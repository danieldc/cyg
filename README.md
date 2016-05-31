From what I can see, the cygin installer is split into 2 programs:
- setup (setup-x86_64.exe for 64 bit, or setup.exe for 32 bit)
- cygcheck

The setup program is expected to be run when no cygwin process is active, the cygcheck can be run within bash (though, as any cygwin program, it can be also run inside cmd.exe).
The setup program is used mainly to install or remove packages, or more generically, for operations that require write access.
The cygcheck program is used for listing related activities, or more generically, for operations that are read-only in nature.

The way cygwin setup installer works is:
- internet (cygwin.com, or mirror) stores packages.
- packages get downloaded to the local cache, under `local-package-dir`
- packages get installed to the machine, under `root` directory

Given this the common operations are:
- install: install from internet to `root` dir
- uninstall: remove packages from the `root` dir
- download: download package from internet to `local-package-dir`
- undownload: ??? remove packages from `local-package-dir`
- list-download: ??? list packages under `local-package-dir`
- local-install: install from `local-package-dir` to the `root` dir
- list: list packages under `root` (i.e. installed packages)


| operation             | internet      | local-package-dir | root                      |
|-----------------------|---------------|-------------------|---------------------------|
| create                | n/a           | download          | install (from internet), local-install (from local-package-dir) |
| read/package-list     | grep-package  | ?? list-download  | list                      |
| read/package-find     | grep-package  | pipe list-download to grep | pipe list to grep|
| read/package-details  | n/a           | details           | n/a (use details)         |
| read/package-grep     | not important | grep-details      | n/a (use grep-details)    |
| read/package-from-file| ??            | find-package      | n/a (use find-package)    |
| update                | n/a           | download          | ??                        |
| delete                | n/a           | ??                | uninstall                 |
