# Caelus

Caelus is a custom ASM language, based on MIPS assembly, emulator.

## Features

### Registers:

  - `$0`: immutable 0
  - `$pc`: program counter
  - `$sp`: stack pointer
  - `$gp`: global pointer
  - `$ra`: return address
  - `$t0` - `$t9`: temporary registers
  - `$s0` - `$s9`: store registers
  - `$a0` - `$a5`: argument registers
  - `$v0` - `$v1`: value for function



### Support for instructions:
Core instruction set:
  - `noop`
  - `add`
  - `addi`
  - `addiu`
  - `addu`
  - `and`
  - `andi`
  - `beq`
  - `bne`
  - `j`
  - `jal`
  - `jr`
  - `lbu`
  - `lhu`
  - `lui`
  - `lw`
  - `nor`
  - `or`
  - `ori`
  - `slt`
  - `slti`
  - `sll`
  - `srl`
  - `sb`
  - `sc`
  - `sub`
  - `subu`
