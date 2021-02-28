#!/usr/bin/env bash

set -eu

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

$DIR/20-backend/apply.sh
$DIR/30-main/apply.sh
