Name:       sdk-client

Summary:    Sailfish OS SDK client tools
Version:    0.8
Release:    1
License:    GPLv2+
BuildArch:  noarch
URL:        https://github.com/sailfishos/sdk-client
Source0:    %{name}-%{version}.tar.bz2
BuildRequires:  systemd

%description
Tools to support the Sailfish OS Qt Creator

%package emul
Summary:    Sailfish OS SDK files for the Emulator VM
Requires:   sudo
Requires:   connman >= 1.14
Requires:   virtualbox-guest-tools
Requires(post): /bin/ln
Requires(post): systemd
Conflicts:  sdk-vm

%description emul
Contains the supporting configs for Emulator VMs to setup shared folders and the internal LAN for the SDK build engine

%prep
%setup -q -n %{name}-%{version}

%build

make %{?_smp_mflags}

%install
rm -rf %{buildroot}
%make_install

%post emul
%systemd_post etc-mersdk-share.mount
%systemd_post etc-ssh-authorized_keys.mount
%systemd_post sdk-emulan.service
%systemd_post sdk-refresh-repos.service
%systemd_post sdk-restart-connman.service
%systemd_post sshd.socket

%preun
%preun emul
%systemd_preun etc-mersdk-share.mount
%systemd_preun etc-ssh-authorized_keys.mount
%systemd_preun sdk-emulan.service
%systemd_preun sdk-refresh-repos.service

%postun
%postun emul
%systemd_postun

%files
%defattr(-,root,root,-)

%files emul
%defattr(-,root,root,-)
%{_sysconfdir}/*
%{_bindir}/sdk-shutdown
%{_bindir}/sdk-setup-emulan
%{_unitdir}/sdk-emulan.service
%{_unitdir}/sdk-refresh-repos.service
%{_unitdir}/etc-mersdk-share.mount
%{_unitdir}/etc-ssh-authorized_keys.mount
%{_unitdir}/sdk-restart-connman.service
