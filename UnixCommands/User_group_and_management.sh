useradd
Example: sudo useradd -m john
-m – create a home directory
Explanation: Adds a new user account to the system. -m ensures the home directory is created.

usermod
Example: sudo usermod -aG sudo john
-aG – append user to group(s)
Explanation: Modifies user settings, such as adding the user john to the sudo group.

userdel
Example: sudo userdel -r john
-r – remove home directory and mail spool
Explanation: Deletes a user and optionally their home directory.

groupadd
Example: sudo groupadd developers
Explanation: Creates a new group named developers.

groupdel
Example: sudo groupdel developers
Explanation: Deletes the specified group.

passwd
Example: passwd john
Explanation: Changes the password of the specified user. If run without a username, it changes the current user’s password.

chage
Example: sudo chage -l john
-l – list password aging info

Explanation: Views or modifies password expiration settings for a user.
whoami
Example: whoami
Explanation: Displays the current logged-in username.

who
Example: who
Explanation: Shows who is currently logged into the system and from where.

w
Example: w
Explanation: Displays who is logged in and what they are doing, including idle time and command activity.

id
Example: id john
Explanation: Shows the UID, GID, and group memberships for a user.

groups
Example: groups john
Explanation: Lists all groups that a user belongs to.