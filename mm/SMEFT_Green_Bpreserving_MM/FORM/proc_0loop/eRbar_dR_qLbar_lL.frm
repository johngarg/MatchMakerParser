#-
#include generaldefs.h
#include /Users/usuario/Library/Python/3.9/lib/python/site-packages/matchmakereft/core/procedures.h

#define NumParts "4"
#define NumDiags "1"
* max power of external momenta that we'll keep
#define Nmax "14"
* min inverse power of cutoff that is set to zero (equal to 3-maxdim)
#define LAMBDAINVERSEmax "-17"

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

#include eRbar_dR_qLbar_lL.aux;


#include wcdimension.dat
id LAMBDA^`LAMBDAINVERSEmax' = 0;


#call doall(`NumParts',setlightmasses,`isnotEFT',`LoopOrder')

id LAMBDA = 1;
id LAMBDA^-1 = 1;
.sort

.store

G  ampleRbardRqLbarlL=expr1+...+expr`NumDiags';

#else
G ampleRbardRqLbarlL=0;

#endif

.sort


#call collectterms


#write <eRbar_dR_qLbar_lL.out> "%X"
print +f;

.end
