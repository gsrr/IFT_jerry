from distutils.core import setup
import py2exe
setup(
    options = {'py2exe': {
        'bundle_files': 3
    }},
    console = [{'script': 'centos_utility.py'}],
)