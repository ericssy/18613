
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400a98 <_init>:
  400a98:	48 83 ec 08          	sub    $0x8,%rsp
  400a9c:	48 8b 05 55 35 20 00 	mov    0x203555(%rip),%rax        # 603ff8 <__gmon_start__>
  400aa3:	48 85 c0             	test   %rax,%rax
  400aa6:	74 05                	je     400aad <_init+0x15>
  400aa8:	e8 53 00 00 00       	callq  400b00 <__gmon_start__@plt>
  400aad:	48 83 c4 08          	add    $0x8,%rsp
  400ab1:	c3                   	retq   

Disassembly of section .plt:

0000000000400ac0 <.plt>:
  400ac0:	ff 35 42 35 20 00    	pushq  0x203542(%rip)        # 604008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400ac6:	ff 25 44 35 20 00    	jmpq   *0x203544(%rip)        # 604010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400acc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400ad0 <printf@plt>:
  400ad0:	ff 25 42 35 20 00    	jmpq   *0x203542(%rip)        # 604018 <printf@GLIBC_2.2.5>
  400ad6:	68 00 00 00 00       	pushq  $0x0
  400adb:	e9 e0 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400ae0 <close@plt>:
  400ae0:	ff 25 3a 35 20 00    	jmpq   *0x20353a(%rip)        # 604020 <close@GLIBC_2.2.5>
  400ae6:	68 01 00 00 00       	pushq  $0x1
  400aeb:	e9 d0 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400af0 <gethostbyname@plt>:
  400af0:	ff 25 32 35 20 00    	jmpq   *0x203532(%rip)        # 604028 <gethostbyname@GLIBC_2.2.5>
  400af6:	68 02 00 00 00       	pushq  $0x2
  400afb:	e9 c0 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400b00 <__gmon_start__@plt>:
  400b00:	ff 25 2a 35 20 00    	jmpq   *0x20352a(%rip)        # 604030 <__gmon_start__>
  400b06:	68 03 00 00 00       	pushq  $0x3
  400b0b:	e9 b0 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400b10 <puts@plt>:
  400b10:	ff 25 22 35 20 00    	jmpq   *0x203522(%rip)        # 604038 <puts@GLIBC_2.2.5>
  400b16:	68 04 00 00 00       	pushq  $0x4
  400b1b:	e9 a0 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400b20 <__isoc99_sscanf@plt>:
  400b20:	ff 25 1a 35 20 00    	jmpq   *0x20351a(%rip)        # 604040 <__isoc99_sscanf@GLIBC_2.7>
  400b26:	68 05 00 00 00       	pushq  $0x5
  400b2b:	e9 90 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400b30 <exit@plt>:
  400b30:	ff 25 12 35 20 00    	jmpq   *0x203512(%rip)        # 604048 <exit@GLIBC_2.2.5>
  400b36:	68 06 00 00 00       	pushq  $0x6
  400b3b:	e9 80 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400b40 <strcasecmp@plt>:
  400b40:	ff 25 0a 35 20 00    	jmpq   *0x20350a(%rip)        # 604050 <strcasecmp@GLIBC_2.2.5>
  400b46:	68 07 00 00 00       	pushq  $0x7
  400b4b:	e9 70 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400b50 <read@plt>:
  400b50:	ff 25 02 35 20 00    	jmpq   *0x203502(%rip)        # 604058 <read@GLIBC_2.2.5>
  400b56:	68 08 00 00 00       	pushq  $0x8
  400b5b:	e9 60 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400b60 <fopen@plt>:
  400b60:	ff 25 fa 34 20 00    	jmpq   *0x2034fa(%rip)        # 604060 <fopen@GLIBC_2.2.5>
  400b66:	68 09 00 00 00       	pushq  $0x9
  400b6b:	e9 50 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400b70 <__libc_start_main@plt>:
  400b70:	ff 25 f2 34 20 00    	jmpq   *0x2034f2(%rip)        # 604068 <__libc_start_main@GLIBC_2.2.5>
  400b76:	68 0a 00 00 00       	pushq  $0xa
  400b7b:	e9 40 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400b80 <fgets@plt>:
  400b80:	ff 25 ea 34 20 00    	jmpq   *0x2034ea(%rip)        # 604070 <fgets@GLIBC_2.2.5>
  400b86:	68 0b 00 00 00       	pushq  $0xb
  400b8b:	e9 30 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400b90 <bcopy@plt>:
  400b90:	ff 25 e2 34 20 00    	jmpq   *0x2034e2(%rip)        # 604078 <bcopy@GLIBC_2.2.5>
  400b96:	68 0c 00 00 00       	pushq  $0xc
  400b9b:	e9 20 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400ba0 <__ctype_b_loc@plt>:
  400ba0:	ff 25 da 34 20 00    	jmpq   *0x2034da(%rip)        # 604080 <__ctype_b_loc@GLIBC_2.3>
  400ba6:	68 0d 00 00 00       	pushq  $0xd
  400bab:	e9 10 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400bb0 <sprintf@plt>:
  400bb0:	ff 25 d2 34 20 00    	jmpq   *0x2034d2(%rip)        # 604088 <sprintf@GLIBC_2.2.5>
  400bb6:	68 0e 00 00 00       	pushq  $0xe
  400bbb:	e9 00 ff ff ff       	jmpq   400ac0 <.plt>

0000000000400bc0 <sleep@plt>:
  400bc0:	ff 25 ca 34 20 00    	jmpq   *0x2034ca(%rip)        # 604090 <sleep@GLIBC_2.2.5>
  400bc6:	68 0f 00 00 00       	pushq  $0xf
  400bcb:	e9 f0 fe ff ff       	jmpq   400ac0 <.plt>

0000000000400bd0 <connect@plt>:
  400bd0:	ff 25 c2 34 20 00    	jmpq   *0x2034c2(%rip)        # 604098 <connect@GLIBC_2.2.5>
  400bd6:	68 10 00 00 00       	pushq  $0x10
  400bdb:	e9 e0 fe ff ff       	jmpq   400ac0 <.plt>

0000000000400be0 <gethostname@plt>:
  400be0:	ff 25 ba 34 20 00    	jmpq   *0x2034ba(%rip)        # 6040a0 <gethostname@GLIBC_2.2.5>
  400be6:	68 11 00 00 00       	pushq  $0x11
  400beb:	e9 d0 fe ff ff       	jmpq   400ac0 <.plt>

0000000000400bf0 <signal@plt>:
  400bf0:	ff 25 b2 34 20 00    	jmpq   *0x2034b2(%rip)        # 6040a8 <signal@GLIBC_2.2.5>
  400bf6:	68 12 00 00 00       	pushq  $0x12
  400bfb:	e9 c0 fe ff ff       	jmpq   400ac0 <.plt>

0000000000400c00 <socket@plt>:
  400c00:	ff 25 aa 34 20 00    	jmpq   *0x2034aa(%rip)        # 6040b0 <socket@GLIBC_2.2.5>
  400c06:	68 13 00 00 00       	pushq  $0x13
  400c0b:	e9 b0 fe ff ff       	jmpq   400ac0 <.plt>

0000000000400c10 <getenv@plt>:
  400c10:	ff 25 a2 34 20 00    	jmpq   *0x2034a2(%rip)        # 6040b8 <getenv@GLIBC_2.2.5>
  400c16:	68 14 00 00 00       	pushq  $0x14
  400c1b:	e9 a0 fe ff ff       	jmpq   400ac0 <.plt>

0000000000400c20 <alarm@plt>:
  400c20:	ff 25 9a 34 20 00    	jmpq   *0x20349a(%rip)        # 6040c0 <alarm@GLIBC_2.2.5>
  400c26:	68 15 00 00 00       	pushq  $0x15
  400c2b:	e9 90 fe ff ff       	jmpq   400ac0 <.plt>

0000000000400c30 <__errno_location@plt>:
  400c30:	ff 25 92 34 20 00    	jmpq   *0x203492(%rip)        # 6040c8 <__errno_location@GLIBC_2.2.5>
  400c36:	68 16 00 00 00       	pushq  $0x16
  400c3b:	e9 80 fe ff ff       	jmpq   400ac0 <.plt>

0000000000400c40 <strcpy@plt>:
  400c40:	ff 25 8a 34 20 00    	jmpq   *0x20348a(%rip)        # 6040d0 <strcpy@GLIBC_2.2.5>
  400c46:	68 17 00 00 00       	pushq  $0x17
  400c4b:	e9 70 fe ff ff       	jmpq   400ac0 <.plt>

0000000000400c50 <write@plt>:
  400c50:	ff 25 82 34 20 00    	jmpq   *0x203482(%rip)        # 6040d8 <write@GLIBC_2.2.5>
  400c56:	68 18 00 00 00       	pushq  $0x18
  400c5b:	e9 60 fe ff ff       	jmpq   400ac0 <.plt>

0000000000400c60 <memcpy@plt>:
  400c60:	ff 25 7a 34 20 00    	jmpq   *0x20347a(%rip)        # 6040e0 <memcpy@GLIBC_2.14>
  400c66:	68 19 00 00 00       	pushq  $0x19
  400c6b:	e9 50 fe ff ff       	jmpq   400ac0 <.plt>

0000000000400c70 <fflush@plt>:
  400c70:	ff 25 72 34 20 00    	jmpq   *0x203472(%rip)        # 6040e8 <fflush@GLIBC_2.2.5>
  400c76:	68 1a 00 00 00       	pushq  $0x1a
  400c7b:	e9 40 fe ff ff       	jmpq   400ac0 <.plt>

Disassembly of section .text:

0000000000400c80 <_start>:
  400c80:	31 ed                	xor    %ebp,%ebp
  400c82:	49 89 d1             	mov    %rdx,%r9
  400c85:	5e                   	pop    %rsi
  400c86:	48 89 e2             	mov    %rsp,%rdx
  400c89:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400c8d:	50                   	push   %rax
  400c8e:	54                   	push   %rsp
  400c8f:	49 c7 c0 b0 26 40 00 	mov    $0x4026b0,%r8
  400c96:	48 c7 c1 40 26 40 00 	mov    $0x402640,%rcx
  400c9d:	48 c7 c7 6d 0d 40 00 	mov    $0x400d6d,%rdi
  400ca4:	e8 c7 fe ff ff       	callq  400b70 <__libc_start_main@plt>
  400ca9:	f4                   	hlt    
  400caa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400cb0 <deregister_tm_clones>:
  400cb0:	b8 6f 57 60 00       	mov    $0x60576f,%eax
  400cb5:	55                   	push   %rbp
  400cb6:	48 2d 68 57 60 00    	sub    $0x605768,%rax
  400cbc:	48 83 f8 0e          	cmp    $0xe,%rax
  400cc0:	48 89 e5             	mov    %rsp,%rbp
  400cc3:	77 02                	ja     400cc7 <deregister_tm_clones+0x17>
  400cc5:	5d                   	pop    %rbp
  400cc6:	c3                   	retq   
  400cc7:	b8 00 00 00 00       	mov    $0x0,%eax
  400ccc:	48 85 c0             	test   %rax,%rax
  400ccf:	74 f4                	je     400cc5 <deregister_tm_clones+0x15>
  400cd1:	5d                   	pop    %rbp
  400cd2:	bf 68 57 60 00       	mov    $0x605768,%edi
  400cd7:	ff e0                	jmpq   *%rax
  400cd9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400ce0 <register_tm_clones>:
  400ce0:	b8 68 57 60 00       	mov    $0x605768,%eax
  400ce5:	55                   	push   %rbp
  400ce6:	48 2d 68 57 60 00    	sub    $0x605768,%rax
  400cec:	48 c1 f8 03          	sar    $0x3,%rax
  400cf0:	48 89 e5             	mov    %rsp,%rbp
  400cf3:	48 89 c2             	mov    %rax,%rdx
  400cf6:	48 c1 ea 3f          	shr    $0x3f,%rdx
  400cfa:	48 01 d0             	add    %rdx,%rax
  400cfd:	48 d1 f8             	sar    %rax
  400d00:	75 02                	jne    400d04 <register_tm_clones+0x24>
  400d02:	5d                   	pop    %rbp
  400d03:	c3                   	retq   
  400d04:	ba 00 00 00 00       	mov    $0x0,%edx
  400d09:	48 85 d2             	test   %rdx,%rdx
  400d0c:	74 f4                	je     400d02 <register_tm_clones+0x22>
  400d0e:	5d                   	pop    %rbp
  400d0f:	48 89 c6             	mov    %rax,%rsi
  400d12:	bf 68 57 60 00       	mov    $0x605768,%edi
  400d17:	ff e2                	jmpq   *%rdx
  400d19:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400d20 <__do_global_dtors_aux>:
  400d20:	80 3d 71 4a 20 00 00 	cmpb   $0x0,0x204a71(%rip)        # 605798 <completed.6355>
  400d27:	75 11                	jne    400d3a <__do_global_dtors_aux+0x1a>
  400d29:	55                   	push   %rbp
  400d2a:	48 89 e5             	mov    %rsp,%rbp
  400d2d:	e8 7e ff ff ff       	callq  400cb0 <deregister_tm_clones>
  400d32:	5d                   	pop    %rbp
  400d33:	c6 05 5e 4a 20 00 01 	movb   $0x1,0x204a5e(%rip)        # 605798 <completed.6355>
  400d3a:	f3 c3                	repz retq 
  400d3c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400d40 <frame_dummy>:
  400d40:	48 83 3d b8 30 20 00 	cmpq   $0x0,0x2030b8(%rip)        # 603e00 <__JCR_END__>
  400d47:	00 
  400d48:	74 1e                	je     400d68 <frame_dummy+0x28>
  400d4a:	b8 00 00 00 00       	mov    $0x0,%eax
  400d4f:	48 85 c0             	test   %rax,%rax
  400d52:	74 14                	je     400d68 <frame_dummy+0x28>
  400d54:	55                   	push   %rbp
  400d55:	bf 00 3e 60 00       	mov    $0x603e00,%edi
  400d5a:	48 89 e5             	mov    %rsp,%rbp
  400d5d:	ff d0                	callq  *%rax
  400d5f:	5d                   	pop    %rbp
  400d60:	e9 7b ff ff ff       	jmpq   400ce0 <register_tm_clones>
  400d65:	0f 1f 00             	nopl   (%rax)
  400d68:	e9 73 ff ff ff       	jmpq   400ce0 <register_tm_clones>

