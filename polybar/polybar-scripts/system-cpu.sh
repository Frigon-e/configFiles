#!/bin/sh

# echo "︁ $[100-$(vmstat 1 2|tail -1|awk '{print $15}')]%  $(sensors coretemp-isa-0000| grep -A 0 'Package id 0' | cut -c17-18)°C"
# echo "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]%  $(sensors k10temp-pci-00c3| grep -A 0 'Package id 0' | cut -c17-18)°C"
#sensors | grep "Package id 0:" | tr -d '+' | awk '{print $4}'
#echo "$[100-$(vmstat 1 2|tail -1|awk '{print $15}')]%  $(sensors k10temp-pci-00c3| grep -A 0 'Package id 0' | cut -c17-18)°C"
#echo $(sensors k10temp-pci-00c3) | cut -c78-80 | echo j"°C"
echo $(sensors k10temp-pci-00c3 | cut -c79-80)
