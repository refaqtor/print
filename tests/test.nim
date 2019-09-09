import tables

import print



type Foo = object
  a: string
  b: seq[string]
  c: int

type Bar = ref object
  a: string
  b: seq[string]
  c: int

type Colors = enum
  Red, White, Blue


var g: Bar
var g2 = Bar(a:"hi", b: @["a", "abc"], c:1234)
print g, g2

# proc hi() =
#   echo "hi"
# print hi
# >> hi=proc (){.gcsafe, locks: 0.}

let what = "\0\tworld\n\r"
print "hello", what
#>> hello what="\0\tworld\n\r"

print 12
#>> pretty(12)="12"

let whatc = cstring "hi there c string"
print whatc

let
  a = 3
  b = "hi there"
  c = "oh\nthis\0isit!"
  d = @[1, 2, 3]
  d2 = [1, 2, 3]
  f = Foo(a:"hi", b: @["a", "abc"], c:1234)

print a, b, c, d, d2, f


var t = ("hi", 1, (2, 3))
print t

let smallArr = [1, 2, 3]
print "array", smallArr
#>> array smallArr=[1, 2, 3]

let smallSeq = @[1, 2, 3]
print "seq", smallSeq
#>> seq smallSeq=@[1, 2, 3]

#TODO: just Table is broken
#let smallTable = {1: "one", 2: "two"}.toTable
#print "table", smallTable
#>> table smallTable={1: "one", 2: "two"}

let smallTableRef = {1: "one", 2: "two"}.newTable
print "table", smallTableRef
#>> table smallTableRef={1: "one", 2: "two"}.newTable

type
  SomeObj = object
    id: string
    year: int
let someThing = SomeObj(id: "xy8", year: 2017)
echo someThing
print someThing
#>> someThing=SomeObj(id: "xy8", year: 2017)


# Really big lines should wrap:
let bigTable = newTable[string, int]()
for i in 0..<20:
  bigTable["id" & $i] = i
print "table", bigTable

# Relly Nested Stuff
let bigTable2 = newTable[string, SomeObj]()
for i in 0..<20:
  bigTable2["id" & $i] = SomeObj(id: "xy{8}", year: i)
print "table", bigTable2


let color = Red
print "Colors", color

