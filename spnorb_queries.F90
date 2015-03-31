module infhso_mod
#include "infhso.h"
end module infhso_mod

module spnorb_queries
implicit none

contains
    function is_one_electron(label) result(is_one)
    use infhso_mod, only: one_electron_spin_orbit_labels, mean_field_spin_orbit_labels
    use list_queries, only: is_in_list
    implicit none
    character*8 label
    logical is_one
    is_one = is_in_list(label, one_electron_spin_orbit_labels).or. &
        is_in_list(label, mean_field_spin_orbit_labels)
    end function is_one_electron

    function is_valid_spin_orbit(label) result(is_valid)
    use infhso_mod, only: &
        two_electron_spin_orbit_labels, &
        full_electron_spin_orbit_labels
    use list_queries, only: is_in_list
    character*8 label
    logical is_valid
    is_valid = is_one_electron(label).or. &
        is_in_list(label, two_electron_spin_orbit_labels).or. &
        is_in_list(label, full_electron_spin_orbit_labels)
    end function is_valid_spin_orbit

end module spnorb_queries
    
