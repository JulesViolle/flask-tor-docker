





nums=list(range(1,27,1))
s=4
y=16
res=[]
res2=[]
for i in nums[:]:
    res.append((((i+s)/y)*y)-s==i)
    res2.append(((i+s)/y))

print(all(res))
print(res2)

