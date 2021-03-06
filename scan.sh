#!/bin/sh

echo 192.168.1.0/24 | httpx > /urls.txt

nuclei -update-templates
nuclei -t /app/nuclei-templates -l /urls.txt
