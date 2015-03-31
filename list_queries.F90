module list_queries
contains
    function is_in_list(element, list) result(is_in)
    implicit none
    character(*) :: element
    character(*), dimension(:) :: list
    logical is_in

    integer i
    is_in = .false.
    do i=1, size(list)
        if (element.eq.list(i)) then
            is_in = .true.
            exit
        end if
    end do
    end function is_in_list

    function get_index(element, list) result(ind)
    implicit none
    character(*) :: element
    character(*), dimension(:) :: list
    integer ind, i
    ind = 0
    do i=1, size(list)
        if (element.eq.list(i)) then
            ind = i
            exit
        end if
    end do
    end function get_index

end module list_queries
