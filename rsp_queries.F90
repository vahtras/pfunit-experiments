module rotation_queries
implicit none
#include "inforb.h"
#include "wrkrsp.h"

contains
    function is_orbital_gradient() result(lorb)
    implicit none
    logical lorb
    lorb = kzwopt.gt.0
    end function is_orbital_gradient

    function is_configuration_gradient() result(lcon)
    implicit none
    logical lcon
    if (nsym .eq. 1) then
        lcon = kzconf .gt. 1
    else
        lcon = kzconf .ge. 1
    endif
    end function is_configuration_gradient

end module rotation_queries
    
