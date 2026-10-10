U64 randSeed = 0x123456789ABCDEF0;

// middle-square because it's just as cursed as everything
U64 RandI64()
{
    U64 x = randSeed;
    U64 a = x >> 32;
    U64 b = x & 0xFFFFFFFF;
    U64 p0 = b * b;
    U64 cross = a * b;
    U64 high = a * a;
    U64 next = (high << 32)
            + (cross << 1)
            + (p0 >> 32);
    randSeed = next;
    return next & 0x7FFFFFFFFFFFFFFF;
}
