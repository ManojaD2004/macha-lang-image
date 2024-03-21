#!/bin/bash


echo "Starting a new shell for client side!!..."
cd ./client && npm run start &
echo "Starting a new shell for server side!!..."
cd ./server && node .

wait

echo "Both of them have executed and exited."
