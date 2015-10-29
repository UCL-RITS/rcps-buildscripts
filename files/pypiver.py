#!/usr/bin/env python

# Script to work out the current version of a package from pypi.
# 
# Owain Kenway

def getPackageJSON(packagename):
 
   import requests

   url='https://pypi.python.org/pypi/' + packagename + '/json'
   returns = requests.get(url)
   dicts = returns.json()
   return dicts

if __name__ == "__main__":

   import sys

   if len(sys.argv) == 2:
     print(getPackageJSON(sys.argv[1])['info']['version'])
   else:
     print('Run ' + sys.argv[0] + ' <packgage> to get latest version number for <package>.')

