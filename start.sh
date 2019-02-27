#!/usr/bin/env bash

work_dir=`pwd`
port=4570
echo "启动Wiki系统中"
echo "当前目录：$work_dir"
nohup gollum -p $port $work_dir > /dev/null &
echo "Wiki系统已启动"
