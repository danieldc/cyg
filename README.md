# cyg - a small command line utility to install cygwin packages 

cyg is a small utility to install cygwin packages on a windows machine, from the comand line.
The main use cases are:
- do cygwin setup/maintenance operations from the command line
- help automate setting up new windows machine declaratively (i.e. have a file with pacakges to be installed)


# Commands supported by cyg utility

| Command   | Example                       | Description                                   |
|-----------|-------------------------------|-----------------------------------------------|
| cyg list      | `cyg list`                | lists all installed packages                  |
| cyg install   | `cyg install p1,p2,p3`    | installs p1, p2 and p3 packages               |
| cyg uninstall | `cyg uninstall p1,p2,p3`  | uninstalls p1, p2 and p3 packages             |
| cyg upgrade   | `cyg upgrade`             | upgrade all packages to their latest version  |
|               | `cyg upgrade p1,p2,p3`    | upgrade p1,p2 and p3 packages to their latest version |
| cyg details   | `cyg details p1 p2 p3`    | get details about packages p1, p2 and p3      |
| cyg grep-details  | `cyg grep-details foo`| grep package details for foo string           |
| cyg find-pacakge  | `cyg find-package /a/b/c1 /a/b/c2 ...` | get package containing /a/b/c file |
| cyg grep-package  | `cyg grep-package packageNameRegexp`   | grep online packages from cygwin.com using packageNameRegexp |
| cyg download      | `cyg download p1,p2,p3`                | download p1, p2 and p3 packages from internet |
| cyg local-install | `cyg local-install p1,p2,p3`           | install p1, p2 and p3 packages from local dir |
| cyg local-list    | `cyg local-list`      | list all locally downloaded packages          |    


# Configuration

The cyg utility uses the following directory setup:
- c:\cygwin64-setup\ -- the local cache for cygwin packages
- c:\cygwin64\ -- the place where cygwin will be installed
