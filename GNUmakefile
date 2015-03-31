.PHONY: tests clean all
.DEFAULT_GOAL = tests

# Determine operating system, architecture and compiler
# automatically if possible

                                                                                TOP_DIR := $(shell pwd)
TEST_DIR=$(TOP_DIR)/tests
VPATH = . $(TEST_DIR)
FFLAGS += -I$(HOME)/dev/dalton/DALTON/include

include $(PFUNIT)/include/base.mk

EXE = tests.x
LIBS = -L$(PFUNIT)/lib -lpfunit 

all: $(EXE)
	./$(EXE) -xml tests.xml

TESTS:
	make -C $(TEST_DIR) tests

tests: all

$(EXE): testSuites.inc sir_queries.o rsp_queries.o list_queries.o spnorb_queries.o test_orbital_queries.pf test_rsp_queries.pf test_inlist.pf test_spnorb_queries.pf TESTS
	$(FC) -o $@ -I$(PFUNIT)/mod -I$(PFUNIT)/include -Itests $(PFUNIT)/include/driver.F90 $(TEST_DIR)/*$(OBJ_EXT) *$(OBJ_EXT) $(LIBS) $(FFLAGS) $(FPPFLAGS)

distclean: clean

clean: local-E0-clean

local-E0-clean:
	make -C $(TEST_DIR) clean
	rm -f $(EXE) *$(OBJ_EXT) tests.xml


export FC
export FPPFLAGS
export FFLAGS
export TOP_DIR
export TEST_DIR
export OBJ_EXT
export LIB_EXT
export EXE_EXT

