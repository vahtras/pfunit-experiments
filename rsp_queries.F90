module wrkrsp_mod
#include "wrkrsp.h"
end module wrkrsp_mod

module rotation_queries
implicit none

contains
    function is_orbital_gradient() result(lorb)
    use wrkrsp_mod, only: kzwopt
    implicit none
    logical lorb
    lorb = kzwopt.gt.0
    end function is_orbital_gradient

    function is_configuration_gradient() result(lcon)
    use wrkrsp_mod, only: kzconf, ksymop
    implicit none
    logical lcon
    if (ksymop .eq. 1) then
        lcon = kzconf .gt. 1
    else
        lcon = kzconf .ge. 1
    endif
    end function is_configuration_gradient

end module rotation_queries
    
