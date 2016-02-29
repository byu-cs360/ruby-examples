# Networking

Example Ruby scripts to demonstrate writing network code.

Contents:

1) echo - A simple echo client and server.

   a) server-socket.rb - An echo server that uses the Socket class,
   which provides direct access to the BSD socket API.

   b) client-socket.rb - An echo client that uses the Socket class.

   c) server-tcp.rb - An echo server that uses the TCPServer class,
   which simplifies server creation.

   d) client-tcp.rb - An echo client that uses the TCPSocket class,
   which simplifies client creation.

Syntax:

```
server-socket.rb -p PORT
client-socket.rb -s SERVER -p PORT
```

```
server-tcp.rb -p PORT
client-tcp.rb -s SERVER -p PORT
```
