#!/usr/bin/env bash

chmod 755 exe

if [ -z "$DEFAULT_TIMEOUT" ]; then
  export DEFAULT_TIMEOUT=5
fi

/usr/bin/time -f "%e" -o time.log timeout $DEFAULT_TIMEOUT bash -c "./exe < run.stdin 2> run.stderr 1> run.stdout || true" || echo "TLE: Execution exceeded the maximum timelimit." > tle.stderr
