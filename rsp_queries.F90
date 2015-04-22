module wrkrsp_mod
#include "wrkrsp.h"
end module wrkrsp_mod

module infrsp_mod
#include "infrsp.h"
end module  infrsp_mod

module infhyp_mod
#include "rspprp.h"
#include "infhyp.h"
#include "infsmo.h"
#include "infpp.h"
end module infhyp_mod

module rsp_queries
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

    function is_quadratic_response() result(is_quadratic)
    use infhyp_mod, only: hypcal, somom, exmom
    implicit none
    logical is_quadratic
    is_quadratic = hypcal .or. somom .or. exmom
    end function is_quadratic_response
    

end module rsp_queries
    
