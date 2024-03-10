#!/bin/bash

# 定义源和目标目录的路径
JAVA_SRC_DIR="./core/src/main/java/org/apache/spark/shuffle/rdma"
JAVA_DEST_DIR="./build_tetris/src/main/java/org/apache/spark/shuffle/rdma"

SCALA_SRC_DIR="./core/src/main/scala/org/apache/spark/shuffle/rdma"
SCALA_DEST_DIR="./build_tetris/src/main/scala/org/apache/spark/shuffle/rdma"

# 清空./build_tetris/src下的所有文件
rm -rf ./build_tetris/src/*

# 检查并创建目标目录
mkdir -p "$JAVA_DEST_DIR"
mkdir -p "$SCALA_DEST_DIR"

# 复制Java源文件
cp -r "$JAVA_SRC_DIR"/* "$JAVA_DEST_DIR"

# 复制Scala源文件
cp -r "$SCALA_SRC_DIR"/* "$SCALA_DEST_DIR"

# 在./build_tetris目录下执行Maven命令
cd ./build_tetris || exit
mvn -DskipTests clean package -Pspark-2.4.0
