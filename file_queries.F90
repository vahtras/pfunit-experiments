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
        call gpclose(lutmp, 'keep')
    end if
99  continue
    end function


end module file_queries
    
