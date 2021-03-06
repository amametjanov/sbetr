module abortutils

  !-----------------------------------------------------------------------
  ! !MODULE: abortutils
  !
  ! !DESCRIPTION:
  ! Abort the model for abnormal termination
  !-----------------------------------------------------------------------

  private
  save

  public :: endrun
  interface endrun
     module procedure endrun_vanilla
     module procedure endrun_globalindex
  end interface
  integer  :: iulog = 6        ! "stdout" log file unit number, default is 6
CONTAINS

  !-----------------------------------------------------------------------
  subroutine endrun_vanilla(msg)

    !-----------------------------------------------------------------------
    ! !DESCRIPTION:
    ! Abort the model for abnormal termination
    !
    !
    ! !ARGUMENTS:

    implicit none
    character(len=*), intent(in), optional :: msg    ! string to be printed
    !-----------------------------------------------------------------------

    if (present (msg)) then
       write(iulog,*)'ENDRUN:', msg
    else
       write(iulog,*)'ENDRUN: called without a message string'
    end if

    stop

  end subroutine endrun_vanilla

  !-----------------------------------------------------------------------
  subroutine endrun_globalindex(decomp_index, clmlevel, msg)

    !-----------------------------------------------------------------------
    ! Description:
    ! Abort the model for abnormal termination
    !

    !
    ! Arguments:
    implicit none
    integer          , intent(in)           :: decomp_index
    character(len=*) , intent(in)           :: clmlevel
    character(len=*) , intent(in), optional :: msg    ! string to be printed
    !
    ! Local Variables:
    integer :: igrc, ilun, icol
    !-----------------------------------------------------------------------

    write(6,*)'calling getglobalwrite with decomp_index= ',decomp_index,' and clmlevel= ',trim(clmlevel)


    if (present (msg)) then
       write(iulog,*)'ENDRUN:', msg
    else
       write(iulog,*)'ENDRUN: called without a message string'
    end if

    stop

  end subroutine endrun_globalindex

end module abortutils
