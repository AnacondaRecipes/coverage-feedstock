#!/bin/bash

$PYTHON -m pip install . --no-deps --no-build-isolation --ignore-installed --no-cache-dir -vv

# Remove versioned entrypoints.
PY_VER_MAJ=$($PYTHON -c "import os; print('_'.join(os.environ['PY_VER'].split('.')[0]))")

rm "${PREFIX}/bin/coverage${PY_VER_MAJ}"
rm "${PREFIX}/bin/coverage-${PY_VER}"

ls $PREFIX/bin/coverage*
