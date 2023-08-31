# AutoTestScript

AutoTestScript is a simple bash script for macOS and Ubuntu that run tests continuously.

It works by continuously monitoring the files below the current directory (the current directory is the one from which the script has been called).
The impact of this monitoring on the hard disk has been found negligeable on a large-ish project (13,000 files, on a Mac Pro from 2009).

## Installation

1. [Download the script](https://raw.github.com/elefevre/AutoTestScript/master/autotest.sh), or clone the project
2. Place it at the root of your project (or anywhere in your path) and `chmod` it to make it executable.

    ```shell
    % chmod +x ./autotest.sh
    ```

## Usage

Run the script with the appropriate test command in parameter.

```shell
# to run tests on a Clojure project using midje
% ./autotest.sh cake midje
# to run tests on a Maven project
% ./autotest.sh mvn verify
# to run tests on a Go project
% ./autotest.sh go test
```
