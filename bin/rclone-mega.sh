#!/bin/bash

RCLONE='/usr/local/bin/rclone'
FLAGS='--progress -vv'

clone() {
    $RCLONE sync $HOME/Accounting Mega:Accounting $FLAGS
    $RCLONE sync $HOME/Clients Mega:Clients $FLAGS
    $RCLONE sync $HOME/Documents Mega:Documents $FLAGS
    $RCLONE sync $HOME/Flighty Mega:Flighty $FLAGS
    $RCLONE sync $HOME/Florena Mega:Florena $FLAGS
    $RCLONE sync $HOME/Music Mega:Music $FLAGS
    $RCLONE sync $HOME/Stuff Mega:Stuff $FLAGS
}

if [ -z $TERM ]; then
    clone 2>&1 >> ~/.log/rclone.log
else
    clone
fi
