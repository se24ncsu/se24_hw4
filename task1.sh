#!/bin/bash
kill -9 $(ps aux | grep bash | grep infinite.sh | gawk '{print $2}')
