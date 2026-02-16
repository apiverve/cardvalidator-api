from setuptools import setup, find_packages

setup(
    name='apiverve_cardvalidator',
    version='1.1.14',
    packages=find_packages(),
    include_package_data=True,
    install_requires=[
        'requests',
        'setuptools'
    ],
    description='Card Validator is a simple tool for validating if a card number is valid or not. It checks the card number format and the Luhn algorithm to see if the card number is valid.',
    author='APIVerve',
    author_email='hello@apiverve.com',
    url='https://apiverve.com/marketplace/cardvalidator?utm_source=pypi&utm_medium=homepage',
    classifiers=[
        'Programming Language :: Python :: 3',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3.6',
)
