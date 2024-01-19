module register;

//   - `$0`: immutable 0
//   - `$pc`: program counter
//   - `$sp`: stack pointer
//   - `$gp`: global pointer
//   - `$ra`: return address
//   - `$t0` - `$t9`: temporary registers
//   - `$s0` - `$s9`: store registers
//   - `$a0` - `$a5`: argument registers
//   - `$v0` - `$v1`: value for function

const string[] registers = [
    "$0",
    "$pc",
    "$sp",
    "$gp",
    "$ra",

    "$t0",
    "$t1",
    "$t2",
    "$t3",
    "$t4",
    "$t5",
    "$t6",
    "$t7",
    "$t8",
    "$t9",

    "$s0",
    "$s1",
    "$s2",
    "$s3",
    "$s4",
    "$s5",
    "$s6",
    "$s7",
    "$s8",
    "$s9",

    "$a0",
    "$a1",
    "$a2",
    "$a3",
    "$a4",
    "$a5",

    "$v0",
    "$v1"
];
