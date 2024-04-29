from setuptools import setup, find_packages

setup(
    name='rmeta',
    version='0.1',
    packages=find_packages(),
    include_package_data=True,
    license='MIT License',
    description='RMeta Django Application',
    long_description=open('README.md').read(),
    url='https://github.com/aanjoorin/rmeta',
    author="Ademiju Anjoorin",
    author_email='ademiju.anjoorin@gmail.com',
    classifiers=[
        'Environment :: Web Environment',
        'Framework :: Django',
        'Framework :: Django :: 5.0.4',  # Replace "X.Y" with your Django version
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.10.12',  # Replace "X" with your Python version
        'Topic :: Internet :: WWW/HTTP',
        'Topic :: Internet :: WWW/HTTP :: Dynamic Content',
    ],
    install_requires=[
        'Django>=2.2',  # Adjust version as needed
        # Add other dependencies here
    ],
)

