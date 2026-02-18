from Flag import FLAG
from Crypto.Util.number import sieve_base

n = 1
m = min(FLAG)
for i in range(len(FLAG)):
    n *= sieve_base[i] ** (FLAG[i] - m + 1)

with open(r'./output.txt', 'w') as f: 
    print(f"{type(FLAG) = }", file=f)
    print(f"{n = }", file=f)
    print(f"{m = }", file=f)