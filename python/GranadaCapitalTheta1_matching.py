## Symbols used:
# ydbar
# yd
# MTheta1
# yl
# lambdaHatPrimePrimeTheta1bar
# ylbar
# muH
# g1
# g2
# invepsilonbar
# lambdaHatPrimeTheta1
# lambdaHatTheta1
# lambdaHatPrimePrimeTheta1
# mu
# lam
# lambdaTheta1
# yubar
# onelooporder
# yu
# lambdaTheta1bar

import python.matchingresult
import numpy as np

class GranadaTheta1MatchingResult(python.matchingresult.GenericMatchingResult):
    def __init__(self, name='GranadaTheta1', scale=91.1876):
        super().__init__(name, scale)
        self.MTheta1 = 1
        self.lambdaTheta1 = 1
        self.lambdaTheta1bar = 1
        self.lambdaHatTheta1 = 1
        self.lambdaHatTheta1bar = 1
        self.lambdaHatPrimeTheta1 = 1
        self.lambdaHatPrimeTheta1bar = 1
        self.lambdaHatPrimePrimeTheta1 = 1
        self.lambdaHatPrimePrimeTheta1bar = 1
        self.nonvanishing = ['alphaO3W', 'alphaOH', 'alphaOHB', 'alphaOHBox', 'alphaOHD', 'alphaOHW', 'alphaOHWB', 'alphaOdd', 'alphaOdH', 'alphaOed', 'alphaOee', 'alphaOeH', 'alphaOeu', 'alphaOHd', 'alphaOHe', 'alphaOHl1', 'alphaOHl3', 'alphaOHq1', 'alphaOHq3', 'alphaOHu', 'alphaOld', 'alphaOle', 'alphaOll', 'alphaOlq1', 'alphaOlq3', 'alphaOlu', 'alphaOqd1', 'alphaOqe', 'alphaOqq1', 'alphaOqq3', 'alphaOqu1', 'alphaOud1', 'alphaOuH', 'alphaOuu']

    def alphaO3G(self, ):
        return 0

    def alphaO3Gt(self, ):
        return 0

    def alphaO3W(self, ):
        return 1/576 * (self.g2)**(3) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2)

    def alphaO3Wt(self, ):
        return 0

    def alphaOH(self, ):
        return (1/6 * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) + -1/96 * (self.g2)**(4) * self.lam * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 2/9 * self.lam * self.lambdaHatPrimePrimeTheta1 * self.lambdaHatPrimePrimeTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 1/6 * self.lambdaHatPrimePrimeTheta1 * self.lambdaHatPrimePrimeTheta1bar * self.lambdaHatPrimeTheta1 * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 5/24 * self.lam * (self.lambdaHatPrimeTheta1)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 1/3 * self.lambdaHatPrimePrimeTheta1 * self.lambdaHatPrimePrimeTheta1bar * self.lambdaHatTheta1 * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 5/32 * (self.lambdaHatPrimeTheta1)**(2) * self.lambdaHatTheta1 * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 1/24 * (self.lambdaHatTheta1)**(3) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 1/6 * (5/3)**(1/2) * self.lambdaHatPrimePrimeTheta1bar * (self.lambdaTheta1)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 1/12 * (5/3)**(1/2) * self.invepsilonbar * self.lambdaHatPrimePrimeTheta1bar * (self.lambdaTheta1)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 41/48 * self.lam * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 7/16 * self.invepsilonbar * self.lam * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 5/48 * self.lambdaHatPrimeTheta1 * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 5/96 * self.invepsilonbar * self.lambdaHatPrimeTheta1 * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 3/16 * self.lambdaHatTheta1 * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 1/16 * self.invepsilonbar * self.lambdaHatTheta1 * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 1/6 * (5/3)**(1/2) * self.lambdaHatPrimePrimeTheta1 * (self.lambdaTheta1bar)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 1/12 * (5/3)**(1/2) * self.invepsilonbar * self.lambdaHatPrimePrimeTheta1 * (self.lambdaTheta1bar)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + -1/12 * (5/3)**(1/2) * self.lambdaHatPrimePrimeTheta1bar * (self.lambdaTheta1)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * np.log((self.MTheta1)**(2) * (self.mu)**(-2)) + -7/16 * self.lam * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * np.log((self.MTheta1)**(2) * (self.mu)**(-2)) + -5/96 * self.lambdaHatPrimeTheta1 * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * np.log((self.MTheta1)**(2) * (self.mu)**(-2)) + -1/16 * self.lambdaHatTheta1 * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * np.log((self.MTheta1)**(2) * (self.mu)**(-2)) + -1/12 * (5/3)**(1/2) * self.lambdaHatPrimePrimeTheta1 * (self.lambdaTheta1bar)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * np.log((self.MTheta1)**(2) * (self.mu)**(-2)))

    def alphaOHB(self, ):
        return -1/192 * (self.g1)**(2) * self.lambdaHatTheta1 * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2)

    def alphaOHBox(self, ):
        return (-1/3840 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + -1/256 * (self.g2)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 1/18 * self.lambdaHatPrimePrimeTheta1 * self.lambdaHatPrimePrimeTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 5/192 * (self.lambdaHatPrimeTheta1)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + -1/48 * (self.lambdaHatTheta1)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 1/16 * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2))

    def alphaOHBt(self, ):
        return 0

    def alphaOHD(self, ):
        return (-1/960 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + 1/9 * self.lambdaHatPrimePrimeTheta1 * self.lambdaHatPrimePrimeTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + -5/48 * (self.lambdaHatPrimeTheta1)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) + -1/8 * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2))

    def alphaOHG(self, ):
        return 0

    def alphaOHGt(self, ):
        return 0

    def alphaOHW(self, ):
        return -5/192 * (self.g2)**(2) * self.lambdaHatTheta1 * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2)

    def alphaOHWB(self, ):
        return -5/192 * self.g1 * self.g2 * self.lambdaHatPrimeTheta1 * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2)

    def alphaOHWBt(self, ):
        return 0

    def alphaOHWt(self, ):
        return 0

    def alphaWeinberg(self, mif1,mif2):
        return 0

    def alphaOdB(self, mif1,mif2):
        return 0

    def alphaOdd(self, mif1,mif2,mif3,mif4):
        return -1/8640 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOdG(self, mif1,mif2):
        return 0

    def alphaOdH(self, mif1,mif2):
        return (-1/384 * (self.g2)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.yd[mif1,mif2] + 1/18 * self.lambdaHatPrimePrimeTheta1 * self.lambdaHatPrimePrimeTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.yd[mif1,mif2] + 5/96 * (self.lambdaHatPrimeTheta1)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.yd[mif1,mif2] + 5/48 * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.yd[mif1,mif2])

    def alphaOdW(self, mif1,mif2):
        return 0

    def alphaOeB(self, mif1,mif2):
        return 0

    def alphaOed(self, mif1,mif2,mif3,mif4):
        return -1/1440 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOee(self, mif1,mif2,mif3,mif4):
        return -1/960 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOeH(self, mif1,mif2):
        return (-1/384 * (self.g2)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.yl[mif1,mif2] + 1/18 * self.lambdaHatPrimePrimeTheta1 * self.lambdaHatPrimePrimeTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.yl[mif1,mif2] + 5/96 * (self.lambdaHatPrimeTheta1)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.yl[mif1,mif2] + 5/48 * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.yl[mif1,mif2])

    def alphaOeu(self, mif1,mif2,mif3,mif4):
        return 1/720 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOeW(self, mif1,mif2):
        return 0

    def alphaOHd(self, mif1,mif2):
        return 1/2880 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2)

    def alphaOHe(self, mif1,mif2):
        return 1/960 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2)

    def alphaOHl1(self, mif1,mif2):
        return 1/1920 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2)

    def alphaOHl3(self, mif1,mif2):
        return -1/384 * (self.g2)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2)

    def alphaOHq1(self, mif1,mif2):
        return -1/5760 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2)

    def alphaOHq3(self, mif1,mif2):
        return -1/384 * (self.g2)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2)

    def alphaOHu(self, mif1,mif2):
        return -1/1440 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2)

    def alphaOHud(self, mif1,mif2):
        return 0

    def alphaOld(self, mif1,mif2,mif3,mif4):
        return -1/2880 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOle(self, mif1,mif2,mif3,mif4):
        return -1/960 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOledq(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlequ1(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlequ3(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOll(self, mif1,mif2,mif3,mif4):
        return (-1/384 * (self.g2)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif4) * self.kronecker_delta(mif2,mif3) + -1/3840 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4) + 1/768 * (self.g2)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4))

    def alphaOlq1(self, mif1,mif2,mif3,mif4):
        return 1/5760 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOlq3(self, mif1,mif2,mif3,mif4):
        return -1/384 * (self.g2)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOlu(self, mif1,mif2,mif3,mif4):
        return 1/1440 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOqd1(self, mif1,mif2,mif3,mif4):
        return 1/8640 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOqd8(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqe(self, mif1,mif2,mif3,mif4):
        return 1/2880 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOqq1(self, mif1,mif2,mif3,mif4):
        return -1/34560 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOqq3(self, mif1,mif2,mif3,mif4):
        return -1/768 * (self.g2)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOqu1(self, mif1,mif2,mif3,mif4):
        return -1/4320 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOqu8(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOquqd1(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOquqd8(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOuB(self, mif1,mif2):
        return 0

    def alphaOud1(self, mif1,mif2,mif3,mif4):
        return 1/2160 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOud8(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOuG(self, mif1,mif2):
        return 0

    def alphaOuH(self, mif1,mif2):
        return (-1/384 * (self.g2)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.yu[mif1,mif2] + 1/18 * self.lambdaHatPrimePrimeTheta1 * self.lambdaHatPrimePrimeTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.yu[mif1,mif2] + 5/96 * (self.lambdaHatPrimeTheta1)**(2) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.yu[mif1,mif2] + 5/48 * self.lambdaTheta1 * self.lambdaTheta1bar * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.yu[mif1,mif2])

    def alphaOuu(self, mif1,mif2,mif3,mif4):
        return -1/2160 * (self.g1)**(4) * (self.MTheta1)**(-2) * self.onelooporder * (np.pi)**(-2) * self.kronecker_delta(mif1,mif2) * self.kronecker_delta(mif3,mif4)

    def alphaOuW(self, mif1,mif2):
        return 0
