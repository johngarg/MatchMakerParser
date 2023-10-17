#-
#include generaldefs.h
#include /usr/local/lib/python3.11/site-packages/matchmakereft/core/procedures.h

#define NumParts "4"
#define NumDiags "0"
* max power of external momenta that we'll keep
#define Nmax "1"
* min inverse power of cutoff that is set to zero (equal to 3-maxdim)
#define LAMBDAINVERSEmax "-3"

v p1, ... , p`NumParts', pol1, ... , pol`NumParts';

#do i=1,`NumDiags';
 S diags'i';
#enddo;
.global;

*>>>>>>>>
#$counter = 0;
*<<<<<<<<

#if `NumDiags'

#do i=1,`NumDiags';
G expr'i'= diags'i';
#enddo
.sort

#include dRbar_qL_Phibar_Wi.aux;


#include wcdimension.dat
id LAMBDA^`LAMBDAINVERSEmax' = 0;


#call doall(`NumParts',setlightmasses,`isnotEFT',`LoopOrder')

id LAMBDA = 1;
id LAMBDA^-1 = 1;
.sort

.store

G  ampldRbarqLPhibarWi=expr1+...+expr`NumDiags';

#else
G ampldRbarqLPhibarWi=0;

#endif

.sort


#call collectterms


#write <dRbar_qL_Phibar_Wi.out> "%X"
print +f;

.end
