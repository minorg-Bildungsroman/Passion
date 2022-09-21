#!/bin/bash

set -e

cd `dirname "$(readlink -f "$0")"`/..
export ROOT_DIRECTORY_PATH=$PWD

export PYTHONPATH=$ROOT_DIRECTORY_PATH/paradicms/etl:$ROOT_DIRECTORY_PATH/paradicms/gui/loader

#COLLECTION=Passion
COLLECTION=Thinker-Doer
#OUTPUT_DATA=Bildungsroman.ttl
#OUTPUT_FORMAT=ttl-rdf
OUTPUT_DATA=$ROOT_DIRECTORY_PATH/Bildungsroman-gui
OUTPUT_FORMAT=exhibition

cd paradicms/gui/loader
poetry run python3 $ROOT_DIRECTORY_PATH/gui-action/action.py \
    --debug 1 --dev \
    --base-url-path /$COLLECTION \
    --configuration-file-path $ROOT_DIRECTORY_PATH/Bildungsroman/configuration.ttl \
    --id Bildungsroman \
    --input-data $ROOT_DIRECTORY_PATH/Bildungsroman/$COLLECTION \
    --input-format markdown \
    --output-data $OUTPUT_DATA --output-format $OUTPUT_FORMAT
