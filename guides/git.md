# use ssh over https on github

`git remote -v`

it will look like https://ww.github.com/...

change it via

`git remote set-url origin <link>`

where link is of type git@github.com:codexetreme/...


# Generate ssh key 

- rsa - an old algorithm based on the difficulty of factoring large numbers. A key size of at least 2048 bits is recommended for RSA; 4096 bits is better. RSA is getting old and significant advances are being made in factoring. Choosing a different algorithm may be advisable. It is quite possible the RSA algorithm will become practically breakable in the foreseeable future. All SSH clients support this algorithm.

- dsa - an old US government Digital Signature Algorithm. It is based on the difficulty of computing discrete logarithms. A key size of 1024 would normally be used with it. DSA in its original form is no longer recommended.
- ecdsa - a new Digital Signature Algorithm standarized by the US government, using elliptic curves. This is probably a good algorithm for current applications. Only three key sizes are supported: 256, 384, and 521 (sic!) bits. We would recommend always using it with 521 bits, since the keys are still small and probably more secure than the smaller keys (even though they should be safe as well). Most SSH clients now support this algorithm.

- ed25519 - this is a new algorithm added in OpenSSH. Support for it in clients is not yet universal. Thus its use in general purpose applications may not yet be advisable.

> The algorithm is selected using the -t option and key size using the -b option. The following commands illustrate:

ssh-keygen -t rsa -b 4096
ssh-keygen -t dsa
ssh-keygen -t ecdsa -b 521
ssh-keygen -t ed25519

see `https://www.ssh.com/ssh/keygen/` for more details


## Test ssh connection 

`ssh -T git@github.com`
`ssh -T git@gitlab.com`

sometimes keys may not be added to ssh agent (your push will fail saying no access rights to repo), if so then do

`eval "$(ssh-agent -s)" `
`ssh-add ~/.ssh/<keyname>` (just the keyname, not <keyname>.pub)


## set file to executable mode
add the file via `git add <file>`
then run `git update-index --chmod=+x <file>`
