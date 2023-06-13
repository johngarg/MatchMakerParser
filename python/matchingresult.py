#!/usr/bin/env python3

from dataclasses import dataclass
from typing import List
import rundec
import numpy as np

CRD = rundec.CRunDec()


class GenericMatchingResult:
    """Class for storing MatchMaker matching results. All dimensionful quantities
    are in GeV. Scale is initialised to mZ.

    """

    def __init__(self, name: str, scale: float = 91.1876):
        self.name = name
        self.scale = scale

        # See https://arxiv.org/abs/2112.10787 for more information about
        # specific couplings and constants

        vev = 248.404
        # SM couplings and parameters
        # Values taken from https://inspirehep.net/files/71930f37457ebd10742e55c2b36531ea
        self.yu: np.matrix = np.diag([0.00123, 0.620, 168.26]) / vev
        self.yd: np.matrix = np.diag([0.00267, 0.05316, 2.839]) / vev
        self.yl: np.matrix = np.diag([0.00048307, 0.101766, 1.72856]) / vev

        self.yubar: np.matrix = self.yu
        self.ydbar: np.matrix = self.yd
        self.ylbar: np.matrix = self.yl

        self.mZ: float = 91.1876
        self.mH: float = 125.10

        self.g1: float = 0.65100
        self.g2: float = 0.357254
        self.g3: float = 1.204

        self.muH: float = np.sqrt(8434) * 1j  # Not sure what to do with this
        self.lam: float = 0.13947
        self.vev: float = vev  # I haven't seen this used by MatchMaker yet

        # Constants
        self.iCPV: int = 1  # Fixes \eps_{0123} sign convention
        self.onelooporder: int = 1  # Dummy variable to identify 1-loop part
        self.aEV: float = 1  # Evanescent parameter
        self.mu: float = self.scale  # Identify mu with scale
        self.invepsilonbar: float = 0
        self.epsilonbar: float = 0

    def kronecker_delta(self, i, j):
        if i == j:
            return 1
        return 0
