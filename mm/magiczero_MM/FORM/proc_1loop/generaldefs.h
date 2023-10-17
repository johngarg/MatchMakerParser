#: Parentheses 2000
#: MaxTermSize 300000
#-
Off Statistics;
format Mathematica;
**** First we introduce the definitions that are general to all models
*** Trick to do gam(y,k+p,y)=gam(y,k,y)+gam(y,p,y)
Index itrick;
s sSS, FourPi, I, D, Dy, [MM.epsi], invepsilonbar, [MM.s1], [MM.s2], SIX, SEVEN, FIVE, ct1, ct2, iCPV;
s signo1,signo2,signo3;
v k1; 
CF DEN, ind, val, F, G;
f GAM, SPI;
Auto I mu=D;
F ALARM;
CF Evect, ubspin, uspin, vbspin, vspin, uspin1, vbspin1, ubspin1, vspin1;
CF Mom, dotp, gam, gam1, gam2, prop, invprop, eps, epsM(antisymmetric), deltaF, deltaFF, gi, Sqrt;
CF Log, den, ee, dd;
F INDSPIN, flipped, SPO;
set spins: uspin, vbspin;
s gap;
v p2;
s LAMBDA;
s dummylightmassneverused;

*** Now model specific definitions
S g1, g2, g3, lam, muH, MDelta1, MN;
#define flFunc "lambdaDelta1, lambdaN, yd, yl, yu, YVp, lambdaDelta1bar, lambdaNbar, ydbar, ylbar, yubar, YVpbar, ddF";
#define flmassFunc "";
#define gFunc "C2224, C344, Eps4, EpsSU3, K6, T6, C2224bar, C344bar, Eps4bar, EpsSU3bar, K6bar, T6bar, Ta, Ta4, FSU2L, T6, T, FSU3C, fsu2, fsu3, ee, ee2, dd";
CF `flFunc', `flmassFunc',`gFunc';
set flFunc:`flFunc';
set flmassFunc:`flmassFunc';
set gFunc:`gFunc';

set setlightmasses: dummylightmassneverused, muH;
set setheavymasses: MDelta1, MN;

*** define variable isnotEFT
#define isnotEFT "11"

*** define variable LoopOrder
#define LoopOrder "1"

extrasymbols array esfull;

i <m1=3>, ... , <m100=3>, <mminus1=3>, ... , <mminus100=3>;
set mi: m1, ... , m100, mminus1, ... , mminus100;

i <fl1=3>, ... , <fl100=3>, <flminus1=3>, ... , <flminus100=3>;
set fli: fl1, ... , fl100, flminus1, ... , flminus100;

i <a1=8>, ... , <a100=8>, <aminus1=8>, ... , <aminus100=8>;
set ai: a1, ... , a100, aminus1, ... , aminus100;

i <l1=2>, ... , <l100=2>, <lminus1=2>, ... , <lminus100=2>;
set li: l1, ... , l100, lminus1, ... , lminus100;

i <n1=3>, ... , <n100=3>, <nminus1=3>, ... , <nminus100=3>;
set ni: n1, ... , n100, nminus1, ... , nminus100;

i <y1=Dy>, ... , <y100=Dy>, <yminus1=Dy>, ... , <yminus100=Dy>;
set yi: y1, ... , y100, yminus1, ... , yminus100;

i <mu1=D>, ... , <mu100=D>, <muminus1=D>, ... , <muminus100=D>;
set mui: mu1, ... , mu100, muminus1, ... , muminus100;

i <lq1=4>, ... , <lq100=4>, <lqminus1=4>, ... , <lqminus100=4>;
set lqi: lq1, ... , lq100, lqminus1, ... , lqminus100;

i <x1=6>, ... , <x100=6>, <xminus1=6>, ... , <xminus100=6>;
set xi: x1, ... , x100, xminus1, ... , xminus100;



#procedure preparedeltas()

id deltaF(?a)=d_(?a);
#endprocedure

#procedure identifydeltas()
id e_(mu1?,mu2?)=ee2(mu1,mu2);
id d_(mu1?li,mu2?li)=dd(2,mu1,mu2);
id d_(mu1?lqi,mu2?lqi)=dd(4,mu1,mu2);
id d_(mu1?ni,mu2?ni)=dd(3,mu1,mu2);
id d_(mu1?xi,mu2?xi)=dd(6,mu1,mu2);
id d_(mu1?mi,mu2?mi)=dd(3,mu1,mu2);
id d_(mu1?ai,mu2?ai)=dd(8,mu1,mu2);
id d_(mu1?fli,mu2?fli)=ddF(3,mu1,mu2);
id d_(mu1?yi,mu2?yi)=ddF(Dy,mu1,mu2);
id d_(mu1?mui,mu2?mui)=ddF(D,mu1,mu2);

#endprocedure

#procedure calldummyindices()
#call dummyindices(mi,m)
#call dummyindices(fli,fl)
#call dummyindices(ai,a)
#call dummyindices(li,l)
#call dummyindices(ni,n)
#call dummyindices(yi,y)
#call dummyindices(mui,mu)

#endprocedure



*>>>>>>>>
CF samb,bracket1;
*<<<<<<<<
*#+
