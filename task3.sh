#!/bin/bash
titanic=$(cat titanic.csv)

echo "$titanic" | sed 's/,,/,NULL,/g; s/,\n$/,NULL/g; s/,\r$/,NULL/g' | gawk -F',' '$13 ~ /S\s*$/ && $3==2' | sed 's/female/F/g; s/male/M/g' | gawk -F',' '$13 ~ /S\s*$/ && $3==2' | gawk -F',' '$7 != "NULL" {print; age_sum += $7; age_count++} END {print "Average Age:", age_sum/age_count}'
