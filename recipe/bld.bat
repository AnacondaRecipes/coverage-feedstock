%PYTHON% -m pip install . --no-deps --no-build-isolation --ignore-installed --no-cache-dir -vv
if %ERRORLEVEL% neq 0 exit %ERRORLEVEL%

:: Remove versioned entrypoints.
%PYTHON% -c "import os; print('_'.join(os.environ['PY_VER'].split('.')[0]))" > temp.txt
set /p PY_VER_MAJ=<temp.txt
del temp.txt

del %PREFIX%\Scripts\coverage%PY_VER_MAJ%-script.py
del %PREFIX%\Scripts\coverage%PY_VER_MAJ%.exe
del %PREFIX%\Scripts\coverage%PY_VER_MAJ%.exe.manifest

del %PREFIX%\Scripts\coverage-%PY_VER%-script.py
del %PREFIX%\Scripts\coverage-%PY_VER%.exe
del %PREFIX%\Scripts\coverage-%PY_VER%.exe.manifest

dir /s "%PREFIX%\Scripts\coverage*"
