to allow a host to login
add their public key to authorized_keys file in .ssh folder.


to create it do

`touch authorized_keys`

and then do 

`cat <KEYNAME>.pub >> authorized_keys`

to disable password auth

goto `/etc/ssh/sshd_config` and then set `PasswordAuthentication no`