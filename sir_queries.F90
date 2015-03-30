module orbital_queries
implicit none
#include "maxorb.h"
#include "maxash.h"
#include "infind.h"
#include "orbtypdef.h"

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

    function is_frozen_frozen(orbital1, orbital2) result(frofro)
    implicit none
    integer:: orbital1, orbital2
    logical:: frofro
    frofro = idbtyp(iobtyp(orbital1), iobtyp(orbital2)) .eq. jtfrfr
    end function is_frozen_frozen

    function is_inactive_frozen(orbital1, orbital2) result(frofro)
    implicit none
    integer:: orbital1, orbital2
    logical:: frofro
    frofro = idbtyp(iobtyp(orbital1), iobtyp(orbital2)) .eq. jtinfr
    end function is_inactive_frozen

    function is_active_frozen(orbital1, orbital2) result(actfro)
    implicit none
    integer:: orbital1, orbital2
    logical:: actfro
    actfro = idbtyp(iobtyp(orbital1), iobtyp(orbital2)) .eq. jtacfr
    end function is_active_frozen

    function is_virtual_frozen(orbital1, orbital2) result(virfro)
    implicit none
    integer:: orbital1, orbital2
    logical:: virfro
    virfro = idbtyp(iobtyp(orbital1), iobtyp(orbital2)) .eq. jtsefr
    end function is_virtual_frozen

    function is_inactive_inactive(orbital1, orbital2) result(inin)
    implicit none
    integer:: orbital1, orbital2
    logical:: inin
    inin = idbtyp(iobtyp(orbital1), iobtyp(orbital2)) .eq. jtinin
    end function is_inactive_inactive

    function is_active_inactive(orbital1, orbital2) result(actin)
    implicit none
    integer:: orbital1, orbital2
    logical:: actin
    actin = idbtyp(iobtyp(orbital1), iobtyp(orbital2)) .eq. jtacin
    end function is_active_inactive

    function is_virtual_inactive(orbital1, orbital2) result(virin)
    implicit none
    integer:: orbital1, orbital2
    logical:: virin
    virin = idbtyp(iobtyp(orbital1), iobtyp(orbital2)) .eq. jtsein
    end function is_virtual_inactive

    function is_active_active(orbital1, orbital2) result(actact)
    implicit none
    integer:: orbital1, orbital2
    logical:: actact
    actact = idbtyp(iobtyp(orbital1), iobtyp(orbital2)) .eq. jtacac
    end function is_active_active

    function is_virtual_active(orbital1, orbital2) result(virac)
    implicit none
    integer:: orbital1, orbital2
    logical:: virac
    virac = idbtyp(iobtyp(orbital1), iobtyp(orbital2)) .eq. jtseac
    end function is_virtual_active

    function is_virtual_virtual(orbital1, orbital2) result(virvir)
    implicit none
    integer:: orbital1, orbital2
    logical:: virvir
    virvir = idbtyp(iobtyp(orbital1), iobtyp(orbital2)) .eq. jtsese
    end function is_virtual_virtual

end module orbital_queries