0000000000400d6d <main>:
  400d6d:	53                   	push   %rbx
  400d6e:	83 ff 01             	cmp    $0x1,%edi
  400d71:	75 10                	jne    400d83 <main+0x16>
  400d73:	48 8b 05 06 4a 20 00 	mov    0x204a06(%rip),%rax        # 605780 <stdin@@GLIBC_2.2.5>
  400d7a:	48 89 05 7f 4a 20 00 	mov    %rax,0x204a7f(%rip)        # 605800 <infile>
  400d81:	eb 59                	jmp    400ddc <main+0x6f>
  400d83:	48 89 f3             	mov    %rsi,%rbx
  400d86:	83 ff 02             	cmp    $0x2,%edi
  400d89:	75 35                	jne    400dc0 <main+0x53>
  400d8b:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  400d8f:	be d0 26 40 00       	mov    $0x4026d0,%esi
  400d94:	e8 c7 fd ff ff       	callq  400b60 <fopen@plt>
  400d99:	48 89 05 60 4a 20 00 	mov    %rax,0x204a60(%rip)        # 605800 <infile>
  400da0:	48 85 c0             	test   %rax,%rax
  400da3:	75 37                	jne    400ddc <main+0x6f>
  400da5:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  400da9:	48 8b 33             	mov    (%rbx),%rsi
  400dac:	bf d2 26 40 00       	mov    $0x4026d2,%edi
  400db1:	e8 1a fd ff ff       	callq  400ad0 <printf@plt>
  400db6:	bf 08 00 00 00       	mov    $0x8,%edi
  400dbb:	e8 70 fd ff ff       	callq  400b30 <exit@plt>
  400dc0:	48 8b 36             	mov    (%rsi),%rsi
  400dc3:	bf ef 26 40 00       	mov    $0x4026ef,%edi
  400dc8:	b8 00 00 00 00       	mov    $0x0,%eax
  400dcd:	e8 fe fc ff ff       	callq  400ad0 <printf@plt>
  400dd2:	bf 08 00 00 00       	mov    $0x8,%edi
  400dd7:	e8 54 fd ff ff       	callq  400b30 <exit@plt>
  400ddc:	e8 25 0b 00 00       	callq  401906 <initialize_bomb>
  400de1:	bf 58 27 40 00       	mov    $0x402758,%edi
  400de6:	e8 25 fd ff ff       	callq  400b10 <puts@plt>
  400deb:	bf 98 27 40 00       	mov    $0x402798,%edi
  400df0:	e8 1b fd ff ff       	callq  400b10 <puts@plt>
  400df5:	e8 c5 08 00 00       	callq  4016bf <read_line>
  400dfa:	48 89 c7             	mov    %rax,%rdi
  400dfd:	e8 9e 00 00 00       	callq  400ea0 <phase_1>
  400e02:	e8 55 0a 00 00       	callq  40185c <phase_defused>
  400e07:	bf c8 27 40 00       	mov    $0x4027c8,%edi
  400e0c:	e8 ff fc ff ff       	callq  400b10 <puts@plt>
  400e11:	e8 a9 08 00 00       	callq  4016bf <read_line>
  400e16:	48 89 c7             	mov    %rax,%rdi
  400e19:	e8 9e 00 00 00       	callq  400ebc <phase_2>
  400e1e:	e8 39 0a 00 00       	callq  40185c <phase_defused>
  400e23:	bf 09 27 40 00       	mov    $0x402709,%edi
  400e28:	e8 e3 fc ff ff       	callq  400b10 <puts@plt>
  400e2d:	e8 8d 08 00 00       	callq  4016bf <read_line>
  400e32:	48 89 c7             	mov    %rax,%rdi
  400e35:	e8 c5 00 00 00       	callq  400eff <phase_3>
  400e3a:	e8 1d 0a 00 00       	callq  40185c <phase_defused>
  400e3f:	bf 27 27 40 00       	mov    $0x402727,%edi
  400e44:	e8 c7 fc ff ff       	callq  400b10 <puts@plt>
  400e49:	e8 71 08 00 00       	callq  4016bf <read_line>
  400e4e:	48 89 c7             	mov    %rax,%rdi
  400e51:	e8 3f 02 00 00       	callq  401095 <phase_4>
  400e56:	e8 01 0a 00 00       	callq  40185c <phase_defused>
  400e5b:	bf f8 27 40 00       	mov    $0x4027f8,%edi
  400e60:	e8 ab fc ff ff       	callq  400b10 <puts@plt>
  400e65:	e8 55 08 00 00       	callq  4016bf <read_line>
  400e6a:	48 89 c7             	mov    %rax,%rdi
  400e6d:	e8 78 02 00 00       	callq  4010ea <phase_5>
  400e72:	e8 e5 09 00 00       	callq  40185c <phase_defused>
  400e77:	bf 36 27 40 00       	mov    $0x402736,%edi
  400e7c:	e8 8f fc ff ff       	callq  400b10 <puts@plt>
  400e81:	e8 39 08 00 00       	callq  4016bf <read_line>
  400e86:	48 89 c7             	mov    %rax,%rdi
  400e89:	e8 c8 02 00 00       	callq  401156 <phase_6>
  400e8e:	e8 c9 09 00 00       	callq  40185c <phase_defused>
  400e93:	b8 00 00 00 00       	mov    $0x0,%eax
  400e98:	5b                   	pop    %rbx
  400e99:	c3                   	retq   
  400e9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400ea0 <phase_1>:
  400ea0:	48 83 ec 08          	sub    $0x8,%rsp
  400ea4:	be 20 44 60 00       	mov    $0x604420,%esi
  400ea9:	e8 48 05 00 00       	callq  4013f6 <strings_not_equal>
  400eae:	84 c0                	test   %al,%al
  400eb0:	74 05                	je     400eb7 <phase_1+0x17>
  400eb2:	e8 90 07 00 00       	callq  401647 <explode_bomb>
  400eb7:	48 83 c4 08          	add    $0x8,%rsp
  400ebb:	c3                   	retq   

0000000000400ebc <phase_2>:
  400ebc:	53                   	push   %rbx
  400ebd:	48 83 ec 30          	sub    $0x30,%rsp
  400ec1:	48 89 e6             	mov    %rsp,%rsi
  400ec4:	e8 b4 07 00 00       	callq  40167d <read_six_numbers>
  400ec9:	48 83 3c 24 02       	cmpq   $0x2,(%rsp)
  400ece:	74 05                	je     400ed5 <phase_2+0x19>
  400ed0:	e8 72 07 00 00       	callq  401647 <explode_bomb>
  400ed5:	bb 01 00 00 00       	mov    $0x1,%ebx
  400eda:	eb 17                	jmp    400ef3 <phase_2+0x37>
  400edc:	48 8b 44 dc f8       	mov    -0x8(%rsp,%rbx,8),%rax
  400ee1:	48 01 c0             	add    %rax,%rax
  400ee4:	48 39 04 dc          	cmp    %rax,(%rsp,%rbx,8)
  400ee8:	74 05                	je     400eef <phase_2+0x33>
  400eea:	e8 58 07 00 00       	callq  401647 <explode_bomb>
  400eef:	48 83 c3 01          	add    $0x1,%rbx
  400ef3:	48 83 fb 05          	cmp    $0x5,%rbx
  400ef7:	76 e3                	jbe    400edc <phase_2+0x20>
  400ef9:	48 83 c4 30          	add    $0x30,%rsp
  400efd:	5b                   	pop    %rbx
  400efe:	c3                   	retq   

0000000000400eff <phase_3>:
  400eff:	48 83 ec 28          	sub    $0x28,%rsp
  400f03:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  400f08:	48 8d 4c 24 0f       	lea    0xf(%rsp),%rcx
  400f0d:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
  400f12:	be 1c 28 40 00       	mov    $0x40281c,%esi
  400f17:	b8 00 00 00 00       	mov    $0x0,%eax
  400f1c:	e8 ff fb ff ff       	callq  400b20 <__isoc99_sscanf@plt>
  400f21:	83 f8 02             	cmp    $0x2,%eax
  400f24:	7f 05                	jg     400f2b <phase_3+0x2c>
  400f26:	e8 1c 07 00 00       	callq  401647 <explode_bomb>
  400f2b:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  400f30:	48 83 e8 06          	sub    $0x6,%rax
  400f34:	48 83 f8 07          	cmp    $0x7,%rax
  400f38:	0f 87 c3 00 00 00    	ja     401001 <phase_3+0x102>
  400f3e:	ff 24 c5 40 28 40 00 	jmpq   *0x402840(,%rax,8)
  400f45:	48 83 7c 24 10 30    	cmpq   $0x30,0x10(%rsp)
  400f4b:	0f 84 bc 00 00 00    	je     40100d <phase_3+0x10e>
  400f51:	e8 f1 06 00 00       	callq  401647 <explode_bomb>
  400f56:	b8 77 00 00 00       	mov    $0x77,%eax
  400f5b:	e9 e3 00 00 00       	jmpq   401043 <phase_3+0x144>
  400f60:	48 83 7c 24 10 4b    	cmpq   $0x4b,0x10(%rsp)
  400f66:	0f 84 a8 00 00 00    	je     401014 <phase_3+0x115>
  400f6c:	e8 d6 06 00 00       	callq  401647 <explode_bomb>
  400f71:	b8 69 00 00 00       	mov    $0x69,%eax
  400f76:	e9 c8 00 00 00       	jmpq   401043 <phase_3+0x144>
  400f7b:	48 83 7c 24 10 4e    	cmpq   $0x4e,0x10(%rsp)
  400f81:	0f 84 94 00 00 00    	je     40101b <phase_3+0x11c>
  400f87:	e8 bb 06 00 00       	callq  401647 <explode_bomb>
  400f8c:	b8 65 00 00 00       	mov    $0x65,%eax
  400f91:	e9 ad 00 00 00       	jmpq   401043 <phase_3+0x144>
  400f96:	48 83 7c 24 10 75    	cmpq   $0x75,0x10(%rsp)
  400f9c:	0f 84 80 00 00 00    	je     401022 <phase_3+0x123>
  400fa2:	e8 a0 06 00 00       	callq  401647 <explode_bomb>
  400fa7:	b8 77 00 00 00       	mov    $0x77,%eax
  400fac:	e9 92 00 00 00       	jmpq   401043 <phase_3+0x144>
  400fb1:	48 83 7c 24 10 20    	cmpq   $0x20,0x10(%rsp)
  400fb7:	74 70                	je     401029 <phase_3+0x12a>
  400fb9:	e8 89 06 00 00       	callq  401647 <explode_bomb>
  400fbe:	b8 66 00 00 00       	mov    $0x66,%eax
  400fc3:	eb 7e                	jmp    401043 <phase_3+0x144>
  400fc5:	48 83 7c 24 10 5b    	cmpq   $0x5b,0x10(%rsp)
  400fcb:	74 63                	je     401030 <phase_3+0x131>
  400fcd:	e8 75 06 00 00       	callq  401647 <explode_bomb>
  400fd2:	b8 78 00 00 00       	mov    $0x78,%eax
  400fd7:	eb 6a                	jmp    401043 <phase_3+0x144>
  400fd9:	48 83 7c 24 10 77    	cmpq   $0x77,0x10(%rsp)
  400fdf:	74 56                	je     401037 <phase_3+0x138>
  400fe1:	e8 61 06 00 00       	callq  401647 <explode_bomb>
  400fe6:	b8 67 00 00 00       	mov    $0x67,%eax
  400feb:	eb 56                	jmp    401043 <phase_3+0x144>
  400fed:	48 83 7c 24 10 56    	cmpq   $0x56,0x10(%rsp)
  400ff3:	74 49                	je     40103e <phase_3+0x13f>
  400ff5:	e8 4d 06 00 00       	callq  401647 <explode_bomb>
  400ffa:	b8 62 00 00 00       	mov    $0x62,%eax
  400fff:	eb 42                	jmp    401043 <phase_3+0x144>
  401001:	e8 41 06 00 00       	callq  401647 <explode_bomb>
  401006:	b8 6c 00 00 00       	mov    $0x6c,%eax
  40100b:	eb 36                	jmp    401043 <phase_3+0x144>
  40100d:	b8 77 00 00 00       	mov    $0x77,%eax
  401012:	eb 2f                	jmp    401043 <phase_3+0x144>
  401014:	b8 69 00 00 00       	mov    $0x69,%eax
  401019:	eb 28                	jmp    401043 <phase_3+0x144>
  40101b:	b8 65 00 00 00       	mov    $0x65,%eax
  401020:	eb 21                	jmp    401043 <phase_3+0x144>
  401022:	b8 77 00 00 00       	mov    $0x77,%eax
  401027:	eb 1a                	jmp    401043 <phase_3+0x144>
  401029:	b8 66 00 00 00       	mov    $0x66,%eax
  40102e:	eb 13                	jmp    401043 <phase_3+0x144>
  401030:	b8 78 00 00 00       	mov    $0x78,%eax
  401035:	eb 0c                	jmp    401043 <phase_3+0x144>
  401037:	b8 67 00 00 00       	mov    $0x67,%eax
  40103c:	eb 05                	jmp    401043 <phase_3+0x144>
  40103e:	b8 62 00 00 00       	mov    $0x62,%eax
  401043:	3a 44 24 0f          	cmp    0xf(%rsp),%al
  401047:	74 05                	je     40104e <phase_3+0x14f>
  401049:	e8 f9 05 00 00       	callq  401647 <explode_bomb>
  40104e:	48 83 c4 28          	add    $0x28,%rsp
  401052:	c3                   	retq   

0000000000401053 <func4>:
  401053:	41 54                	push   %r12
  401055:	55                   	push   %rbp
  401056:	53                   	push   %rbx
  401057:	48 89 fb             	mov    %rdi,%rbx
  40105a:	48 85 ff             	test   %rdi,%rdi
  40105d:	7e 27                	jle    401086 <func4+0x33>
  40105f:	48 89 f5             	mov    %rsi,%rbp
  401062:	48 83 ff 01          	cmp    $0x1,%rdi
  401066:	74 25                	je     40108d <func4+0x3a>
  401068:	48 8d 7f ff          	lea    -0x1(%rdi),%rdi
  40106c:	e8 e2 ff ff ff       	callq  401053 <func4>
  401071:	4c 8d 24 28          	lea    (%rax,%rbp,1),%r12
  401075:	48 8d 7b fe          	lea    -0x2(%rbx),%rdi
  401079:	48 89 ee             	mov    %rbp,%rsi
  40107c:	e8 d2 ff ff ff       	callq  401053 <func4>
  401081:	4c 01 e0             	add    %r12,%rax
  401084:	eb 0a                	jmp    401090 <func4+0x3d>
  401086:	b8 00 00 00 00       	mov    $0x0,%eax
  40108b:	eb 03                	jmp    401090 <func4+0x3d>
  40108d:	48 89 f0             	mov    %rsi,%rax
  401090:	5b                   	pop    %rbx
  401091:	5d                   	pop    %rbp
  401092:	41 5c                	pop    %r12
  401094:	c3                   	retq   

0000000000401095 <phase_4>:
  401095:	48 83 ec 18          	sub    $0x18,%rsp
  401099:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  40109e:	48 89 e2             	mov    %rsp,%rdx
  4010a1:	be 3f 2d 40 00       	mov    $0x402d3f,%esi
  4010a6:	b8 00 00 00 00       	mov    $0x0,%eax
  4010ab:	e8 70 fa ff ff       	callq  400b20 <__isoc99_sscanf@plt>
  4010b0:	83 f8 02             	cmp    $0x2,%eax
  4010b3:	75 11                	jne    4010c6 <phase_4+0x31>
  4010b5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  4010ba:	48 83 f8 01          	cmp    $0x1,%rax
  4010be:	7e 06                	jle    4010c6 <phase_4+0x31>
  4010c0:	48 83 f8 04          	cmp    $0x4,%rax
  4010c4:	7e 05                	jle    4010cb <phase_4+0x36>
  4010c6:	e8 7c 05 00 00       	callq  401647 <explode_bomb>
  4010cb:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
  4010d0:	bf 07 00 00 00       	mov    $0x7,%edi
  4010d5:	e8 79 ff ff ff       	callq  401053 <func4>
  4010da:	48 3b 04 24          	cmp    (%rsp),%rax
  4010de:	74 05                	je     4010e5 <phase_4+0x50>
  4010e0:	e8 62 05 00 00       	callq  401647 <explode_bomb>
  4010e5:	48 83 c4 18          	add    $0x18,%rsp
  4010e9:	c3                   	retq   

