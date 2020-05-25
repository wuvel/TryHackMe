#!/bin/bash

for i in {0..100}; do
    content=$(curl http://10.10.234.214/th1s_1s_h1dd3n/?secret="{$i}")
    echo "Loop $i" 
    echo "$content" 
done

#y2RPJ4QaPF!B -> Stego