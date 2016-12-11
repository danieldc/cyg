# cyg - a small command line utility to install cygwin packages on the machine

cyg is a small utility to install cygwin packages from the comand line on the machine.
The main use case is to help automate new machine setup, and to allow declaratively what packages must be installed.


# Commands supported by cyg utility

cyg install p1,p2,p3   -- install p1, p2 and p3 packages
cyg download p1,p2,p3  -- download p1, p2 and p3 packages from internet
cyg local-install p1,p2,p3  -- install p1, p2 and p3 packages from local dir
cyg uninstall p1,p2,p3  -- uninstall p1, p2 and p3 packages
cyg list               -- list all installed packages
cyg local-list         -- list all locally downloaded packages
cyg details p1 p2 p3   -- get details about packages p1, p2 and p3
cyg grep-details foo   -- grep package details for foo string
cyg find-package /a/b/c1 /a/b/c2 ...   -- get package containing /a/b/c file
cyg grep-package packageNameRegexp     -- grep online packages from cygwin.com using packageNameRegexp
cyg upgrade             -- upgrade all packages to their latest version
cyg upgrade p1,p2,p3    -- upgrade p1,p2 and p3 packages to their latest version


# Configuration

The cyg utility expects the following directory setup:
- c:\cygwin64-setup\ -- the local cache for cygwin packages
- c:\cygwin64\ -- the place where cygwin will be installed