00000000004010ea <phase_5>:
  4010ea:	48 83 ec 18          	sub    $0x18,%rsp
  4010ee:	48 89 e1             	mov    %rsp,%rcx
  4010f1:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  4010f6:	be 3f 2d 40 00       	mov    $0x402d3f,%esi
  4010fb:	b8 00 00 00 00       	mov    $0x0,%eax
  401100:	e8 1b fa ff ff       	callq  400b20 <__isoc99_sscanf@plt>
  401105:	83 f8 01             	cmp    $0x1,%eax
  401108:	7f 05                	jg     40110f <phase_5+0x25>
  40110a:	e8 38 05 00 00       	callq  401647 <explode_bomb>
  40110f:	48 83 64 24 08 0f    	andq   $0xf,0x8(%rsp)
  401115:	b9 00 00 00 00       	mov    $0x0,%ecx
  40111a:	ba 00 00 00 00       	mov    $0x0,%edx
  40111f:	eb 14                	jmp    401135 <phase_5+0x4b>
  401121:	48 83 c2 01          	add    $0x1,%rdx
  401125:	48 8b 04 c5 80 28 40 	mov    0x402880(,%rax,8),%rax
  40112c:	00 
  40112d:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401132:	48 01 c1             	add    %rax,%rcx
  401135:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  40113a:	48 83 f8 0f          	cmp    $0xf,%rax
  40113e:	75 e1                	jne    401121 <phase_5+0x37>
  401140:	48 83 fa 0f          	cmp    $0xf,%rdx
  401144:	75 06                	jne    40114c <phase_5+0x62>
  401146:	48 3b 0c 24          	cmp    (%rsp),%rcx
  40114a:	74 05                	je     401151 <phase_5+0x67>
  40114c:	e8 f6 04 00 00       	callq  401647 <explode_bomb>
  401151:	48 83 c4 18          	add    $0x18,%rsp
  401155:	c3                   	retq   

0000000000401156 <phase_6>:
  401156:	41 54                	push   %r12
  401158:	55                   	push   %rbp
  401159:	53                   	push   %rbx
  40115a:	48 83 ec 60          	sub    $0x60,%rsp
  40115e:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  401163:	e8 15 05 00 00       	callq  40167d <read_six_numbers>
  401168:	bd 00 00 00 00       	mov    $0x0,%ebp
  40116d:	eb 3b                	jmp    4011aa <phase_6+0x54>
  40116f:	48 8b 44 ec 30       	mov    0x30(%rsp,%rbp,8),%rax
  401174:	48 83 e8 01          	sub    $0x1,%rax
  401178:	48 83 f8 05          	cmp    $0x5,%rax
  40117c:	76 05                	jbe    401183 <phase_6+0x2d>
  40117e:	e8 c4 04 00 00       	callq  401647 <explode_bomb>
  401183:	4c 8d 65 01          	lea    0x1(%rbp),%r12
  401187:	4c 89 e3             	mov    %r12,%rbx
  40118a:	eb 15                	jmp    4011a1 <phase_6+0x4b>
  40118c:	48 8b 44 dc 30       	mov    0x30(%rsp,%rbx,8),%rax
  401191:	48 39 44 ec 30       	cmp    %rax,0x30(%rsp,%rbp,8)
  401196:	75 05                	jne    40119d <phase_6+0x47>
  401198:	e8 aa 04 00 00       	callq  401647 <explode_bomb>
  40119d:	48 83 c3 01          	add    $0x1,%rbx
  4011a1:	48 83 fb 05          	cmp    $0x5,%rbx
  4011a5:	7e e5                	jle    40118c <phase_6+0x36>
  4011a7:	4c 89 e5             	mov    %r12,%rbp
  4011aa:	48 83 fd 05          	cmp    $0x5,%rbp
  4011ae:	7e bf                	jle    40116f <phase_6+0x19>
  4011b0:	b8 00 00 00 00       	mov    $0x0,%eax
  4011b5:	b9 07 00 00 00       	mov    $0x7,%ecx
  4011ba:	eb 11                	jmp    4011cd <phase_6+0x77>
  4011bc:	48 89 ca             	mov    %rcx,%rdx
  4011bf:	48 2b 54 c4 30       	sub    0x30(%rsp,%rax,8),%rdx
  4011c4:	48 89 54 c4 30       	mov    %rdx,0x30(%rsp,%rax,8)
  4011c9:	48 83 c0 01          	add    $0x1,%rax
  4011cd:	48 83 f8 05          	cmp    $0x5,%rax
  4011d1:	7e e9                	jle    4011bc <phase_6+0x66>


  4011d3:	b9 00 00 00 00       	mov    $0x0,%ecx

  4011d8:	eb 23                	jmp    4011fd <phase_6+0xa7>
  4011da:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  4011de:	48 83 c0 01          	add    $0x1,%rax
  4011e2:	eb 0a                	jmp    4011ee <phase_6+0x98>

  4011e4:	b8 01 00 00 00       	mov    $0x1,%eax                 5 times 
  4011e9:	ba 00 43 60 00       	mov    $0x604300,%edx
  4011ee:	48 39 44 cc 30       	cmp    %rax,0x30(%rsp,%rcx,8)
  4011f3:	7f e5                	jg     4011da <phase_6+0x84>

  
  4011f5:	48 89 14 cc          	mov    %rdx,(%rsp,%rcx,8)
  4011f9:	48 83 c1 01          	add    $0x1,%rcx


  4011fd:	48 83 f9 05          	cmp    $0x5,%rcx
  401201:	7e e1                	jle    4011e4 <phase_6+0x8e>
  401203:	48 8b 1c 24          	mov    (%rsp),%rbx
  401207:	48 89 d9             	mov    %rbx,%rcx
  40120a:	b8 01 00 00 00       	mov    $0x1,%eax
  40120f:	eb 0f                	jmp    401220 <phase_6+0xca>
  401211:	48 8b 14 c4          	mov    (%rsp,%rax,8),%rdx
  401215:	48 89 51 10          	mov    %rdx,0x10(%rcx)
  401219:	48 83 c0 01          	add    $0x1,%rax
  40121d:	48 89 d1             	mov    %rdx,%rcx
  401220:	48 83 f8 05          	cmp    $0x5,%rax
  401224:	7e eb                	jle    401211 <phase_6+0xbb>
  401226:	48 c7 41 10 00 00 00 	movq   $0x0,0x10(%rcx)
  40122d:	00 
  40122e:	bd 00 00 00 00       	mov    $0x0,%ebp
  401233:	eb 19                	jmp    40124e <phase_6+0xf8>
  401235:	48 8b 43 10          	mov    0x10(%rbx),%rax
  401239:	48 8b 00             	mov    (%rax),%rax
  40123c:	48 39 03             	cmp    %rax,(%rbx)
  40123f:	7d 05                	jge    401246 <phase_6+0xf0>
  401241:	e8 01 04 00 00       	callq  401647 <explode_bomb>
  401246:	48 8b 5b 10          	mov    0x10(%rbx),%rbx
  40124a:	48 83 c5 01          	add    $0x1,%rbp
  40124e:	48 83 fd 04          	cmp    $0x4,%rbp
  401252:	7e e1                	jle    401235 <phase_6+0xdf>
  401254:	48 83 c4 60          	add    $0x60,%rsp
  401258:	5b                   	pop    %rbx
  401259:	5d                   	pop    %rbp
  40125a:	41 5c                	pop    %r12
  40125c:	c3                   	retq   

000000000040125d <fun7>:
  40125d:	48 83 ec 08          	sub    $0x8,%rsp
  401261:	48 85 ff             	test   %rdi,%rdi
  401264:	74 38                	je     40129e <fun7+0x41>
  401266:	48 8b 02             	mov    (%rdx),%rax
  401269:	48 c1 e0 08          	shl    $0x8,%rax
  40126d:	48 03 07             	add    (%rdi),%rax
  401270:	48 89 02             	mov    %rax,(%rdx)
  401273:	48 8b 07             	mov    (%rdi),%rax
  401276:	48 39 f0             	cmp    %rsi,%rax
  401279:	7e 0e                	jle    401289 <fun7+0x2c>
  40127b:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  40127f:	e8 d9 ff ff ff       	callq  40125d <fun7>
  401284:	48 01 c0             	add    %rax,%rax
  401287:	eb 23                	jmp    4012ac <fun7+0x4f>
  401289:	48 39 f0             	cmp    %rsi,%rax
  40128c:	74 19                	je     4012a7 <fun7+0x4a>
  40128e:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  401292:	e8 c6 ff ff ff       	callq  40125d <fun7>
  401297:	48 8d 44 00 01       	lea    0x1(%rax,%rax,1),%rax
  40129c:	eb 0e                	jmp    4012ac <fun7+0x4f>
  40129e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4012a5:	eb 05                	jmp    4012ac <fun7+0x4f>
  4012a7:	b8 00 00 00 00       	mov    $0x0,%eax
  4012ac:	48 83 c4 08          	add    $0x8,%rsp
  4012b0:	c3                   	retq   

00000000004012b1 <secret_phase>:
  4012b1:	48 83 ec 28          	sub    $0x28,%rsp
  4012b5:	e8 05 04 00 00       	callq  4016bf <read_line>
  4012ba:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  4012c1:	00 00 
  4012c3:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  4012c8:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
  4012cd:	be 27 28 40 00       	mov    $0x402827,%esi
  4012d2:	48 89 c7             	mov    %rax,%rdi
  4012d5:	b8 00 00 00 00       	mov    $0x0,%eax
  4012da:	e8 41 f8 ff ff       	callq  400b20 <__isoc99_sscanf@plt>
  4012df:	83 f8 02             	cmp    $0x2,%eax
  4012e2:	74 05                	je     4012e9 <secret_phase+0x38>
  4012e4:	e8 5e 03 00 00       	callq  401647 <explode_bomb>
  4012e9:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4012ee:	48 83 e8 3a          	sub    $0x3a,%rax
  4012f2:	48 83 f8 7a          	cmp    $0x7a,%rax
  4012f6:	76 05                	jbe    4012fd <secret_phase+0x4c>
  4012f8:	e8 4a 03 00 00       	callq  401647 <explode_bomb>
  4012fd:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  401302:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
  401307:	bf 20 41 60 00       	mov    $0x604120,%edi
  40130c:	e8 4c ff ff ff       	callq  40125d <fun7>
  401311:	48 85 c0             	test   %rax,%rax
  401314:	74 05                	je     40131b <secret_phase+0x6a>
  401316:	e8 2c 03 00 00       	callq  401647 <explode_bomb>
  40131b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
  401320:	48 39 44 24 08       	cmp    %rax,0x8(%rsp)
  401325:	74 05                	je     40132c <secret_phase+0x7b>
  401327:	e8 1b 03 00 00       	callq  401647 <explode_bomb>
  40132c:	bf 00 29 40 00       	mov    $0x402900,%edi
  401331:	e8 da f7 ff ff       	callq  400b10 <puts@plt>
  401336:	e8 21 05 00 00       	callq  40185c <phase_defused>
  40133b:	48 83 c4 28          	add    $0x28,%rsp
  40133f:	c3                   	retq   

0000000000401340 <safe_print>:
  401340:	48 83 ec 08          	sub    $0x8,%rsp
  401344:	48 89 fe             	mov    %rdi,%rsi
  401347:	b8 00 00 00 00       	mov    $0x0,%eax
  40134c:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401353:	f2 ae                	repnz scas %es:(%rdi),%al
  401355:	48 f7 d1             	not    %rcx
  401358:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  40135c:	48 63 d2             	movslq %edx,%rdx
  40135f:	bf 01 00 00 00       	mov    $0x1,%edi
  401364:	e8 e7 f8 ff ff       	callq  400c50 <write@plt>
  401369:	89 05 81 44 20 00    	mov    %eax,0x204481(%rip)        # 6057f0 <returncode>
  40136f:	48 83 c4 08          	add    $0x8,%rsp
  401373:	c3                   	retq   

0000000000401374 <sig_handler>:
  401374:	48 83 ec 08          	sub    $0x8,%rsp
  401378:	bf 28 29 40 00       	mov    $0x402928,%edi
  40137d:	e8 be ff ff ff       	callq  401340 <safe_print>
  401382:	bf 03 00 00 00       	mov    $0x3,%edi
  401387:	e8 34 f8 ff ff       	callq  400bc0 <sleep@plt>
  40138c:	bf bf 2c 40 00       	mov    $0x402cbf,%edi
  401391:	e8 aa ff ff ff       	callq  401340 <safe_print>
  401396:	48 8b 3d f3 43 20 00 	mov    0x2043f3(%rip),%rdi        # 605790 <stdout@@GLIBC_2.2.5>
  40139d:	e8 ce f8 ff ff       	callq  400c70 <fflush@plt>
  4013a2:	bf 01 00 00 00       	mov    $0x1,%edi
  4013a7:	e8 14 f8 ff ff       	callq  400bc0 <sleep@plt>
  4013ac:	bf c7 2c 40 00       	mov    $0x402cc7,%edi
  4013b1:	e8 8a ff ff ff       	callq  401340 <safe_print>
  4013b6:	bf 10 00 00 00       	mov    $0x10,%edi
  4013bb:	e8 70 f7 ff ff       	callq  400b30 <exit@plt>

00000000004013c0 <invalid_phase>:
  4013c0:	48 83 ec 08          	sub    $0x8,%rsp
  4013c4:	48 89 fe             	mov    %rdi,%rsi
  4013c7:	bf d0 2c 40 00       	mov    $0x402cd0,%edi
  4013cc:	b8 00 00 00 00       	mov    $0x0,%eax
  4013d1:	e8 fa f6 ff ff       	callq  400ad0 <printf@plt>
  4013d6:	bf 08 00 00 00       	mov    $0x8,%edi
  4013db:	e8 50 f7 ff ff       	callq  400b30 <exit@plt>

00000000004013e0 <string_length>:
  4013e0:	b8 00 00 00 00       	mov    $0x0,%eax
  4013e5:	eb 08                	jmp    4013ef <string_length+0xf>
  4013e7:	48 83 c7 01          	add    $0x1,%rdi
  4013eb:	48 83 c0 01          	add    $0x1,%rax
  4013ef:	80 3f 00             	cmpb   $0x0,(%rdi)
  4013f2:	75 f3                	jne    4013e7 <string_length+0x7>
  4013f4:	f3 c3                	repz retq 

