import re, os, shutil

home = '/Users/telliott'
dt = home + '/Desktop'
tex = dt + '/full.tex'

with open(tex,'r') as fh:
    data = fh.read()

s = ' {.+\.png}'
t = re.compile(s)

L = re.findall(t,data)
L = [e[2:-1] for e in L]
#print(L[:5])

src = dt + '/png'
dst = dt + '/png2'

for fn in os.listdir(src):
    #print(fn)
    if fn in L or fn.endswith('.jpg'):
        shutil.copyfile(
            src + '/' + fn, 
            dst + '/' + fn)


    