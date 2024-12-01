discard """

  output: '''
Part A
11
2000468
Part B
31
18567089
'''
"""

import algorithm
import strutils
import tables

proc parseLists*(raw: string): (seq[int], seq[int]) =
  var l = newSeq[int]()
  var r = newSeq[int]()
  for line in raw.split("\n"):
    let ps = line.split()
    l.add(ps[0].parseInt())
    r.add(ps[^1].parseInt())
  return (l, r)

proc compareSortedLists*(raw: string): int =
  result = 0
  var (l, r) = parseLists(raw)
  l.sort()
  r.sort()
  for i in 0 .. l.len-1:
    result += abs(l[i] - r[i])

proc count*(ls: seq[int]): CountTable[int] =
  result = initCountTable[int]()
  for v in ls:
    result.inc(v)

proc compareCounts*(raw: string): int =
  result = 0
  let (l, r) = parseLists(raw)
  let cs = count(r)
  for v in l:
    let c = cs.getOrDefault(v, 0)
    result += v * c

let example = readFile("example/01.txt")
let input = readFile("input/01.txt")

echo "Part A"
echo compareSortedLists(example)
echo compareSortedLists(input)

echo "Part B"
echo compareCounts(example)
echo compareCounts(input)
