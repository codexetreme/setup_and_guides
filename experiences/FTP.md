# Thoughts on working with FTPS

so with the java FTPS library, it is not easy to get FTPS up and running.

a few hitches are:
1. you may not have set a passive connection, this means that you are the one who picks the port over which the data transfer will happen, and not the server (hence "active")
    if you goto passive mode via `enterLocalPassiveMode`, then the server will select a port for you. this is advised since it means you get to keep a tight lock on the total open ports on the server.


2. once connected , the protocol needs to be set. FTP is old. So even when connecting over a secure connection (like say FTP over TLS - AKA - FTPS), it will attempt to send data in cleartext, and this will most likely not be correctly setup for your server. Instead you need to tell the server that yes your data is indeed encrypted. 
To do this, simple send a `PROT P` command , you can send P for protected or C for cleartext.

via the java FTPSClient it is `sendProt("P")`
send this immediately afer connection.

3. File modes, older FTP servers assume ASCII (I think, not sure). But mine did not, it only did binary, so I set it to binary mode. `ftpClient.setFileType(FTP.BINARY_FILE_TYPE)`

4. after this, just make sure your files are ready and open them up via any type of an input stream, and you are set :)
