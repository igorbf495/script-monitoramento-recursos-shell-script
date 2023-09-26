#!/bin/bash

while true; do
  clear
  echo "Uso da CPU:"
  top -bn1 | grep "Cpu(s)" | sed 's/.*, *\([0-9.]*\)%* id.*/\1/' | awk '{print "  Uso total: " 100 - $1 "%"}'
  echo ""
  
  echo "Uso da Memória RAM:"
  free -m | grep "Mem:" | awk '{print "  Total: " $2 "MB"}'
  free -m | grep "Mem:" | awk '{print "  Usado: " $3 "MB"}'
  free -m | grep "Mem:" | awk '{print "  Disponível: " $4 "MB"}'
  echo ""
  
  echo "Uso do Espaço em Disco:"
  df -h | grep "/dev/sda1" | awk '{print "  Total: " $2}'
  df -h | grep "/dev/sda1" | awk '{print "  Usado: " $3}'
  df -h | grep "/dev/sda1" | awk '{print "  Disponível: " $4}'
  echo ""
  
  sleep 5
done
