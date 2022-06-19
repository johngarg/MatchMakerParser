#!/usr/bin/env python3

from dataclasses import dataclass
from typing import List
import numpy as np


class GenericMatchingResult:
    """Class for storing MatchMaker matching results."""

    def __init__(self, name: str):
        self.name = name

        # SM Couplings
        self.yu: np.matrix = np.diag([1, 2, 3])
        self.yd: np.matrix = np.diag([1, 2, 3])
        self.yl: np.matrix = np.diag([1, 2, 3])
        self.g1: float = 0.5
        self.g2: float = 0.5
        self.g3: float = 0.5

        # Constants
        self.iCPV: float = 1
        self.muH: float = 100
        self.lam: float = 0.5
        self.aEV: float = 1
        self.mu: float = 1000

    def get_coeff(self, coeff: str, entry: List[int]) -> float:
        return getattr(self, coeff)(entry)


class MatchingResult(GenericMatchingResult):
    def __init__(self, name: str):
        super().__init__(name)

    def alphaEceu(self, entry):
        i, j = entry
        return i ** 2 + j
