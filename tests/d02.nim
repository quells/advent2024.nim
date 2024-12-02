discard """

  output: '''
Part A
2
663
Part B
'''
"""

import algorithm
import sequtils
import strutils
import sugar
import tables

proc parseFile*(raw: string): seq[seq[int]] =
  result = newSeq[seq[int]]()
  for line in raw.splitLines():
    if line == "":
      continue
    result.add(line.split().map(d => d.parseInt()))

proc littleSteps*(s: seq[int]): bool =
  var dir = 0
  for i in (1 .. s.len-1):
    var d = s[i] - s[i-1]
    if dir == 0:
      if d > 0:
        dir = 1
      else:
        dir = -1
    if dir == -1:
      d = -d
    if 1 <= d and d <= 3:
      continue
    return false
  return true

proc countLittleSteps(ss: seq[seq[int]]): int =
  result = 0
  for s in ss:
    if littleSteps(s):
      result += 1

let example = parseFile(readFile("example/02.txt"))
let input = parseFile(readFile("input/02.txt"))

echo "Part A"
echo countLittleSteps(example)
echo countLittleSteps(input)

echo "Part B"
