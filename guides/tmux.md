# install tmux

`sudo apt install tmux`


`https://www.hamvocke.com/blog/a-guide-to-customizing-your-tmux-conf/`



# tmux shortcuts

`<PREFIX>` => `Ctrl + a`

tmux list sessions 
 
`tmux ls`


attach session (from the list displayed by the above command)

`tmux attach-session -t <session-name>`

detach from current session

`<PREFIX> d`


create new window

`<PREFIX> c`

rename current window

`<PREFIX> ,`


goto cmd line

`<PREFIX> :`






# tmux plugins


## tmux plugin manager

https://github.com/tmux-plugins/tpm

### to install 

`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

### Commands

`prefix + I` => installs the listed plugins in the tmux config

---

## copycat

https://github.com/tmux-plugins/tmux-copycat


`prefix + / `