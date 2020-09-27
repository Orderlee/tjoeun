import re

s='My id number is kim0502'
a=re.findall('[a-z]',s)
print(a)

b=re.findall('[a-z]+',s)
print(b)

c=re.findall('[A-Z]',s)
print(c)

d=re.findall('[0-9]',s)
print(d)

e=re.findall('[0-9]+',s)
print(e)