!----------------------------------------------------------------------------------------------------------------------------------
! SPHERA (Smoothed Particle Hydrodynamics research software; mesh-less Computational Fluid Dynamics code).
! Copyright 2005-2015 (RSE SpA -formerly ERSE SpA, formerly CESI RICERCA, formerly CESI-; SPHERA has been authored for RSE SpA by 
!    Andrea Amicarelli, Antonio Di Monaco, Sauro Manenti, Elia Bon, Daria Gatti, Giordano Agate, Stefano Falappi, 
!    Barbara Flamini, Roberto Guandalini, David Zuccalà).
! Main numerical developments of SPHERA: 
!    Amicarelli et al. (2015,CAF), Amicarelli et al. (2013,IJNME), Manenti et al. (2012,JHE), Di Monaco et al. (2011,EACFM). 
! Email contact: andrea.amicarelli@rse-web.it

! This file is part of SPHERA.
! SPHERA is free software: you can redistribute it and/or modify
! it under the terms of the GNU General Public License as published by
! the Free Software Foundation, either version 3 of the License, or
! (at your option) any later version.
! SPHERA is distributed in the hope that it will be useful,
! but WITHOUT ANY WARRANTY; without even the implied warranty of
! MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
! GNU General Public License for more details.
! You should have received a copy of the GNU General Public License
! along with SPHERA. If not, see <http://www.gnu.org/licenses/>.
!----------------------------------------------------------------------------------------------------------------------------------

!----------------------------------------------------------------------------------------------------------------------------------
! Program unit: FindLine
! Description: Finds extremes of the rectangular frame which contains the boundary mib.
!----------------------------------------------------------------------------------------------------------------------------------

subroutine FindLine (Xmin,Xmax,Nt)
!------------------------
! Modules
!------------------------ 
use I_O_file_module
use Static_allocation_module
use Hybrid_allocation_module
use Dynamic_allocation_module
use I_O_diagnostic_module
!------------------------
! Declarations
!------------------------
implicit none
integer(4),intent(IN) :: Nt
double precision,intent(INOUT),dimension(SPACEDIM,NumTratti) :: Xmin,Xmax
integer(4) :: i,iv,nf
character(len=lencard) :: nomsub = "FindLine"
!------------------------
! Explicit interfaces
!------------------------
!------------------------
! Allocations
!------------------------
!------------------------
! Initializations
!------------------------
!------------------------
! Statements
!------------------------
! Loop on the segments of the line
do iv=Tratto(Nt)%inivertex,(Tratto(Nt)%inivertex+Tratto(Nt)%numvertices-1)
! It checks for the maximum boundary lines storage
   if (iv>NumBVertices) then
      call diagnostic (arg1=10,arg2=2,arg3=nomsub)
   end if
! It evaluates the minimum and maximum coordinates with respect the current 
! vertex nf in the line nt
   nf = BoundaryVertex(iv)
   do i=1,SPACEDIM
      if (Vertice(i,nf)<Xmin(i,Nt)) Xmin(i,Nt)=Vertice(i,nf)
      if (Vertice(i,nf)>Xmax(i,Nt)) Xmax(i,Nt)=Vertice(i,nf)
   end do
end do
!------------------------
! Deallocations
!------------------------
return
end subroutine FindLine
