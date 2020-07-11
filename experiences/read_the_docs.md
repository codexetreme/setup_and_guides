---
date: july, 12, 2020
tags: vault, docs, docker, ldap, logs
---

# read the docs

generally, I like to tinker with a lot of things, but recently I got into LDAP and Vault.

and man are these systems messsed up, they takes ages to setup, atleast for me that is the case. The reason I find is that I do not read the docs TM properly. reading docs is quite important. 

Take setting up vault for example, I struggled in so many areas:

1) ldap auth - did not lookup the docker logs on the LDAP container to see that I had accidently changed the password of the test account I had created. (hunted that error for 2 hours)

2) I could not launch vault, because I kept telling it to run on 127.0.0.1:8200, which is the localhost. I `thought` that meant, just expose the port and I am good to go. but man was I wrong. it means nothing like that. localhost in a docker is just localhost, in order to really expose a port you gotta run it on the external interface, ie on 0.0.0.0:PORT 

3) when setting up ACLs for a simple access to certain secrets, it turns out there were 2 versions , v1 and v2, I "thought" simple writing the paths and their permissions is it. But man was I wrong. my `thinking` lead me to debug an error that was so simple: the entire format of the paths was different, spent 3 hours on this. How did I break this through? finally `read the docs TM` and saw that a new convention is in place for the v2 engine. 


Takeaway: always read docs and logs folks, it takes a bit of time to understand where they are coming from, but they are there. Take a moment and find and understand the docs structure. Genrerally there is 2 types:

1. getting started guide
2. the actual docs

take some time and get familiar, then onto the next step

LOGS!!!
 
here you have to understand where they are stored, and if possible change their location to something you are familiar with, eg: if you are running it in a docker, pipe it to stdout and stderr, so that you can see them with the `docker logs command`. As for the other options, I prefer to write it to /var/logs/<appname>/loggy.logs. Or if I am on a docker, mount them to a directory that is open in my VScode. 

your mileage may vary but atleast you have some idea now.

As usual,
Happy Coding and Tinkering
See ya
