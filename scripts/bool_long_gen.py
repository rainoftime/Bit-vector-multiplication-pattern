import subprocess 
import glob
import os
from subprocess import check_output
pwd = os.getcwd()

file_names = glob.glob(pwd + "/../benchmark_long/generated_files/*.smt2")
output_file = open("bool_long_gen.st", "w")
for i, val in enumerate(file_names):
	output_file.write(val + "\n")
	out = check_output(['boolector', '--time=3600', '-v', file_names[i]])
	output_file.write(out)
