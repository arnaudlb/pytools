#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2015-05-25 01:38:24 +0100 (Mon, 25 May 2015)
#
#  https://github.com/harisekhon/pytools
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help improve or steer this or other code I publish
#
#  https://www.linkedin.com/in/harisekhon
#

set -eu
[ -n "${DEBUG:-}" ] && set -x
srcdir2="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

. "$srcdir2/excluded.sh"
. "$srcdir2/../bash-tools/utils.sh"
. "$srcdir2/../bash-tools/docker.sh"

srcdir="$srcdir2"

hr(){
    echo "================================================================================"
}

if [ -n "${TRAVIS:-}" ]; then
    sudo=sudo
else
    sudo=""
fi

export SPARK_HOME="$(ls -d tests/spark-*-bin-hadoop* | head -n 1)"

. "$srcdir/excluded.sh"

. "$srcdir/check.sh"
