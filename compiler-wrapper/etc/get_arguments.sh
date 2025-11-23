#!/bin/bash

# see https://clang.llvm.org/docs/ClangCommandLineReference.html for all arguments

# Some command line arguments can be recogized by clang，with or without the spaces.
# e.g. -MP -MF -o

declare find_options_with_argument='(^|\s)-(([a-zA-Z]<\S+>)|(\S+( <\S+>)+))'
declare find_options_without_space="(^|(, ))-+[^= ]+(=<\S+>|$|,)"
declare find_options_with_space="(^|(, ))-+\S+( <\S+>)+($|,)"

declare regex_to_use=${find_options_without_space}
cat clang.txt | grep -E -o "${regex_to_use}" | sed 's/^, //g' | sed 's/,$//g' | sort | uniq