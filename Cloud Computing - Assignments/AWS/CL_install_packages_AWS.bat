Last login: Thu Jun  8 17:08:00 on ttys000
complete:13: command not found: compdef
~ ❯❯❯ ssh -i devenv-key.pem ec2-user@52.59.165.233                     master ◼

The authenticity of host '52.59.165.233 (52.59.165.233)' can't be established.
ECDSA key fingerprint is SHA256:sWrb/h0v9lFkK57TvyZqNI03lo24Afq88EZSRu+2G9M.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '52.59.165.233' (ECDSA) to the list of known hosts.
Last login: Wed Jun  7 12:45:52 2017 from wlan-141-23-192-17.tubit.tu-berlin.de

       __|  __|_  )
       _|  (     /   Amazon Linux AMI
      ___|\___|___|

https://aws.amazon.com/amazon-linux-ami/2017.03-release-notes/
4 package(s) needed for security, out of 4 available
Run "sudo yum update" to apply all updates.
[ec2-user@ip-172-31-20-224 ~]$ sudo yum groupinstall "Development Tools"
Loaded plugins: priorities, update-motd, upgrade-helper
Resolving Dependencies
--> Running transaction check
---> Package autoconf.noarch 0:2.69-11.9.amzn1 will be installed
--> Processing Dependency: m4 >= 1.4.14 for package: autoconf-2.69-11.9.amzn1.noarch
--> Processing Dependency: perl(Data::Dumper) for package: autoconf-2.69-11.9.amzn1.noarch
---> Package automake.noarch 0:1.13.4-3.15.amzn1 will be installed
--> Processing Dependency: perl(Thread::Queue) for package: automake-1.13.4-3.15.amzn1.noarch
--> Processing Dependency: perl(TAP::Parser) for package: automake-1.13.4-3.15.amzn1.noarch
---> Package bison.x86_64 0:2.7-4.11.amzn1 will be installed
---> Package byacc.x86_64 0:1.9.20070509-7.8.amzn1 will be installed
---> Package crash.x86_64 0:7.1.8-1.21.amzn1 will be installed
--> Processing Dependency: libsnappy.so.1()(64bit) for package: crash-7.1.8-1.21.amzn1.x86_64
--> Processing Dependency: liblzo2.so.2()(64bit) for package: crash-7.1.8-1.21.amzn1.x86_64
---> Package cscope.x86_64 0:15.6-6.5.amzn1 will be installed
---> Package ctags.x86_64 0:5.8-2.6.amzn1 will be installed
---> Package cvs.x86_64 0:1.11.23-16.9.amzn1 will be installed
---> Package diffstat.x86_64 0:1.51-2.5.amzn1 will be installed
---> Package doxygen.x86_64 1:1.8.2-1.11.amzn1 will be installed
---> Package elfutils.x86_64 0:0.163-3.18.amzn1 will be installed
--> Processing Dependency: elfutils-libs(x86-64) = 0.163-3.18.amzn1 for package: elfutils-0.163-3.18.amzn1.x86_64
--> Processing Dependency: libdw.so.1(ELFUTILS_0.148)(64bit) for package: elfutils-0.163-3.18.amzn1.x86_64
--> Processing Dependency: libdw.so.1(ELFUTILS_0.130)(64bit) for package: elfutils-0.163-3.18.amzn1.x86_64
--> Processing Dependency: libdw.so.1(ELFUTILS_0.127)(64bit) for package: elfutils-0.163-3.18.amzn1.x86_64
--> Processing Dependency: libdw.so.1(ELFUTILS_0.126)(64bit) for package: elfutils-0.163-3.18.amzn1.x86_64
--> Processing Dependency: libdw.so.1(ELFUTILS_0.158)(64bit) for package: elfutils-0.163-3.18.amzn1.x86_64
--> Processing Dependency: libasm.so.1(ELFUTILS_1.0)(64bit) for package: elfutils-0.163-3.18.amzn1.x86_64
--> Processing Dependency: libdw.so.1(ELFUTILS_0.122)(64bit) for package: elfutils-0.163-3.18.amzn1.x86_64
--> Processing Dependency: libdw.so.1(ELFUTILS_0.149)(64bit) for package: elfutils-0.163-3.18.amzn1.x86_64
--> Processing Dependency: libdw.so.1(ELFUTILS_0.138)(64bit) for package: elfutils-0.163-3.18.amzn1.x86_64
--> Processing Dependency: libdw.so.1()(64bit) for package: elfutils-0.163-3.18.amzn1.x86_64
--> Processing Dependency: libasm.so.1()(64bit) for package: elfutils-0.163-3.18.amzn1.x86_64
---> Package flex.x86_64 0:2.5.37-3.13.amzn1 will be installed
---> Package gcc.noarch 0:4.8.3-3.20.amzn1 will be installed
--> Processing Dependency: gcc48 = 4.8.3 for package: gcc-4.8.3-3.20.amzn1.noarch
---> Package gcc-c++.noarch 0:4.8.3-3.20.amzn1 will be installed
--> Processing Dependency: gcc48-c++ = 4.8.3 for package: gcc-c++-4.8.3-3.20.amzn1.noarch
--> Processing Dependency: libstdc++48-devel = 4.8.3 for package: gcc-c++-4.8.3-3.20.amzn1.noarch
---> Package gcc-gfortran.noarch 0:4.8.3-3.20.amzn1 will be installed
--> Processing Dependency: gcc48-gfortran = 4.8.3 for package: gcc-gfortran-4.8.3-3.20.amzn1.noarch
---> Package gdb.x86_64 0:7.6.1-64.33.amzn1 will be installed
---> Package gettext.x86_64 0:0.18.1.1-9.1.11.amzn1 will be installed
--> Processing Dependency: libgomp.so.1(GOMP_1.0)(64bit) for package: gettext-0.18.1.1-9.1.11.amzn1.x86_64
--> Processing Dependency: libgettextsrc-0.18.1.so()(64bit) for package: gettext-0.18.1.1-9.1.11.amzn1.x86_64
--> Processing Dependency: libgomp.so.1()(64bit) for package: gettext-0.18.1.1-9.1.11.amzn1.x86_64
--> Processing Dependency: libgettextlib-0.18.1.so()(64bit) for package: gettext-0.18.1.1-9.1.11.amzn1.x86_64
---> Package git.x86_64 0:2.7.5-1.49.amzn1 will be installed
--> Processing Dependency: perl-Git = 2.7.5-1.49.amzn1 for package: git-2.7.5-1.49.amzn1.x86_64
--> Processing Dependency: perl(Term::ReadKey) for package: git-2.7.5-1.49.amzn1.x86_64
--> Processing Dependency: perl(Git) for package: git-2.7.5-1.49.amzn1.x86_64
--> Processing Dependency: perl(Error) for package: git-2.7.5-1.49.amzn1.x86_64
---> Package indent.x86_64 0:2.2.10-7.6.amzn1 will be installed
---> Package intltool.noarch 0:0.41.0-1.1.5.amzn1 will be installed
--> Processing Dependency: perl(XML::Parser) for package: intltool-0.41.0-1.1.5.amzn1.noarch
--> Processing Dependency: gettext-devel for package: intltool-0.41.0-1.1.5.amzn1.noarch
---> Package kexec-tools.x86_64 0:2.0.0-273.11.amzn1 will be installed
--> Processing Dependency: busybox >= 1.2.0 for package: kexec-tools-2.0.0-273.11.amzn1.x86_64
---> Package latrace.x86_64 0:0.5.9-2.2.amzn1 will be installed
---> Package libtool.x86_64 0:2.4.2-20.4.8.3.31.amzn1 will be installed
---> Package ltrace.x86_64 0:0.5-23.45svn.6.amzn1 will be installed
---> Package patch.x86_64 0:2.7.1-8.9.amzn1 will be installed
---> Package patchutils.x86_64 0:0.3.1-3.1.5.amzn1 will be installed
---> Package rcs.x86_64 0:5.7-37.7.amzn1 will be installed
---> Package rpm-build.x86_64 0:4.11.3-21.75.amzn1 will be installed
---> Package strace.x86_64 0:4.8-11.16.amzn1 will be installed
---> Package subversion.x86_64 0:1.9.5-1.56.amzn1 will be installed
--> Processing Dependency: subversion-libs(x86-64) = 1.9.5-1.56.amzn1 for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_fs_base-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libaprutil-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_fs_util-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libserf-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_fs-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_fs_fs-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_ra_serf-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_client-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libapr-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_diff-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_wc-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_subr-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_delta-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_fs_x-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_ra_local-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_ra-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_ra_svn-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
--> Processing Dependency: libsvn_repos-1.so.0()(64bit) for package: subversion-1.9.5-1.56.amzn1.x86_64
---> Package swig.x86_64 0:2.0.10-4.24.amzn1 will be installed
---> Package system-rpm-config.noarch 0:9.0.3-42.28.amzn1 will be installed
---> Package systemtap.x86_64 0:3.1-2.34.amzn1 will be installed
--> Processing Dependency: systemtap-devel = 3.1-2.34.amzn1 for package: systemtap-3.1-2.34.amzn1.x86_64
--> Processing Dependency: systemtap-client = 3.1-2.34.amzn1 for package: systemtap-3.1-2.34.amzn1.x86_64
---> Package systemtap-runtime.x86_64 0:3.1-2.34.amzn1 will be installed
--> Processing Dependency: libdyninstAPI.so.8.1()(64bit) for package: systemtap-runtime-3.1-2.34.amzn1.x86_64
--> Processing Dependency: libsymtabAPI.so.8.1()(64bit) for package: systemtap-runtime-3.1-2.34.amzn1.x86_64
---> Package texinfo.x86_64 0:5.1-4.10.amzn1 will be installed
--> Processing Dependency: perl(Text::Unidecode) for package: texinfo-5.1-4.10.amzn1.x86_64
--> Processing Dependency: perl(Locale::Messages) for package: texinfo-5.1-4.10.amzn1.x86_64
---> Package valgrind.x86_64 1:3.10.0-16.14.amzn1 will be installed
--> Running transaction check
---> Package apr.x86_64 0:1.5.1-1.12.amzn1 will be installed
---> Package apr-util.x86_64 0:1.4.1-4.17.amzn1 will be installed
---> Package busybox.x86_64 1:1.19.3-2.11.amzn1 will be installed
---> Package dyninst.x86_64 0:8.1.2-6.3.amzn1 will be installed
--> Processing Dependency: libdwarf.so.0()(64bit) for package: dyninst-8.1.2-6.3.amzn1.x86_64
---> Package elfutils-libs.x86_64 0:0.163-3.18.amzn1 will be installed
---> Package gcc48.x86_64 0:4.8.3-9.111.amzn1 will be installed
--> Processing Dependency: cpp48(x86-64) = 4.8.3-9.111.amzn1 for package: gcc48-4.8.3-9.111.amzn1.x86_64
--> Processing Dependency: glibc-devel(x86-64) >= 2.2.90-12 for package: gcc48-4.8.3-9.111.amzn1.x86_64
--> Processing Dependency: libmpc.so.3()(64bit) for package: gcc48-4.8.3-9.111.amzn1.x86_64
--> Processing Dependency: libmpfr.so.4()(64bit) for package: gcc48-4.8.3-9.111.amzn1.x86_64
---> Package gcc48-c++.x86_64 0:4.8.3-9.111.amzn1 will be installed
---> Package gcc48-gfortran.x86_64 0:4.8.3-9.111.amzn1 will be installed
--> Processing Dependency: libquadmath48-devel(x86-64) = 4.8.3-9.111.amzn1 for package: gcc48-gfortran-4.8.3-9.111.amzn1.x86_64
--> Processing Dependency: libgfortran.so.3()(64bit) for package: gcc48-gfortran-4.8.3-9.111.amzn1.x86_64
---> Package gettext-devel.x86_64 0:0.18.1.1-9.1.11.amzn1 will be installed
--> Processing Dependency: gettext-common-devel = 0.18.1.1-9.1.11.amzn1 for package: gettext-devel-0.18.1.1-9.1.11.amzn1.x86_64
---> Package gettext-libs.x86_64 0:0.18.1.1-9.1.11.amzn1 will be installed
---> Package libgomp.x86_64 0:4.8.3-9.111.amzn1 will be installed
---> Package libserf.x86_64 0:1.3.7-1.7.amzn1 will be installed
---> Package libstdc++48-devel.x86_64 0:4.8.3-9.111.amzn1 will be installed
---> Package lzo.x86_64 0:2.08-1.5.amzn1 will be installed
---> Package m4.x86_64 0:1.4.16-9.10.amzn1 will be installed
---> Package perl-Data-Dumper.x86_64 0:2.145-3.5.amzn1 will be installed
---> Package perl-Error.noarch 1:0.17020-2.9.amzn1 will be installed
---> Package perl-Git.noarch 0:2.7.5-1.49.amzn1 will be installed
---> Package perl-TermReadKey.x86_64 0:2.30-20.9.amzn1 will be installed
---> Package perl-Test-Harness.noarch 0:3.28-3.6.amzn1 will be installed
---> Package perl-Text-Unidecode.noarch 0:0.04-20.7.amzn1 will be installed
---> Package perl-Thread-Queue.noarch 0:3.02-2.5.amzn1 will be installed
---> Package perl-XML-Parser.x86_64 0:2.41-10.9.amzn1 will be installed
---> Package perl-libintl.x86_64 0:1.20-12.7.amzn1 will be installed
---> Package snappy.x86_64 0:1.0.5-1.1.amzn1 will be installed
---> Package subversion-libs.x86_64 0:1.9.5-1.56.amzn1 will be installed
---> Package systemtap-client.x86_64 0:3.1-2.34.amzn1 will be installed
--> Processing Dependency: libavahi-client.so.3()(64bit) for package: systemtap-client-3.1-2.34.amzn1.x86_64
--> Processing Dependency: libavahi-common.so.3()(64bit) for package: systemtap-client-3.1-2.34.amzn1.x86_64
---> Package systemtap-devel.x86_64 0:3.1-2.34.amzn1 will be installed
--> Processing Dependency: kernel-devel for package: systemtap-devel-3.1-2.34.amzn1.x86_64
--> Running transaction check
---> Package avahi-libs.x86_64 0:0.6.25-12.17.amzn1 will be installed
---> Package cpp48.x86_64 0:4.8.3-9.111.amzn1 will be installed
---> Package gettext-common-devel.noarch 0:0.18.1.1-9.1.11.amzn1 will be installed
---> Package glibc-devel.x86_64 0:2.17-157.169.amzn1 will be installed
--> Processing Dependency: glibc-headers = 2.17-157.169.amzn1 for package: glibc-devel-2.17-157.169.amzn1.x86_64
--> Processing Dependency: glibc-headers for package: glibc-devel-2.17-157.169.amzn1.x86_64
---> Package kernel-devel.x86_64 0:4.9.27-14.31.amzn1 will be installed
--> Processing Dependency: /usr/sbin/hardlink for package: kernel-devel-4.9.27-14.31.amzn1.x86_64
---> Package libdwarf.x86_64 0:20130207-3.3.amzn1 will be installed
---> Package libgfortran.x86_64 0:4.8.3-9.111.amzn1 will be installed
amzn-main/latest/filelists_db                            | 5.1 MB     00:00     
amzn-updates/latest/filelists_db                         | 1.2 MB     00:00     
--> Processing Dependency: libquadmath.so.0(QUADMATH_1.0)(64bit) for package: libgfortran-4.8.3-9.111.amzn1.x86_64
--> Processing Dependency: /usr/lib64/libquadmath.so.0.0.0 for package: libgfortran-4.8.3-9.111.amzn1.x86_64
--> Processing Dependency: libquadmath.so.0()(64bit) for package: libgfortran-4.8.3-9.111.amzn1.x86_64
---> Package libmpc.x86_64 0:1.0.1-3.3.amzn1 will be installed
---> Package libquadmath48-devel.x86_64 0:4.8.3-9.111.amzn1 will be installed
---> Package mpfr.x86_64 0:3.1.1-4.14.amzn1 will be installed
--> Running transaction check
---> Package glibc-headers.x86_64 0:2.17-157.169.amzn1 will be installed
--> Processing Dependency: kernel-headers >= 2.2.1 for package: glibc-headers-2.17-157.169.amzn1.x86_64
--> Processing Dependency: kernel-headers for package: glibc-headers-2.17-157.169.amzn1.x86_64
---> Package hardlink.x86_64 1:1.0-10.4.amzn1 will be installed
---> Package libquadmath.x86_64 0:4.8.3-9.111.amzn1 will be installed
--> Running transaction check
---> Package kernel-headers.x86_64 0:4.9.27-14.31.amzn1 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package                Arch     Version                   Repository      Size
================================================================================
Installing for group install "Development tools":
 autoconf               noarch   2.69-11.9.amzn1           amzn-main      915 k
 automake               noarch   1.13.4-3.15.amzn1         amzn-main      718 k
 bison                  x86_64   2.7-4.11.amzn1            amzn-main      645 k
 byacc                  x86_64   1.9.20070509-7.8.amzn1    amzn-main       52 k
 crash                  x86_64   7.1.8-1.21.amzn1          amzn-main      2.9 M
 cscope                 x86_64   15.6-6.5.amzn1            amzn-main      148 k
 ctags                  x86_64   5.8-2.6.amzn1             amzn-main      156 k
 cvs                    x86_64   1.11.23-16.9.amzn1        amzn-main      753 k
 diffstat               x86_64   1.51-2.5.amzn1            amzn-main       27 k
 doxygen                x86_64   1:1.8.2-1.11.amzn1        amzn-main      4.7 M
 elfutils               x86_64   0.163-3.18.amzn1          amzn-main      308 k
 flex                   x86_64   2.5.37-3.13.amzn1         amzn-main      325 k
 gcc                    noarch   4.8.3-3.20.amzn1          amzn-main      3.9 k
 gcc-c++                noarch   4.8.3-3.20.amzn1          amzn-main      3.8 k
 gcc-gfortran           noarch   4.8.3-3.20.amzn1          amzn-main      3.5 k
 gdb                    x86_64   7.6.1-64.33.amzn1         amzn-main      2.6 M
 gettext                x86_64   0.18.1.1-9.1.11.amzn1     amzn-main      1.6 M
 git                    x86_64   2.7.5-1.49.amzn1          amzn-updates    11 M
 indent                 x86_64   2.2.10-7.6.amzn1          amzn-main      123 k
 intltool               noarch   0.41.0-1.1.5.amzn1        amzn-main       56 k
 kexec-tools            x86_64   2.0.0-273.11.amzn1        amzn-main      370 k
 latrace                x86_64   0.5.9-2.2.amzn1           amzn-main      152 k
 libtool                x86_64   2.4.2-20.4.8.3.31.amzn1   amzn-main      737 k
 ltrace                 x86_64   0.5-23.45svn.6.amzn1      amzn-main       79 k
 patch                  x86_64   2.7.1-8.9.amzn1           amzn-main      113 k
 patchutils             x86_64   0.3.1-3.1.5.amzn1         amzn-main      113 k
 rcs                    x86_64   5.7-37.7.amzn1            amzn-main      357 k
 rpm-build              x86_64   4.11.3-21.75.amzn1        amzn-main      155 k
 strace                 x86_64   4.8-11.16.amzn1           amzn-main      319 k
 subversion             x86_64   1.9.5-1.56.amzn1          amzn-main      1.6 M
 swig                   x86_64   2.0.10-4.24.amzn1         amzn-main      1.4 M
 system-rpm-config      noarch   9.0.3-42.28.amzn1         amzn-main       63 k
 systemtap              x86_64   3.1-2.34.amzn1            amzn-main      148 k
 systemtap-runtime      x86_64   3.1-2.34.amzn1            amzn-main      476 k
 texinfo                x86_64   5.1-4.10.amzn1            amzn-main      1.2 M
 valgrind               x86_64   1:3.10.0-16.14.amzn1      amzn-main       18 M
Installing for dependencies:
 apr                    x86_64   1.5.1-1.12.amzn1          amzn-main      116 k
 apr-util               x86_64   1.4.1-4.17.amzn1          amzn-main       87 k
 avahi-libs             x86_64   0.6.25-12.17.amzn1        amzn-main       64 k
 busybox                x86_64   1:1.19.3-2.11.amzn1       amzn-main      616 k
 cpp48                  x86_64   4.8.3-9.111.amzn1         amzn-main      6.7 M
 dyninst                x86_64   8.1.2-6.3.amzn1           amzn-main      3.1 M
 elfutils-libs          x86_64   0.163-3.18.amzn1          amzn-main      286 k
 gcc48                  x86_64   4.8.3-9.111.amzn1         amzn-main       17 M
 gcc48-c++              x86_64   4.8.3-9.111.amzn1         amzn-main      8.1 M
 gcc48-gfortran         x86_64   4.8.3-9.111.amzn1         amzn-main      7.9 M
 gettext-common-devel   noarch   0.18.1.1-9.1.11.amzn1     amzn-main      597 k
 gettext-devel          x86_64   0.18.1.1-9.1.11.amzn1     amzn-main      162 k
 gettext-libs           x86_64   0.18.1.1-9.1.11.amzn1     amzn-main      428 k
 glibc-devel            x86_64   2.17-157.169.amzn1        amzn-main      1.1 M
 glibc-headers          x86_64   2.17-157.169.amzn1        amzn-main      743 k
 hardlink               x86_64   1:1.0-10.4.amzn1          amzn-main      9.6 k
 kernel-devel           x86_64   4.9.27-14.31.amzn1        amzn-updates    11 M
 kernel-headers         x86_64   4.9.27-14.31.amzn1        amzn-updates   1.1 M
 libdwarf               x86_64   20130207-3.3.amzn1        amzn-main      117 k
 libgfortran            x86_64   4.8.3-9.111.amzn1         amzn-main      411 k
 libgomp                x86_64   4.8.3-9.111.amzn1         amzn-main      175 k
 libmpc                 x86_64   1.0.1-3.3.amzn1           amzn-main       53 k
 libquadmath            x86_64   4.8.3-9.111.amzn1         amzn-main      234 k
 libquadmath48-devel    x86_64   4.8.3-9.111.amzn1         amzn-main       87 k
 libserf                x86_64   1.3.7-1.7.amzn1           amzn-main       64 k
 libstdc++48-devel      x86_64   4.8.3-9.111.amzn1         amzn-main      1.7 M
 lzo                    x86_64   2.08-1.5.amzn1            amzn-main       64 k
 m4                     x86_64   1.4.16-9.10.amzn1         amzn-main      263 k
 mpfr                   x86_64   3.1.1-4.14.amzn1          amzn-main      237 k
 perl-Data-Dumper       x86_64   2.145-3.5.amzn1           amzn-main       49 k
 perl-Error             noarch   1:0.17020-2.9.amzn1       amzn-main       33 k
 perl-Git               noarch   2.7.5-1.49.amzn1          amzn-updates    65 k
 perl-TermReadKey       x86_64   2.30-20.9.amzn1           amzn-main       33 k
 perl-Test-Harness      noarch   3.28-3.6.amzn1            amzn-main      314 k
 perl-Text-Unidecode    noarch   0.04-20.7.amzn1           amzn-main      121 k
 perl-Thread-Queue      noarch   3.02-2.5.amzn1            amzn-main       17 k
 perl-XML-Parser        x86_64   2.41-10.9.amzn1           amzn-main      277 k
 perl-libintl           x86_64   1.20-12.7.amzn1           amzn-main      1.1 M
 snappy                 x86_64   1.0.5-1.1.amzn1           amzn-main       36 k
 subversion-libs        x86_64   1.9.5-1.56.amzn1          amzn-main      1.5 M
 systemtap-client       x86_64   3.1-2.34.amzn1            amzn-main      4.1 M
 systemtap-devel        x86_64   3.1-2.34.amzn1            amzn-main      2.9 M

Transaction Summary
================================================================================
Install  36 Packages (+42 Dependent packages)

Total download size: 125 M
Installed size: 309 M
Is this ok [y/d/N]: y                      
Downloading packages:
(1/78): apr-util-1.4.1-4.17.amzn1.x86_64.rpm                                                                                                                              |  87 kB  00:00:00     
(2/78): apr-1.5.1-1.12.amzn1.x86_64.rpm                                                                                                                                   | 116 kB  00:00:00     
(3/78): autoconf-2.69-11.9.amzn1.noarch.rpm                                                                                                                               | 915 kB  00:00:00     
(4/78): automake-1.13.4-3.15.amzn1.noarch.rpm                                                                                                                             | 718 kB  00:00:00     
(5/78): avahi-libs-0.6.25-12.17.amzn1.x86_64.rpm                                                                                                                          |  64 kB  00:00:00     
(6/78): busybox-1.19.3-2.11.amzn1.x86_64.rpm                                                                                                                              | 616 kB  00:00:00     
(7/78): byacc-1.9.20070509-7.8.amzn1.x86_64.rpm                                                                                                                           |  52 kB  00:00:00     
(8/78): bison-2.7-4.11.amzn1.x86_64.rpm                                                                                                                                   | 645 kB  00:00:00     
(9/78): cpp48-4.8.3-9.111.amzn1.x86_64.rpm                                                                                                                                | 6.7 MB  00:00:00     
(10/78): cscope-15.6-6.5.amzn1.x86_64.rpm                                                                                                                                 | 148 kB  00:00:00     
(11/78): crash-7.1.8-1.21.amzn1.x86_64.rpm                                                                                                                                | 2.9 MB  00:00:00     
(12/78): ctags-5.8-2.6.amzn1.x86_64.rpm                                                                                                                                   | 156 kB  00:00:00     
(13/78): cvs-1.11.23-16.9.amzn1.x86_64.rpm                                                                                                                                | 753 kB  00:00:00     
(14/78): diffstat-1.51-2.5.amzn1.x86_64.rpm                                                                                                                               |  27 kB  00:00:00     
(15/78): dyninst-8.1.2-6.3.amzn1.x86_64.rpm                                                                                                                               | 3.1 MB  00:00:00     
(16/78): elfutils-0.163-3.18.amzn1.x86_64.rpm                                                                                                                             | 308 kB  00:00:00     
(17/78): doxygen-1.8.2-1.11.amzn1.x86_64.rpm                                                                                                                              | 4.7 MB  00:00:00     
(18/78): elfutils-libs-0.163-3.18.amzn1.x86_64.rpm                                                                                                                        | 286 kB  00:00:00     
(19/78): flex-2.5.37-3.13.amzn1.x86_64.rpm                                                                                                                                | 325 kB  00:00:00     
(20/78): gcc-4.8.3-3.20.amzn1.noarch.rpm                                                                                                                                  | 3.9 kB  00:00:00     
(21/78): gcc-c++-4.8.3-3.20.amzn1.noarch.rpm                                                                                                                              | 3.8 kB  00:00:00     
(22/78): gcc-gfortran-4.8.3-3.20.amzn1.noarch.rpm                                                                                                                         | 3.5 kB  00:00:00     
(23/78): gcc48-c++-4.8.3-9.111.amzn1.x86_64.rpm                                                                                                                           | 8.1 MB  00:00:00     
(24/78): gcc48-4.8.3-9.111.amzn1.x86_64.rpm                                                                                                                               |  17 MB  00:00:00     
(25/78): gcc48-gfortran-4.8.3-9.111.amzn1.x86_64.rpm                                                                                                                      | 7.9 MB  00:00:00     
(26/78): gdb-7.6.1-64.33.amzn1.x86_64.rpm                                                                                                                                 | 2.6 MB  00:00:00     
(27/78): gettext-0.18.1.1-9.1.11.amzn1.x86_64.rpm                                                                                                                         | 1.6 MB  00:00:00     
(28/78): gettext-devel-0.18.1.1-9.1.11.amzn1.x86_64.rpm                                                                                                                   | 162 kB  00:00:00     
(29/78): gettext-common-devel-0.18.1.1-9.1.11.amzn1.noarch.rpm                                                                                                            | 597 kB  00:00:00     
(30/78): gettext-libs-0.18.1.1-9.1.11.amzn1.x86_64.rpm                                                                                                                    | 428 kB  00:00:00     
(31/78): glibc-devel-2.17-157.169.amzn1.x86_64.rpm                                                                                                                        | 1.1 MB  00:00:00     
(32/78): hardlink-1.0-10.4.amzn1.x86_64.rpm                                                                                                                               | 9.6 kB  00:00:00     
(33/78): glibc-headers-2.17-157.169.amzn1.x86_64.rpm                                                                                                                      | 743 kB  00:00:00     
(34/78): indent-2.2.10-7.6.amzn1.x86_64.rpm                                                                                                                               | 123 kB  00:00:00     
(35/78): intltool-0.41.0-1.1.5.amzn1.noarch.rpm                                                                                                                           |  56 kB  00:00:00     
(36/78): git-2.7.5-1.49.amzn1.x86_64.rpm                                                                                                                                  |  11 MB  00:00:00     
(37/78): kernel-devel-4.9.27-14.31.amzn1.x86_64.rpm                                                                                                                       |  11 MB  00:00:01     
(38/78): kernel-headers-4.9.27-14.31.amzn1.x86_64.rpm                                                                                                                     | 1.1 MB  00:00:00     
(39/78): kexec-tools-2.0.0-273.11.amzn1.x86_64.rpm                                                                                                                        | 370 kB  00:00:00     
(40/78): latrace-0.5.9-2.2.amzn1.x86_64.rpm                                                                                                                               | 152 kB  00:00:00     
(41/78): libdwarf-20130207-3.3.amzn1.x86_64.rpm                                                                                                                           | 117 kB  00:00:00     
(42/78): libgomp-4.8.3-9.111.amzn1.x86_64.rpm                                                                                                                             | 175 kB  00:00:00     
(43/78): libgfortran-4.8.3-9.111.amzn1.x86_64.rpm                                                                                                                         | 411 kB  00:00:00     
(44/78): libmpc-1.0.1-3.3.amzn1.x86_64.rpm                                                                                                                                |  53 kB  00:00:00     
(45/78): libquadmath-4.8.3-9.111.amzn1.x86_64.rpm                                                                                                                         | 234 kB  00:00:00     
(46/78): libquadmath48-devel-4.8.3-9.111.amzn1.x86_64.rpm                                                                                                                 |  87 kB  00:00:00     
(47/78): libserf-1.3.7-1.7.amzn1.x86_64.rpm                                                                                                                               |  64 kB  00:00:00     
(48/78): libtool-2.4.2-20.4.8.3.31.amzn1.x86_64.rpm                                                                                                                       | 737 kB  00:00:00     
(49/78): ltrace-0.5-23.45svn.6.amzn1.x86_64.rpm                                                                                                                           |  79 kB  00:00:00     
(50/78): libstdc++48-devel-4.8.3-9.111.amzn1.x86_64.rpm                                                                                                                   | 1.7 MB  00:00:00     
(51/78): lzo-2.08-1.5.amzn1.x86_64.rpm                                                                                                                                    |  64 kB  00:00:00     
(52/78): m4-1.4.16-9.10.amzn1.x86_64.rpm                                                                                                                                  | 263 kB  00:00:00     
(53/78): patch-2.7.1-8.9.amzn1.x86_64.rpm                                                                                                                                 | 113 kB  00:00:00     
(54/78): mpfr-3.1.1-4.14.amzn1.x86_64.rpm                                                                                                                                 | 237 kB  00:00:00     
(55/78): patchutils-0.3.1-3.1.5.amzn1.x86_64.rpm                                                                                                                          | 113 kB  00:00:00     
(56/78): perl-Data-Dumper-2.145-3.5.amzn1.x86_64.rpm                                                                                                                      |  49 kB  00:00:00     
(57/78): perl-Error-0.17020-2.9.amzn1.noarch.rpm                                                                                                                          |  33 kB  00:00:00     
(58/78): perl-TermReadKey-2.30-20.9.amzn1.x86_64.rpm                                                                                                                      |  33 kB  00:00:00     
(59/78): perl-Text-Unidecode-0.04-20.7.amzn1.noarch.rpm                                                                                                                   | 121 kB  00:00:00     
(60/78): perl-Thread-Queue-3.02-2.5.amzn1.noarch.rpm                                                                                                                      |  17 kB  00:00:00     
(61/78): perl-Git-2.7.5-1.49.amzn1.noarch.rpm                                                                                                                             |  65 kB  00:00:00     
(62/78): perl-XML-Parser-2.41-10.9.amzn1.x86_64.rpm                                                                                                                       | 277 kB  00:00:00     
(63/78): perl-Test-Harness-3.28-3.6.amzn1.noarch.rpm                                                                                                                      | 314 kB  00:00:00     
(64/78): perl-libintl-1.20-12.7.amzn1.x86_64.rpm                                                                                                                          | 1.1 MB  00:00:00     
(65/78): rpm-build-4.11.3-21.75.amzn1.x86_64.rpm                                                                                                                          | 155 kB  00:00:00     
(66/78): rcs-5.7-37.7.amzn1.x86_64.rpm                                                                                                                                    | 357 kB  00:00:00     
(67/78): strace-4.8-11.16.amzn1.x86_64.rpm                                                                                                                                | 319 kB  00:00:00     
(68/78): snappy-1.0.5-1.1.amzn1.x86_64.rpm                                                                                                                                |  36 kB  00:00:00     
(69/78): subversion-libs-1.9.5-1.56.amzn1.x86_64.rpm                                                                                                                      | 1.5 MB  00:00:00     
(70/78): subversion-1.9.5-1.56.amzn1.x86_64.rpm                                                                                                                           | 1.6 MB  00:00:00     
(71/78): swig-2.0.10-4.24.amzn1.x86_64.rpm                                                                                                                                | 1.4 MB  00:00:00     
(72/78): system-rpm-config-9.0.3-42.28.amzn1.noarch.rpm                                                                                                                   |  63 kB  00:00:00     
(73/78): systemtap-3.1-2.34.amzn1.x86_64.rpm                                                                                                                              | 148 kB  00:00:00     
(74/78): systemtap-devel-3.1-2.34.amzn1.x86_64.rpm                                                                                                                        | 2.9 MB  00:00:00     
(75/78): systemtap-client-3.1-2.34.amzn1.x86_64.rpm                                                                                                                       | 4.1 MB  00:00:00     
(76/78): systemtap-runtime-3.1-2.34.amzn1.x86_64.rpm                                                                                                                      | 476 kB  00:00:00     
(77/78): texinfo-5.1-4.10.amzn1.x86_64.rpm                                                                                                                                | 1.2 MB  00:00:00     
(78/78): valgrind-3.10.0-16.14.amzn1.x86_64.rpm                                                                                                                           |  18 MB  00:00:00     
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Total                                                                                                                                                             21 MB/s | 125 MB  00:00:05     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : mpfr-3.1.1-4.14.amzn1.x86_64                                                                                                                                                 1/78 
  Installing : libmpc-1.0.1-3.3.amzn1.x86_64                                                                                                                                                2/78 
  Installing : elfutils-libs-0.163-3.18.amzn1.x86_64                                                                                                                                        3/78 
  Installing : apr-1.5.1-1.12.amzn1.x86_64                                                                                                                                                  4/78 
  Installing : apr-util-1.4.1-4.17.amzn1.x86_64                                                                                                                                             5/78 
  Installing : m4-1.4.16-9.10.amzn1.x86_64                                                                                                                                                  6/78 
  Installing : libserf-1.3.7-1.7.amzn1.x86_64                                                                                                                                               7/78 
  Installing : libquadmath-4.8.3-9.111.amzn1.x86_64                                                                                                                                         8/78 
  Installing : 1:perl-Error-0.17020-2.9.amzn1.noarch                                                                                                                                        9/78 
  Installing : lzo-2.08-1.5.amzn1.x86_64                                                                                                                                                   10/78 
  Installing : snappy-1.0.5-1.1.amzn1.x86_64                                                                                                                                               11/78 
  Installing : perl-Thread-Queue-3.02-2.5.amzn1.noarch                                                                                                                                     12/78 
  Installing : gettext-libs-0.18.1.1-9.1.11.amzn1.x86_64                                                                                                                                   13/78 
  Installing : libstdc++48-devel-4.8.3-9.111.amzn1.x86_64                                                                                                                                  14/78 
  Installing : perl-Data-Dumper-2.145-3.5.amzn1.x86_64                                                                                                                                     15/78 
  Installing : autoconf-2.69-11.9.amzn1.noarch                                                                                                                                             16/78 
  Installing : avahi-libs-0.6.25-12.17.amzn1.x86_64                                                                                                                                        17/78 
  Installing : libgomp-4.8.3-9.111.amzn1.x86_64                                                                                                                                            18/78 
  Installing : patch-2.7.1-8.9.amzn1.x86_64                                                                                                                                                19/78 
  Installing : gettext-0.18.1.1-9.1.11.amzn1.x86_64                                                                                                                                        20/78 
  Installing : libquadmath48-devel-4.8.3-9.111.amzn1.x86_64                                                                                                                                21/78 
  Installing : libgfortran-4.8.3-9.111.amzn1.x86_64                                                                                                                                        22/78 
  Installing : subversion-libs-1.9.5-1.56.amzn1.x86_64                                                                                                                                     23/78 
  Installing : elfutils-0.163-3.18.amzn1.x86_64                                                                                                                                            24/78 
  Installing : cpp48-4.8.3-9.111.amzn1.x86_64                                                                                                                                              25/78 
  Installing : perl-XML-Parser-2.41-10.9.amzn1.x86_64                                                                                                                                      26/78 
  Installing : perl-Text-Unidecode-0.04-20.7.amzn1.noarch                                                                                                                                  27/78 
  Installing : gdb-7.6.1-64.33.amzn1.x86_64                                                                                                                                                28/78 
  Installing : kernel-headers-4.9.27-14.31.amzn1.x86_64                                                                                                                                    29/78 
  Installing : glibc-headers-2.17-157.169.amzn1.x86_64                                                                                                                                     30/78 
  Installing : glibc-devel-2.17-157.169.amzn1.x86_64                                                                                                                                       31/78 
  Installing : gcc48-4.8.3-9.111.amzn1.x86_64                                                                                                                                              32/78 
  Installing : gcc-4.8.3-3.20.amzn1.noarch                                                                                                                                                 33/78 
  Installing : gcc48-gfortran-4.8.3-9.111.amzn1.x86_64                                                                                                                                     34/78 
  Installing : gcc48-c++-4.8.3-9.111.amzn1.x86_64                                                                                                                                          35/78 
  Installing : perl-libintl-1.20-12.7.amzn1.x86_64                                                                                                                                         36/78 
  Installing : perl-Test-Harness-3.28-3.6.amzn1.noarch                                                                                                                                     37/78 
  Installing : automake-1.13.4-3.15.amzn1.noarch                                                                                                                                           38/78 
  Installing : 1:hardlink-1.0-10.4.amzn1.x86_64                                                                                                                                            39/78 
  Installing : kernel-devel-4.9.27-14.31.amzn1.x86_64                                                                                                                                      40/78 
  Installing : systemtap-devel-3.1-2.34.amzn1.x86_64                                                                                                                                       41/78 
  Installing : libdwarf-20130207-3.3.amzn1.x86_64                                                                                                                                          42/78 
  Installing : dyninst-8.1.2-6.3.amzn1.x86_64                                                                                                                                              43/78 
  Installing : systemtap-runtime-3.1-2.34.amzn1.x86_64                                                                                                                                     44/78 
  Installing : systemtap-client-3.1-2.34.amzn1.x86_64                                                                                                                                      45/78 
  Installing : 1:busybox-1.19.3-2.11.amzn1.x86_64                                                                                                                                          46/78 
  Installing : gettext-common-devel-0.18.1.1-9.1.11.amzn1.noarch                                                                                                                           47/78 
  Installing : perl-TermReadKey-2.30-20.9.amzn1.x86_64                                                                                                                                     48/78 
  Installing : perl-Git-2.7.5-1.49.amzn1.noarch                                                                                                                                            49/78 
  Installing : git-2.7.5-1.49.amzn1.x86_64                                                                                                                                                 50/78 
  Installing : gettext-devel-0.18.1.1-9.1.11.amzn1.x86_64                                                                                                                                  51/78 
  Installing : intltool-0.41.0-1.1.5.amzn1.noarch                                                                                                                                          52/78 
  Installing : kexec-tools-2.0.0-273.11.amzn1.x86_64                                                                                                                                       53/78 
  Installing : systemtap-3.1-2.34.amzn1.x86_64                                                                                                                                             54/78 
  Installing : libtool-2.4.2-20.4.8.3.31.amzn1.x86_64                                                                                                                                      55/78 
  Installing : texinfo-5.1-4.10.amzn1.x86_64                                                                                                                                               56/78 
  Installing : gcc-c++-4.8.3-3.20.amzn1.noarch                                                                                                                                             57/78 
  Installing : gcc-gfortran-4.8.3-3.20.amzn1.noarch                                                                                                                                        58/78 
  Installing : rpm-build-4.11.3-21.75.amzn1.x86_64                                                                                                                                         59/78 
  Installing : subversion-1.9.5-1.56.amzn1.x86_64                                                                                                                                          60/78 
  Installing : crash-7.1.8-1.21.amzn1.x86_64                                                                                                                                               61/78 
  Installing : flex-2.5.37-3.13.amzn1.x86_64                                                                                                                                               62/78 
  Installing : bison-2.7-4.11.amzn1.x86_64                                                                                                                                                 63/78 
  Installing : rcs-5.7-37.7.amzn1.x86_64                                                                                                                                                   64/78 
  Installing : ctags-5.8-2.6.amzn1.x86_64                                                                                                                                                  65/78 
  Installing : ltrace-0.5-23.45svn.6.amzn1.x86_64                                                                                                                                          66/78 
  Installing : strace-4.8-11.16.amzn1.x86_64                                                                                                                                               67/78 
  Installing : diffstat-1.51-2.5.amzn1.x86_64                                                                                                                                              68/78 
  Installing : byacc-1.9.20070509-7.8.amzn1.x86_64                                                                                                                                         69/78 
  Installing : swig-2.0.10-4.24.amzn1.x86_64                                                                                                                                               70/78 
  Installing : 1:doxygen-1.8.2-1.11.amzn1.x86_64                                                                                                                                           71/78 
  Installing : cscope-15.6-6.5.amzn1.x86_64                                                                                                                                                72/78 
  Installing : cvs-1.11.23-16.9.amzn1.x86_64                                                                                                                                               73/78 
  Installing : system-rpm-config-9.0.3-42.28.amzn1.noarch                                                                                                                                  74/78 
  Installing : latrace-0.5.9-2.2.amzn1.x86_64                                                                                                                                              75/78 
  Installing : indent-2.2.10-7.6.amzn1.x86_64                                                                                                                                              76/78 
  Installing : patchutils-0.3.1-3.1.5.amzn1.x86_64                                                                                                                                         77/78 
  Installing : 1:valgrind-3.10.0-16.14.amzn1.x86_64                                                                                                                                        78/78 
  Verifying  : systemtap-runtime-3.1-2.34.amzn1.x86_64                                                                                                                                      1/78 
  Verifying  : perl-TermReadKey-2.30-20.9.amzn1.x86_64                                                                                                                                      2/78 
  Verifying  : dyninst-8.1.2-6.3.amzn1.x86_64                                                                                                                                               3/78 
  Verifying  : 1:valgrind-3.10.0-16.14.amzn1.x86_64                                                                                                                                         4/78 
  Verifying  : kernel-devel-4.9.27-14.31.amzn1.x86_64                                                                                                                                       5/78 
  Verifying  : automake-1.13.4-3.15.amzn1.noarch                                                                                                                                            6/78 
  Verifying  : patchutils-0.3.1-3.1.5.amzn1.x86_64                                                                                                                                          7/78 
  Verifying  : gettext-common-devel-0.18.1.1-9.1.11.amzn1.noarch                                                                                                                            8/78 
  Verifying  : indent-2.2.10-7.6.amzn1.x86_64                                                                                                                                               9/78 
  Verifying  : gcc-4.8.3-3.20.amzn1.noarch                                                                                                                                                 10/78 
  Verifying  : gettext-0.18.1.1-9.1.11.amzn1.x86_64                                                                                                                                        11/78 
  Verifying  : glibc-headers-2.17-157.169.amzn1.x86_64                                                                                                                                     12/78 
  Verifying  : patch-2.7.1-8.9.amzn1.x86_64                                                                                                                                                13/78 
  Verifying  : latrace-0.5.9-2.2.amzn1.x86_64                                                                                                                                              14/78 
  Verifying  : libgomp-4.8.3-9.111.amzn1.x86_64                                                                                                                                            15/78 
  Verifying  : avahi-libs-0.6.25-12.17.amzn1.x86_64                                                                                                                                        16/78 
  Verifying  : 1:busybox-1.19.3-2.11.amzn1.x86_64                                                                                                                                          17/78 
  Verifying  : mpfr-3.1.1-4.14.amzn1.x86_64                                                                                                                                                18/78 
  Verifying  : system-rpm-config-9.0.3-42.28.amzn1.noarch                                                                                                                                  19/78 
  Verifying  : cvs-1.11.23-16.9.amzn1.x86_64                                                                                                                                               20/78 
  Verifying  : cscope-15.6-6.5.amzn1.x86_64                                                                                                                                                21/78 
  Verifying  : apr-1.5.1-1.12.amzn1.x86_64                                                                                                                                                 22/78 
  Verifying  : systemtap-client-3.1-2.34.amzn1.x86_64                                                                                                                                      23/78 
  Verifying  : libmpc-1.0.1-3.3.amzn1.x86_64                                                                                                                                               24/78 
  Verifying  : m4-1.4.16-9.10.amzn1.x86_64                                                                                                                                                 25/78 
  Verifying  : libdwarf-20130207-3.3.amzn1.x86_64                                                                                                                                          26/78 
  Verifying  : 1:doxygen-1.8.2-1.11.amzn1.x86_64                                                                                                                                           27/78 
  Verifying  : subversion-libs-1.9.5-1.56.amzn1.x86_64                                                                                                                                     28/78 
  Verifying  : swig-2.0.10-4.24.amzn1.x86_64                                                                                                                                               29/78 
  Verifying  : byacc-1.9.20070509-7.8.amzn1.x86_64                                                                                                                                         30/78 
  Verifying  : libserf-1.3.7-1.7.amzn1.x86_64                                                                                                                                              31/78 
  Verifying  : diffstat-1.51-2.5.amzn1.x86_64                                                                                                                                              32/78 
  Verifying  : 1:hardlink-1.0-10.4.amzn1.x86_64                                                                                                                                            33/78 
  Verifying  : perl-Test-Harness-3.28-3.6.amzn1.noarch                                                                                                                                     34/78 
  Verifying  : texinfo-5.1-4.10.amzn1.x86_64                                                                                                                                               35/78 
  Verifying  : intltool-0.41.0-1.1.5.amzn1.noarch                                                                                                                                          36/78 
  Verifying  : perl-Data-Dumper-2.145-3.5.amzn1.x86_64                                                                                                                                     37/78 
  Verifying  : perl-libintl-1.20-12.7.amzn1.x86_64                                                                                                                                         38/78 
  Verifying  : libtool-2.4.2-20.4.8.3.31.amzn1.x86_64                                                                                                                                      39/78 
  Verifying  : libstdc++48-devel-4.8.3-9.111.amzn1.x86_64                                                                                                                                  40/78 
  Verifying  : gettext-libs-0.18.1.1-9.1.11.amzn1.x86_64                                                                                                                                   41/78 
  Verifying  : elfutils-0.163-3.18.amzn1.x86_64                                                                                                                                            42/78 
  Verifying  : git-2.7.5-1.49.amzn1.x86_64                                                                                                                                                 43/78 
  Verifying  : flex-2.5.37-3.13.amzn1.x86_64                                                                                                                                               44/78 
  Verifying  : gcc48-gfortran-4.8.3-9.111.amzn1.x86_64                                                                                                                                     45/78 
  Verifying  : libquadmath48-devel-4.8.3-9.111.amzn1.x86_64                                                                                                                                46/78 
  Verifying  : perl-Thread-Queue-3.02-2.5.amzn1.noarch                                                                                                                                     47/78 
  Verifying  : bison-2.7-4.11.amzn1.x86_64                                                                                                                                                 48/78 
  Verifying  : gcc48-4.8.3-9.111.amzn1.x86_64                                                                                                                                              49/78 
  Verifying  : strace-4.8-11.16.amzn1.x86_64                                                                                                                                               50/78 
  Verifying  : kernel-headers-4.9.27-14.31.amzn1.x86_64                                                                                                                                    51/78 
  Verifying  : systemtap-devel-3.1-2.34.amzn1.x86_64                                                                                                                                       52/78 
  Verifying  : gdb-7.6.1-64.33.amzn1.x86_64                                                                                                                                                53/78 
  Verifying  : crash-7.1.8-1.21.amzn1.x86_64                                                                                                                                               54/78 
  Verifying  : perl-Text-Unidecode-0.04-20.7.amzn1.noarch                                                                                                                                  55/78 
  Verifying  : snappy-1.0.5-1.1.amzn1.x86_64                                                                                                                                               56/78 
  Verifying  : ltrace-0.5-23.45svn.6.amzn1.x86_64                                                                                                                                          57/78 
  Verifying  : gcc-c++-4.8.3-3.20.amzn1.noarch                                                                                                                                             58/78 
  Verifying  : lzo-2.08-1.5.amzn1.x86_64                                                                                                                                                   59/78 
  Verifying  : 1:perl-Error-0.17020-2.9.amzn1.noarch                                                                                                                                       60/78 
  Verifying  : perl-XML-Parser-2.41-10.9.amzn1.x86_64                                                                                                                                      61/78 
  Verifying  : systemtap-3.1-2.34.amzn1.x86_64                                                                                                                                             62/78 
  Verifying  : ctags-5.8-2.6.amzn1.x86_64                                                                                                                                                  63/78 
  Verifying  : gcc-gfortran-4.8.3-3.20.amzn1.noarch                                                                                                                                        64/78 
  Verifying  : rcs-5.7-37.7.amzn1.x86_64                                                                                                                                                   65/78 
  Verifying  : glibc-devel-2.17-157.169.amzn1.x86_64                                                                                                                                       66/78 
  Verifying  : kexec-tools-2.0.0-273.11.amzn1.x86_64                                                                                                                                       67/78 
  Verifying  : elfutils-libs-0.163-3.18.amzn1.x86_64                                                                                                                                       68/78 
  Verifying  : autoconf-2.69-11.9.amzn1.noarch                                                                                                                                             69/78 
  Verifying  : rpm-build-4.11.3-21.75.amzn1.x86_64                                                                                                                                         70/78 
  Verifying  : gettext-devel-0.18.1.1-9.1.11.amzn1.x86_64                                                                                                                                  71/78 
  Verifying  : libgfortran-4.8.3-9.111.amzn1.x86_64                                                                                                                                        72/78 
  Verifying  : perl-Git-2.7.5-1.49.amzn1.noarch                                                                                                                                            73/78 
  Verifying  : cpp48-4.8.3-9.111.amzn1.x86_64                                                                                                                                              74/78 
  Verifying  : gcc48-c++-4.8.3-9.111.amzn1.x86_64                                                                                                                                          75/78 
  Verifying  : subversion-1.9.5-1.56.amzn1.x86_64                                                                                                                                          76/78 
  Verifying  : libquadmath-4.8.3-9.111.amzn1.x86_64                                                                                                                                        77/78 
  Verifying  : apr-util-1.4.1-4.17.amzn1.x86_64                                                                                                                                            78/78 

Installed:
  autoconf.noarch 0:2.69-11.9.amzn1             automake.noarch 0:1.13.4-3.15.amzn1             bison.x86_64 0:2.7-4.11.amzn1                  byacc.x86_64 0:1.9.20070509-7.8.amzn1             
  crash.x86_64 0:7.1.8-1.21.amzn1               cscope.x86_64 0:15.6-6.5.amzn1                  ctags.x86_64 0:5.8-2.6.amzn1                   cvs.x86_64 0:1.11.23-16.9.amzn1                   
  diffstat.x86_64 0:1.51-2.5.amzn1              doxygen.x86_64 1:1.8.2-1.11.amzn1               elfutils.x86_64 0:0.163-3.18.amzn1             flex.x86_64 0:2.5.37-3.13.amzn1                   
  gcc.noarch 0:4.8.3-3.20.amzn1                 gcc-c++.noarch 0:4.8.3-3.20.amzn1               gcc-gfortran.noarch 0:4.8.3-3.20.amzn1         gdb.x86_64 0:7.6.1-64.33.amzn1                    
  gettext.x86_64 0:0.18.1.1-9.1.11.amzn1        git.x86_64 0:2.7.5-1.49.amzn1                   indent.x86_64 0:2.2.10-7.6.amzn1               intltool.noarch 0:0.41.0-1.1.5.amzn1              
  kexec-tools.x86_64 0:2.0.0-273.11.amzn1       latrace.x86_64 0:0.5.9-2.2.amzn1                libtool.x86_64 0:2.4.2-20.4.8.3.31.amzn1       ltrace.x86_64 0:0.5-23.45svn.6.amzn1              
  patch.x86_64 0:2.7.1-8.9.amzn1                patchutils.x86_64 0:0.3.1-3.1.5.amzn1           rcs.x86_64 0:5.7-37.7.amzn1                    rpm-build.x86_64 0:4.11.3-21.75.amzn1             
  strace.x86_64 0:4.8-11.16.amzn1               subversion.x86_64 0:1.9.5-1.56.amzn1            swig.x86_64 0:2.0.10-4.24.amzn1                system-rpm-config.noarch 0:9.0.3-42.28.amzn1      
  systemtap.x86_64 0:3.1-2.34.amzn1             systemtap-runtime.x86_64 0:3.1-2.34.amzn1       texinfo.x86_64 0:5.1-4.10.amzn1                valgrind.x86_64 1:3.10.0-16.14.amzn1              

Dependency Installed:
  apr.x86_64 0:1.5.1-1.12.amzn1                apr-util.x86_64 0:1.4.1-4.17.amzn1            avahi-libs.x86_64 0:0.6.25-12.17.amzn1               busybox.x86_64 1:1.19.3-2.11.amzn1             
  cpp48.x86_64 0:4.8.3-9.111.amzn1             dyninst.x86_64 0:8.1.2-6.3.amzn1              elfutils-libs.x86_64 0:0.163-3.18.amzn1              gcc48.x86_64 0:4.8.3-9.111.amzn1               
  gcc48-c++.x86_64 0:4.8.3-9.111.amzn1         gcc48-gfortran.x86_64 0:4.8.3-9.111.amzn1     gettext-common-devel.noarch 0:0.18.1.1-9.1.11.amzn1  gettext-devel.x86_64 0:0.18.1.1-9.1.11.amzn1   
  gettext-libs.x86_64 0:0.18.1.1-9.1.11.amzn1  glibc-devel.x86_64 0:2.17-157.169.amzn1       glibc-headers.x86_64 0:2.17-157.169.amzn1            hardlink.x86_64 1:1.0-10.4.amzn1               
  kernel-devel.x86_64 0:4.9.27-14.31.amzn1     kernel-headers.x86_64 0:4.9.27-14.31.amzn1    libdwarf.x86_64 0:20130207-3.3.amzn1                 libgfortran.x86_64 0:4.8.3-9.111.amzn1         
  libgomp.x86_64 0:4.8.3-9.111.amzn1           libmpc.x86_64 0:1.0.1-3.3.amzn1               libquadmath.x86_64 0:4.8.3-9.111.amzn1               libquadmath48-devel.x86_64 0:4.8.3-9.111.amzn1 
  libserf.x86_64 0:1.3.7-1.7.amzn1             libstdc++48-devel.x86_64 0:4.8.3-9.111.amzn1  lzo.x86_64 0:2.08-1.5.amzn1                          m4.x86_64 0:1.4.16-9.10.amzn1                  
  mpfr.x86_64 0:3.1.1-4.14.amzn1               perl-Data-Dumper.x86_64 0:2.145-3.5.amzn1     perl-Error.noarch 1:0.17020-2.9.amzn1                perl-Git.noarch 0:2.7.5-1.49.amzn1             
  perl-TermReadKey.x86_64 0:2.30-20.9.amzn1    perl-Test-Harness.noarch 0:3.28-3.6.amzn1     perl-Text-Unidecode.noarch 0:0.04-20.7.amzn1         perl-Thread-Queue.noarch 0:3.02-2.5.amzn1      
  perl-XML-Parser.x86_64 0:2.41-10.9.amzn1     perl-libintl.x86_64 0:1.20-12.7.amzn1         snappy.x86_64 0:1.0.5-1.1.amzn1                      subversion-libs.x86_64 0:1.9.5-1.56.amzn1      
  systemtap-client.x86_64 0:3.1-2.34.amzn1     systemtap-devel.x86_64 0:3.1-2.34.amzn1      

Complete!
[ec2-user@ip-172-31-20-224 ~]$ sudo yum install -y fio
Loaded plugins: priorities, update-motd, upgrade-helper
Resolving Dependencies
--> Running transaction check
---> Package fio.x86_64 0:2.1.5-1.5.amzn1 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

=================================================================================================================================================================================================
 Package                                  Arch                                        Version                                               Repository                                      Size
=================================================================================================================================================================================================
Installing:
 fio                                      x86_64                                      2.1.5-1.5.amzn1                                       amzn-main                                      287 k

Transaction Summary
=================================================================================================================================================================================================
Install  1 Package

Total download size: 287 k
Installed size: 1.2 M
Downloading packages:
fio-2.1.5-1.5.amzn1.x86_64.rpm                                                                                                                                            | 287 kB  00:00:00     
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : fio-2.1.5-1.5.amzn1.x86_64                                                                                                                                                    1/1 
  Verifying  : fio-2.1.5-1.5.amzn1.x86_64                                                                                                                                                    1/1 

Installed:
  fio.x86_64 0:2.1.5-1.5.amzn1                                                                                                                                                                   

Complete!
[ec2-user@ip-172-31-20-224 ~]$ sudo yum install -y ruby
Loaded plugins: priorities, update-motd, upgrade-helper
amzn-main                                                                                                                                                                 | 2.1 kB  00:00:00     
amzn-updates                                                                                                                                                              | 2.3 kB  00:00:00     
Package 1:ruby-2.0-0.3.amzn1.noarch already installed and latest version
Nothing to do
[ec2-user@ip-172-31-20-224 ~]$ sudo wget https://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.noarch.rpm
--2017-06-08 15:39:30--  https://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.noarch.rpm
Resolving s3.amazonaws.com (s3.amazonaws.com)... 52.216.224.67
Connecting to s3.amazonaws.com (s3.amazonaws.com)|52.216.224.67|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 201239 (197K) [application/x-rpm]
Saving to: ‘ec2-ami-tools.noarch.rpm’

ec2-ami-tools.noarch.rpm                         100%[=======================================================================================================>] 196.52K   500KB/s    in 0.4s    

2017-06-08 15:39:31 (500 KB/s) - ‘ec2-ami-tools.noarch.rpm’ saved [201239/201239]

[ec2-user@ip-172-31-20-224 ~]$ sudo yum install ec2-ami-tools.noarch.rpm
Loaded plugins: priorities, update-motd, upgrade-helper
Examining ec2-ami-tools.noarch.rpm: ec2-ami-tools-1.5-7.noarch
Marking ec2-ami-tools.noarch.rpm to be installed
Resolving Dependencies
--> Running transaction check
---> Package ec2-ami-tools.noarch 0:1.5-7 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

=================================================================================================================================================================================================
 Package                                         Arch                                     Version                                  Repository                                               Size
=================================================================================================================================================================================================
Installing:
 ec2-ami-tools                                   noarch                                   1.5-7                                    /ec2-ami-tools.noarch                                   766 k

Transaction Summary
=================================================================================================================================================================================================
Install  1 Package

Total size: 766 k
Installed size: 766 k
Is this ok [y/d/N]: y
Downloading packages:
Running transaction check
Running transaction test
Transaction test succeeded
Running transaction
  Installing : ec2-ami-tools-1.5-7.noarch                                                                                                                                                    1/1 
  Verifying  : ec2-ami-tools-1.5-7.noarch                                                                                                                                                    1/1 

Installed:
  ec2-ami-tools.noarch 0:1.5-7                                                                                                                                                                   

Complete!
[ec2-user@ip-172-31-20-224 ~]$ ec2-ami-tools-version
/usr/share/ruby/vendor_ruby/2.0/rubygems/core_ext/kernel_require.rb:55:in `require': cannot load such file -- ec2/amitools/version (LoadError)
	from /usr/share/ruby/vendor_ruby/2.0/rubygems/core_ext/kernel_require.rb:55:in `require'
	from /usr/lib/ruby/site_ruby/ec2/amitools/showversion.rb:11:in `<main>'
[ec2-user@ip-172-31-20-224 ~]$ sudo yum install -y aws-apitools-ec2
Loaded plugins: priorities, update-motd, upgrade-helper
amzn-main                                                                                                                                                                 | 2.1 kB  00:00:00     
amzn-updates                                                                                                                                                              | 2.3 kB  00:00:00     
Package aws-apitools-ec2-1.7.3.0-1.0.amzn1.noarch already installed and latest version
Nothing to do
[ec2-user@ip-172-31-20-224 ~]$ 