00000000004013f6 <strings_not_equal>:
  4013f6:	41 54                	push   %r12
  4013f8:	55                   	push   %rbp
  4013f9:	53                   	push   %rbx
  4013fa:	48 89 fb             	mov    %rdi,%rbx
  4013fd:	48 89 f5             	mov    %rsi,%rbp
  401400:	e8 db ff ff ff       	callq  4013e0 <string_length>
  401405:	49 89 c4             	mov    %rax,%r12
  401408:	48 89 ef             	mov    %rbp,%rdi
  40140b:	e8 d0 ff ff ff       	callq  4013e0 <string_length>
  401410:	49 39 c4             	cmp    %rax,%r12
  401413:	75 18                	jne    40142d <strings_not_equal+0x37>
  401415:	eb 0d                	jmp    401424 <strings_not_equal+0x2e>
  401417:	3a 45 00             	cmp    0x0(%rbp),%al
  40141a:	75 18                	jne    401434 <strings_not_equal+0x3e>
  40141c:	48 83 c3 01          	add    $0x1,%rbx
  401420:	48 83 c5 01          	add    $0x1,%rbp
  401424:	0f b6 03             	movzbl (%rbx),%eax
  401427:	84 c0                	test   %al,%al
  401429:	75 ec                	jne    401417 <strings_not_equal+0x21>
  40142b:	eb 0c                	jmp    401439 <strings_not_equal+0x43>
  40142d:	b8 01 00 00 00       	mov    $0x1,%eax
  401432:	eb 05                	jmp    401439 <strings_not_equal+0x43>
  401434:	b8 01 00 00 00       	mov    $0x1,%eax
  401439:	5b                   	pop    %rbx
  40143a:	5d                   	pop    %rbp
  40143b:	41 5c                	pop    %r12
  40143d:	c3                   	retq   

000000000040143e <fs>:
  40143e:	ba 00 00 00 00       	mov    $0x0,%edx
  401443:	eb 2d                	jmp    401472 <fs+0x34>
  401445:	83 e8 61             	sub    $0x61,%eax
  401448:	3c 14                	cmp    $0x14,%al
  40144a:	77 23                	ja     40146f <fs+0x31>
  40144c:	0f b6 c0             	movzbl %al,%eax
  40144f:	ff 24 c5 08 2f 40 00 	jmpq   *0x402f08(,%rax,8)
  401456:	c6 01 6f             	movb   $0x6f,(%rcx)
  401459:	eb 14                	jmp    40146f <fs+0x31>
  40145b:	c6 01 69             	movb   $0x69,(%rcx)
  40145e:	66 90                	xchg   %ax,%ax
  401460:	eb 0d                	jmp    40146f <fs+0x31>
  401462:	c6 01 65             	movb   $0x65,(%rcx)
  401465:	eb 08                	jmp    40146f <fs+0x31>
  401467:	c6 01 61             	movb   $0x61,(%rcx)
  40146a:	eb 03                	jmp    40146f <fs+0x31>
  40146c:	c6 01 75             	movb   $0x75,(%rcx)
  40146f:	83 c2 01             	add    $0x1,%edx
  401472:	48 63 ca             	movslq %edx,%rcx
  401475:	48 01 f9             	add    %rdi,%rcx
  401478:	0f b6 01             	movzbl (%rcx),%eax
  40147b:	84 c0                	test   %al,%al
  40147d:	75 c6                	jne    401445 <fs+0x7>
  40147f:	f3 c3                	repz retq 

0000000000401481 <initialize_bomb_solve>:
  401481:	f3 c3                	repz retq 

0000000000401483 <blank_line>:
  401483:	55                   	push   %rbp
  401484:	53                   	push   %rbx
  401485:	48 83 ec 08          	sub    $0x8,%rsp
  401489:	48 89 fb             	mov    %rdi,%rbx
  40148c:	eb 17                	jmp    4014a5 <blank_line+0x22>
  40148e:	e8 0d f7 ff ff       	callq  400ba0 <__ctype_b_loc@plt>
  401493:	48 8b 00             	mov    (%rax),%rax
  401496:	48 83 c3 01          	add    $0x1,%rbx
  40149a:	48 0f be ed          	movsbq %bpl,%rbp
  40149e:	f6 44 68 01 20       	testb  $0x20,0x1(%rax,%rbp,2)
  4014a3:	74 0f                	je     4014b4 <blank_line+0x31>
  4014a5:	0f b6 2b             	movzbl (%rbx),%ebp
  4014a8:	40 84 ed             	test   %bpl,%bpl
  4014ab:	75 e1                	jne    40148e <blank_line+0xb>
  4014ad:	b8 01 00 00 00       	mov    $0x1,%eax
  4014b2:	eb 05                	jmp    4014b9 <blank_line+0x36>
  4014b4:	b8 00 00 00 00       	mov    $0x0,%eax
  4014b9:	48 83 c4 08          	add    $0x8,%rsp
  4014bd:	5b                   	pop    %rbx
  4014be:	5d                   	pop    %rbp
  4014bf:	c3                   	retq   

00000000004014c0 <skip>:
  4014c0:	55                   	push   %rbp
  4014c1:	53                   	push   %rbx
  4014c2:	48 83 ec 08          	sub    $0x8,%rsp
  4014c6:	48 89 fd             	mov    %rdi,%rbp
  4014c9:	48 8b 05 28 43 20 00 	mov    0x204328(%rip),%rax        # 6057f8 <num_input_strings>
  4014d0:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4014d4:	48 c1 e0 04          	shl    $0x4,%rax
  4014d8:	48 8d b8 20 58 60 00 	lea    0x605820(%rax),%rdi
  4014df:	48 8b 15 1a 43 20 00 	mov    0x20431a(%rip),%rdx        # 605800 <infile>
  4014e6:	be 50 00 00 00       	mov    $0x50,%esi
  4014eb:	e8 90 f6 ff ff       	callq  400b80 <fgets@plt>
  4014f0:	48 89 c3             	mov    %rax,%rbx
  4014f3:	48 85 c0             	test   %rax,%rax
  4014f6:	74 3b                	je     401533 <skip+0x73>
  4014f8:	48 89 c7             	mov    %rax,%rdi
  4014fb:	e8 83 ff ff ff       	callq  401483 <blank_line>
  401500:	85 c0                	test   %eax,%eax
  401502:	75 c5                	jne    4014c9 <skip+0x9>
  401504:	eb 1b                	jmp    401521 <skip+0x61>
  401506:	85 c9                	test   %ecx,%ecx
  401508:	75 0c                	jne    401516 <skip+0x56>
  40150a:	80 fa 27             	cmp    $0x27,%dl
  40150d:	0f 1f 00             	nopl   (%rax)
  401510:	75 09                	jne    40151b <skip+0x5b>
  401512:	b1 01                	mov    $0x1,%cl
  401514:	eb 05                	jmp    40151b <skip+0x5b>
  401516:	b9 01 00 00 00       	mov    $0x1,%ecx
  40151b:	48 83 c0 01          	add    $0x1,%rax
  40151f:	eb 08                	jmp    401529 <skip+0x69>
  401521:	48 89 d8             	mov    %rbx,%rax
  401524:	b9 00 00 00 00       	mov    $0x0,%ecx
  401529:	0f b6 10             	movzbl (%rax),%edx
  40152c:	84 d2                	test   %dl,%dl
  40152e:	75 d6                	jne    401506 <skip+0x46>
  401530:	89 4d 00             	mov    %ecx,0x0(%rbp)
  401533:	48 89 d8             	mov    %rbx,%rax
  401536:	48 83 c4 08          	add    $0x8,%rsp
  40153a:	5b                   	pop    %rbx
  40153b:	5d                   	pop    %rbp
  40153c:	c3                   	retq   

000000000040153d <send_msg>:
  40153d:	53                   	push   %rbx
  40153e:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  401545:	89 fb                	mov    %edi,%ebx
  401547:	83 ff 01             	cmp    $0x1,%edi
  40154a:	74 26                	je     401572 <send_msg+0x35>
  40154c:	83 ff 01             	cmp    $0x1,%edi
  40154f:	72 07                	jb     401558 <send_msg+0x1b>
  401551:	83 ff 02             	cmp    $0x2,%edi
  401554:	74 0c                	je     401562 <send_msg+0x25>
  401556:	eb 12                	jmp    40156a <send_msg+0x2d>
  401558:	41 b8 e1 2c 40 00    	mov    $0x402ce1,%r8d
  40155e:	66 90                	xchg   %ax,%ax
  401560:	eb 16                	jmp    401578 <send_msg+0x3b>
  401562:	41 b8 f2 2c 40 00    	mov    $0x402cf2,%r8d
  401568:	eb 0e                	jmp    401578 <send_msg+0x3b>
  40156a:	41 b8 f7 2c 40 00    	mov    $0x402cf7,%r8d
  401570:	eb 06                	jmp    401578 <send_msg+0x3b>
  401572:	41 b8 ea 2c 40 00    	mov    $0x402cea,%r8d
  401578:	4c 8b 0d 79 42 20 00 	mov    0x204279(%rip),%r9        # 6057f8 <num_input_strings>
  40157f:	4b 8d 54 89 fb       	lea    -0x5(%r9,%r9,4),%rdx
  401584:	48 89 d0             	mov    %rdx,%rax
  401587:	48 c1 e0 04          	shl    $0x4,%rax
  40158b:	48 8d 90 20 58 60 00 	lea    0x605820(%rax),%rdx
  401592:	48 89 d7             	mov    %rdx,%rdi
  401595:	b8 00 00 00 00       	mov    $0x0,%eax
  40159a:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4015a1:	f2 ae                	repnz scas %es:(%rdi),%al
  4015a3:	48 f7 d1             	not    %rcx
  4015a6:	48 83 c1 63          	add    $0x63,%rcx
  4015aa:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  4015b1:	76 1d                	jbe    4015d0 <send_msg+0x93>
  4015b3:	83 fb 02             	cmp    $0x2,%ebx
  4015b6:	0f 84 82 00 00 00    	je     40163e <send_msg+0x101>
  4015bc:	bf 68 29 40 00       	mov    $0x402968,%edi
  4015c1:	e8 0a f5 ff ff       	callq  400ad0 <printf@plt>
  4015c6:	bf 08 00 00 00       	mov    $0x8,%edi
  4015cb:	e8 60 f5 ff ff       	callq  400b30 <exit@plt>
  4015d0:	48 89 14 24          	mov    %rdx,(%rsp)
  4015d4:	b9 80 4c 60 00       	mov    $0x604c80,%ecx
  4015d9:	8b 15 a1 3e 20 00    	mov    0x203ea1(%rip),%edx        # 605480 <bomb_id>
  4015df:	be ff 2c 40 00       	mov    $0x402cff,%esi
  4015e4:	48 8d bc 24 10 20 00 	lea    0x2010(%rsp),%rdi
  4015eb:	00 
  4015ec:	b8 00 00 00 00       	mov    $0x0,%eax
  4015f1:	e8 ba f5 ff ff       	callq  400bb0 <sprintf@plt>
  4015f6:	4c 8d 4c 24 10       	lea    0x10(%rsp),%r9
  4015fb:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401601:	48 8d 8c 24 10 20 00 	lea    0x2010(%rsp),%rcx
  401608:	00 
  401609:	ba 80 44 60 00       	mov    $0x604480,%edx
  40160e:	be 80 48 60 00       	mov    $0x604880,%esi
  401613:	bf 80 50 60 00       	mov    $0x605080,%edi
  401618:	e8 b2 0f 00 00       	callq  4025cf <driver_post>
  40161d:	c1 e8 1f             	shr    $0x1f,%eax
  401620:	83 fb 02             	cmp    $0x2,%ebx
  401623:	0f 95 c2             	setne  %dl
  401626:	84 c2                	test   %al,%dl
  401628:	74 14                	je     40163e <send_msg+0x101>
  40162a:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  40162f:	e8 dc f4 ff ff       	callq  400b10 <puts@plt>
  401634:	bf 00 00 00 00       	mov    $0x0,%edi
  401639:	e8 f2 f4 ff ff       	callq  400b30 <exit@plt>
  40163e:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  401645:	5b                   	pop    %rbx
  401646:	c3                   	retq   

0000000000401647 <explode_bomb>:
  401647:	48 83 ec 08          	sub    $0x8,%rsp
  40164b:	bf 0f 2d 40 00       	mov    $0x402d0f,%edi
  401650:	e8 bb f4 ff ff       	callq  400b10 <puts@plt>
  401655:	bf 18 2d 40 00       	mov    $0x402d18,%edi
  40165a:	e8 b1 f4 ff ff       	callq  400b10 <puts@plt>
  40165f:	bf 00 00 00 00       	mov    $0x0,%edi
  401664:	e8 d4 fe ff ff       	callq  40153d <send_msg>
  401669:	bf 90 29 40 00       	mov    $0x402990,%edi
  40166e:	e8 9d f4 ff ff       	callq  400b10 <puts@plt>
  401673:	bf 08 00 00 00       	mov    $0x8,%edi
  401678:	e8 b3 f4 ff ff       	callq  400b30 <exit@plt>

000000000040167d <read_six_numbers>:
  40167d:	48 83 ec 18          	sub    $0x18,%rsp
  401681:	48 89 f2             	mov    %rsi,%rdx
  401684:	48 8d 76 28          	lea    0x28(%rsi),%rsi
  401688:	48 8d 42 20          	lea    0x20(%rdx),%rax
  40168c:	48 8d 4a 08          	lea    0x8(%rdx),%rcx
  401690:	48 89 74 24 08       	mov    %rsi,0x8(%rsp)
  401695:	48 89 04 24          	mov    %rax,(%rsp)
  401699:	4c 8d 4a 18          	lea    0x18(%rdx),%r9
  40169d:	4c 8d 42 10          	lea    0x10(%rdx),%r8
  4016a1:	be 2f 2d 40 00       	mov    $0x402d2f,%esi
  4016a6:	b8 00 00 00 00       	mov    $0x0,%eax
  4016ab:	e8 70 f4 ff ff       	callq  400b20 <__isoc99_sscanf@plt>
  4016b0:	83 f8 05             	cmp    $0x5,%eax
  4016b3:	7f 05                	jg     4016ba <read_six_numbers+0x3d>
  4016b5:	e8 8d ff ff ff       	callq  401647 <explode_bomb>
  4016ba:	48 83 c4 18          	add    $0x18,%rsp
  4016be:	c3                   	retq   

