.PHONY: tests clean all
.DEFAULT_GOAL = tests
DALTON_DIR = $(HOME)/dev/daltonprogram/dalton

# Determine operating system, architecture and compiler
# automatically if possible

                                                                                TOP_DIR := $(shell pwd)
TEST_DIR=$(TOP_DIR)/tests

VPATH = . $(TEST_DIR)
VPATH += $(DALTON_DIR)/DALTON/sirius 
VPATH += $(DALTON_DIR)/DALTON/rsp 
VPATH += $(DALTON_DIR)/DALTON/gp 
VPATH += $(DALTON_DIR)/DALTON/include 

FFLAGS += -I$(DALTON_DIR)/DALTON/include
FFLAGS += -I$(DALTON_DIR)/DALTON/rsp
FFLAGS += --coverage

include $(PFUNIT)/include/base.mk

EXE = tests.x
LIBS = -L$(PFUNIT)/lib -lpfunit  -llapack -lblas
OBJDIR = $(DALTON_DIR)/build/master-refactor-rsphso/CMakeFiles/dalton.dir/DALTON
LIBS += $(OBJDIR)/sirius/sirgp.F.o
LIBS += $(OBJDIR)/gp/gptrygve.F.o
LIBS += $(OBJDIR)/gp/gphjj.F.o
LIBS += $(OBJDIR)/gp/qpack.F.o
LIBS += $(OBJDIR)/pdpack/printpkg.F.o
LIBS += $(OBJDIR)/pdpack/linextra.F.o
LIBS += $(OBJDIR)/pdpack/linpack.F.o
LIBS += $(OBJDIR)/pdpack/arhpack.F.o

all: $(EXE) 
	./$(EXE) -xml tests.xml

TESTS:
	make -C $(TEST_DIR) tests

rsphso_mod.o: rsphso.F

sir_modules.o: sir_modules.F90
rsp_modules.o: rsp_modules.F90
include_mod.o: include_mod.F90
mpi_dummy.o: mpi_dummy.F

tests: all

$(EXE): testSuites.inc rsptypes.o sir_queries.o rsp_queries.o list_queries.o spnorb_queries.o file_queries.o rsphso_mod.o sir_modules.o include_mod.o mpi_dummy.o test_orbital_queries.pf test_rsp_queries.pf test_inlist.pf test_spnorb_queries.pf test_rsphso.pf TESTS
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

