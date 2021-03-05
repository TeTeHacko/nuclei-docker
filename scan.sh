#!/bin/sh

/app/nuclei -update-templates
/app/nuclei -t /app/nuclei-templates -l /urls.txt
