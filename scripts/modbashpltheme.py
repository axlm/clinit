#!/usr/bin/env python3

import json
from pprint import pprint
from time import time
from datetime import datetime
from shutil import copyfile
from sys import exit
from os import environ

# set up envoronment
clinit_home=environ['CLINIT_HOME']
if not clinit_home or clinit_home == '':
    print("CLINIT_HOME not set!")
    exit(1)
config_file_name=clinit_home + "/dependencies/powerline/powerline/config_files/config.json"

# Make a backup of the configuration file
now=datetime.fromtimestamp(time()).strftime('%Y%m%d%H%M%S')
copyfile(config_file_name, config_file_name + ".asat" + now)

# Read bash shell configuration file
config_in=open(config_file_name, "r")
config_data=json.load(config_in)
config_in.close()

# Change the theme from "whatever" to "default_leftonly"
config_data["ext"]["shell"]["theme"] = "default_leftonly"

# Write the updated information back out
config_out=open(config_file_name, "w")
json.dump(config_data, config_out)
config_out.close()

