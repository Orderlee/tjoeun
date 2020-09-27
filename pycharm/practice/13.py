import re
s = 'My id number is kim0902'
a=re.findall('a',s)
print(a)
b=re.findall('kim',s)
print(b)
c=re.findall('m',s)
print(c)