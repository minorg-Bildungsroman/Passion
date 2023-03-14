#!/bin/bash

set -e

cd `dirname "$(readlink -f "$0")"`

PROJECTS_DIR_PATH=$PWD/../..

cd $PROJECTS_DIR_PATH/paradicms/lib/py/ssg

poetry run $PROJECTS_DIR_PATH/markdown-ssg-action/action.py \
  --dev \
  --markdown-directory-path $PROJECTS_DIR_PATH/Bildungsroman/Thinker-Doer \
  --pipeline-id Thinker-Doer
