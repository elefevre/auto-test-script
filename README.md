# AutoTestScript

AutoTestScript is a simple bash script that run tests continuously.

It works by continuously monitoring the files below the current directory. The impact on the hard disk has been found negligeable on a large-ish project (13,000 files, on a Mac Pro from 2009).

It works on Mac OSX and Ubuntu.

## Installation

1. [Download the script](https://raw.github.com/elefevre/AutoTestScript/master/autotest.sh)
2. Place it at the root of your project (or anywhere in your path) and chmod it to be executable.

## Usage

Run the script with the appropriate test command in parameter.

	./autorun.sh cake midje	# to test a Clojure project using midje
	./autorun.sh mvn verify	# to test a Maven project
