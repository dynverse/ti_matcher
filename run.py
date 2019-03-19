#!/usr/local/bin/python

import dynclipy
task = dynclipy.main()

import pandas as pd
import numpy as np
import json

from pymatcher import matcher

import time
checkpoints = {}


#   ____________________________________________________________________________
#   Load data                                                               ####
expression = task["expression"]
parameters = task["parameters"]

#   ____________________________________________________________________________
#   Infer trajectory                                                        ####
m = matcher.MATCHER([expression.values])
m.infer(quantiles = parameters["quantiles"], method = parameters["method"])

checkpoints["method_aftermethod"] = time.time()

#   ____________________________________________________________________________
#   Save output                                                             ####
dataset = dynclipy.wrap_data(cell_ids = expression.index)

# pseudotime
pseudotime = pd.DataFrame({
  "cell_id":expression.index,
  "pseudotime":m.master_time[0][:, 0]
})

dataset.add_linear_trajectory(pseudotime = pseudotime)

# timings
dataset.add_timings(checkpoints)

# save
dataset.write_output(task["output"])
