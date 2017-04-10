#!/bin/bash

#./steamcmd.sh +login anonymous +force_install_dir /server/csgo +app_update 740 validate +quit      

cd $HOME/hlserver
#csgo/srcds_run -game csgo -console -usercon +game_type $GAME_TYPE \
#                               +game_mode $GAME_MODE \
#                               +mapgroup $MAPGROUP \
#                               +map $MAP  $STARTUP_OPTIONS
./csgo/srcds_run -game csgo -tickrate 128 -autoupdate -steam_dir ~/hlserver -steamcmd_script ~/hlserver/csgo_ds.txt $@
