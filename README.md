# sqlite3
cxw's arrangement of sqlite-amalgamation for use with soci

With this in ~/src/sqlite3 and soci in ~/src/soci, do:
 - `cd ~/src/sqlite3`
 - `make`
 - `cd ~/src/soci`
 - `mkdir build`
 - `cmake -G 'MSYS Makefiles' -DSOCI_CXX_C11=ON -DSQLITE_ROOT_DIR=/c/MinGW/msys/1.0/home/<yourname>/src/sqlite3 ..`
 - `VERBOSE=1 make`

