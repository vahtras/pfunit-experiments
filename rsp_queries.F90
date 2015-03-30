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

    function is_inactive(orbital) result(inactive)
    implicit none
    integer orbital
    logical inactive
#include "maxorb.h"
#include "maxash.h"
#include "infind.h"
    inactive = iobtyp(orbital).eq.jtinac
    end function is_inactive

    function is_active(orbital) result(active)
    implicit none
    integer orbital
    logical active
#include "maxorb.h"
#include "maxash.h"
#include "infind.h"
    active = iobtyp(orbital).eq.jtact
    end function is_active

    function is_virtual(orbital) result(active)
    implicit none
    integer orbital
    logical active
#include "maxorb.h"
#include "maxash.h"
#include "infind.h"
    active = iobtyp(orbital).eq.jtsec
    end function is_virtual

end module orbital_queries
