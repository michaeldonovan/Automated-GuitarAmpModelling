#!/usr/bin/env python
# -*- coding: utf-8 -*-

import audalign as ad
import sys

if __name__ == "__main__":
    input = sys.argv[1]
    target = sys.argv[2]
    correlation_rec = ad.CorrelationRecognizer()
    cor_spec_rec = ad.CorrelationSpectrogramRecognizer()
    results = ad.align_files(input, target, recognizer = correlation_rec, destination_path="Data/aligned")

    fine_resullts = ad.fine_align(results, recognizer=cor_spec_rec,destination_path="Data/aligned")
