Debian-based (Ubuntu, Linux Mint, etc.)

Install a package:

Example: sudo apt-get install vim
Explanation: Installs the vim package.

Update package list:

Example: sudo apt-get update
Explanation: Refreshes the local list of available packages from repositories.

Upgrade installed packages:

Example: sudo apt-get upgrade
Explanation: Installs newer versions of currently installed packages.

Remove a package:

Example: sudo apt-get remove vim
Explanation: Removes the specified package (config files remain).

Search packages:

Example: apt-cache search vim
Explanation: Searches for packages matching the term "vim".

Show package details:

Example: apt-cache show vim
Explanation: Displays detailed info about the vim package.

Install .deb file manually:

Example: sudo dpkg -i package.deb
Explanation: Installs a .deb file manually.

Remove installed .deb package:

Example: sudo dpkg -r package
Explanation: Removes a .deb package by name.

Red Hat-based (CentOS, Fedora, RHEL)

Install package with yum (older systems):

Example: sudo yum install nano
Explanation: Installs nano using the traditional RPM-based manager.

Update packages with yum:

Example: sudo yum update
Explanation: Updates all packages on the system.

Remove package with yum:

Example: sudo yum remove nano
Explanation: Uninstalls nano.

Install package with dnf (modern systems):

Example: sudo dnf install nano
Explanation: Same as yum, but used on Fedora, CentOS 8+, RHEL 8+.

Update system with dnf:

Example: sudo dnf update
Explanation: Updates all installed packages.

Remove with dnf:

Example: sudo dnf remove nano
Explanation: Uninstalls a package.

Low-level tools

rpm (Install .rpm directly):
Example: sudo rpm -i package.rpm

-i – install package
Explanation: Installs a prebuilt RPM package.

Remove RPM package:

Example: sudo rpm -e package
-e – erase (remove)
Explanation: Removes an installed RPM package.