import traceback
import sys
import os
from distutils.core import setup

setup(
    name='vpntfi',
    version='0.1',
    packages=['vpnmodule', 'vpnmodule.lib'],
    license='Creative Commons Attribution-Noncommercial-Share Alike license',
    long_description=open('README.txt').read(),
    data_files=[
        ('/usr/local/NAS/misc/HAAgent/Config', ['hapack/VPNConfig.py']),
        ('/usr/local/NAS/misc/HAAgent/Config', ['hapack/VPNConfig.xml']),
        ('/usr/local/NAS/misc/HAAgent/Lib/Service', ['hapack/vpnLib.py']),
        ('/usr/local/NAS/misc/Cmd/Exec/Service', ['hapack/vpn.py']),
    ]
 )