00000000004016bf <read_line>:
  4016bf:	53                   	push   %rbx
  4016c0:	48 83 ec 10          	sub    $0x10,%rsp
  4016c4:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%rsp)
  4016cb:	00 
  4016cc:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
  4016d1:	e8 ea fd ff ff       	callq  4014c0 <skip>
  4016d6:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%rsp)
  4016db:	74 14                	je     4016f1 <read_line+0x32>
  4016dd:	bf b8 29 40 00       	mov    $0x4029b8,%edi
  4016e2:	e8 29 f4 ff ff       	callq  400b10 <puts@plt>
  4016e7:	bf 00 00 00 00       	mov    $0x0,%edi
  4016ec:	e8 3f f4 ff ff       	callq  400b30 <exit@plt>
  4016f1:	48 85 c0             	test   %rax,%rax
  4016f4:	0f 85 89 00 00 00    	jne    401783 <read_line+0xc4>
  4016fa:	48 8b 05 7f 40 20 00 	mov    0x20407f(%rip),%rax        # 605780 <stdin@@GLIBC_2.2.5>
  401701:	48 39 05 f8 40 20 00 	cmp    %rax,0x2040f8(%rip)        # 605800 <infile>
  401708:	75 14                	jne    40171e <read_line+0x5f>
  40170a:	bf 47 2d 40 00       	mov    $0x402d47,%edi
  40170f:	e8 fc f3 ff ff       	callq  400b10 <puts@plt>
  401714:	bf 00 00 00 00       	mov    $0x0,%edi
  401719:	e8 12 f4 ff ff       	callq  400b30 <exit@plt>
  40171e:	bf 65 2d 40 00       	mov    $0x402d65,%edi
  401723:	e8 e8 f4 ff ff       	callq  400c10 <getenv@plt>
  401728:	48 85 c0             	test   %rax,%rax
  40172b:	74 0a                	je     401737 <read_line+0x78>
  40172d:	bf 00 00 00 00       	mov    $0x0,%edi
  401732:	e8 f9 f3 ff ff       	callq  400b30 <exit@plt>
  401737:	48 8b 05 42 40 20 00 	mov    0x204042(%rip),%rax        # 605780 <stdin@@GLIBC_2.2.5>
  40173e:	48 89 05 bb 40 20 00 	mov    %rax,0x2040bb(%rip)        # 605800 <infile>
  401745:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
  40174a:	e8 71 fd ff ff       	callq  4014c0 <skip>
  40174f:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%rsp)
  401754:	74 14                	je     40176a <read_line+0xab>
  401756:	bf b8 29 40 00       	mov    $0x4029b8,%edi
  40175b:	e8 b0 f3 ff ff       	callq  400b10 <puts@plt>
  401760:	bf 00 00 00 00       	mov    $0x0,%edi
  401765:	e8 c6 f3 ff ff       	callq  400b30 <exit@plt>
  40176a:	48 85 c0             	test   %rax,%rax
  40176d:	75 14                	jne    401783 <read_line+0xc4>
  40176f:	bf 47 2d 40 00       	mov    $0x402d47,%edi
  401774:	e8 97 f3 ff ff       	callq  400b10 <puts@plt>
  401779:	bf 00 00 00 00       	mov    $0x0,%edi
  40177e:	e8 ad f3 ff ff       	callq  400b30 <exit@plt>
  401783:	48 8b 15 6e 40 20 00 	mov    0x20406e(%rip),%rdx        # 6057f8 <num_input_strings>
  40178a:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  40178e:	48 c1 e0 04          	shl    $0x4,%rax
  401792:	48 8d 98 20 58 60 00 	lea    0x605820(%rax),%rbx
  401799:	48 89 df             	mov    %rbx,%rdi
  40179c:	b8 00 00 00 00       	mov    $0x0,%eax
  4017a1:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4017a8:	f2 ae                	repnz scas %es:(%rdi),%al
  4017aa:	48 f7 d1             	not    %rcx
  4017ad:	48 83 e9 01          	sub    $0x1,%rcx
  4017b1:	48 83 f9 4e          	cmp    $0x4e,%rcx
  4017b5:	76 47                	jbe    4017fe <read_line+0x13f>
  4017b7:	bf 70 2d 40 00       	mov    $0x402d70,%edi
  4017bc:	e8 4f f3 ff ff       	callq  400b10 <puts@plt>
  4017c1:	48 8b 05 30 40 20 00 	mov    0x204030(%rip),%rax        # 6057f8 <num_input_strings>
  4017c8:	48 8d 50 01          	lea    0x1(%rax),%rdx
  4017cc:	48 89 15 25 40 20 00 	mov    %rdx,0x204025(%rip)        # 6057f8 <num_input_strings>
  4017d3:	48 6b c0 50          	imul   $0x50,%rax,%rax
  4017d7:	48 bb 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rbx
  4017de:	75 6e 63 
  4017e1:	48 89 98 20 58 60 00 	mov    %rbx,0x605820(%rax)
  4017e8:	48 bb 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rbx
  4017ef:	2a 2a 00 
  4017f2:	48 89 98 28 58 60 00 	mov    %rbx,0x605828(%rax)
  4017f9:	e8 49 fe ff ff       	callq  401647 <explode_bomb>
  4017fe:	48 8d 34 92          	lea    (%rdx,%rdx,4),%rsi
  401802:	48 c1 e6 04          	shl    $0x4,%rsi
  401806:	80 bc 31 1f 58 60 00 	cmpb   $0xa,0x60581f(%rcx,%rsi,1)
  40180d:	0a 
  40180e:	75 10                	jne    401820 <read_line+0x161>
  401810:	48 8d 34 92          	lea    (%rdx,%rdx,4),%rsi
  401814:	48 c1 e6 04          	shl    $0x4,%rsi
  401818:	c6 84 31 1f 58 60 00 	movb   $0x0,0x60581f(%rcx,%rsi,1)
  40181f:	00 
  401820:	48 83 e9 02          	sub    $0x2,%rcx
  401824:	48 8d 34 92          	lea    (%rdx,%rdx,4),%rsi
  401828:	48 c1 e6 04          	shl    $0x4,%rsi
  40182c:	80 bc 31 20 58 60 00 	cmpb   $0xd,0x605820(%rcx,%rsi,1)
  401833:	0d 
  401834:	75 08                	jne    40183e <read_line+0x17f>
  401836:	c6 84 31 20 58 60 00 	movb   $0x0,0x605820(%rcx,%rsi,1)
  40183d:	00 
  40183e:	48 83 c2 01          	add    $0x1,%rdx
  401842:	48 89 15 af 3f 20 00 	mov    %rdx,0x203faf(%rip)        # 6057f8 <num_input_strings>
  401849:	bf 02 00 00 00       	mov    $0x2,%edi
  40184e:	e8 ea fc ff ff       	callq  40153d <send_msg>
  401853:	48 89 d8             	mov    %rbx,%rax
  401856:	48 83 c4 10          	add    $0x10,%rsp
  40185a:	5b                   	pop    %rbx
  40185b:	c3                   	retq   

000000000040185c <phase_defused>:
  40185c:	48 83 ec 78          	sub    $0x78,%rsp
  401860:	bf 01 00 00 00       	mov    $0x1,%edi
  401865:	e8 d3 fc ff ff       	callq  40153d <send_msg>
  40186a:	48 83 3d 86 3f 20 00 	cmpq   $0x6,0x203f86(%rip)        # 6057f8 <num_input_strings>
  401871:	06 
  401872:	0f 85 83 00 00 00    	jne    4018fb <phase_defused+0x9f>
  401878:	4c 8d 4c 24 08       	lea    0x8(%rsp),%r9
  40187d:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  401882:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  401887:	48 8d 54 24 18       	lea    0x18(%rsp),%rdx
  40188c:	be 8b 2d 40 00       	mov    $0x402d8b,%esi
  401891:	bf 10 59 60 00       	mov    $0x605910,%edi
  401896:	b8 00 00 00 00       	mov    $0x0,%eax
  40189b:	e8 80 f2 ff ff       	callq  400b20 <__isoc99_sscanf@plt>
  4018a0:	83 f8 04             	cmp    $0x4,%eax
  4018a3:	75 42                	jne    4018e7 <phase_defused+0x8b>
  4018a5:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  4018aa:	e8 31 fb ff ff       	callq  4013e0 <string_length>
  4018af:	48 3b 44 24 08       	cmp    0x8(%rsp),%rax
  4018b4:	75 31                	jne    4018e7 <phase_defused+0x8b>
  4018b6:	be c0 43 60 00       	mov    $0x6043c0,%esi
  4018bb:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
  4018c0:	e8 31 fb ff ff       	callq  4013f6 <strings_not_equal>
  4018c5:	84 c0                	test   %al,%al
  4018c7:	75 1e                	jne    4018e7 <phase_defused+0x8b>
  4018c9:	bf f0 29 40 00       	mov    $0x4029f0,%edi
  4018ce:	e8 3d f2 ff ff       	callq  400b10 <puts@plt>
  4018d3:	bf 18 2a 40 00       	mov    $0x402a18,%edi
  4018d8:	e8 33 f2 ff ff       	callq  400b10 <puts@plt>
  4018dd:	b8 00 00 00 00       	mov    $0x0,%eax
  4018e2:	e8 ca f9 ff ff       	callq  4012b1 <secret_phase>
  4018e7:	bf 50 2a 40 00       	mov    $0x402a50,%edi
  4018ec:	e8 1f f2 ff ff       	callq  400b10 <puts@plt>
  4018f1:	bf 80 2a 40 00       	mov    $0x402a80,%edi
  4018f6:	e8 15 f2 ff ff       	callq  400b10 <puts@plt>
  4018fb:	48 83 c4 78          	add    $0x78,%rsp
  4018ff:	c3                   	retq   

0000000000401900 <checkhash>:
  401900:	b8 01 00 00 00       	mov    $0x1,%eax
  401905:	c3                   	retq   

0000000000401906 <initialize_bomb>:
  401906:	53                   	push   %rbx
  401907:	48 81 ec 40 20 00 00 	sub    $0x2040,%rsp
  40190e:	be 74 13 40 00       	mov    $0x401374,%esi
  401913:	bf 02 00 00 00       	mov    $0x2,%edi
  401918:	e8 d3 f2 ff ff       	callq  400bf0 <signal@plt>
  40191d:	bf 20 44 60 00       	mov    $0x604420,%edi
  401922:	e8 17 fb ff ff       	callq  40143e <fs>
  401927:	bf c0 43 60 00       	mov    $0x6043c0,%edi
  40192c:	e8 0d fb ff ff       	callq  40143e <fs>
  401931:	bf a0 57 60 00       	mov    $0x6057a0,%edi
  401936:	e8 03 fb ff ff       	callq  40143e <fs>
  40193b:	e8 c0 ff ff ff       	callq  401900 <checkhash>
  401940:	85 c0                	test   %eax,%eax
  401942:	75 14                	jne    401958 <initialize_bomb+0x52>
  401944:	bf c8 2a 40 00       	mov    $0x402ac8,%edi
  401949:	e8 c2 f1 ff ff       	callq  400b10 <puts@plt>
  40194e:	bf 08 00 00 00       	mov    $0x8,%edi
  401953:	e8 d8 f1 ff ff       	callq  400b30 <exit@plt>
  401958:	be 40 00 00 00       	mov    $0x40,%esi
  40195d:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  401964:	00 
  401965:	e8 76 f2 ff ff       	callq  400be0 <gethostname@plt>
  40196a:	85 c0                	test   %eax,%eax
  40196c:	74 2a                	je     401998 <initialize_bomb+0x92>
  40196e:	bf 78 2b 40 00       	mov    $0x402b78,%edi
  401973:	e8 98 f1 ff ff       	callq  400b10 <puts@plt>
  401978:	bf 08 00 00 00       	mov    $0x8,%edi
  40197d:	e8 ae f1 ff ff       	callq  400b30 <exit@plt>
  401982:	48 8d b4 24 00 20 00 	lea    0x2000(%rsp),%rsi
  401989:	00 
  40198a:	e8 b1 f1 ff ff       	callq  400b40 <strcasecmp@plt>
  40198f:	85 c0                	test   %eax,%eax
  401991:	74 21                	je     4019b4 <initialize_bomb+0xae>
  401993:	83 c3 01             	add    $0x1,%ebx
  401996:	eb 05                	jmp    40199d <initialize_bomb+0x97>
  401998:	bb 00 00 00 00       	mov    $0x0,%ebx
  40199d:	48 63 c3             	movslq %ebx,%rax
  4019a0:	48 8b 3c c5 e0 54 60 	mov    0x6054e0(,%rax,8),%rdi
  4019a7:	00 
  4019a8:	48 85 ff             	test   %rdi,%rdi
  4019ab:	75 d5                	jne    401982 <initialize_bomb+0x7c>
  4019ad:	b8 00 00 00 00       	mov    $0x0,%eax
  4019b2:	eb 05                	jmp    4019b9 <initialize_bomb+0xb3>
  4019b4:	b8 01 00 00 00       	mov    $0x1,%eax
  4019b9:	85 c0                	test   %eax,%eax
  4019bb:	75 14                	jne    4019d1 <initialize_bomb+0xcb>
  4019bd:	bf b0 2b 40 00       	mov    $0x402bb0,%edi
  4019c2:	e8 49 f1 ff ff       	callq  400b10 <puts@plt>
  4019c7:	bf 08 00 00 00       	mov    $0x8,%edi
  4019cc:	e8 5f f1 ff ff       	callq  400b30 <exit@plt>
  4019d1:	48 89 e7             	mov    %rsp,%rdi
  4019d4:	e8 2d 0a 00 00       	callq  402406 <init_driver>
  4019d9:	85 c0                	test   %eax,%eax
  4019db:	79 1c                	jns    4019f9 <initialize_bomb+0xf3>
  4019dd:	48 89 e6             	mov    %rsp,%rsi
  4019e0:	bf 9a 2d 40 00       	mov    $0x402d9a,%edi
  4019e5:	b8 00 00 00 00       	mov    $0x0,%eax
  4019ea:	e8 e1 f0 ff ff       	callq  400ad0 <printf@plt>
  4019ef:	bf 08 00 00 00       	mov    $0x8,%edi
  4019f4:	e8 37 f1 ff ff       	callq  400b30 <exit@plt>
  4019f9:	48 81 c4 40 20 00 00 	add    $0x2040,%rsp
  401a00:	5b                   	pop    %rbx
  401a01:	c3                   	retq   
  401a02:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  401a09:	00 00 00 
  401a0c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401a10 <rio_readinitb>:
  401a10:	89 37                	mov    %esi,(%rdi)
  401a12:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  401a19:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401a1d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  401a21:	c3                   	retq   

0000000000401a22 <sigalrm_handler>:
  401a22:	48 83 ec 08          	sub    $0x8,%rsp
  401a26:	48 8b 15 33 3d 20 00 	mov    0x203d33(%rip),%rdx        # 605760 <sm_length>
  401a2d:	be b0 2f 40 00       	mov    $0x402fb0,%esi
  401a32:	bf 02 00 00 00       	mov    $0x2,%edi
  401a37:	e8 14 f2 ff ff       	callq  400c50 <write@plt>
  401a3c:	bf 01 00 00 00       	mov    $0x1,%edi
  401a41:	e8 ea f0 ff ff       	callq  400b30 <exit@plt>

