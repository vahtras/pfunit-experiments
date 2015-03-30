module orbital_queries
implicit none
#include "maxorb.h"
#include "maxash.h"
#include "infind.h"

contains
    function is_frozen(orbital) result(frozen)
    implicit none
    integer orbital
    logical frozen
    frozen = iobtyp(orbital).eq.jtfro
    end function is_frozen

    function is_inactive(orbital) result(inactive)
    implicit none
    integer orbital
    logical inactive
    inactive = iobtyp(orbital).eq.jtinac
    end function is_inactive

    function is_active(orbital) result(active)
    implicit none
    integer orbital
    logical active
    active = iobtyp(orbital).eq.jtact
    end function is_active

    function is_virtual(orbital) result(active)
    implicit none
    integer orbital
    logical active
    active = iobtyp(orbital).eq.jtsec
    end function is_virtual

end module orbital_queries
