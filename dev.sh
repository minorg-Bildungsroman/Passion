#!/bin/bash

set -e

cd `dirname "$(readlink -f "$0")"`

export PYTHONPATH=$PWD/etl:$PWD/gui/loader
source $PWD/gui/loader/venv/bin/activate

#COLLECTION=Passion
COLLECTION=Thinker-Doer
#OUTPUT_DATA=Bildungsroman.ttl
#OUTPUT_FORMAT=ttl-rdf
OUTPUT_DATA=Bildungsroman-gui
OUTPUT_FORMAT=bootstrap-exhibition

python3 gui-action/action.py --debug 1 --dev --base-url-path /$COLLECTION --configuration-file-path Bildungsroman/configuration.json --id Bildungsroman --input-data Bildungsroman/$COLLECTION --input-format markdown --output-data $OUTPUT_DATA --output-format $OUTPUT_FORMAT
