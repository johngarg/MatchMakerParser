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
CF Log, den, ee, dd,tenredcountK,tenredfden0,tenredfden1,tenredtensorpart,tenredgg;
F INDSPIN, flipped, SPO;
set spins: uspin, vbspin;
s gap;
v p2;
s LAMBDA;
s dummylightmassneverused,tenredj;

*** Now model specific definitions
S g1, g2, g3, lam, muH, alphaOmuH2, alphaKB, alphaKW, alphaKG, alphaKH, alphaOlambda, alphaO3G, alphaO3Gt, alphaO3W, alphaO3Wt, alphaR2G, alphaR2W, alphaR2B, alphaOHG, alphaOHGt, alphaOHW, alphaOHWt, alphaOHB, alphaOHBt, alphaOHWB, alphaOHWBt, alphaRWDH, alphaRBDH, alphaRDH, alphaOHBox, alphaOHD, alphaRHDp, alphaRHDpp, alphaOH;
#define flFunc "alphaEBd, alphaEBdp, alphaEBdtp, alphaEBe, alphaEBep, alphaEBetp, alphaEBl, alphaEBlp, alphaEBltp, alphaEBq, alphaEBqp, alphaEBqtp, alphaEBu, alphaEBup, alphaEButp, alphaEcdd, alphaEcddtwo, alphaEced, alphaEcedtwo, alphaEcee, alphaEceetwo, alphaEceu, alphaEceutwo, alphaEcld, alphaEcldthree, alphaEcle, alphaEclethree, alphaEcll, alphaEclltwo, alphaEclu, alphaEcluthree, alphaEcqd, alphaEcqdp, alphaEcqdpthree, alphaEcqdthree, alphaEcqe, alphaEcqedl, alphaEcqedlthree, alphaEcqethree, alphaEcql, alphaEcqlp, alphaEcqlptwo, alphaEcqltwo, alphaEcqq, alphaEcqqp, alphaEcqqptwo, alphaEcqqtwo, alphaEcqu, alphaEcqup, alphaEcqupthree, alphaEcquthree, alphaEcud, alphaEcudp, alphaEcudptwo, alphaEcudqq, alphaEcudqqtwo, alphaEcudtwo, alphaEcuelq, alphaEcuelqtwo, alphaEcuu, alphaEcuutwo, alphaEdB, alphaEdd8, alphaEddthree, alphaEddthree8, alphaEdG, alphaEdH, alphaEdW, alphaEeB, alphaEed, alphaEedthree, alphaEedthreep, alphaEeethree, alphaEeH, alphaEeu, alphaEeuthree, alphaEeuthreep, alphaEeW, alphaEGd, alphaEGdp, alphaEGdtp, alphaEGq, alphaEGqp, alphaEGqtp, alphaEGu, alphaEGup, alphaEGutp, alphaEld, alphaEldthree, alphaEldtwo, alphaEle, alphaEledqtwo, alphaElequtwo, alphaElethree, alphaEletwo, alphaEll3, alphaEllthree, alphaEllthree3, alphaElq, alphaElq3, alphaElqde, alphaElqdethree, alphaElqthree, alphaElqthree3, alphaElqthree3p, alphaElqthreep, alphaElu, alphaEluqe, alphaEluqetwo, alphaEluthree, alphaElutwo, alphaEqd, alphaEqd8, alphaEqdthree, alphaEqdthree8, alphaEqdtwo, alphaEqdtwo8, alphaEqe, alphaEqethree, alphaEqetwo, alphaEqq38, alphaEqq8, alphaEqqthree1, alphaEqqthree3, alphaEqqthree38, alphaEqqthree8, alphaEqu, alphaEqu8, alphaEquqdtwo, alphaEquqdtwo8, alphaEquthree, alphaEquthree8, alphaEqutwo, alphaEqutwo8, alphaEuB, alphaEud, alphaEud8, alphaEudthree, alphaEudthree8, alphaEudthree8p, alphaEudthreep, alphaEuG, alphaEuH, alphaEuu8, alphaEuuthree, alphaEuuthree8, alphaEuW, alphaEWl, alphaEWlp, alphaEWltp, alphaEWq, alphaEWqp, alphaEWqtp, alphaKd, alphaKe, alphaKl, alphaKq, alphaKu, alphaOdB, alphaOdd, alphaOdG, alphaOdH, alphaOdW, alphaOeB, alphaOed, alphaOee, alphaOeH, alphaOeu, alphaOeW, alphaOHd, alphaOHe, alphaOHl1, alphaOHl3, alphaOHq1, alphaOHq3, alphaOHu, alphaOHud, alphaOlambdad, alphaOlambdae, alphaOlambdau, alphaOld, alphaOle, alphaOledq, alphaOlequ1, alphaOll, alphaOlq1, alphaOlq3, alphaOlu, alphaOqd1, alphaOqd8, alphaOqe, alphaOqq1, alphaOqq3, alphaOqu1, alphaOqu8, alphaOquqd1, alphaOquqd8, alphaOuB, alphaOud1, alphaOud8, alphaOuG, alphaOuH, alphaOuu, alphaOuW, alphaRBd, alphaRBdp, alphaRBdtp, alphaRBe, alphaRBep, alphaRBetp, alphaRBl, alphaRBlp, alphaRBltp, alphaRBq, alphaRBqp, alphaRBqtp, alphaRBu, alphaRBup, alphaRButp, alphaRdD, alphaRdHD1, alphaRdHD2, alphaRdHD3, alphaRdHD4, alphaReD, alphaReHD1, alphaReHD2, alphaReHD3, alphaReHD4, alphaRGd, alphaRGdp, alphaRGdtp, alphaRGq, alphaRGqp, alphaRGqtp, alphaRGu, alphaRGup, alphaRGutp, alphaRHdp, alphaRHdpp, alphaRHep, alphaRHepp, alphaRHl1p, alphaRHl1pp, alphaRHl3p, alphaRHl3pp, alphaRHq1p, alphaRHq1pp, alphaRHq3p, alphaRHq3pp, alphaRHup, alphaRHupp, alphaRlD, alphaRqD, alphaRuD, alphaRuHD1, alphaRuHD2, alphaRuHD3, alphaRuHD4, alphaRWl, alphaRWlp, alphaRWltp, alphaRWq, alphaRWqp, alphaRWqtp, alphaWeinberg, yd, yl, yu, alphaEBdbar, alphaEBdpbar, alphaEBdtpbar, alphaEBebar, alphaEBepbar, alphaEBetpbar, alphaEBlbar, alphaEBlpbar, alphaEBltpbar, alphaEBqbar, alphaEBqpbar, alphaEBqtpbar, alphaEBubar, alphaEBupbar, alphaEButpbar, alphaEcddbar, alphaEcddtwobar, alphaEcedbar, alphaEcedtwobar, alphaEceebar, alphaEceetwobar, alphaEceubar, alphaEceutwobar, alphaEcldbar, alphaEcldthreebar, alphaEclebar, alphaEclethreebar, alphaEcllbar, alphaEclltwobar, alphaEclubar, alphaEcluthreebar, alphaEcqdbar, alphaEcqdpbar, alphaEcqdpthreebar, alphaEcqdthreebar, alphaEcqebar, alphaEcqedlbar, alphaEcqedlthreebar, alphaEcqethreebar, alphaEcqlbar, alphaEcqlpbar, alphaEcqlptwobar, alphaEcqltwobar, alphaEcqqbar, alphaEcqqpbar, alphaEcqqptwobar, alphaEcqqtwobar, alphaEcqubar, alphaEcqupbar, alphaEcqupthreebar, alphaEcquthreebar, alphaEcudbar, alphaEcudpbar, alphaEcudptwobar, alphaEcudqqbar, alphaEcudqqtwobar, alphaEcudtwobar, alphaEcuelqbar, alphaEcuelqtwobar, alphaEcuubar, alphaEcuutwobar, alphaEdBbar, alphaEdd8bar, alphaEddthree8bar, alphaEddthreebar, alphaEdGbar, alphaEdHbar, alphaEdWbar, alphaEeBbar, alphaEedbar, alphaEedthreebar, alphaEedthreepbar, alphaEeethreebar, alphaEeHbar, alphaEeubar, alphaEeuthreebar, alphaEeuthreepbar, alphaEeWbar, alphaEGdbar, alphaEGdpbar, alphaEGdtpbar, alphaEGqbar, alphaEGqpbar, alphaEGqtpbar, alphaEGubar, alphaEGupbar, alphaEGutpbar, alphaEldbar, alphaEldthreebar, alphaEldtwobar, alphaElebar, alphaEledqtwobar, alphaElequtwobar, alphaElethreebar, alphaEletwobar, alphaEll3bar, alphaEllthree3bar, alphaEllthreebar, alphaElq3bar, alphaElqbar, alphaElqdebar, alphaElqdethreebar, alphaElqthree3bar, alphaElqthree3pbar, alphaElqthreebar, alphaElqthreepbar, alphaElubar, alphaEluqebar, alphaEluqetwobar, alphaEluthreebar, alphaElutwobar, alphaEqd8bar, alphaEqdbar, alphaEqdthree8bar, alphaEqdthreebar, alphaEqdtwo8bar, alphaEqdtwobar, alphaEqebar, alphaEqethreebar, alphaEqetwobar, alphaEqq38bar, alphaEqq8bar, alphaEqqthree1bar, alphaEqqthree38bar, alphaEqqthree3bar, alphaEqqthree8bar, alphaEqu8bar, alphaEqubar, alphaEquqdtwo8bar, alphaEquqdtwobar, alphaEquthree8bar, alphaEquthreebar, alphaEqutwo8bar, alphaEqutwobar, alphaEuBbar, alphaEud8bar, alphaEudbar, alphaEudthree8bar, alphaEudthree8pbar, alphaEudthreebar, alphaEudthreepbar, alphaEuGbar, alphaEuHbar, alphaEuu8bar, alphaEuuthree8bar, alphaEuuthreebar, alphaEuWbar, alphaEWlbar, alphaEWlpbar, alphaEWltpbar, alphaEWqbar, alphaEWqpbar, alphaEWqtpbar, alphaKdbar, alphaKebar, alphaKlbar, alphaKqbar, alphaKubar, alphaOdBbar, alphaOddbar, alphaOdGbar, alphaOdHbar, alphaOdWbar, alphaOeBbar, alphaOedbar, alphaOeebar, alphaOeHbar, alphaOeubar, alphaOeWbar, alphaOHdbar, alphaOHebar, alphaOHl1bar, alphaOHl3bar, alphaOHq1bar, alphaOHq3bar, alphaOHubar, alphaOHudbar, alphaOlambdadbar, alphaOlambdaebar, alphaOlambdaubar, alphaOldbar, alphaOlebar, alphaOledqbar, alphaOlequ1bar, alphaOllbar, alphaOlq1bar, alphaOlq3bar, alphaOlubar, alphaOqd1bar, alphaOqd8bar, alphaOqebar, alphaOqq1bar, alphaOqq3bar, alphaOqu1bar, alphaOqu8bar, alphaOquqd1bar, alphaOquqd8bar, alphaOuBbar, alphaOud1bar, alphaOud8bar, alphaOuGbar, alphaOuHbar, alphaOuubar, alphaOuWbar, alphaRBdbar, alphaRBdpbar, alphaRBdtpbar, alphaRBebar, alphaRBepbar, alphaRBetpbar, alphaRBlbar, alphaRBlpbar, alphaRBltpbar, alphaRBqbar, alphaRBqpbar, alphaRBqtpbar, alphaRBubar, alphaRBupbar, alphaRButpbar, alphaRdDbar, alphaRdHD1bar, alphaRdHD2bar, alphaRdHD3bar, alphaRdHD4bar, alphaReDbar, alphaReHD1bar, alphaReHD2bar, alphaReHD3bar, alphaReHD4bar, alphaRGdbar, alphaRGdpbar, alphaRGdtpbar, alphaRGqbar, alphaRGqpbar, alphaRGqtpbar, alphaRGubar, alphaRGupbar, alphaRGutpbar, alphaRHdpbar, alphaRHdppbar, alphaRHepbar, alphaRHeppbar, alphaRHl1pbar, alphaRHl1ppbar, alphaRHl3pbar, alphaRHl3ppbar, alphaRHq1pbar, alphaRHq1ppbar, alphaRHq3pbar, alphaRHq3ppbar, alphaRHupbar, alphaRHuppbar, alphaRlDbar, alphaRqDbar, alphaRuDbar, alphaRuHD1bar, alphaRuHD2bar, alphaRuHD3bar, alphaRuHD4bar, alphaRWlbar, alphaRWlpbar, alphaRWltpbar, alphaRWqbar, alphaRWqpbar, alphaRWqtpbar, alphaWeinbergbar, ydbar, ylbar, yubar, ddF";
#define flmassFunc "";
#define gFunc "ee3col, Ta, Ta4, FSU2L, T, FSU3C, fsu2, fsu3, ee, ee2, dd";
CF `flFunc', `flmassFunc',`gFunc';
set flFunc:`flFunc';
set flmassFunc:`flmassFunc';
set gFunc:`gFunc';

set setlightmasses: dummylightmassneverused, muH;
set setheavymasses: ;

*** define variable isnotEFT
#define isnotEFT "1"

*** define variable LoopOrder
#define LoopOrder "0"

extrasymbols array eseft;

i <a1=8>, ... , <a100=8>, <aminus1=8>, ... , <aminus100=8>;
set ai: a1, ... , a100, aminus1, ... , aminus100;

i <fl1=3>, ... , <fl100=3>, <flminus1=3>, ... , <flminus100=3>;
set fli: fl1, ... , fl100, flminus1, ... , flminus100;

i <l1=2>, ... , <l100=2>, <lminus1=2>, ... , <lminus100=2>;
set li: l1, ... , l100, lminus1, ... , lminus100;

i <m1=3>, ... , <m100=3>, <mminus1=3>, ... , <mminus100=3>;
set mi: m1, ... , m100, mminus1, ... , mminus100;

i <mu1=D>, ... , <mu100=D>, <muminus1=D>, ... , <muminus100=D>, mumubeta1=D, mumuzeta1=D, mumueta1=D, mumualpha1=D, mumudelta1=D, mumutheta1=D, mumucurlyepsilon1=D, mumugamma1=D;
set mui: mu1, ... , mu100, muminus1, ... , muminus100, mumubeta1, mumuzeta1, mumueta1, mumualpha1, mumudelta1, mumutheta1, mumucurlyepsilon1, mumugamma1;

i <n1=3>, ... , <n100=3>, <nminus1=3>, ... , <nminus100=3>;
set ni: n1, ... , n100, nminus1, ... , nminus100;

i <y1=Dy>, ... , <y100=Dy>, <yminus1=Dy>, ... , <yminus100=Dy>;
set yi: y1, ... , y100, yminus1, ... , yminus100;

i <lq1=4>, ... , <lq100=4>, <lqminus1=4>, ... , <lqminus100=4>;
set lqi: lq1, ... , lq100, lqminus1, ... , lqminus100;



#procedure preparedeltas()

id deltaF(?a)=d_(?a);
#endprocedure

#procedure identifydeltas()
id e_(mu1?,mu2?)=ee2(mu1,mu2);
id d_(mu1?li,mu2?li)=dd(2,mu1,mu2);
id d_(mu1?lqi,mu2?lqi)=dd(4,mu1,mu2);
id d_(mu1?ni,mu2?ni)=dd(3,mu1,mu2);
id d_(mu1?mi,mu2?mi)=dd(3,mu1,mu2);
id d_(mu1?ai,mu2?ai)=dd(8,mu1,mu2);
id d_(mu1?fli,mu2?fli)=ddF(3,mu1,mu2);
id d_(mu1?yi,mu2?yi)=ddF(Dy,mu1,mu2);
id d_(mu1?mui,mu2?mui)=ddF(D,mu1,mu2);
id e_(mu1?,...,mu2?)=ee(2,mu1,...,mu2);
id e_(mu1?,...,mu3?)=ee(3,mu1,...,mu3);
id e_(mu1?,...,mu4?)=ee(4,mu1,...,mu4);
id e_(mu1?,...,mu8?)=ee(8,mu1,...,mu8);

id ee(4,mu1?, ... , mu4?)=e_(mu1,...,mu4);
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