0000000000401a46 <urlencode>:
  401a46:	41 54                	push   %r12
  401a48:	55                   	push   %rbp
  401a49:	53                   	push   %rbx
  401a4a:	48 83 ec 10          	sub    $0x10,%rsp
  401a4e:	48 89 fb             	mov    %rdi,%rbx
  401a51:	48 89 f5             	mov    %rsi,%rbp
  401a54:	b8 00 00 00 00       	mov    $0x0,%eax
  401a59:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401a60:	f2 ae                	repnz scas %es:(%rdi),%al
  401a62:	48 f7 d1             	not    %rcx
  401a65:	8d 41 ff             	lea    -0x1(%rcx),%eax
  401a68:	e9 93 00 00 00       	jmpq   401b00 <urlencode+0xba>
  401a6d:	0f b6 13             	movzbl (%rbx),%edx
  401a70:	80 fa 2a             	cmp    $0x2a,%dl
  401a73:	0f 94 c1             	sete   %cl
  401a76:	80 fa 2d             	cmp    $0x2d,%dl
  401a79:	0f 94 c0             	sete   %al
  401a7c:	08 c1                	or     %al,%cl
  401a7e:	75 1f                	jne    401a9f <urlencode+0x59>
  401a80:	80 fa 2e             	cmp    $0x2e,%dl
  401a83:	74 1a                	je     401a9f <urlencode+0x59>
  401a85:	80 fa 5f             	cmp    $0x5f,%dl
  401a88:	74 15                	je     401a9f <urlencode+0x59>
  401a8a:	8d 42 d0             	lea    -0x30(%rdx),%eax
  401a8d:	3c 09                	cmp    $0x9,%al
  401a8f:	76 0e                	jbe    401a9f <urlencode+0x59>
  401a91:	8d 42 bf             	lea    -0x41(%rdx),%eax
  401a94:	3c 19                	cmp    $0x19,%al
  401a96:	76 07                	jbe    401a9f <urlencode+0x59>
  401a98:	8d 42 9f             	lea    -0x61(%rdx),%eax
  401a9b:	3c 19                	cmp    $0x19,%al
  401a9d:	77 09                	ja     401aa8 <urlencode+0x62>
  401a9f:	88 55 00             	mov    %dl,0x0(%rbp)
  401aa2:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  401aa6:	eb 51                	jmp    401af9 <urlencode+0xb3>
  401aa8:	80 fa 20             	cmp    $0x20,%dl
  401aab:	75 0a                	jne    401ab7 <urlencode+0x71>
  401aad:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  401ab1:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  401ab5:	eb 42                	jmp    401af9 <urlencode+0xb3>
  401ab7:	8d 42 e0             	lea    -0x20(%rdx),%eax
  401aba:	3c 5f                	cmp    $0x5f,%al
  401abc:	0f 96 c1             	setbe  %cl
  401abf:	80 fa 09             	cmp    $0x9,%dl
  401ac2:	0f 94 c0             	sete   %al
  401ac5:	08 c1                	or     %al,%cl
  401ac7:	74 45                	je     401b0e <urlencode+0xc8>
  401ac9:	0f b6 d2             	movzbl %dl,%edx
  401acc:	be c3 2f 40 00       	mov    $0x402fc3,%esi
  401ad1:	48 89 e7             	mov    %rsp,%rdi
  401ad4:	b8 00 00 00 00       	mov    $0x0,%eax
  401ad9:	e8 d2 f0 ff ff       	callq  400bb0 <sprintf@plt>
  401ade:	0f b6 04 24          	movzbl (%rsp),%eax
  401ae2:	88 45 00             	mov    %al,0x0(%rbp)
  401ae5:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  401aea:	88 45 01             	mov    %al,0x1(%rbp)
  401aed:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  401af2:	88 45 02             	mov    %al,0x2(%rbp)
  401af5:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  401af9:	48 83 c3 01          	add    $0x1,%rbx
  401afd:	44 89 e0             	mov    %r12d,%eax
  401b00:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  401b04:	85 c0                	test   %eax,%eax
  401b06:	0f 85 61 ff ff ff    	jne    401a6d <urlencode+0x27>
  401b0c:	eb 05                	jmp    401b13 <urlencode+0xcd>
  401b0e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b13:	48 83 c4 10          	add    $0x10,%rsp
  401b17:	5b                   	pop    %rbx
  401b18:	5d                   	pop    %rbp
  401b19:	41 5c                	pop    %r12
  401b1b:	c3                   	retq   

0000000000401b1c <rio_writen>:
  401b1c:	41 55                	push   %r13
  401b1e:	41 54                	push   %r12
  401b20:	55                   	push   %rbp
  401b21:	53                   	push   %rbx
  401b22:	48 83 ec 08          	sub    $0x8,%rsp
  401b26:	41 89 fc             	mov    %edi,%r12d
  401b29:	48 89 f5             	mov    %rsi,%rbp
  401b2c:	49 89 d5             	mov    %rdx,%r13
  401b2f:	48 89 d3             	mov    %rdx,%rbx
  401b32:	eb 29                	jmp    401b5d <rio_writen+0x41>
  401b34:	48 89 da             	mov    %rbx,%rdx
  401b37:	48 89 ee             	mov    %rbp,%rsi
  401b3a:	44 89 e7             	mov    %r12d,%edi
  401b3d:	e8 0e f1 ff ff       	callq  400c50 <write@plt>
  401b42:	48 85 c0             	test   %rax,%rax
  401b45:	7f 10                	jg     401b57 <rio_writen+0x3b>
  401b47:	e8 e4 f0 ff ff       	callq  400c30 <__errno_location@plt>
  401b4c:	83 38 04             	cmpl   $0x4,(%rax)
  401b4f:	90                   	nop
  401b50:	75 15                	jne    401b67 <rio_writen+0x4b>
  401b52:	b8 00 00 00 00       	mov    $0x0,%eax
  401b57:	48 29 c3             	sub    %rax,%rbx
  401b5a:	48 01 c5             	add    %rax,%rbp
  401b5d:	48 85 db             	test   %rbx,%rbx
  401b60:	75 d2                	jne    401b34 <rio_writen+0x18>
  401b62:	4c 89 e8             	mov    %r13,%rax
  401b65:	eb 07                	jmp    401b6e <rio_writen+0x52>
  401b67:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401b6e:	48 83 c4 08          	add    $0x8,%rsp
  401b72:	5b                   	pop    %rbx
  401b73:	5d                   	pop    %rbp
  401b74:	41 5c                	pop    %r12
  401b76:	41 5d                	pop    %r13
  401b78:	c3                   	retq   

0000000000401b79 <rio_read>:
  401b79:	41 56                	push   %r14
  401b7b:	41 55                	push   %r13
  401b7d:	41 54                	push   %r12
  401b7f:	55                   	push   %rbp
  401b80:	53                   	push   %rbx
  401b81:	48 89 fb             	mov    %rdi,%rbx
  401b84:	49 89 f6             	mov    %rsi,%r14
  401b87:	49 89 d5             	mov    %rdx,%r13
  401b8a:	4c 8d 67 10          	lea    0x10(%rdi),%r12
  401b8e:	eb 2a                	jmp    401bba <rio_read+0x41>
  401b90:	ba 00 20 00 00       	mov    $0x2000,%edx
  401b95:	4c 89 e6             	mov    %r12,%rsi
  401b98:	8b 3b                	mov    (%rbx),%edi
  401b9a:	e8 b1 ef ff ff       	callq  400b50 <read@plt>
  401b9f:	89 43 04             	mov    %eax,0x4(%rbx)
  401ba2:	85 c0                	test   %eax,%eax
  401ba4:	79 0c                	jns    401bb2 <rio_read+0x39>
  401ba6:	e8 85 f0 ff ff       	callq  400c30 <__errno_location@plt>
  401bab:	83 38 04             	cmpl   $0x4,(%rax)
  401bae:	74 0a                	je     401bba <rio_read+0x41>
  401bb0:	eb 37                	jmp    401be9 <rio_read+0x70>
  401bb2:	85 c0                	test   %eax,%eax
  401bb4:	74 3c                	je     401bf2 <rio_read+0x79>
  401bb6:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  401bba:	8b 6b 04             	mov    0x4(%rbx),%ebp
  401bbd:	85 ed                	test   %ebp,%ebp
  401bbf:	7e cf                	jle    401b90 <rio_read+0x17>
  401bc1:	89 e8                	mov    %ebp,%eax
  401bc3:	4c 39 e8             	cmp    %r13,%rax
  401bc6:	72 03                	jb     401bcb <rio_read+0x52>
  401bc8:	44 89 ed             	mov    %r13d,%ebp
  401bcb:	4c 63 e5             	movslq %ebp,%r12
  401bce:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  401bd2:	4c 89 e2             	mov    %r12,%rdx
  401bd5:	4c 89 f7             	mov    %r14,%rdi
  401bd8:	e8 83 f0 ff ff       	callq  400c60 <memcpy@plt>
  401bdd:	4c 01 63 08          	add    %r12,0x8(%rbx)
  401be1:	29 6b 04             	sub    %ebp,0x4(%rbx)
  401be4:	4c 89 e0             	mov    %r12,%rax
  401be7:	eb 0e                	jmp    401bf7 <rio_read+0x7e>
  401be9:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401bf0:	eb 05                	jmp    401bf7 <rio_read+0x7e>
  401bf2:	b8 00 00 00 00       	mov    $0x0,%eax
  401bf7:	5b                   	pop    %rbx
  401bf8:	5d                   	pop    %rbp
  401bf9:	41 5c                	pop    %r12
  401bfb:	41 5d                	pop    %r13
  401bfd:	41 5e                	pop    %r14
  401bff:	c3                   	retq   

0000000000401c00 <rio_readlineb>:
  401c00:	41 55                	push   %r13
  401c02:	41 54                	push   %r12
  401c04:	55                   	push   %rbp
  401c05:	53                   	push   %rbx
  401c06:	48 83 ec 18          	sub    $0x18,%rsp
  401c0a:	49 89 fd             	mov    %rdi,%r13
  401c0d:	48 89 f5             	mov    %rsi,%rbp
  401c10:	49 89 d4             	mov    %rdx,%r12
  401c13:	bb 01 00 00 00       	mov    $0x1,%ebx
  401c18:	eb 41                	jmp    401c5b <rio_readlineb+0x5b>
  401c1a:	ba 01 00 00 00       	mov    $0x1,%edx
  401c1f:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  401c24:	4c 89 ef             	mov    %r13,%rdi
  401c27:	e8 4d ff ff ff       	callq  401b79 <rio_read>
  401c2c:	83 f8 01             	cmp    $0x1,%eax
  401c2f:	75 12                	jne    401c43 <rio_readlineb+0x43>
  401c31:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  401c35:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  401c3a:	88 45 00             	mov    %al,0x0(%rbp)
  401c3d:	3c 0a                	cmp    $0xa,%al
  401c3f:	75 13                	jne    401c54 <rio_readlineb+0x54>
  401c41:	eb 1f                	jmp    401c62 <rio_readlineb+0x62>
  401c43:	85 c0                	test   %eax,%eax
  401c45:	75 27                	jne    401c6e <rio_readlineb+0x6e>
  401c47:	48 83 fb 01          	cmp    $0x1,%rbx
  401c4b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401c50:	75 13                	jne    401c65 <rio_readlineb+0x65>
  401c52:	eb 23                	jmp    401c77 <rio_readlineb+0x77>
  401c54:	48 83 c3 01          	add    $0x1,%rbx
  401c58:	48 89 d5             	mov    %rdx,%rbp
  401c5b:	4c 39 e3             	cmp    %r12,%rbx
  401c5e:	72 ba                	jb     401c1a <rio_readlineb+0x1a>
  401c60:	eb 03                	jmp    401c65 <rio_readlineb+0x65>
  401c62:	48 89 d5             	mov    %rdx,%rbp
  401c65:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  401c69:	48 89 d8             	mov    %rbx,%rax
  401c6c:	eb 0e                	jmp    401c7c <rio_readlineb+0x7c>
  401c6e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401c75:	eb 05                	jmp    401c7c <rio_readlineb+0x7c>
  401c77:	b8 00 00 00 00       	mov    $0x0,%eax
  401c7c:	48 83 c4 18          	add    $0x18,%rsp
  401c80:	5b                   	pop    %rbx
  401c81:	5d                   	pop    %rbp
  401c82:	41 5c                	pop    %r12
  401c84:	41 5d                	pop    %r13
  401c86:	c3                   	retq   

