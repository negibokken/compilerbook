#!/bin/bash
assert() {
  expected="$1"
  input="$2"

  ./9cc "$input" > tmp.s 2> /dev/null
  cc -o tmp tmp.s
  ./tmp
  actual="$?"

  if [ "$actual" = "$expected" ]; then
    echo "$input => $actual"
  else
    echo "$input => $expected expected, but got $actual"
    exit 1
  fi
}

assert 7 "1+2*3"
assert 21 "5+20-4"
assert 41 " 12 + 34 - 5 "
assert 27 "-12 + 34 + 5 "
assert 1 "1 == 1 "
assert 0 "1 == 0 "
assert 1 "1 != 0 "
assert 0 "1 != 1 "
# assert 41 "1+3++"

echo OK