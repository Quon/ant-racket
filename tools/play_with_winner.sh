#!/usr/bin/env sh
./playgame.py -So --player_seed 42 --end_wait=0.25 --verbose --log_dir game_logs --turns 1000 --map_file maps/maze/maze_p02_01.map "$@" \
	"./MyBot" \
	"java -classpath ../AI-Challenge-2011-bot MyBot" |
java -jar visualizer.jar
