from setuptools import setup

VERSION='1.0.0'

setup(name='testver',
      version=VERSION,
      packages=['testver'],
      install_requires=[
          'rht-labs-ocp~=0.0.6'
      ],
      zip_safe=False)