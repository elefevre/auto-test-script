# AutoTestScript

AutoTestScript is a simple bash script that run tests continuously.

It is made to work with reasonably small projects (not too many files). It is likely to be slow on projects that have a large number of files.

It currently only works on Mac OSX.

## Installation

1. [Download the script](https://raw.github.com/elefevre/AutoTestScript/master/autotest.sh)
2. Place it at the root of your project (or anywhere in your path) and chmod it to be executable.

## Usage

Run the script with the appropriate test command in parameter.

	./autorun.sh cake midje	# to test a Clojure project continuously midje
	./autorun.sh mvn verify	# to test a Maven project
