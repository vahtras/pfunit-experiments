module file_queries
implicit none

contains

    function found_and_read(record, reclen, label, filename) result(ok)
    double precision, intent(out), dimension(reclen):: record
    integer, intent(in):: reclen
    character*8, intent(in):: label
    character*(*), intent(in):: filename
    logical ok
    integer read_status

    integer lutmp
    logical, external:: fndlab

    inquire(file=filename, exist=ok)
    if (ok) then
        lutmp = -1
        call gpopen(lutmp, filename, 'old','','unformatted',0,.false.)
        rewind lutmp
        if (fndlab(label, lutmp)) then
            read(lutmp, iostat=read_status) record
            ok = read_status.eq.0
        else
            ok = .false.
        end if
        call gpclose(lutmp, 'KEEP')
    end if
99  continue
    end function

    subroutine save_rec_with_label(x, n, label, filename)
    double precision x(n)
    integer n
    character(*) filename
    character(8) label

    integer lutmp
    lutmp = -1
    call gpopen(lutmp, filename, 'unknown','','unformatted',0,.false.)
    print *,'lutmp', lutmp, filename
    rewind lutmp
    call newlab(label, lutmp, 0)
    print *,'newlab'
    write(lutmp) x
    call gpclose(lutmp, 'KEEP')

    end subroutine
    

end module file_queries
    