0000000000401c87 <submitr>:
  401c87:	41 57                	push   %r15
  401c89:	41 56                	push   %r14
  401c8b:	41 55                	push   %r13
  401c8d:	41 54                	push   %r12
  401c8f:	55                   	push   %rbp
  401c90:	53                   	push   %rbx
  401c91:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  401c98:	49 89 fc             	mov    %rdi,%r12
  401c9b:	89 74 24 1c          	mov    %esi,0x1c(%rsp)
  401c9f:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  401ca4:	49 89 cf             	mov    %rcx,%r15
  401ca7:	4d 89 c6             	mov    %r8,%r14
  401caa:	4d 89 cd             	mov    %r9,%r13
  401cad:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  401cb4:	00 
  401cb5:	c7 84 24 2c 20 00 00 	movl   $0x0,0x202c(%rsp)
  401cbc:	00 00 00 00 
  401cc0:	ba 00 00 00 00       	mov    $0x0,%edx
  401cc5:	be 01 00 00 00       	mov    $0x1,%esi
  401cca:	bf 02 00 00 00       	mov    $0x2,%edi
  401ccf:	e8 2c ef ff ff       	callq  400c00 <socket@plt>
  401cd4:	89 c5                	mov    %eax,%ebp
  401cd6:	85 c0                	test   %eax,%eax
  401cd8:	79 4e                	jns    401d28 <submitr+0xa1>
  401cda:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401ce1:	3a 20 43 
  401ce4:	48 89 03             	mov    %rax,(%rbx)
  401ce7:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401cee:	20 75 6e 
  401cf1:	48 89 43 08          	mov    %rax,0x8(%rbx)
  401cf5:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401cfc:	74 6f 20 
  401cff:	48 89 43 10          	mov    %rax,0x10(%rbx)
  401d03:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  401d0a:	65 20 73 
  401d0d:	48 89 43 18          	mov    %rax,0x18(%rbx)
  401d11:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  401d18:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  401d1e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401d23:	e9 83 06 00 00       	jmpq   4023ab <submitr+0x724>
  401d28:	4c 89 e7             	mov    %r12,%rdi
  401d2b:	e8 c0 ed ff ff       	callq  400af0 <gethostbyname@plt>
  401d30:	48 85 c0             	test   %rax,%rax
  401d33:	75 75                	jne    401daa <submitr+0x123>
  401d35:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  401d3c:	3a 20 44 
  401d3f:	48 89 03             	mov    %rax,(%rbx)
  401d42:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  401d49:	20 75 6e 
  401d4c:	48 89 43 08          	mov    %rax,0x8(%rbx)
  401d50:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401d57:	74 6f 20 
  401d5a:	48 89 43 10          	mov    %rax,0x10(%rbx)
  401d5e:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  401d65:	76 65 20 
  401d68:	48 89 43 18          	mov    %rax,0x18(%rbx)
  401d6c:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  401d73:	61 62 20 
  401d76:	48 89 43 20          	mov    %rax,0x20(%rbx)
  401d7a:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  401d81:	72 20 61 
  401d84:	48 89 43 28          	mov    %rax,0x28(%rbx)
  401d88:	c7 43 30 64 64 72 65 	movl   $0x65726464,0x30(%rbx)
  401d8f:	66 c7 43 34 73 73    	movw   $0x7373,0x34(%rbx)
  401d95:	c6 43 36 00          	movb   $0x0,0x36(%rbx)
  401d99:	89 ef                	mov    %ebp,%edi
  401d9b:	e8 40 ed ff ff       	callq  400ae0 <close@plt>
  401da0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401da5:	e9 01 06 00 00       	jmpq   4023ab <submitr+0x724>
  401daa:	48 c7 84 24 40 a0 00 	movq   $0x0,0xa040(%rsp)
  401db1:	00 00 00 00 00 
  401db6:	48 c7 84 24 48 a0 00 	movq   $0x0,0xa048(%rsp)
  401dbd:	00 00 00 00 00 
  401dc2:	66 c7 84 24 40 a0 00 	movw   $0x2,0xa040(%rsp)
  401dc9:	00 02 00 
  401dcc:	48 8b 48 18          	mov    0x18(%rax),%rcx
  401dd0:	48 63 50 14          	movslq 0x14(%rax),%rdx
  401dd4:	48 8d b4 24 44 a0 00 	lea    0xa044(%rsp),%rsi
  401ddb:	00 
  401ddc:	48 8b 39             	mov    (%rcx),%rdi
  401ddf:	e8 ac ed ff ff       	callq  400b90 <bcopy@plt>
  401de4:	0f b7 44 24 1c       	movzwl 0x1c(%rsp),%eax
  401de9:	66 c1 c8 08          	ror    $0x8,%ax
  401ded:	66 89 84 24 42 a0 00 	mov    %ax,0xa042(%rsp)
  401df4:	00 
  401df5:	ba 10 00 00 00       	mov    $0x10,%edx
  401dfa:	48 8d b4 24 40 a0 00 	lea    0xa040(%rsp),%rsi
  401e01:	00 
  401e02:	89 ef                	mov    %ebp,%edi
  401e04:	e8 c7 ed ff ff       	callq  400bd0 <connect@plt>
  401e09:	85 c0                	test   %eax,%eax
  401e0b:	79 67                	jns    401e74 <submitr+0x1ed>
  401e0d:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  401e14:	3a 20 55 
  401e17:	48 89 03             	mov    %rax,(%rbx)
  401e1a:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  401e21:	20 74 6f 
  401e24:	48 89 43 08          	mov    %rax,0x8(%rbx)
  401e28:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  401e2f:	65 63 74 
  401e32:	48 89 43 10          	mov    %rax,0x10(%rbx)
  401e36:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  401e3d:	68 65 20 
  401e40:	48 89 43 18          	mov    %rax,0x18(%rbx)
  401e44:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  401e4b:	61 62 20 
  401e4e:	48 89 43 20          	mov    %rax,0x20(%rbx)
  401e52:	c7 43 28 73 65 72 76 	movl   $0x76726573,0x28(%rbx)
  401e59:	66 c7 43 2c 65 72    	movw   $0x7265,0x2c(%rbx)
  401e5f:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  401e63:	89 ef                	mov    %ebp,%edi
  401e65:	e8 76 ec ff ff       	callq  400ae0 <close@plt>
  401e6a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401e6f:	e9 37 05 00 00       	jmpq   4023ab <submitr+0x724>
  401e74:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401e7b:	4c 89 ef             	mov    %r13,%rdi
  401e7e:	b8 00 00 00 00       	mov    $0x0,%eax
  401e83:	48 89 d1             	mov    %rdx,%rcx
  401e86:	f2 ae                	repnz scas %es:(%rdi),%al
  401e88:	48 f7 d1             	not    %rcx
  401e8b:	48 89 ce             	mov    %rcx,%rsi
  401e8e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  401e93:	48 89 d1             	mov    %rdx,%rcx
  401e96:	f2 ae                	repnz scas %es:(%rdi),%al
  401e98:	48 f7 d1             	not    %rcx
  401e9b:	49 89 c8             	mov    %rcx,%r8
  401e9e:	4c 89 ff             	mov    %r15,%rdi
  401ea1:	48 89 d1             	mov    %rdx,%rcx
  401ea4:	f2 ae                	repnz scas %es:(%rdi),%al
  401ea6:	49 29 c8             	sub    %rcx,%r8
  401ea9:	4c 89 f7             	mov    %r14,%rdi
  401eac:	48 89 d1             	mov    %rdx,%rcx
  401eaf:	f2 ae                	repnz scas %es:(%rdi),%al
  401eb1:	49 29 c8             	sub    %rcx,%r8
  401eb4:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  401eb9:	49 8d 44 00 7b       	lea    0x7b(%r8,%rax,1),%rax
  401ebe:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  401ec4:	76 72                	jbe    401f38 <submitr+0x2b1>
  401ec6:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  401ecd:	3a 20 52 
  401ed0:	48 89 03             	mov    %rax,(%rbx)
  401ed3:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  401eda:	20 73 74 
  401edd:	48 89 43 08          	mov    %rax,0x8(%rbx)
  401ee1:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  401ee8:	74 6f 6f 
  401eeb:	48 89 43 10          	mov    %rax,0x10(%rbx)
  401eef:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  401ef6:	65 2e 20 
  401ef9:	48 89 43 18          	mov    %rax,0x18(%rbx)
  401efd:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  401f04:	61 73 65 
  401f07:	48 89 43 20          	mov    %rax,0x20(%rbx)
  401f0b:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  401f12:	49 54 52 
  401f15:	48 89 43 28          	mov    %rax,0x28(%rbx)
  401f19:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  401f20:	55 46 00 
  401f23:	48 89 43 30          	mov    %rax,0x30(%rbx)
  401f27:	89 ef                	mov    %ebp,%edi
  401f29:	e8 b2 eb ff ff       	callq  400ae0 <close@plt>
  401f2e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f33:	e9 73 04 00 00       	jmpq   4023ab <submitr+0x724>
  401f38:	48 8d b4 24 30 40 00 	lea    0x4030(%rsp),%rsi
  401f3f:	00 
  401f40:	b9 00 04 00 00       	mov    $0x400,%ecx
  401f45:	b8 00 00 00 00       	mov    $0x0,%eax
  401f4a:	48 89 f7             	mov    %rsi,%rdi
  401f4d:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401f50:	4c 89 ef             	mov    %r13,%rdi
  401f53:	e8 ee fa ff ff       	callq  401a46 <urlencode>
  401f58:	85 c0                	test   %eax,%eax
  401f5a:	0f 89 8a 00 00 00    	jns    401fea <submitr+0x363>
  401f60:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  401f67:	3a 20 52 
  401f6a:	48 89 03             	mov    %rax,(%rbx)
  401f6d:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  401f74:	20 73 74 
  401f77:	48 89 43 08          	mov    %rax,0x8(%rbx)
  401f7b:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  401f82:	63 6f 6e 
  401f85:	48 89 43 10          	mov    %rax,0x10(%rbx)
  401f89:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  401f90:	20 61 6e 
  401f93:	48 89 43 18          	mov    %rax,0x18(%rbx)
  401f97:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  401f9e:	67 61 6c 
  401fa1:	48 89 43 20          	mov    %rax,0x20(%rbx)
  401fa5:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  401fac:	6e 70 72 
  401faf:	48 89 43 28          	mov    %rax,0x28(%rbx)
  401fb3:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  401fba:	6c 65 20 
  401fbd:	48 89 43 30          	mov    %rax,0x30(%rbx)
  401fc1:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  401fc8:	63 74 65 
  401fcb:	48 89 43 38          	mov    %rax,0x38(%rbx)
  401fcf:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  401fd5:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  401fd9:	89 ef                	mov    %ebp,%edi
  401fdb:	e8 00 eb ff ff       	callq  400ae0 <close@plt>
  401fe0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401fe5:	e9 c1 03 00 00       	jmpq   4023ab <submitr+0x724>
  401fea:	4c 89 24 24          	mov    %r12,(%rsp)
  401fee:	4c 8d 8c 24 30 40 00 	lea    0x4030(%rsp),%r9
  401ff5:	00 
  401ff6:	4d 89 f8             	mov    %r15,%r8
  401ff9:	4c 89 f1             	mov    %r14,%rcx
  401ffc:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  402001:	be 10 30 40 00       	mov    $0x403010,%esi
  402006:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  40200d:	00 
  40200e:	b8 00 00 00 00       	mov    $0x0,%eax
  402013:	e8 98 eb ff ff       	callq  400bb0 <sprintf@plt>
  402018:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  40201f:	00 
  402020:	b8 00 00 00 00       	mov    $0x0,%eax
  402025:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40202c:	f2 ae                	repnz scas %es:(%rdi),%al
  40202e:	48 f7 d1             	not    %rcx
  402031:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  402035:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  40203c:	00 
  40203d:	89 ef                	mov    %ebp,%edi
  40203f:	e8 d8 fa ff ff       	callq  401b1c <rio_writen>
  402044:	48 85 c0             	test   %rax,%rax
  402047:	79 6b                	jns    4020b4 <submitr+0x42d>
  402049:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402050:	3a 20 43 
  402053:	48 89 03             	mov    %rax,(%rbx)
  402056:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40205d:	20 75 6e 
  402060:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402064:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40206b:	74 6f 20 
  40206e:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402072:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  402079:	20 74 6f 
  40207c:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402080:	48 b8 20 74 68 65 20 	movabs $0x7475412065687420,%rax
  402087:	41 75 74 
  40208a:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40208e:	48 b8 6f 6c 61 62 20 	movabs $0x7265732062616c6f,%rax
  402095:	73 65 72 
  402098:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40209c:	c7 43 30 76 65 72 00 	movl   $0x726576,0x30(%rbx)
  4020a3:	89 ef                	mov    %ebp,%edi
  4020a5:	e8 36 ea ff ff       	callq  400ae0 <close@plt>
  4020aa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4020af:	e9 f7 02 00 00       	jmpq   4023ab <submitr+0x724>
  4020b4:	89 ee                	mov    %ebp,%esi
  4020b6:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  4020bd:	00 
  4020be:	e8 4d f9 ff ff       	callq  401a10 <rio_readinitb>
  4020c3:	ba 00 20 00 00       	mov    $0x2000,%edx
  4020c8:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  4020cf:	00 
  4020d0:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  4020d7:	00 
  4020d8:	e8 23 fb ff ff       	callq  401c00 <rio_readlineb>
  4020dd:	48 85 c0             	test   %rax,%rax
  4020e0:	7f 7f                	jg     402161 <submitr+0x4da>
  4020e2:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4020e9:	3a 20 43 
  4020ec:	48 89 03             	mov    %rax,(%rbx)
  4020ef:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4020f6:	20 75 6e 
  4020f9:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4020fd:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402104:	74 6f 20 
  402107:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40210b:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  402112:	66 69 72 
  402115:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402119:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402120:	61 64 65 
  402123:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402127:	48 b8 72 20 66 72 6f 	movabs $0x41206d6f72662072,%rax
  40212e:	6d 20 41 
  402131:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402135:	48 b8 75 74 6f 6c 61 	movabs $0x732062616c6f7475,%rax
  40213c:	62 20 73 
  40213f:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402143:	c7 43 38 65 72 76 65 	movl   $0x65767265,0x38(%rbx)
  40214a:	66 c7 43 3c 72 00    	movw   $0x72,0x3c(%rbx)
  402150:	89 ef                	mov    %ebp,%edi
  402152:	e8 89 e9 ff ff       	callq  400ae0 <close@plt>
  402157:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40215c:	e9 4a 02 00 00       	jmpq   4023ab <submitr+0x724>
  402161:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  402166:	48 8d 8c 24 2c 20 00 	lea    0x202c(%rsp),%rcx
  40216d:	00 
  40216e:	48 8d 94 24 30 20 00 	lea    0x2030(%rsp),%rdx
  402175:	00 
  402176:	be ca 2f 40 00       	mov    $0x402fca,%esi
  40217b:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  402182:	00 
  402183:	b8 00 00 00 00       	mov    $0x0,%eax
  402188:	e8 93 e9 ff ff       	callq  400b20 <__isoc99_sscanf@plt>
  40218d:	e9 95 00 00 00       	jmpq   402227 <submitr+0x5a0>
  402192:	ba 00 20 00 00       	mov    $0x2000,%edx
  402197:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  40219e:	00 
  40219f:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  4021a6:	00 
  4021a7:	e8 54 fa ff ff       	callq  401c00 <rio_readlineb>
  4021ac:	48 85 c0             	test   %rax,%rax
  4021af:	7f 76                	jg     402227 <submitr+0x5a0>
  4021b1:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4021b8:	3a 20 43 
  4021bb:	48 89 03             	mov    %rax,(%rbx)
  4021be:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4021c5:	20 75 6e 
  4021c8:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4021cc:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4021d3:	74 6f 20 
  4021d6:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4021da:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  4021e1:	68 65 61 
  4021e4:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4021e8:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  4021ef:	66 72 6f 
  4021f2:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4021f6:	48 b8 6d 20 41 75 74 	movabs $0x616c6f747541206d,%rax
  4021fd:	6f 6c 61 
  402200:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402204:	48 b8 62 20 73 65 72 	movabs $0x7265767265732062,%rax
  40220b:	76 65 72 
  40220e:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402212:	c6 43 38 00          	movb   $0x0,0x38(%rbx)
  402216:	89 ef                	mov    %ebp,%edi
  402218:	e8 c3 e8 ff ff       	callq  400ae0 <close@plt>
  40221d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402222:	e9 84 01 00 00       	jmpq   4023ab <submitr+0x724>
  402227:	0f b6 84 24 30 60 00 	movzbl 0x6030(%rsp),%eax
  40222e:	00 
  40222f:	83 e8 0d             	sub    $0xd,%eax
  402232:	75 15                	jne    402249 <submitr+0x5c2>
  402234:	0f b6 84 24 31 60 00 	movzbl 0x6031(%rsp),%eax
  40223b:	00 
  40223c:	83 e8 0a             	sub    $0xa,%eax
  40223f:	75 08                	jne    402249 <submitr+0x5c2>
  402241:	0f b6 84 24 32 60 00 	movzbl 0x6032(%rsp),%eax
  402248:	00 
  402249:	85 c0                	test   %eax,%eax
  40224b:	0f 85 41 ff ff ff    	jne    402192 <submitr+0x50b>
  402251:	ba 00 20 00 00       	mov    $0x2000,%edx
  402256:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  40225d:	00 
  40225e:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  402265:	00 
  402266:	e8 95 f9 ff ff       	callq  401c00 <rio_readlineb>
  40226b:	48 85 c0             	test   %rax,%rax
  40226e:	0f 8f 80 00 00 00    	jg     4022f4 <submitr+0x66d>
  402274:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40227b:	3a 20 43 
  40227e:	48 89 03             	mov    %rax,(%rbx)
  402281:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402288:	20 75 6e 
  40228b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40228f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402296:	74 6f 20 
  402299:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40229d:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  4022a4:	73 74 61 
  4022a7:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4022ab:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  4022b2:	65 73 73 
  4022b5:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4022b9:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  4022c0:	72 6f 6d 
  4022c3:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4022c7:	48 b8 20 41 75 74 6f 	movabs $0x62616c6f74754120,%rax
  4022ce:	6c 61 62 
  4022d1:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4022d5:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
  4022dc:	65 72 00 
  4022df:	48 89 43 38          	mov    %rax,0x38(%rbx)
  4022e3:	89 ef                	mov    %ebp,%edi
  4022e5:	e8 f6 e7 ff ff       	callq  400ae0 <close@plt>
  4022ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4022ef:	e9 b7 00 00 00       	jmpq   4023ab <submitr+0x724>
  4022f4:	8b 94 24 2c 20 00 00 	mov    0x202c(%rsp),%edx
  4022fb:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  402301:	74 28                	je     40232b <submitr+0x6a4>
  402303:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  402308:	be 70 30 40 00       	mov    $0x403070,%esi
  40230d:	48 89 df             	mov    %rbx,%rdi
  402310:	b8 00 00 00 00       	mov    $0x0,%eax
  402315:	e8 96 e8 ff ff       	callq  400bb0 <sprintf@plt>
  40231a:	89 ef                	mov    %ebp,%edi
  40231c:	e8 bf e7 ff ff       	callq  400ae0 <close@plt>
  402321:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402326:	e9 80 00 00 00       	jmpq   4023ab <submitr+0x724>
  40232b:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402332:	00 
  402333:	48 89 df             	mov    %rbx,%rdi
  402336:	e8 05 e9 ff ff       	callq  400c40 <strcpy@plt>
  40233b:	89 ef                	mov    %ebp,%edi
  40233d:	e8 9e e7 ff ff       	callq  400ae0 <close@plt>
  402342:	0f b6 03             	movzbl (%rbx),%eax
  402345:	83 e8 4f             	sub    $0x4f,%eax
  402348:	75 18                	jne    402362 <submitr+0x6db>
  40234a:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
  40234e:	83 ea 4b             	sub    $0x4b,%edx
  402351:	75 11                	jne    402364 <submitr+0x6dd>
  402353:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402357:	83 ea 0a             	sub    $0xa,%edx
  40235a:	75 08                	jne    402364 <submitr+0x6dd>
  40235c:	0f b6 53 03          	movzbl 0x3(%rbx),%edx
  402360:	eb 02                	jmp    402364 <submitr+0x6dd>
  402362:	89 c2                	mov    %eax,%edx
  402364:	85 d2                	test   %edx,%edx
  402366:	74 30                	je     402398 <submitr+0x711>
  402368:	bf db 2f 40 00       	mov    $0x402fdb,%edi
  40236d:	b9 05 00 00 00       	mov    $0x5,%ecx
  402372:	48 89 de             	mov    %rbx,%rsi
  402375:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402377:	0f 97 c1             	seta   %cl
  40237a:	0f 92 c2             	setb   %dl
  40237d:	38 d1                	cmp    %dl,%cl
  40237f:	74 1e                	je     40239f <submitr+0x718>
  402381:	85 c0                	test   %eax,%eax
  402383:	75 0d                	jne    402392 <submitr+0x70b>
  402385:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402389:	83 e8 4b             	sub    $0x4b,%eax
  40238c:	75 04                	jne    402392 <submitr+0x70b>
  40238e:	0f b6 43 02          	movzbl 0x2(%rbx),%eax
  402392:	85 c0                	test   %eax,%eax
  402394:	75 10                	jne    4023a6 <submitr+0x71f>
  402396:	eb 13                	jmp    4023ab <submitr+0x724>
  402398:	b8 00 00 00 00       	mov    $0x0,%eax
  40239d:	eb 0c                	jmp    4023ab <submitr+0x724>
  40239f:	b8 00 00 00 00       	mov    $0x0,%eax
  4023a4:	eb 05                	jmp    4023ab <submitr+0x724>
  4023a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023ab:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  4023b2:	5b                   	pop    %rbx
  4023b3:	5d                   	pop    %rbp
  4023b4:	41 5c                	pop    %r12
  4023b6:	41 5d                	pop    %r13
  4023b8:	41 5e                	pop    %r14
  4023ba:	41 5f                	pop    %r15
  4023bc:	c3                   	retq   

