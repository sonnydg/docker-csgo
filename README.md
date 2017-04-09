# Official Counter-Strike : Global Offensive Container on EdenServers



![](http://image.noelshack.com/fichiers/2015/35/1440632013-csgo-logo1.png)

All-in-one Counter-Strike : Global Offensive Server Container built for [EdenServers](http://www.edenservers.us).

It also includes an SCP server.

---

**This image is meant to be used on an EdenServers Server.**

Our images are built to specifically run for our services. You can run it directly with Docker though.

---
### 1.0.0 (2015-08-27)

This initial version contains:

* *steamcmd*, and a pre-installed CS:GO Server
* *scp* Server to upload and download files

---

## Install

    $ docker pull edenservers/docker-csgo

---

## Config

Instructions for CS:GO config can be found [here](https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers).

| Environment Variable  | Description |
| ------------- | ------------- |
| GAME_TYPE | CS:GO Gametype  |
| GAME_MODE   | CS:GO Gamemode  |
| MAPGROUP    | CS:GO Mapgroup  |
| MAP    | CS:GO Map  |
| STARTUP_OPTIONS    | Additional startup options  |
| USERNAME    | SCP Username  |
| PASSWORD     | SCP Password  |

| Port  | Description |
| ------------- | ------------- |
| 27015 | CS:GO and RCON  |
| 22 | SCP  |

---

## Run example

    $ docker run -e GAME_TYPE=0 -e GAME_MODE=0 -e MAPGROUP=mg_bomb -e MAP=de_dust2 -e USERNAME=edenservers -e PASSWORD=edenservers -p 27015:27015 -p 27015:27015/udp -p 1234:22 -d edenservers/docker-csgo

---

Made by [![EdenServers](http://image.noelshack.com/fichiers/2015/35/1440630894-logo.png)](https://www.edenservers.us)
