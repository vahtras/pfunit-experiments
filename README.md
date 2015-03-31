fpunit-experiments with Dalton
==============================

* To run this test suite have a working installation of pfunit
     (see e.g. git://git.code.sf.net/p/pfunit/code)
* A recent version of GNU compilers (> 4.8)
* Set environment variable PFUNIT to install directory, *e.g.*
```
export PFUNIT=/opt/pfunit/pfunit-serial
```

* These experimental tests are targeted for use with Dalton (www.daltonprogram.org). Adapt top-level GNUmakefile for Dalton include directory

```
FFLAGS += -I$(HOME)/dev/dalton/DALTON/include
```

Compile and run the tests with
```
$ make
...
./tests.x -xml tests.xml
........................
Time:         0.000 seconds
  
 OK
 (24 tests)
```
The executable `tests.x` has a help menu
./tests.x -h
```
$ ./tests.x -h
 Command line arguments:
  
  Options: 
    '-h', '--help'    : Prints this message
    '-v', '--verbose' : Logs start/stop of each test
    '-d', '--debug'   : Logs start/stop of each test (same as -v)
    '-o <file>'       : Diverts output to specified file
    '-robust'         : (experimental) runs tests in a separate shell
                        Attempts to detect/handle hangs and crashes
    '-skip n'         : used by remote start with 'robust' internally
                        This flag should NOT be used directly by users.
  
```
