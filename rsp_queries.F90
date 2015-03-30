module orbital_queries

contains
    function is_frozen(orbital) result(frozen)
    implicit none
    integer orbital
    logical frozen
#include "maxorb.h"
#include "maxash.h"
#include "infind.h"
    frozen = iobtyp(orbital).eq.jtfro
    end function is_frozen

end module orbital_queries
