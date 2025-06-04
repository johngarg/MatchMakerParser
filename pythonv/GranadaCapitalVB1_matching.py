## Symbols used:
# ydbar
# yd
# yl
# gphiVB1bar
# ylbar
# gduVB1bar
# muH
# MVB1
# lam
# yubar
# gphiVB1
# yu
# gduVB1

import python.matchingresult
import numpy as np

class GranadaVB1MatchingResult(python.matchingresult.GenericMatchingResult):
    def __init__(self, name='GranadaVB1', scale=1.0):
        super().__init__(name, scale)
        self.MVB1 = 1
        self.gduVB1 = np.ones((3, 3))
        self.gduVB1bar = np.ones((3, 3))
        self.gphiVB1 = 1
        self.gphiVB1bar = 1
        self.nonvanishing = ['alphaOH', 'alphaOHBox', 'alphaOHD', 'alphaOdH', 'alphaOdHbar', 'alphaOeH', 'alphaOeHbar', 'alphaOHud', 'alphaOHudbar', 'alphaOud1', 'alphaOud1bar', 'alphaOud8', 'alphaOud8bar', 'alphaOuH', 'alphaOuHbar']

    def alphaO3G(self, ):
        return 0

    def alphaO3Gt(self, ):
        return 0

    def alphaO3W(self, ):
        return 0

    def alphaO3Wt(self, ):
        return 0

    def alphaOH(self, ):
        return -2 * self.gphiVB1 * self.gphiVB1bar * self.lam * (self.MVB1)**(-2)

    def alphaOHB(self, ):
        return 0

    def alphaOHBox(self, ):
        return -1/2 * self.gphiVB1 * self.gphiVB1bar * (self.MVB1)**(-2)

    def alphaOHBt(self, ):
        return 0

    def alphaOHD(self, ):
        return self.gphiVB1 * self.gphiVB1bar * (self.MVB1)**(-2)

    def alphaOHG(self, ):
        return 0

    def alphaOHGt(self, ):
        return 0

    def alphaOHW(self, ):
        return 0

    def alphaOHWB(self, ):
        return 0

    def alphaOHWBt(self, ):
        return 0

    def alphaOHWt(self, ):
        return 0

    def alphaOddbar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOeebar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOHdbar(self, mif1,mif2):
        return 0

    def alphaOHebar(self, mif1,mif2):
        return 0

    def alphaOHl1bar(self, mif1,mif2):
        return 0

    def alphaOHl3bar(self, mif1,mif2):
        return 0

    def alphaOHq1bar(self, mif1,mif2):
        return 0

    def alphaOHq3bar(self, mif1,mif2):
        return 0

    def alphaOHubar(self, mif1,mif2):
        return 0

    def alphaOllbar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOuubar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaWeinberg(self, mif1,mif2):
        return 0

    def alphaWeinbergbar(self, mif1,mif2):
        return 0

    def alphaOdB(self, mif1,mif2):
        return 0

    def alphaOdBbar(self, mif1,mif2):
        return 0

    def alphaOdd(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOdG(self, mif1,mif2):
        return 0

    def alphaOdGbar(self, mif1,mif2):
        return 0

    def alphaOdH(self, mif1,mif2):
        return -1/2 * self.gphiVB1 * self.gphiVB1bar * (self.MVB1)**(-2) * self.yd[mif1,mif2]

    def alphaOdHbar(self, mif1,mif2):
        return -1/2 * self.gphiVB1 * self.gphiVB1bar * (self.MVB1)**(-2) * self.ydbar[mif1,mif2]

    def alphaOdW(self, mif1,mif2):
        return 0

    def alphaOdWbar(self, mif1,mif2):
        return 0

    def alphaOeB(self, mif1,mif2):
        return 0

    def alphaOeBbar(self, mif1,mif2):
        return 0

    def alphaOed(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOedbar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOee(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOeH(self, mif1,mif2):
        return -1/2 * self.gphiVB1 * self.gphiVB1bar * (self.MVB1)**(-2) * self.yl[mif1,mif2]

    def alphaOeHbar(self, mif1,mif2):
        return -1/2 * self.gphiVB1 * self.gphiVB1bar * (self.MVB1)**(-2) * self.ylbar[mif1,mif2]

    def alphaOeu(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOeubar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOeW(self, mif1,mif2):
        return 0

    def alphaOeWbar(self, mif1,mif2):
        return 0

    def alphaOHd(self, mif1,mif2):
        return 0

    def alphaOHe(self, mif1,mif2):
        return 0

    def alphaOHl1(self, mif1,mif2):
        return 0

    def alphaOHl3(self, mif1,mif2):
        return 0

    def alphaOHq1(self, mif1,mif2):
        return 0

    def alphaOHq3(self, mif1,mif2):
        return 0

    def alphaOHu(self, mif1,mif2):
        return 0

    def alphaOHud(self, mif1,mif2):
        return -1 * self.gphiVB1 * (self.MVB1)**(-2) * self.gduVB1bar[mif2,mif1]

    def alphaOHudbar(self, mif1,mif2):
        return -1 * self.gphiVB1bar * (self.MVB1)**(-2) * self.gduVB1[mif2,mif1]

    def alphaOld(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOldbar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOle(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlebar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOledq(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOledqbar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlequ1(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlequ1bar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlequ3(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlequ3bar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOll(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlq1(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlq1bar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlq3(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlq3bar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlu(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOlubar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqd1(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqd1bar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqd8(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqd8bar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqe(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqebar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqq1(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqq1bar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqq3(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqq3bar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqu1(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqu1bar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqu8(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOqu8bar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOquqd1(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOquqd1bar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOquqd8(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOquqd8bar(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOuB(self, mif1,mif2):
        return 0

    def alphaOuBbar(self, mif1,mif2):
        return 0

    def alphaOud1(self, mif1,mif2,mif3,mif4):
        return -1/3 * (self.MVB1)**(-2) * self.gduVB1[mif3,mif2] * self.gduVB1bar[mif4,mif1]

    def alphaOud1bar(self, mif1,mif2,mif3,mif4):
        return -1/3 * (self.MVB1)**(-2) * self.gduVB1[mif4,mif1] * self.gduVB1bar[mif3,mif2]

    def alphaOud8(self, mif1,mif2,mif3,mif4):
        return -2 * (self.MVB1)**(-2) * self.gduVB1[mif3,mif2] * self.gduVB1bar[mif4,mif1]

    def alphaOud8bar(self, mif1,mif2,mif3,mif4):
        return -2 * (self.MVB1)**(-2) * self.gduVB1[mif4,mif1] * self.gduVB1bar[mif3,mif2]

    def alphaOuG(self, mif1,mif2):
        return 0

    def alphaOuGbar(self, mif1,mif2):
        return 0

    def alphaOuH(self, mif1,mif2):
        return -1/2 * self.gphiVB1 * self.gphiVB1bar * (self.MVB1)**(-2) * self.yu[mif1,mif2]

    def alphaOuHbar(self, mif1,mif2):
        return -1/2 * self.gphiVB1 * self.gphiVB1bar * (self.MVB1)**(-2) * self.yubar[mif1,mif2]

    def alphaOuu(self, mif1,mif2,mif3,mif4):
        return 0

    def alphaOuW(self, mif1,mif2):
        return 0

    def alphaOuWbar(self, mif1,mif2):
        return 0