00000000004023bd <init_timeout>:
  4023bd:	53                   	push   %rbx
  4023be:	89 fb                	mov    %edi,%ebx
  4023c0:	85 ff                	test   %edi,%edi
  4023c2:	74 40                	je     402404 <init_timeout+0x47>
  4023c4:	85 ff                	test   %edi,%edi
  4023c6:	79 05                	jns    4023cd <init_timeout+0x10>
  4023c8:	bb 00 00 00 00       	mov    $0x0,%ebx
  4023cd:	89 da                	mov    %ebx,%edx
  4023cf:	be a0 30 40 00       	mov    $0x4030a0,%esi
  4023d4:	bf b0 2f 40 00       	mov    $0x402fb0,%edi
  4023d9:	b8 00 00 00 00       	mov    $0x0,%eax
  4023de:	e8 cd e7 ff ff       	callq  400bb0 <sprintf@plt>
  4023e3:	48 c7 05 72 33 20 00 	movq   $0x13,0x203372(%rip)        # 605760 <sm_length>
  4023ea:	13 00 00 00 
  4023ee:	be 22 1a 40 00       	mov    $0x401a22,%esi
  4023f3:	bf 0e 00 00 00       	mov    $0xe,%edi
  4023f8:	e8 f3 e7 ff ff       	callq  400bf0 <signal@plt>
  4023fd:	89 df                	mov    %ebx,%edi
  4023ff:	e8 1c e8 ff ff       	callq  400c20 <alarm@plt>
  402404:	5b                   	pop    %rbx
  402405:	c3                   	retq   

0000000000402406 <init_driver>:
  402406:	55                   	push   %rbp
  402407:	53                   	push   %rbx
  402408:	48 83 ec 18          	sub    $0x18,%rsp
  40240c:	48 89 fd             	mov    %rdi,%rbp
  40240f:	be 01 00 00 00       	mov    $0x1,%esi
  402414:	bf 0d 00 00 00       	mov    $0xd,%edi
  402419:	e8 d2 e7 ff ff       	callq  400bf0 <signal@plt>
  40241e:	be 01 00 00 00       	mov    $0x1,%esi
  402423:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402428:	e8 c3 e7 ff ff       	callq  400bf0 <signal@plt>
  40242d:	be 01 00 00 00       	mov    $0x1,%esi
  402432:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402437:	e8 b4 e7 ff ff       	callq  400bf0 <signal@plt>
  40243c:	ba 00 00 00 00       	mov    $0x0,%edx
  402441:	be 01 00 00 00       	mov    $0x1,%esi
  402446:	bf 02 00 00 00       	mov    $0x2,%edi
  40244b:	e8 b0 e7 ff ff       	callq  400c00 <socket@plt>
  402450:	89 c3                	mov    %eax,%ebx
  402452:	85 c0                	test   %eax,%eax
  402454:	79 4f                	jns    4024a5 <init_driver+0x9f>
  402456:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40245d:	3a 20 43 
  402460:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402464:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40246b:	20 75 6e 
  40246e:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402472:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402479:	74 6f 20 
  40247c:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402480:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402487:	65 20 73 
  40248a:	48 89 45 18          	mov    %rax,0x18(%rbp)
  40248e:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402495:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  40249b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024a0:	e9 23 01 00 00       	jmpq   4025c8 <init_driver+0x1c2>
  4024a5:	bf e0 2f 40 00       	mov    $0x402fe0,%edi
  4024aa:	e8 41 e6 ff ff       	callq  400af0 <gethostbyname@plt>
  4024af:	48 85 c0             	test   %rax,%rax
  4024b2:	75 68                	jne    40251c <init_driver+0x116>
  4024b4:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4024bb:	3a 20 44 
  4024be:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4024c2:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4024c9:	20 75 6e 
  4024cc:	48 89 45 08          	mov    %rax,0x8(%rbp)
  4024d0:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4024d7:	74 6f 20 
  4024da:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4024de:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4024e5:	76 65 20 
  4024e8:	48 89 45 18          	mov    %rax,0x18(%rbp)
  4024ec:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4024f3:	72 20 61 
  4024f6:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4024fa:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402501:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402507:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  40250b:	89 df                	mov    %ebx,%edi
  40250d:	e8 ce e5 ff ff       	callq  400ae0 <close@plt>
  402512:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402517:	e9 ac 00 00 00       	jmpq   4025c8 <init_driver+0x1c2>
  40251c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402523:	00 
  402524:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  40252b:	00 00 
  40252d:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402533:	48 8b 48 18          	mov    0x18(%rax),%rcx
  402537:	48 63 50 14          	movslq 0x14(%rax),%rdx
  40253b:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  402540:	48 8b 39             	mov    (%rcx),%rdi
  402543:	e8 48 e6 ff ff       	callq  400b90 <bcopy@plt>
  402548:	66 c7 44 24 02 00 50 	movw   $0x5000,0x2(%rsp)
  40254f:	ba 10 00 00 00       	mov    $0x10,%edx
  402554:	48 89 e6             	mov    %rsp,%rsi
  402557:	89 df                	mov    %ebx,%edi
  402559:	e8 72 e6 ff ff       	callq  400bd0 <connect@plt>
  40255e:	85 c0                	test   %eax,%eax
  402560:	79 50                	jns    4025b2 <init_driver+0x1ac>
  402562:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402569:	3a 20 55 
  40256c:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402570:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402577:	20 74 6f 
  40257a:	48 89 45 08          	mov    %rax,0x8(%rbp)
  40257e:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402585:	65 63 74 
  402588:	48 89 45 10          	mov    %rax,0x10(%rbp)
  40258c:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402593:	65 72 76 
  402596:	48 89 45 18          	mov    %rax,0x18(%rbp)
  40259a:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  4025a0:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  4025a4:	89 df                	mov    %ebx,%edi
  4025a6:	e8 35 e5 ff ff       	callq  400ae0 <close@plt>
  4025ab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025b0:	eb 16                	jmp    4025c8 <init_driver+0x1c2>
  4025b2:	89 df                	mov    %ebx,%edi
  4025b4:	e8 27 e5 ff ff       	callq  400ae0 <close@plt>
  4025b9:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  4025bf:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  4025c3:	b8 00 00 00 00       	mov    $0x0,%eax
  4025c8:	48 83 c4 18          	add    $0x18,%rsp
  4025cc:	5b                   	pop    %rbx
  4025cd:	5d                   	pop    %rbp
  4025ce:	c3                   	retq   

00000000004025cf <driver_post>:
  4025cf:	53                   	push   %rbx
  4025d0:	48 83 ec 10          	sub    $0x10,%rsp
  4025d4:	4c 89 cb             	mov    %r9,%rbx
  4025d7:	45 85 c0             	test   %r8d,%r8d
  4025da:	74 22                	je     4025fe <driver_post+0x2f>
  4025dc:	48 89 ce             	mov    %rcx,%rsi
  4025df:	bf f7 2f 40 00       	mov    $0x402ff7,%edi
  4025e4:	b8 00 00 00 00       	mov    $0x0,%eax
  4025e9:	e8 e2 e4 ff ff       	callq  400ad0 <printf@plt>
  4025ee:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4025f3:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4025f7:	b8 00 00 00 00       	mov    $0x0,%eax
  4025fc:	eb 39                	jmp    402637 <driver_post+0x68>
  4025fe:	48 85 ff             	test   %rdi,%rdi
  402601:	74 26                	je     402629 <driver_post+0x5a>
  402603:	80 3f 00             	cmpb   $0x0,(%rdi)
  402606:	74 21                	je     402629 <driver_post+0x5a>
  402608:	4c 89 0c 24          	mov    %r9,(%rsp)
  40260c:	49 89 c9             	mov    %rcx,%r9
  40260f:	49 89 d0             	mov    %rdx,%r8
  402612:	48 89 f9             	mov    %rdi,%rcx
  402615:	48 89 f2             	mov    %rsi,%rdx
  402618:	be 50 00 00 00       	mov    $0x50,%esi
  40261d:	bf e0 2f 40 00       	mov    $0x402fe0,%edi
  402622:	e8 60 f6 ff ff       	callq  401c87 <submitr>
  402627:	eb 0e                	jmp    402637 <driver_post+0x68>
  402629:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  40262e:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402632:	b8 00 00 00 00       	mov    $0x0,%eax
  402637:	48 83 c4 10          	add    $0x10,%rsp
  40263b:	5b                   	pop    %rbx
  40263c:	c3                   	retq   
  40263d:	0f 1f 00             	nopl   (%rax)

0000000000402640 <__libc_csu_init>:
  402640:	41 57                	push   %r15
  402642:	41 89 ff             	mov    %edi,%r15d
  402645:	41 56                	push   %r14
  402647:	49 89 f6             	mov    %rsi,%r14
  40264a:	41 55                	push   %r13
  40264c:	49 89 d5             	mov    %rdx,%r13
  40264f:	41 54                	push   %r12
  402651:	4c 8d 25 98 17 20 00 	lea    0x201798(%rip),%r12        # 603df0 <__frame_dummy_init_array_entry>
  402658:	55                   	push   %rbp
  402659:	48 8d 2d 98 17 20 00 	lea    0x201798(%rip),%rbp        # 603df8 <__init_array_end>
  402660:	53                   	push   %rbx
  402661:	4c 29 e5             	sub    %r12,%rbp
  402664:	31 db                	xor    %ebx,%ebx
  402666:	48 c1 fd 03          	sar    $0x3,%rbp
  40266a:	48 83 ec 08          	sub    $0x8,%rsp
  40266e:	e8 25 e4 ff ff       	callq  400a98 <_init>
  402673:	48 85 ed             	test   %rbp,%rbp
  402676:	74 1e                	je     402696 <__libc_csu_init+0x56>
  402678:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40267f:	00 
  402680:	4c 89 ea             	mov    %r13,%rdx
  402683:	4c 89 f6             	mov    %r14,%rsi
  402686:	44 89 ff             	mov    %r15d,%edi
  402689:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40268d:	48 83 c3 01          	add    $0x1,%rbx
  402691:	48 39 eb             	cmp    %rbp,%rbx
  402694:	75 ea                	jne    402680 <__libc_csu_init+0x40>
  402696:	48 83 c4 08          	add    $0x8,%rsp
  40269a:	5b                   	pop    %rbx
  40269b:	5d                   	pop    %rbp
  40269c:	41 5c                	pop    %r12
  40269e:	41 5d                	pop    %r13
  4026a0:	41 5e                	pop    %r14
  4026a2:	41 5f                	pop    %r15
  4026a4:	c3                   	retq   
  4026a5:	90                   	nop
  4026a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4026ad:	00 00 00 

00000000004026b0 <__libc_csu_fini>:
  4026b0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000004026b4 <_fini>:
  4026b4:	48 83 ec 08          	sub    $0x8,%rsp
  4026b8:	48 83 c4 08          	add    $0x8,%rsp
  4026bc:	c3                   	retq   
