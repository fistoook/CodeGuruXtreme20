import sys

K = 0x10E1
MASK16 = 0xFFFF

def encrypt_chain(x, rounds):
    ax = x & MASK16
    bx = 0
    results = []

    for _ in range(rounds):
        bx = (bx + K) & MASK16          # add bx, k
        product = ax * bx              # mul bx (DX:AX = AX * BX)
        high = (product >> 16) & MASK16
        low  = product & MASK16

        results.append(high)
        ax, bx = bx, low               # xchg ax, bx

    return results

def find_candidates(observed):
    candidates = []

    for x in range(0x10000):
        if encrypt_chain(x, len(observed)) == observed:
            candidates.append(x)

    return candidates

if __name__ == "__main__":
    if not (2 <= len(sys.argv) <= 4):
        print("Usage: python decrypt.py H0 [H1] [H2]")
        sys.exit(1)

    observed = [int(arg, 0) & MASK16 for arg in sys.argv[1:]]
    candidates = find_candidates(observed)

    if not candidates:
        print("No possible AX values found.")
    else:
        print(f"Possible original AX values ({len(candidates)}):")
        for x in candidates:
            print(f"0x{x:04X}")
