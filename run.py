#!/usr/bin/python

import sys
import os
import subprocess
import time
from machinekit import launcher
from machinekit import config

launcher.register_exit_handler()
#launcher.set_debug_level(5)
os.chdir(os.path.dirname(os.path.realpath(__file__)))

if 'MACHINEKIT_INI' not in os.environ:  # export for package installs
    mkconfig = config.Config()
    os.environ['MACHINEKIT_INI'] = mkconfig.MACHINEKIT_INI

def check_mklaucher():
    try:
        subprocess.check_output(['pgrep', 'mklauncher'])
        return True
    except subprocess.CalledProcessError:
        return False

try:
    launcher.check_installation()
    launcher.cleanup_session()
    launcher.load_bbio_file('cramps2_cape.bbio')
    launcher.start_realtime()
    launcher.load_hal_file('basic.hal')
    launcher.start_process("configserver -n Electrolab \"demo-ui.Awesome UI\"")
    #launcher.start_process('linuxcnc CRAMPS.ini')

    if not check_mklaucher():  # start mklauncher if not running to make things easier
        launcher.start_process('mklauncher .')

    while True:
        launcher.check_processes()
        time.sleep(1)
except subprocess.CalledProcessError:
    launcher.end_session()
    sys.exit(1)

sys.exit(0)

