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

## sign your commits

- create a gpg key with `gpg --gen-key`
- Use the following command to list the private GPG key you just created:
    - `gpg --list-secret-keys --keyid-format LONG <your_email>`

- set key to sign commits (the key id is the one when you list the keys)
- `git config --global user.signingkey <keyid>`

Copy the GPG key ID that starts with sec. In the following example, that's `30F2B65B9246B6CA`, this is the `<keyid>`
```

sec   rsa4096/30F2B65B9246B6CA 2017-08-18 [SC]
      D5E4F29F3275DC0CDA8FFC8730F2B65B9246B6CA
uid                   [ultimate] Mr. Robot <your_email>
ssb   rsa4096/B7ABC0813E4028C0 2017-08-18 [E]
```

export your key as 
public key
`gpg --armor --export <keyid>`

private key
`gpg --export-secret-key --armor <keyid>`


MORE INFO [http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/](http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/)



# squashing commits 

When submitting a pull request, and they ask that you squash your commits before they merge.

Some applications that interact with git repos will provide a user interface for squashing. Refer to your application's document for more information.

If you're familiar with Terminal, you can do the following:

- Make sure your branch is up to date with the master branch.
Run `git rebase -i master`.

- You should see a list of commits, each commit starting with the word "pick".
Make sure the first commit says "pick" and change the rest from "pick" to "squash". -- This will squash each commit into the previous commit, which will continue until every commit is squashed into the first commit.

- Save and close the editor.

- It will give you the opportunity to change the commit message.
Save and close the editor again.

- Then you have to force push the final, squashed commit: `git push --force-with-lease origin`.

- Squashing commits can be a tricky process but once you figure it out, it's really helpful and keeps our repo concise and clean.