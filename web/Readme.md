DaemonRinger
=========

This is a client/server setup for a "doorbell" ringer. The daemon runs on the client computers and the server "sends" rings to the client computers. Whenever the daemon receives a ring, it will display the custom message and play a ringtone.

###Requirements###

 * Windows computer
 * Apache webserver with PHP


###Files###

 * exec/DaemonRinger.au3 - **AutoIt Daemon**
 * web/index.html - **Website interface**
 * web/handle.php - **Server-side ring handler**
 * web/download.html - **Used to distribute the Daemon**

###Creating individual Daemons ###

The DaemonRinger.au3 must be compiled individually per client computer. The global variable $name must be set accordingly

    #!AutoIt
    Global $name = "your name"

Additionally, the server URL must be set

    #!AutoIt
    Global $url = "http://plankenau.com/ringer/handle.php?op="

