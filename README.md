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

