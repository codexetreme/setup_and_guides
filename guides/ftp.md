# install 

VSFTPD is the one most people use


steps here are for install on a linux AMI 2 instance

`sudo yum install vsftpd`
for ubuntu do 
`sudo apt-get install vsftpd`


Most VSFTPD’s configuration takes place in /etc/vsftpd/vsftpd.conf. The file itself is well-documented, so this section only highlights some important changes you may want to make. For all available options and basic documentation see the man pages:

`man vsftpd.conf`


Enable Uploading to the FTP server:

The “write_enable” flag must be set to YES in order to allow changes to the filesystem, such as uploading:

`write_enable=YES`


Allow Local Users to Login:

In order to allow users in /etc/passwd to login, the “local_enable” directive must look like this:

`local_enable=YES`


Chroot Jail

It is possible to set up a chroot environment, which prevents the user from leaving his home directory. To enable this, add/change the following lines in the configuration file:

`chroot_list_enable=YES`
`chroot_list_file=/etc/vsftpd.chroot_list`

Restart your FTP server

In the end  you must restart your ftp server. Type in your command line

`sudo systemctl restart vsftpd`