#!/bin/bash

. "$(dirname "$0")"/formula/formula.sh --source-only

runFormula "$NUMBER_ONE" "$NUMBER_TWO"
