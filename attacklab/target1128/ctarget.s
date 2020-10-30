
ctarget:     file format elf64-x86-64


Disassembly of section .text:

0000000000421300 <_start>:
  421300:	31 ed                	xor    %ebp,%ebp
  421302:	49 89 d1             	mov    %rdx,%r9
  421305:	5e                   	pop    %rsi
  421306:	48 89 e2             	mov    %rsp,%rdx
  421309:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  42130d:	50                   	push   %rax
  42130e:	54                   	push   %rsp
  42130f:	49 c7 c0 c0 33 42 00 	mov    $0x4233c0,%r8
  421316:	48 c7 c1 50 33 42 00 	mov    $0x423350,%rcx
  42131d:	48 c7 c7 c0 15 42 00 	mov    $0x4215c0,%rdi
  421324:	e8 07 fb fd ff       	callq  400e30 <__libc_start_main@plt>
  421329:	f4                   	hlt    
  42132a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000421330 <deregister_tm_clones>:
  421330:	b8 d7 54 62 00       	mov    $0x6254d7,%eax
  421335:	55                   	push   %rbp
  421336:	48 2d d0 54 62 00    	sub    $0x6254d0,%rax
  42133c:	48 83 f8 0e          	cmp    $0xe,%rax
  421340:	48 89 e5             	mov    %rsp,%rbp
  421343:	77 02                	ja     421347 <deregister_tm_clones+0x17>
  421345:	5d                   	pop    %rbp
  421346:	c3                   	retq   
  421347:	b8 00 00 00 00       	mov    $0x0,%eax
  42134c:	48 85 c0             	test   %rax,%rax
  42134f:	74 f4                	je     421345 <deregister_tm_clones+0x15>
  421351:	5d                   	pop    %rbp
  421352:	bf d0 54 62 00       	mov    $0x6254d0,%edi
  421357:	ff e0                	jmpq   *%rax
  421359:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000421360 <register_tm_clones>:
  421360:	b8 d0 54 62 00       	mov    $0x6254d0,%eax
  421365:	55                   	push   %rbp
  421366:	48 2d d0 54 62 00    	sub    $0x6254d0,%rax
  42136c:	48 c1 f8 03          	sar    $0x3,%rax
  421370:	48 89 e5             	mov    %rsp,%rbp
  421373:	48 89 c2             	mov    %rax,%rdx
  421376:	48 c1 ea 3f          	shr    $0x3f,%rdx
  42137a:	48 01 d0             	add    %rdx,%rax
  42137d:	48 d1 f8             	sar    %rax
  421380:	75 02                	jne    421384 <register_tm_clones+0x24>
  421382:	5d                   	pop    %rbp
  421383:	c3                   	retq   
  421384:	ba 00 00 00 00       	mov    $0x0,%edx
  421389:	48 85 d2             	test   %rdx,%rdx
  42138c:	74 f4                	je     421382 <register_tm_clones+0x22>
  42138e:	5d                   	pop    %rbp
  42138f:	48 89 c6             	mov    %rax,%rsi
  421392:	bf d0 54 62 00       	mov    $0x6254d0,%edi
  421397:	ff e2                	jmpq   *%rdx
  421399:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004213a0 <__do_global_dtors_aux>:
  4213a0:	80 3d 51 41 20 00 00 	cmpb   $0x0,0x204151(%rip)        # 6254f8 <completed.6355>
  4213a7:	75 11                	jne    4213ba <__do_global_dtors_aux+0x1a>
  4213a9:	55                   	push   %rbp
  4213aa:	48 89 e5             	mov    %rsp,%rbp
  4213ad:	e8 7e ff ff ff       	callq  421330 <deregister_tm_clones>
  4213b2:	5d                   	pop    %rbp
  4213b3:	c6 05 3e 41 20 00 01 	movb   $0x1,0x20413e(%rip)        # 6254f8 <completed.6355>
  4213ba:	f3 c3                	repz retq 
  4213bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004213c0 <frame_dummy>:
  4213c0:	48 83 3d 48 3a 20 00 	cmpq   $0x0,0x203a48(%rip)        # 624e10 <__JCR_END__>
  4213c7:	00 
  4213c8:	74 1e                	je     4213e8 <frame_dummy+0x28>
  4213ca:	b8 00 00 00 00       	mov    $0x0,%eax
  4213cf:	48 85 c0             	test   %rax,%rax
  4213d2:	74 14                	je     4213e8 <frame_dummy+0x28>
  4213d4:	55                   	push   %rbp
  4213d5:	bf 10 4e 62 00       	mov    $0x624e10,%edi
  4213da:	48 89 e5             	mov    %rsp,%rbp
  4213dd:	ff d0                	callq  *%rax
  4213df:	5d                   	pop    %rbp
  4213e0:	e9 7b ff ff ff       	jmpq   421360 <register_tm_clones>
  4213e5:	0f 1f 00             	nopl   (%rax)
  4213e8:	e9 73 ff ff ff       	jmpq   421360 <register_tm_clones>
  4213ed:	0f 1f 00             	nopl   (%rax)

00000000004213f0 <usage>:
  4213f0:	48 83 ec 08          	sub    $0x8,%rsp
  4213f4:	48 89 fe             	mov    %rdi,%rsi
  4213f7:	83 3d 2a 41 20 00 00 	cmpl   $0x0,0x20412a(%rip)        # 625528 <is_checker>
  4213fe:	74 39                	je     421439 <usage+0x49>
  421400:	bf e0 33 42 00       	mov    $0x4233e0,%edi
  421405:	b8 00 00 00 00       	mov    $0x0,%eax
  42140a:	e8 51 f9 fd ff       	callq  400d60 <printf@plt>
  42140f:	bf 18 34 42 00       	mov    $0x423418,%edi
  421414:	e8 97 f9 fd ff       	callq  400db0 <puts@plt>
  421419:	bf 90 35 42 00       	mov    $0x423590,%edi
  42141e:	e8 8d f9 fd ff       	callq  400db0 <puts@plt>
  421423:	bf 40 34 42 00       	mov    $0x423440,%edi
  421428:	e8 83 f9 fd ff       	callq  400db0 <puts@plt>
  42142d:	bf aa 35 42 00       	mov    $0x4235aa,%edi
  421432:	e8 79 f9 fd ff       	callq  400db0 <puts@plt>
  421437:	eb 2d                	jmp    421466 <usage+0x76>
  421439:	bf c6 35 42 00       	mov    $0x4235c6,%edi
  42143e:	b8 00 00 00 00       	mov    $0x0,%eax
  421443:	e8 18 f9 fd ff       	callq  400d60 <printf@plt>
  421448:	bf 68 34 42 00       	mov    $0x423468,%edi
  42144d:	e8 5e f9 fd ff       	callq  400db0 <puts@plt>
  421452:	bf 90 34 42 00       	mov    $0x423490,%edi
  421457:	e8 54 f9 fd ff       	callq  400db0 <puts@plt>
  42145c:	bf e4 35 42 00       	mov    $0x4235e4,%edi
  421461:	e8 4a f9 fd ff       	callq  400db0 <puts@plt>
  421466:	bf 00 00 00 00       	mov    $0x0,%edi
  42146b:	e8 60 f9 fd ff       	callq  400dd0 <exit@plt>

0000000000421470 <initialize_target>:
  421470:	55                   	push   %rbp
  421471:	53                   	push   %rbx
  421472:	48 81 ec 08 21 00 00 	sub    $0x2108,%rsp
  421479:	89 f5                	mov    %esi,%ebp
  42147b:	89 3d 97 40 20 00    	mov    %edi,0x204097(%rip)        # 625518 <check_level>
  421481:	8b 3d 01 3d 20 00    	mov    0x203d01(%rip),%edi        # 625188 <target_id>
  421487:	e8 42 1c 00 00       	callq  4230ce <gencookie>
  42148c:	89 05 92 40 20 00    	mov    %eax,0x204092(%rip)        # 625524 <cookie>
  421492:	89 c7                	mov    %eax,%edi
  421494:	e8 35 1c 00 00       	callq  4230ce <gencookie>
  421499:	89 05 81 40 20 00    	mov    %eax,0x204081(%rip)        # 625520 <authkey>
  42149f:	8b 05 e3 3c 20 00    	mov    0x203ce3(%rip),%eax        # 625188 <target_id>
  4214a5:	8d 78 01             	lea    0x1(%rax),%edi
  4214a8:	e8 93 f9 fd ff       	callq  400e40 <srandom@plt>
  4214ad:	e8 8e fa fd ff       	callq  400f40 <random@plt>
  4214b2:	89 c7                	mov    %eax,%edi
  4214b4:	e8 ca 02 00 00       	callq  421783 <scramble>
  4214b9:	89 c3                	mov    %eax,%ebx
  4214bb:	bf 00 00 00 00       	mov    $0x0,%edi
  4214c0:	e8 db fa fd ff       	callq  400fa0 <time@plt>
  4214c5:	89 c7                	mov    %eax,%edi
  4214c7:	e8 74 f9 fd ff       	callq  400e40 <srandom@plt>
  4214cc:	85 ed                	test   %ebp,%ebp
  4214ce:	74 07                	je     4214d7 <initialize_target+0x67>
  4214d0:	e8 6b fa fd ff       	callq  400f40 <random@plt>
  4214d5:	eb 05                	jmp    4214dc <initialize_target+0x6c>
  4214d7:	b8 00 00 00 00       	mov    $0x0,%eax
  4214dc:	01 c3                	add    %eax,%ebx
  4214de:	0f b7 db             	movzwl %bx,%ebx
  4214e1:	8d 04 dd 00 01 00 00 	lea    0x100(,%rbx,8),%eax
  4214e8:	89 c0                	mov    %eax,%eax
  4214ea:	48 89 05 cf 3f 20 00 	mov    %rax,0x203fcf(%rip)        # 6254c0 <buf_offset>
  4214f1:	c6 05 50 4c 20 00 63 	movb   $0x63,0x204c50(%rip)        # 626148 <target_prefix>
  4214f8:	83 3d c9 3f 20 00 00 	cmpl   $0x0,0x203fc9(%rip)        # 6254c8 <notify>
  4214ff:	0f 84 b1 00 00 00    	je     4215b6 <initialize_target+0x146>
  421505:	83 3d 1c 40 20 00 00 	cmpl   $0x0,0x20401c(%rip)        # 625528 <is_checker>
  42150c:	0f 85 a4 00 00 00    	jne    4215b6 <initialize_target+0x146>
  421512:	be 00 01 00 00       	mov    $0x100,%esi
  421517:	48 89 e7             	mov    %rsp,%rdi
  42151a:	e8 a1 f9 fd ff       	callq  400ec0 <gethostname@plt>
  42151f:	85 c0                	test   %eax,%eax
  421521:	74 25                	je     421548 <initialize_target+0xd8>
  421523:	bf c0 34 42 00       	mov    $0x4234c0,%edi
  421528:	e8 83 f8 fd ff       	callq  400db0 <puts@plt>
  42152d:	bf 08 00 00 00       	mov    $0x8,%edi
  421532:	e8 99 f8 fd ff       	callq  400dd0 <exit@plt>
  421537:	48 89 e6             	mov    %rsp,%rsi
  42153a:	e8 a1 f8 fd ff       	callq  400de0 <strcasecmp@plt>
  42153f:	85 c0                	test   %eax,%eax
  421541:	74 21                	je     421564 <initialize_target+0xf4>
  421543:	83 c3 01             	add    $0x1,%ebx
  421546:	eb 05                	jmp    42154d <initialize_target+0xdd>
  421548:	bb 00 00 00 00       	mov    $0x0,%ebx
  42154d:	48 63 c3             	movslq %ebx,%rax
  421550:	48 8b 3c c5 a0 51 62 	mov    0x6251a0(,%rax,8),%rdi
  421557:	00 
  421558:	48 85 ff             	test   %rdi,%rdi
  42155b:	75 da                	jne    421537 <initialize_target+0xc7>
  42155d:	b8 00 00 00 00       	mov    $0x0,%eax
  421562:	eb 05                	jmp    421569 <initialize_target+0xf9>
  421564:	b8 01 00 00 00       	mov    $0x1,%eax
  421569:	85 c0                	test   %eax,%eax
  42156b:	75 17                	jne    421584 <initialize_target+0x114>
  42156d:	48 89 e6             	mov    %rsp,%rsi
  421570:	bf f8 34 42 00       	mov    $0x4234f8,%edi
  421575:	e8 e6 f7 fd ff       	callq  400d60 <printf@plt>
  42157a:	bf 08 00 00 00       	mov    $0x8,%edi
  42157f:	e8 4c f8 fd ff       	callq  400dd0 <exit@plt>
  421584:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  42158b:	00 
  42158c:	e8 d4 18 00 00       	callq  422e65 <init_driver>
  421591:	85 c0                	test   %eax,%eax
  421593:	79 21                	jns    4215b6 <initialize_target+0x146>
  421595:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  42159c:	00 
  42159d:	bf 38 35 42 00       	mov    $0x423538,%edi
  4215a2:	b8 00 00 00 00       	mov    $0x0,%eax
  4215a7:	e8 b4 f7 fd ff       	callq  400d60 <printf@plt>
  4215ac:	bf 08 00 00 00       	mov    $0x8,%edi
  4215b1:	e8 1a f8 fd ff       	callq  400dd0 <exit@plt>
  4215b6:	48 81 c4 08 21 00 00 	add    $0x2108,%rsp
  4215bd:	5b                   	pop    %rbx
  4215be:	5d                   	pop    %rbp
  4215bf:	c3                   	retq   

00000000004215c0 <main>:
  4215c0:	41 56                	push   %r14
  4215c2:	41 55                	push   %r13
  4215c4:	41 54                	push   %r12
  4215c6:	55                   	push   %rbp
  4215c7:	53                   	push   %rbx
  4215c8:	41 89 fc             	mov    %edi,%r12d
  4215cb:	48 89 f3             	mov    %rsi,%rbx
  4215ce:	be 71 22 42 00       	mov    $0x422271,%esi
  4215d3:	bf 0b 00 00 00       	mov    $0xb,%edi
  4215d8:	e8 f3 f8 fd ff       	callq  400ed0 <signal@plt>
  4215dd:	be 23 22 42 00       	mov    $0x422223,%esi
  4215e2:	bf 07 00 00 00       	mov    $0x7,%edi
  4215e7:	e8 e4 f8 fd ff       	callq  400ed0 <signal@plt>
  4215ec:	be bf 22 42 00       	mov    $0x4222bf,%esi
  4215f1:	bf 04 00 00 00       	mov    $0x4,%edi
  4215f6:	e8 d5 f8 fd ff       	callq  400ed0 <signal@plt>
  4215fb:	83 3d 26 3f 20 00 00 	cmpl   $0x0,0x203f26(%rip)        # 625528 <is_checker>
  421602:	74 20                	je     421624 <main+0x64>
  421604:	be 0d 23 42 00       	mov    $0x42230d,%esi
  421609:	bf 0e 00 00 00       	mov    $0xe,%edi
  42160e:	e8 bd f8 fd ff       	callq  400ed0 <signal@plt>
  421613:	bf 05 00 00 00       	mov    $0x5,%edi
  421618:	e8 d3 f8 fd ff       	callq  400ef0 <alarm@plt>
  42161d:	bd 02 36 42 00       	mov    $0x423602,%ebp
  421622:	eb 05                	jmp    421629 <main+0x69>
  421624:	bd fd 35 42 00       	mov    $0x4235fd,%ebp
  421629:	48 8b 05 b0 3e 20 00 	mov    0x203eb0(%rip),%rax        # 6254e0 <stdin@@GLIBC_2.2.5>
  421630:	48 89 05 d9 3e 20 00 	mov    %rax,0x203ed9(%rip)        # 625510 <infile>
  421637:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  42163d:	41 be 00 00 00 00    	mov    $0x0,%r14d
  421643:	e9 b9 00 00 00       	jmpq   421701 <main+0x141>
  421648:	83 e8 61             	sub    $0x61,%eax
  42164b:	3c 10                	cmp    $0x10,%al
  42164d:	0f 87 93 00 00 00    	ja     4216e6 <main+0x126>
  421653:	0f b6 c0             	movzbl %al,%eax
  421656:	ff 24 c5 48 36 42 00 	jmpq   *0x423648(,%rax,8)
  42165d:	48 8b 3b             	mov    (%rbx),%rdi
  421660:	e8 8b fd ff ff       	callq  4213f0 <usage>
  421665:	be 1d 3a 42 00       	mov    $0x423a1d,%esi
  42166a:	48 8b 3d 77 3e 20 00 	mov    0x203e77(%rip),%rdi        # 6254e8 <optarg@@GLIBC_2.2.5>
  421671:	e8 aa f7 fd ff       	callq  400e20 <fopen@plt>
  421676:	48 89 05 93 3e 20 00 	mov    %rax,0x203e93(%rip)        # 625510 <infile>
  42167d:	48 85 c0             	test   %rax,%rax
  421680:	75 7f                	jne    421701 <main+0x141>
  421682:	48 8b 15 5f 3e 20 00 	mov    0x203e5f(%rip),%rdx        # 6254e8 <optarg@@GLIBC_2.2.5>
  421689:	be 0a 36 42 00       	mov    $0x42360a,%esi
  42168e:	48 8b 3d 5b 3e 20 00 	mov    0x203e5b(%rip),%rdi        # 6254f0 <stderr@@GLIBC_2.2.5>
  421695:	e8 b6 f8 fd ff       	callq  400f50 <fprintf@plt>
  42169a:	b8 01 00 00 00       	mov    $0x1,%eax
  42169f:	e9 d6 00 00 00       	jmpq   42177a <main+0x1ba>
  4216a4:	ba 10 00 00 00       	mov    $0x10,%edx
  4216a9:	be 00 00 00 00       	mov    $0x0,%esi
  4216ae:	48 8b 3d 33 3e 20 00 	mov    0x203e33(%rip),%rdi        # 6254e8 <optarg@@GLIBC_2.2.5>
  4216b5:	e8 b6 f8 fd ff       	callq  400f70 <strtoul@plt>
  4216ba:	41 89 c6             	mov    %eax,%r14d
  4216bd:	eb 42                	jmp    421701 <main+0x141>
  4216bf:	ba 0a 00 00 00       	mov    $0xa,%edx
  4216c4:	be 00 00 00 00       	mov    $0x0,%esi
  4216c9:	48 8b 3d 18 3e 20 00 	mov    0x203e18(%rip),%rdi        # 6254e8 <optarg@@GLIBC_2.2.5>
  4216d0:	e8 cb f7 fd ff       	callq  400ea0 <strtol@plt>
  4216d5:	41 89 c5             	mov    %eax,%r13d
  4216d8:	eb 27                	jmp    421701 <main+0x141>
  4216da:	c7 05 e4 3d 20 00 00 	movl   $0x0,0x203de4(%rip)        # 6254c8 <notify>
  4216e1:	00 00 00 
  4216e4:	eb 1b                	jmp    421701 <main+0x141>
  4216e6:	40 0f be f6          	movsbl %sil,%esi
  4216ea:	bf 27 36 42 00       	mov    $0x423627,%edi
  4216ef:	b8 00 00 00 00       	mov    $0x0,%eax
  4216f4:	e8 67 f6 fd ff       	callq  400d60 <printf@plt>
  4216f9:	48 8b 3b             	mov    (%rbx),%rdi
  4216fc:	e8 ef fc ff ff       	callq  4213f0 <usage>
  421701:	48 89 ea             	mov    %rbp,%rdx
  421704:	48 89 de             	mov    %rbx,%rsi
  421707:	44 89 e7             	mov    %r12d,%edi
  42170a:	e8 e1 f6 fd ff       	callq  400df0 <getopt@plt>
  42170f:	89 c6                	mov    %eax,%esi
  421711:	3c ff                	cmp    $0xff,%al
  421713:	0f 85 2f ff ff ff    	jne    421648 <main+0x88>
  421719:	be 00 00 00 00       	mov    $0x0,%esi
  42171e:	44 89 ef             	mov    %r13d,%edi
  421721:	e8 4a fd ff ff       	callq  421470 <initialize_target>
  421726:	83 3d fb 3d 20 00 00 	cmpl   $0x0,0x203dfb(%rip)        # 625528 <is_checker>
  42172d:	74 25                	je     421754 <main+0x194>
  42172f:	44 3b 35 ea 3d 20 00 	cmp    0x203dea(%rip),%r14d        # 625520 <authkey>
  421736:	74 1c                	je     421754 <main+0x194>
  421738:	44 89 f6             	mov    %r14d,%esi
  42173b:	bf 60 35 42 00       	mov    $0x423560,%edi
  421740:	b8 00 00 00 00       	mov    $0x0,%eax
  421745:	e8 16 f6 fd ff       	callq  400d60 <printf@plt>
  42174a:	b8 00 00 00 00       	mov    $0x0,%eax
  42174f:	e8 d7 07 00 00       	callq  421f2b <check_fail>
  421754:	8b 35 ca 3d 20 00    	mov    0x203dca(%rip),%esi        # 625524 <cookie>
  42175a:	bf 3a 36 42 00       	mov    $0x42363a,%edi
  42175f:	b8 00 00 00 00       	mov    $0x0,%eax
  421764:	e8 f7 f5 fd ff       	callq  400d60 <printf@plt>
  421769:	48 8b 3d 50 3d 20 00 	mov    0x203d50(%rip),%rdi        # 6254c0 <buf_offset>
  421770:	e8 67 0c 00 00       	callq  4223dc <stable_launch>
  421775:	b8 00 00 00 00       	mov    $0x0,%eax
  42177a:	5b                   	pop    %rbx
  42177b:	5d                   	pop    %rbp
  42177c:	41 5c                	pop    %r12
  42177e:	41 5d                	pop    %r13
  421780:	41 5e                	pop    %r14
  421782:	c3                   	retq   

0000000000421783 <scramble>:
  421783:	b8 00 00 00 00       	mov    $0x0,%eax
  421788:	eb 11                	jmp    42179b <scramble+0x18>
  42178a:	69 c8 4b 46 00 00    	imul   $0x464b,%eax,%ecx
  421790:	01 f9                	add    %edi,%ecx
  421792:	89 c2                	mov    %eax,%edx
  421794:	89 4c 94 d0          	mov    %ecx,-0x30(%rsp,%rdx,4)
  421798:	83 c0 01             	add    $0x1,%eax
  42179b:	83 f8 09             	cmp    $0x9,%eax
  42179e:	76 ea                	jbe    42178a <scramble+0x7>
  4217a0:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4217a4:	69 c0 ad 12 00 00    	imul   $0x12ad,%eax,%eax
  4217aa:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4217ae:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4217b2:	69 c0 8e 8f 00 00    	imul   $0x8f8e,%eax,%eax
  4217b8:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4217bc:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4217c0:	69 c0 c3 61 00 00    	imul   $0x61c3,%eax,%eax
  4217c6:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4217ca:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4217ce:	69 c0 8a aa 00 00    	imul   $0xaa8a,%eax,%eax
  4217d4:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4217d8:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4217dc:	69 c0 ba 46 00 00    	imul   $0x46ba,%eax,%eax
  4217e2:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4217e6:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4217ea:	69 c0 08 2a 00 00    	imul   $0x2a08,%eax,%eax
  4217f0:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4217f4:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4217f8:	69 c0 58 05 00 00    	imul   $0x558,%eax,%eax
  4217fe:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  421802:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  421806:	69 c0 98 4f 00 00    	imul   $0x4f98,%eax,%eax
  42180c:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  421810:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  421814:	69 c0 df c3 00 00    	imul   $0xc3df,%eax,%eax
  42181a:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  42181e:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  421822:	69 c0 e0 d9 00 00    	imul   $0xd9e0,%eax,%eax
  421828:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  42182c:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  421830:	69 c0 dc c7 00 00    	imul   $0xc7dc,%eax,%eax
  421836:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  42183a:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  42183e:	69 c0 16 14 00 00    	imul   $0x1416,%eax,%eax
  421844:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  421848:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  42184c:	69 c0 11 bf 00 00    	imul   $0xbf11,%eax,%eax
  421852:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  421856:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  42185a:	69 c0 9b a2 00 00    	imul   $0xa29b,%eax,%eax
  421860:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  421864:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  421868:	69 c0 62 9d 00 00    	imul   $0x9d62,%eax,%eax
  42186e:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  421872:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  421876:	69 c0 e9 0f 00 00    	imul   $0xfe9,%eax,%eax
  42187c:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  421880:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  421884:	69 c0 00 6e 00 00    	imul   $0x6e00,%eax,%eax
  42188a:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  42188e:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  421892:	69 c0 fc 29 00 00    	imul   $0x29fc,%eax,%eax
  421898:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  42189c:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4218a0:	69 c0 18 ea 00 00    	imul   $0xea18,%eax,%eax
  4218a6:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  4218aa:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4218ae:	69 c0 bf 51 00 00    	imul   $0x51bf,%eax,%eax
  4218b4:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4218b8:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4218bc:	69 c0 76 5c 00 00    	imul   $0x5c76,%eax,%eax
  4218c2:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4218c6:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4218ca:	69 c0 86 5b 00 00    	imul   $0x5b86,%eax,%eax
  4218d0:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4218d4:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4218d8:	69 c0 18 fa 00 00    	imul   $0xfa18,%eax,%eax
  4218de:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4218e2:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4218e6:	69 c0 63 ed 00 00    	imul   $0xed63,%eax,%eax
  4218ec:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  4218f0:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4218f4:	69 c0 e7 f4 00 00    	imul   $0xf4e7,%eax,%eax
  4218fa:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4218fe:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  421902:	69 c0 a5 01 00 00    	imul   $0x1a5,%eax,%eax
  421908:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  42190c:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  421910:	69 c0 49 2d 00 00    	imul   $0x2d49,%eax,%eax
  421916:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  42191a:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  42191e:	69 c0 58 f7 00 00    	imul   $0xf758,%eax,%eax
  421924:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  421928:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  42192c:	69 c0 59 35 00 00    	imul   $0x3559,%eax,%eax
  421932:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  421936:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  42193a:	69 c0 f7 b5 00 00    	imul   $0xb5f7,%eax,%eax
  421940:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  421944:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  421948:	69 c0 8e e0 00 00    	imul   $0xe08e,%eax,%eax
  42194e:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  421952:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  421956:	69 c0 cb 82 00 00    	imul   $0x82cb,%eax,%eax
  42195c:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  421960:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  421964:	69 c0 57 65 00 00    	imul   $0x6557,%eax,%eax
  42196a:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  42196e:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  421972:	69 c0 52 1e 00 00    	imul   $0x1e52,%eax,%eax
  421978:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  42197c:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  421980:	69 c0 4e 81 00 00    	imul   $0x814e,%eax,%eax
  421986:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  42198a:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  42198e:	69 c0 43 80 00 00    	imul   $0x8043,%eax,%eax
  421994:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  421998:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  42199c:	69 c0 d9 eb 00 00    	imul   $0xebd9,%eax,%eax
  4219a2:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4219a6:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4219aa:	69 c0 93 3f 00 00    	imul   $0x3f93,%eax,%eax
  4219b0:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4219b4:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4219b8:	69 c0 e7 86 00 00    	imul   $0x86e7,%eax,%eax
  4219be:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4219c2:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4219c6:	69 c0 e9 a3 00 00    	imul   $0xa3e9,%eax,%eax
  4219cc:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  4219d0:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4219d4:	69 c0 39 f4 00 00    	imul   $0xf439,%eax,%eax
  4219da:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4219de:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4219e2:	69 c0 92 38 00 00    	imul   $0x3892,%eax,%eax
  4219e8:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4219ec:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4219f0:	69 c0 49 bb 00 00    	imul   $0xbb49,%eax,%eax
  4219f6:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4219fa:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4219fe:	69 c0 dc 0d 00 00    	imul   $0xddc,%eax,%eax
  421a04:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  421a08:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  421a0c:	69 c0 dd c9 00 00    	imul   $0xc9dd,%eax,%eax
  421a12:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  421a16:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  421a1a:	69 c0 5e c3 00 00    	imul   $0xc35e,%eax,%eax
  421a20:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  421a24:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  421a28:	69 c0 b4 89 00 00    	imul   $0x89b4,%eax,%eax
  421a2e:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  421a32:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  421a36:	69 c0 fb f8 00 00    	imul   $0xf8fb,%eax,%eax
  421a3c:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  421a40:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  421a44:	69 c0 f1 f2 00 00    	imul   $0xf2f1,%eax,%eax
  421a4a:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  421a4e:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  421a52:	69 c0 7b 3e 00 00    	imul   $0x3e7b,%eax,%eax
  421a58:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  421a5c:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  421a60:	69 c0 5f 87 00 00    	imul   $0x875f,%eax,%eax
  421a66:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  421a6a:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  421a6e:	69 c0 03 52 00 00    	imul   $0x5203,%eax,%eax
  421a74:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  421a78:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  421a7c:	69 c0 87 9a 00 00    	imul   $0x9a87,%eax,%eax
  421a82:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  421a86:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  421a8a:	69 c0 29 59 00 00    	imul   $0x5929,%eax,%eax
  421a90:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  421a94:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  421a98:	69 c0 8c be 00 00    	imul   $0xbe8c,%eax,%eax
  421a9e:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  421aa2:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  421aa6:	69 c0 3d 9d 00 00    	imul   $0x9d3d,%eax,%eax
  421aac:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  421ab0:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  421ab4:	69 c0 a1 a2 00 00    	imul   $0xa2a1,%eax,%eax
  421aba:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  421abe:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  421ac2:	69 c0 47 d4 00 00    	imul   $0xd447,%eax,%eax
  421ac8:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  421acc:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  421ad0:	69 c0 b9 05 00 00    	imul   $0x5b9,%eax,%eax
  421ad6:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  421ada:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  421ade:	69 c0 8d 4e 00 00    	imul   $0x4e8d,%eax,%eax
  421ae4:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  421ae8:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  421aec:	69 c0 f7 a5 00 00    	imul   $0xa5f7,%eax,%eax
  421af2:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  421af6:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  421afa:	69 c0 02 7a 00 00    	imul   $0x7a02,%eax,%eax
  421b00:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  421b04:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  421b08:	69 c0 15 58 00 00    	imul   $0x5815,%eax,%eax
  421b0e:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  421b12:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  421b16:	69 c0 b6 1e 00 00    	imul   $0x1eb6,%eax,%eax
  421b1c:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  421b20:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  421b24:	69 c0 4b 8a 00 00    	imul   $0x8a4b,%eax,%eax
  421b2a:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  421b2e:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  421b32:	69 c0 45 bf 00 00    	imul   $0xbf45,%eax,%eax
  421b38:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  421b3c:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  421b40:	69 c0 f0 1b 00 00    	imul   $0x1bf0,%eax,%eax
  421b46:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  421b4a:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  421b4e:	69 c0 e2 84 00 00    	imul   $0x84e2,%eax,%eax
  421b54:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  421b58:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  421b5c:	69 c0 df a2 00 00    	imul   $0xa2df,%eax,%eax
  421b62:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  421b66:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  421b6a:	69 c0 e6 d7 00 00    	imul   $0xd7e6,%eax,%eax
  421b70:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  421b74:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  421b78:	69 c0 1e db 00 00    	imul   $0xdb1e,%eax,%eax
  421b7e:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  421b82:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  421b86:	69 c0 31 14 00 00    	imul   $0x1431,%eax,%eax
  421b8c:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  421b90:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  421b94:	69 c0 f2 4a 00 00    	imul   $0x4af2,%eax,%eax
  421b9a:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  421b9e:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  421ba2:	69 c0 ab db 00 00    	imul   $0xdbab,%eax,%eax
  421ba8:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  421bac:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  421bb0:	69 c0 9c ca 00 00    	imul   $0xca9c,%eax,%eax
  421bb6:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  421bba:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  421bbe:	69 c0 42 20 00 00    	imul   $0x2042,%eax,%eax
  421bc4:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  421bc8:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  421bcc:	69 c0 24 3c 00 00    	imul   $0x3c24,%eax,%eax
  421bd2:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  421bd6:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  421bda:	69 c0 3e a0 00 00    	imul   $0xa03e,%eax,%eax
  421be0:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  421be4:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  421be8:	69 c0 42 0d 00 00    	imul   $0xd42,%eax,%eax
  421bee:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  421bf2:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  421bf6:	69 c0 3f df 00 00    	imul   $0xdf3f,%eax,%eax
  421bfc:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  421c00:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  421c04:	69 c0 26 1c 00 00    	imul   $0x1c26,%eax,%eax
  421c0a:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  421c0e:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  421c12:	69 c0 37 a9 00 00    	imul   $0xa937,%eax,%eax
  421c18:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  421c1c:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  421c20:	69 c0 cc af 00 00    	imul   $0xafcc,%eax,%eax
  421c26:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  421c2a:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  421c2e:	69 c0 8f ee 00 00    	imul   $0xee8f,%eax,%eax
  421c34:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  421c38:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  421c3c:	69 c0 24 0c 00 00    	imul   $0xc24,%eax,%eax
  421c42:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  421c46:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  421c4a:	69 c0 17 b4 00 00    	imul   $0xb417,%eax,%eax
  421c50:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  421c54:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  421c58:	69 c0 99 3b 00 00    	imul   $0x3b99,%eax,%eax
  421c5e:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  421c62:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  421c66:	69 c0 03 65 00 00    	imul   $0x6503,%eax,%eax
  421c6c:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  421c70:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  421c74:	69 c0 c0 b0 00 00    	imul   $0xb0c0,%eax,%eax
  421c7a:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  421c7e:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  421c82:	69 c0 37 d7 00 00    	imul   $0xd737,%eax,%eax
  421c88:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  421c8c:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  421c90:	69 c0 e6 6a 00 00    	imul   $0x6ae6,%eax,%eax
  421c96:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  421c9a:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  421c9e:	69 c0 ef eb 00 00    	imul   $0xebef,%eax,%eax
  421ca4:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  421ca8:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  421cac:	69 c0 bd 91 00 00    	imul   $0x91bd,%eax,%eax
  421cb2:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  421cb6:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  421cba:	69 c0 43 3b 00 00    	imul   $0x3b43,%eax,%eax
  421cc0:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  421cc4:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  421cc8:	69 c0 22 4b 00 00    	imul   $0x4b22,%eax,%eax
  421cce:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  421cd2:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  421cd6:	69 c0 8c 36 00 00    	imul   $0x368c,%eax,%eax
  421cdc:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  421ce0:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  421ce4:	69 c0 06 b9 00 00    	imul   $0xb906,%eax,%eax
  421cea:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  421cee:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  421cf2:	69 c0 5f 9f 00 00    	imul   $0x9f5f,%eax,%eax
  421cf8:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  421cfc:	ba 00 00 00 00       	mov    $0x0,%edx
  421d01:	b8 00 00 00 00       	mov    $0x0,%eax
  421d06:	eb 0b                	jmp    421d13 <scramble+0x590>
  421d08:	89 d1                	mov    %edx,%ecx
  421d0a:	8b 4c 8c d0          	mov    -0x30(%rsp,%rcx,4),%ecx
  421d0e:	01 c8                	add    %ecx,%eax
  421d10:	83 c2 01             	add    $0x1,%edx
  421d13:	83 fa 09             	cmp    $0x9,%edx
  421d16:	76 f0                	jbe    421d08 <scramble+0x585>
  421d18:	f3 c3                	repz retq 

0000000000421d1a <getbuf>:
  421d1a:	48 83 ec 18          	sub    $0x18,%rsp
  421d1e:	48 89 e7             	mov    %rsp,%rdi
  421d21:	e8 34 02 00 00       	callq  421f5a <Gets>
  421d26:	b8 01 00 00 00       	mov    $0x1,%eax
  421d2b:	48 83 c4 18          	add    $0x18,%rsp
  421d2f:	c3                   	retq   

0000000000421d30 <touch1>:
  421d30:	48 83 ec 08          	sub    $0x8,%rsp
  421d34:	c7 05 de 37 20 00 01 	movl   $0x1,0x2037de(%rip)        # 62551c <vlevel>
  421d3b:	00 00 00 
  421d3e:	bf 6f 38 42 00       	mov    $0x42386f,%edi
  421d43:	e8 68 f0 fd ff       	callq  400db0 <puts@plt>
  421d48:	bf 01 00 00 00       	mov    $0x1,%edi
  421d4d:	e8 f7 03 00 00       	callq  422149 <validate>
  421d52:	bf 00 00 00 00       	mov    $0x0,%edi
  421d57:	e8 74 f0 fd ff       	callq  400dd0 <exit@plt>

0000000000421d5c <touch2>:
  421d5c:	48 83 ec 08          	sub    $0x8,%rsp
  421d60:	89 fe                	mov    %edi,%esi
  421d62:	c7 05 b0 37 20 00 02 	movl   $0x2,0x2037b0(%rip)        # 62551c <vlevel>
  421d69:	00 00 00 
  421d6c:	3b 3d b2 37 20 00    	cmp    0x2037b2(%rip),%edi        # 625524 <cookie>
  421d72:	75 1b                	jne    421d8f <touch2+0x33>
  421d74:	bf 98 38 42 00       	mov    $0x423898,%edi
  421d79:	b8 00 00 00 00       	mov    $0x0,%eax
  421d7e:	e8 dd ef fd ff       	callq  400d60 <printf@plt>
  421d83:	bf 02 00 00 00       	mov    $0x2,%edi
  421d88:	e8 bc 03 00 00       	callq  422149 <validate>
  421d8d:	eb 19                	jmp    421da8 <touch2+0x4c>
  421d8f:	bf c0 38 42 00       	mov    $0x4238c0,%edi
  421d94:	b8 00 00 00 00       	mov    $0x0,%eax
  421d99:	e8 c2 ef fd ff       	callq  400d60 <printf@plt>
  421d9e:	bf 02 00 00 00       	mov    $0x2,%edi
  421da3:	e8 53 04 00 00       	callq  4221fb <fail>
  421da8:	bf 00 00 00 00       	mov    $0x0,%edi
  421dad:	e8 1e f0 fd ff       	callq  400dd0 <exit@plt>

0000000000421db2 <hexmatch>:
  421db2:	41 54                	push   %r12
  421db4:	55                   	push   %rbp
  421db5:	53                   	push   %rbx
  421db6:	48 83 ec 70          	sub    $0x70,%rsp
  421dba:	41 89 fc             	mov    %edi,%r12d
  421dbd:	48 89 f5             	mov    %rsi,%rbp
  421dc0:	e8 7b f1 fd ff       	callq  400f40 <random@plt>
  421dc5:	48 89 c1             	mov    %rax,%rcx
  421dc8:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  421dcf:	0a d7 a3 
  421dd2:	48 f7 ea             	imul   %rdx
  421dd5:	48 8d 04 0a          	lea    (%rdx,%rcx,1),%rax
  421dd9:	48 c1 f8 06          	sar    $0x6,%rax
  421ddd:	48 89 ce             	mov    %rcx,%rsi
  421de0:	48 c1 fe 3f          	sar    $0x3f,%rsi
  421de4:	48 29 f0             	sub    %rsi,%rax
  421de7:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  421deb:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  421def:	48 c1 e0 02          	shl    $0x2,%rax
  421df3:	48 29 c1             	sub    %rax,%rcx
  421df6:	48 8d 1c 0c          	lea    (%rsp,%rcx,1),%rbx
  421dfa:	44 89 e2             	mov    %r12d,%edx
  421dfd:	be 8c 38 42 00       	mov    $0x42388c,%esi
  421e02:	48 89 df             	mov    %rbx,%rdi
  421e05:	b8 00 00 00 00       	mov    $0x0,%eax
  421e0a:	e8 71 f0 fd ff       	callq  400e80 <sprintf@plt>
  421e0f:	ba 09 00 00 00       	mov    $0x9,%edx
  421e14:	48 89 de             	mov    %rbx,%rsi
  421e17:	48 89 ef             	mov    %rbp,%rdi
  421e1a:	e8 f1 ef fd ff       	callq  400e10 <strncmp@plt>
  421e1f:	85 c0                	test   %eax,%eax
  421e21:	0f 94 c0             	sete   %al
  421e24:	0f b6 c0             	movzbl %al,%eax
  421e27:	48 83 c4 70          	add    $0x70,%rsp
  421e2b:	5b                   	pop    %rbx
  421e2c:	5d                   	pop    %rbp
  421e2d:	41 5c                	pop    %r12
  421e2f:	c3                   	retq   

0000000000421e30 <touch3>:
  421e30:	53                   	push   %rbx
  421e31:	48 89 fb             	mov    %rdi,%rbx
  421e34:	c7 05 de 36 20 00 03 	movl   $0x3,0x2036de(%rip)        # 62551c <vlevel>
  421e3b:	00 00 00 
  421e3e:	48 89 fe             	mov    %rdi,%rsi
  421e41:	8b 3d dd 36 20 00    	mov    0x2036dd(%rip),%edi        # 625524 <cookie>
  421e47:	e8 66 ff ff ff       	callq  421db2 <hexmatch>
  421e4c:	85 c0                	test   %eax,%eax
  421e4e:	74 1e                	je     421e6e <touch3+0x3e>
  421e50:	48 89 de             	mov    %rbx,%rsi
  421e53:	bf e8 38 42 00       	mov    $0x4238e8,%edi
  421e58:	b8 00 00 00 00       	mov    $0x0,%eax
  421e5d:	e8 fe ee fd ff       	callq  400d60 <printf@plt>
  421e62:	bf 03 00 00 00       	mov    $0x3,%edi
  421e67:	e8 dd 02 00 00       	callq  422149 <validate>
  421e6c:	eb 1c                	jmp    421e8a <touch3+0x5a>
  421e6e:	48 89 de             	mov    %rbx,%rsi
  421e71:	bf 10 39 42 00       	mov    $0x423910,%edi
  421e76:	b8 00 00 00 00       	mov    $0x0,%eax
  421e7b:	e8 e0 ee fd ff       	callq  400d60 <printf@plt>
  421e80:	bf 03 00 00 00       	mov    $0x3,%edi
  421e85:	e8 71 03 00 00       	callq  4221fb <fail>
  421e8a:	bf 00 00 00 00       	mov    $0x0,%edi
  421e8f:	e8 3c ef fd ff       	callq  400dd0 <exit@plt>

0000000000421e94 <test>:
  421e94:	48 83 ec 08          	sub    $0x8,%rsp
  421e98:	b8 00 00 00 00       	mov    $0x0,%eax
  421e9d:	e8 78 fe ff ff       	callq  421d1a <getbuf>
  421ea2:	89 c6                	mov    %eax,%esi
  421ea4:	bf 38 39 42 00       	mov    $0x423938,%edi
  421ea9:	b8 00 00 00 00       	mov    $0x0,%eax
  421eae:	e8 ad ee fd ff       	callq  400d60 <printf@plt>
  421eb3:	48 83 c4 08          	add    $0x8,%rsp
  421eb7:	c3                   	retq   
  421eb8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  421ebf:	00 

0000000000421ec0 <save_char>:
  421ec0:	8b 05 7e 42 20 00    	mov    0x20427e(%rip),%eax        # 626144 <gets_cnt>
  421ec6:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  421ecb:	7f 49                	jg     421f16 <save_char+0x56>
  421ecd:	8d 14 40             	lea    (%rax,%rax,2),%edx
  421ed0:	89 f9                	mov    %edi,%ecx
  421ed2:	c0 e9 04             	shr    $0x4,%cl
  421ed5:	83 e1 0f             	and    $0xf,%ecx
  421ed8:	0f b6 b1 60 3c 42 00 	movzbl 0x423c60(%rcx),%esi
  421edf:	48 63 ca             	movslq %edx,%rcx
  421ee2:	40 88 b1 40 55 62 00 	mov    %sil,0x625540(%rcx)
  421ee9:	8d 4a 01             	lea    0x1(%rdx),%ecx
  421eec:	83 e7 0f             	and    $0xf,%edi
  421eef:	0f b6 b7 60 3c 42 00 	movzbl 0x423c60(%rdi),%esi
  421ef6:	48 63 c9             	movslq %ecx,%rcx
  421ef9:	40 88 b1 40 55 62 00 	mov    %sil,0x625540(%rcx)
  421f00:	83 c2 02             	add    $0x2,%edx
  421f03:	48 63 d2             	movslq %edx,%rdx
  421f06:	c6 82 40 55 62 00 20 	movb   $0x20,0x625540(%rdx)
  421f0d:	83 c0 01             	add    $0x1,%eax
  421f10:	89 05 2e 42 20 00    	mov    %eax,0x20422e(%rip)        # 626144 <gets_cnt>
  421f16:	f3 c3                	repz retq 

0000000000421f18 <save_term>:
  421f18:	8b 05 26 42 20 00    	mov    0x204226(%rip),%eax        # 626144 <gets_cnt>
  421f1e:	8d 04 40             	lea    (%rax,%rax,2),%eax
  421f21:	48 98                	cltq   
  421f23:	c6 80 40 55 62 00 00 	movb   $0x0,0x625540(%rax)
  421f2a:	c3                   	retq   

0000000000421f2b <check_fail>:
  421f2b:	48 83 ec 08          	sub    $0x8,%rsp
  421f2f:	0f be 35 12 42 20 00 	movsbl 0x204212(%rip),%esi        # 626148 <target_prefix>
  421f36:	b9 40 55 62 00       	mov    $0x625540,%ecx
  421f3b:	8b 15 d7 35 20 00    	mov    0x2035d7(%rip),%edx        # 625518 <check_level>
  421f41:	bf 5b 39 42 00       	mov    $0x42395b,%edi
  421f46:	b8 00 00 00 00       	mov    $0x0,%eax
  421f4b:	e8 10 ee fd ff       	callq  400d60 <printf@plt>
  421f50:	bf 01 00 00 00       	mov    $0x1,%edi
  421f55:	e8 76 ee fd ff       	callq  400dd0 <exit@plt>

0000000000421f5a <Gets>:
  421f5a:	41 54                	push   %r12
  421f5c:	55                   	push   %rbp
  421f5d:	53                   	push   %rbx
  421f5e:	49 89 fc             	mov    %rdi,%r12
  421f61:	c7 05 d9 41 20 00 00 	movl   $0x0,0x2041d9(%rip)        # 626144 <gets_cnt>
  421f68:	00 00 00 
  421f6b:	48 89 fb             	mov    %rdi,%rbx
  421f6e:	eb 11                	jmp    421f81 <Gets+0x27>
  421f70:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  421f74:	88 03                	mov    %al,(%rbx)
  421f76:	0f b6 f8             	movzbl %al,%edi
  421f79:	e8 42 ff ff ff       	callq  421ec0 <save_char>
  421f7e:	48 89 eb             	mov    %rbp,%rbx
  421f81:	48 8b 3d 88 35 20 00 	mov    0x203588(%rip),%rdi        # 625510 <infile>
  421f88:	e8 d3 ee fd ff       	callq  400e60 <_IO_getc@plt>
  421f8d:	83 f8 ff             	cmp    $0xffffffff,%eax
  421f90:	74 05                	je     421f97 <Gets+0x3d>
  421f92:	83 f8 0a             	cmp    $0xa,%eax
  421f95:	75 d9                	jne    421f70 <Gets+0x16>
  421f97:	c6 03 00             	movb   $0x0,(%rbx)
  421f9a:	b8 00 00 00 00       	mov    $0x0,%eax
  421f9f:	e8 74 ff ff ff       	callq  421f18 <save_term>
  421fa4:	4c 89 e0             	mov    %r12,%rax
  421fa7:	5b                   	pop    %rbx
  421fa8:	5d                   	pop    %rbp
  421fa9:	41 5c                	pop    %r12
  421fab:	c3                   	retq   

0000000000421fac <notify_server>:
  421fac:	83 3d 75 35 20 00 00 	cmpl   $0x0,0x203575(%rip)        # 625528 <is_checker>
  421fb3:	0f 85 8e 01 00 00    	jne    422147 <notify_server+0x19b>
  421fb9:	53                   	push   %rbx
  421fba:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  421fc1:	89 fb                	mov    %edi,%ebx
  421fc3:	8b 05 7b 41 20 00    	mov    0x20417b(%rip),%eax        # 626144 <gets_cnt>
  421fc9:	83 c0 64             	add    $0x64,%eax
  421fcc:	3d 00 20 00 00       	cmp    $0x2000,%eax
  421fd1:	7e 19                	jle    421fec <notify_server+0x40>
  421fd3:	bf 90 3a 42 00       	mov    $0x423a90,%edi
  421fd8:	b8 00 00 00 00       	mov    $0x0,%eax
  421fdd:	e8 7e ed fd ff       	callq  400d60 <printf@plt>
  421fe2:	bf 01 00 00 00       	mov    $0x1,%edi
  421fe7:	e8 e4 ed fd ff       	callq  400dd0 <exit@plt>
  421fec:	44 0f be 0d 54 41 20 	movsbl 0x204154(%rip),%r9d        # 626148 <target_prefix>
  421ff3:	00 
  421ff4:	83 3d cd 34 20 00 00 	cmpl   $0x0,0x2034cd(%rip)        # 6254c8 <notify>
  421ffb:	74 09                	je     422006 <notify_server+0x5a>
  421ffd:	44 8b 05 1c 35 20 00 	mov    0x20351c(%rip),%r8d        # 625520 <authkey>
  422004:	eb 06                	jmp    42200c <notify_server+0x60>
  422006:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  42200c:	85 db                	test   %ebx,%ebx
  42200e:	74 07                	je     422017 <notify_server+0x6b>
  422010:	b9 71 39 42 00       	mov    $0x423971,%ecx
  422015:	eb 05                	jmp    42201c <notify_server+0x70>
  422017:	b9 76 39 42 00       	mov    $0x423976,%ecx
  42201c:	48 c7 44 24 08 40 55 	movq   $0x625540,0x8(%rsp)
  422023:	62 00 
  422025:	89 34 24             	mov    %esi,(%rsp)
  422028:	8b 15 5a 31 20 00    	mov    0x20315a(%rip),%edx        # 625188 <target_id>
  42202e:	be 7b 39 42 00       	mov    $0x42397b,%esi
  422033:	48 8d bc 24 10 20 00 	lea    0x2010(%rsp),%rdi
  42203a:	00 
  42203b:	b8 00 00 00 00       	mov    $0x0,%eax
  422040:	e8 3b ee fd ff       	callq  400e80 <sprintf@plt>
  422045:	83 3d 7c 34 20 00 00 	cmpl   $0x0,0x20347c(%rip)        # 6254c8 <notify>
  42204c:	74 78                	je     4220c6 <notify_server+0x11a>
  42204e:	4c 8d 4c 24 10       	lea    0x10(%rsp),%r9
  422053:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  422059:	48 8d 8c 24 10 20 00 	lea    0x2010(%rsp),%rcx
  422060:	00 
  422061:	48 8b 15 28 31 20 00 	mov    0x203128(%rip),%rdx        # 625190 <lab>
  422068:	48 8b 35 29 31 20 00 	mov    0x203129(%rip),%rsi        # 625198 <course>
  42206f:	48 8b 3d 0a 31 20 00 	mov    0x20310a(%rip),%rdi        # 625180 <user_id>
  422076:	e8 b3 0f 00 00       	callq  42302e <driver_post>
  42207b:	85 c0                	test   %eax,%eax
  42207d:	79 1e                	jns    42209d <notify_server+0xf1>
  42207f:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  422084:	bf 97 39 42 00       	mov    $0x423997,%edi
  422089:	b8 00 00 00 00       	mov    $0x0,%eax
  42208e:	e8 cd ec fd ff       	callq  400d60 <printf@plt>
  422093:	bf 01 00 00 00       	mov    $0x1,%edi
  422098:	e8 33 ed fd ff       	callq  400dd0 <exit@plt>
  42209d:	85 db                	test   %ebx,%ebx
  42209f:	74 19                	je     4220ba <notify_server+0x10e>
  4220a1:	bf c0 3a 42 00       	mov    $0x423ac0,%edi
  4220a6:	e8 05 ed fd ff       	callq  400db0 <puts@plt>
  4220ab:	bf a3 39 42 00       	mov    $0x4239a3,%edi
  4220b0:	e8 fb ec fd ff       	callq  400db0 <puts@plt>
  4220b5:	e9 85 00 00 00       	jmpq   42213f <notify_server+0x193>
  4220ba:	bf ad 39 42 00       	mov    $0x4239ad,%edi
  4220bf:	e8 ec ec fd ff       	callq  400db0 <puts@plt>
  4220c4:	eb 79                	jmp    42213f <notify_server+0x193>
  4220c6:	85 db                	test   %ebx,%ebx
  4220c8:	74 08                	je     4220d2 <notify_server+0x126>
  4220ca:	be 71 39 42 00       	mov    $0x423971,%esi
  4220cf:	90                   	nop
  4220d0:	eb 05                	jmp    4220d7 <notify_server+0x12b>
  4220d2:	be 76 39 42 00       	mov    $0x423976,%esi
  4220d7:	bf f8 3a 42 00       	mov    $0x423af8,%edi
  4220dc:	b8 00 00 00 00       	mov    $0x0,%eax
  4220e1:	e8 7a ec fd ff       	callq  400d60 <printf@plt>
  4220e6:	48 8b 35 93 30 20 00 	mov    0x203093(%rip),%rsi        # 625180 <user_id>
  4220ed:	bf b4 39 42 00       	mov    $0x4239b4,%edi
  4220f2:	b8 00 00 00 00       	mov    $0x0,%eax
  4220f7:	e8 64 ec fd ff       	callq  400d60 <printf@plt>
  4220fc:	48 8b 35 95 30 20 00 	mov    0x203095(%rip),%rsi        # 625198 <course>
  422103:	bf c1 39 42 00       	mov    $0x4239c1,%edi
  422108:	b8 00 00 00 00       	mov    $0x0,%eax
  42210d:	e8 4e ec fd ff       	callq  400d60 <printf@plt>
  422112:	48 8b 35 77 30 20 00 	mov    0x203077(%rip),%rsi        # 625190 <lab>
  422119:	bf cd 39 42 00       	mov    $0x4239cd,%edi
  42211e:	b8 00 00 00 00       	mov    $0x0,%eax
  422123:	e8 38 ec fd ff       	callq  400d60 <printf@plt>
  422128:	48 8d b4 24 10 20 00 	lea    0x2010(%rsp),%rsi
  42212f:	00 
  422130:	bf d6 39 42 00       	mov    $0x4239d6,%edi
  422135:	b8 00 00 00 00       	mov    $0x0,%eax
  42213a:	e8 21 ec fd ff       	callq  400d60 <printf@plt>
  42213f:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  422146:	5b                   	pop    %rbx
  422147:	f3 c3                	repz retq 

0000000000422149 <validate>:
  422149:	53                   	push   %rbx
  42214a:	89 fb                	mov    %edi,%ebx
  42214c:	83 3d d5 33 20 00 00 	cmpl   $0x0,0x2033d5(%rip)        # 625528 <is_checker>
  422153:	74 60                	je     4221b5 <validate+0x6c>
  422155:	39 3d c1 33 20 00    	cmp    %edi,0x2033c1(%rip)        # 62551c <vlevel>
  42215b:	74 14                	je     422171 <validate+0x28>
  42215d:	bf e2 39 42 00       	mov    $0x4239e2,%edi
  422162:	e8 49 ec fd ff       	callq  400db0 <puts@plt>
  422167:	b8 00 00 00 00       	mov    $0x0,%eax
  42216c:	e8 ba fd ff ff       	callq  421f2b <check_fail>
  422171:	8b 35 a1 33 20 00    	mov    0x2033a1(%rip),%esi        # 625518 <check_level>
  422177:	39 fe                	cmp    %edi,%esi
  422179:	74 1b                	je     422196 <validate+0x4d>
  42217b:	89 fa                	mov    %edi,%edx
  42217d:	bf 20 3b 42 00       	mov    $0x423b20,%edi
  422182:	b8 00 00 00 00       	mov    $0x0,%eax
  422187:	e8 d4 eb fd ff       	callq  400d60 <printf@plt>
  42218c:	b8 00 00 00 00       	mov    $0x0,%eax
  422191:	e8 95 fd ff ff       	callq  421f2b <check_fail>
  422196:	0f be 35 ab 3f 20 00 	movsbl 0x203fab(%rip),%esi        # 626148 <target_prefix>
  42219d:	b9 40 55 62 00       	mov    $0x625540,%ecx
  4221a2:	89 fa                	mov    %edi,%edx
  4221a4:	bf 00 3a 42 00       	mov    $0x423a00,%edi
  4221a9:	b8 00 00 00 00       	mov    $0x0,%eax
  4221ae:	e8 ad eb fd ff       	callq  400d60 <printf@plt>
  4221b3:	eb 44                	jmp    4221f9 <validate+0xb0>
  4221b5:	39 3d 61 33 20 00    	cmp    %edi,0x203361(%rip)        # 62551c <vlevel>
  4221bb:	74 18                	je     4221d5 <validate+0x8c>
  4221bd:	bf e2 39 42 00       	mov    $0x4239e2,%edi
  4221c2:	e8 e9 eb fd ff       	callq  400db0 <puts@plt>
  4221c7:	89 de                	mov    %ebx,%esi
  4221c9:	bf 00 00 00 00       	mov    $0x0,%edi
  4221ce:	e8 d9 fd ff ff       	callq  421fac <notify_server>
  4221d3:	eb 24                	jmp    4221f9 <validate+0xb0>
  4221d5:	0f be 15 6c 3f 20 00 	movsbl 0x203f6c(%rip),%edx        # 626148 <target_prefix>
  4221dc:	89 fe                	mov    %edi,%esi
  4221de:	bf 48 3b 42 00       	mov    $0x423b48,%edi
  4221e3:	b8 00 00 00 00       	mov    $0x0,%eax
  4221e8:	e8 73 eb fd ff       	callq  400d60 <printf@plt>
  4221ed:	89 de                	mov    %ebx,%esi
  4221ef:	bf 01 00 00 00       	mov    $0x1,%edi
  4221f4:	e8 b3 fd ff ff       	callq  421fac <notify_server>
  4221f9:	5b                   	pop    %rbx
  4221fa:	c3                   	retq   

00000000004221fb <fail>:
  4221fb:	48 83 ec 08          	sub    $0x8,%rsp
  4221ff:	83 3d 22 33 20 00 00 	cmpl   $0x0,0x203322(%rip)        # 625528 <is_checker>
  422206:	74 0a                	je     422212 <fail+0x17>
  422208:	b8 00 00 00 00       	mov    $0x0,%eax
  42220d:	e8 19 fd ff ff       	callq  421f2b <check_fail>
  422212:	89 fe                	mov    %edi,%esi
  422214:	bf 00 00 00 00       	mov    $0x0,%edi
  422219:	e8 8e fd ff ff       	callq  421fac <notify_server>
  42221e:	48 83 c4 08          	add    $0x8,%rsp
  422222:	c3                   	retq   

0000000000422223 <bushandler>:
  422223:	48 83 ec 08          	sub    $0x8,%rsp
  422227:	83 3d fa 32 20 00 00 	cmpl   $0x0,0x2032fa(%rip)        # 625528 <is_checker>
  42222e:	74 14                	je     422244 <bushandler+0x21>
  422230:	bf 15 3a 42 00       	mov    $0x423a15,%edi
  422235:	e8 76 eb fd ff       	callq  400db0 <puts@plt>
  42223a:	b8 00 00 00 00       	mov    $0x0,%eax
  42223f:	e8 e7 fc ff ff       	callq  421f2b <check_fail>
  422244:	bf 80 3b 42 00       	mov    $0x423b80,%edi
  422249:	e8 62 eb fd ff       	callq  400db0 <puts@plt>
  42224e:	bf 1f 3a 42 00       	mov    $0x423a1f,%edi
  422253:	e8 58 eb fd ff       	callq  400db0 <puts@plt>
  422258:	be 00 00 00 00       	mov    $0x0,%esi
  42225d:	bf 00 00 00 00       	mov    $0x0,%edi
  422262:	e8 45 fd ff ff       	callq  421fac <notify_server>
  422267:	bf 01 00 00 00       	mov    $0x1,%edi
  42226c:	e8 5f eb fd ff       	callq  400dd0 <exit@plt>

0000000000422271 <seghandler>:
  422271:	48 83 ec 08          	sub    $0x8,%rsp
  422275:	83 3d ac 32 20 00 00 	cmpl   $0x0,0x2032ac(%rip)        # 625528 <is_checker>
  42227c:	74 14                	je     422292 <seghandler+0x21>
  42227e:	bf 35 3a 42 00       	mov    $0x423a35,%edi
  422283:	e8 28 eb fd ff       	callq  400db0 <puts@plt>
  422288:	b8 00 00 00 00       	mov    $0x0,%eax
  42228d:	e8 99 fc ff ff       	callq  421f2b <check_fail>
  422292:	bf a0 3b 42 00       	mov    $0x423ba0,%edi
  422297:	e8 14 eb fd ff       	callq  400db0 <puts@plt>
  42229c:	bf 1f 3a 42 00       	mov    $0x423a1f,%edi
  4222a1:	e8 0a eb fd ff       	callq  400db0 <puts@plt>
  4222a6:	be 00 00 00 00       	mov    $0x0,%esi
  4222ab:	bf 00 00 00 00       	mov    $0x0,%edi
  4222b0:	e8 f7 fc ff ff       	callq  421fac <notify_server>
  4222b5:	bf 01 00 00 00       	mov    $0x1,%edi
  4222ba:	e8 11 eb fd ff       	callq  400dd0 <exit@plt>

00000000004222bf <illegalhandler>:
  4222bf:	48 83 ec 08          	sub    $0x8,%rsp
  4222c3:	83 3d 5e 32 20 00 00 	cmpl   $0x0,0x20325e(%rip)        # 625528 <is_checker>
  4222ca:	74 14                	je     4222e0 <illegalhandler+0x21>
  4222cc:	bf 48 3a 42 00       	mov    $0x423a48,%edi
  4222d1:	e8 da ea fd ff       	callq  400db0 <puts@plt>
  4222d6:	b8 00 00 00 00       	mov    $0x0,%eax
  4222db:	e8 4b fc ff ff       	callq  421f2b <check_fail>
  4222e0:	bf c8 3b 42 00       	mov    $0x423bc8,%edi
  4222e5:	e8 c6 ea fd ff       	callq  400db0 <puts@plt>
  4222ea:	bf 1f 3a 42 00       	mov    $0x423a1f,%edi
  4222ef:	e8 bc ea fd ff       	callq  400db0 <puts@plt>
  4222f4:	be 00 00 00 00       	mov    $0x0,%esi
  4222f9:	bf 00 00 00 00       	mov    $0x0,%edi
  4222fe:	e8 a9 fc ff ff       	callq  421fac <notify_server>
  422303:	bf 01 00 00 00       	mov    $0x1,%edi
  422308:	e8 c3 ea fd ff       	callq  400dd0 <exit@plt>

000000000042230d <sigalrmhandler>:
  42230d:	48 83 ec 08          	sub    $0x8,%rsp
  422311:	83 3d 10 32 20 00 00 	cmpl   $0x0,0x203210(%rip)        # 625528 <is_checker>
  422318:	74 14                	je     42232e <sigalrmhandler+0x21>
  42231a:	bf 5c 3a 42 00       	mov    $0x423a5c,%edi
  42231f:	e8 8c ea fd ff       	callq  400db0 <puts@plt>
  422324:	b8 00 00 00 00       	mov    $0x0,%eax
  422329:	e8 fd fb ff ff       	callq  421f2b <check_fail>
  42232e:	be 05 00 00 00       	mov    $0x5,%esi
  422333:	bf f8 3b 42 00       	mov    $0x423bf8,%edi
  422338:	b8 00 00 00 00       	mov    $0x0,%eax
  42233d:	e8 1e ea fd ff       	callq  400d60 <printf@plt>
  422342:	be 00 00 00 00       	mov    $0x0,%esi
  422347:	bf 00 00 00 00       	mov    $0x0,%edi
  42234c:	e8 5b fc ff ff       	callq  421fac <notify_server>
  422351:	bf 01 00 00 00       	mov    $0x1,%edi
  422356:	e8 75 ea fd ff       	callq  400dd0 <exit@plt>

000000000042235b <launch>:
  42235b:	55                   	push   %rbp
  42235c:	48 89 e5             	mov    %rsp,%rbp
  42235f:	48 89 fa             	mov    %rdi,%rdx
  422362:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  422366:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  42236a:	48 29 c4             	sub    %rax,%rsp
  42236d:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  422372:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  422376:	be f4 00 00 00       	mov    $0xf4,%esi
  42237b:	e8 f0 e9 fd ff       	callq  400d70 <memset@plt>
  422380:	48 8b 05 59 31 20 00 	mov    0x203159(%rip),%rax        # 6254e0 <stdin@@GLIBC_2.2.5>
  422387:	48 39 05 82 31 20 00 	cmp    %rax,0x203182(%rip)        # 625510 <infile>
  42238e:	75 0f                	jne    42239f <launch+0x44>
  422390:	bf 64 3a 42 00       	mov    $0x423a64,%edi
  422395:	b8 00 00 00 00       	mov    $0x0,%eax
  42239a:	e8 c1 e9 fd ff       	callq  400d60 <printf@plt>
  42239f:	c7 05 73 31 20 00 00 	movl   $0x0,0x203173(%rip)        # 62551c <vlevel>
  4223a6:	00 00 00 
  4223a9:	b8 00 00 00 00       	mov    $0x0,%eax
  4223ae:	e8 e1 fa ff ff       	callq  421e94 <test>
  4223b3:	83 3d 6e 31 20 00 00 	cmpl   $0x0,0x20316e(%rip)        # 625528 <is_checker>
  4223ba:	74 14                	je     4223d0 <launch+0x75>
  4223bc:	bf 71 3a 42 00       	mov    $0x423a71,%edi
  4223c1:	e8 ea e9 fd ff       	callq  400db0 <puts@plt>
  4223c6:	b8 00 00 00 00       	mov    $0x0,%eax
  4223cb:	e8 5b fb ff ff       	callq  421f2b <check_fail>
  4223d0:	bf 7c 3a 42 00       	mov    $0x423a7c,%edi
  4223d5:	e8 d6 e9 fd ff       	callq  400db0 <puts@plt>
  4223da:	c9                   	leaveq 
  4223db:	c3                   	retq   

00000000004223dc <stable_launch>:
  4223dc:	53                   	push   %rbx
  4223dd:	48 89 3d 24 31 20 00 	mov    %rdi,0x203124(%rip)        # 625508 <global_offset>
  4223e4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  4223ea:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  4223f0:	b9 32 01 00 00       	mov    $0x132,%ecx
  4223f5:	ba 07 00 00 00       	mov    $0x7,%edx
  4223fa:	be 00 00 10 00       	mov    $0x100000,%esi
  4223ff:	bf 00 60 58 55       	mov    $0x55586000,%edi
  422404:	e8 87 eb fd ff       	callq  400f90 <mmap@plt>
  422409:	48 89 c3             	mov    %rax,%rbx
  42240c:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  422412:	74 32                	je     422446 <stable_launch+0x6a>
  422414:	be 00 00 10 00       	mov    $0x100000,%esi
  422419:	48 89 c7             	mov    %rax,%rdi
  42241c:	e8 0f eb fd ff       	callq  400f30 <munmap@plt>
  422421:	ba 00 60 58 55       	mov    $0x55586000,%edx
  422426:	be 30 3c 42 00       	mov    $0x423c30,%esi
  42242b:	48 8b 3d be 30 20 00 	mov    0x2030be(%rip),%rdi        # 6254f0 <stderr@@GLIBC_2.2.5>
  422432:	b8 00 00 00 00       	mov    $0x0,%eax
  422437:	e8 14 eb fd ff       	callq  400f50 <fprintf@plt>
  42243c:	bf 01 00 00 00       	mov    $0x1,%edi
  422441:	e8 8a e9 fd ff       	callq  400dd0 <exit@plt>
  422446:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  42244d:	48 89 15 fc 3c 20 00 	mov    %rdx,0x203cfc(%rip)        # 626150 <stack_top>
  422454:	48 89 e0             	mov    %rsp,%rax
  422457:	48 89 d4             	mov    %rdx,%rsp
  42245a:	48 89 c2             	mov    %rax,%rdx
  42245d:	48 89 15 9c 30 20 00 	mov    %rdx,0x20309c(%rip)        # 625500 <global_save_stack>
  422464:	48 8b 3d 9d 30 20 00 	mov    0x20309d(%rip),%rdi        # 625508 <global_offset>
  42246b:	e8 eb fe ff ff       	callq  42235b <launch>
  422470:	48 8b 05 89 30 20 00 	mov    0x203089(%rip),%rax        # 625500 <global_save_stack>
  422477:	48 89 c4             	mov    %rax,%rsp
  42247a:	be 00 00 10 00       	mov    $0x100000,%esi
  42247f:	48 89 df             	mov    %rbx,%rdi
  422482:	e8 a9 ea fd ff       	callq  400f30 <munmap@plt>
  422487:	5b                   	pop    %rbx
  422488:	c3                   	retq   
  422489:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000422490 <rio_readinitb>:
  422490:	89 37                	mov    %esi,(%rdi)
  422492:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  422499:	48 8d 47 10          	lea    0x10(%rdi),%rax
  42249d:	48 89 47 08          	mov    %rax,0x8(%rdi)
  4224a1:	c3                   	retq   

00000000004224a2 <sigalrm_handler>:
  4224a2:	48 83 ec 08          	sub    $0x8,%rsp
  4224a6:	ba 00 00 00 00       	mov    $0x0,%edx
  4224ab:	be 70 3c 42 00       	mov    $0x423c70,%esi
  4224b0:	48 8b 3d 39 30 20 00 	mov    0x203039(%rip),%rdi        # 6254f0 <stderr@@GLIBC_2.2.5>
  4224b7:	b8 00 00 00 00       	mov    $0x0,%eax
  4224bc:	e8 8f ea fd ff       	callq  400f50 <fprintf@plt>
  4224c1:	bf 01 00 00 00       	mov    $0x1,%edi
  4224c6:	e8 05 e9 fd ff       	callq  400dd0 <exit@plt>

00000000004224cb <urlencode>:
  4224cb:	41 54                	push   %r12
  4224cd:	55                   	push   %rbp
  4224ce:	53                   	push   %rbx
  4224cf:	48 83 ec 10          	sub    $0x10,%rsp
  4224d3:	48 89 fb             	mov    %rdi,%rbx
  4224d6:	48 89 f5             	mov    %rsi,%rbp
  4224d9:	b8 00 00 00 00       	mov    $0x0,%eax
  4224de:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4224e5:	f2 ae                	repnz scas %es:(%rdi),%al
  4224e7:	48 f7 d1             	not    %rcx
  4224ea:	8d 41 ff             	lea    -0x1(%rcx),%eax
  4224ed:	e9 93 00 00 00       	jmpq   422585 <urlencode+0xba>
  4224f2:	0f b6 13             	movzbl (%rbx),%edx
  4224f5:	80 fa 2a             	cmp    $0x2a,%dl
  4224f8:	0f 94 c1             	sete   %cl
  4224fb:	80 fa 2d             	cmp    $0x2d,%dl
  4224fe:	0f 94 c0             	sete   %al
  422501:	08 c1                	or     %al,%cl
  422503:	75 1f                	jne    422524 <urlencode+0x59>
  422505:	80 fa 2e             	cmp    $0x2e,%dl
  422508:	74 1a                	je     422524 <urlencode+0x59>
  42250a:	80 fa 5f             	cmp    $0x5f,%dl
  42250d:	74 15                	je     422524 <urlencode+0x59>
  42250f:	8d 42 d0             	lea    -0x30(%rdx),%eax
  422512:	3c 09                	cmp    $0x9,%al
  422514:	76 0e                	jbe    422524 <urlencode+0x59>
  422516:	8d 42 bf             	lea    -0x41(%rdx),%eax
  422519:	3c 19                	cmp    $0x19,%al
  42251b:	76 07                	jbe    422524 <urlencode+0x59>
  42251d:	8d 42 9f             	lea    -0x61(%rdx),%eax
  422520:	3c 19                	cmp    $0x19,%al
  422522:	77 09                	ja     42252d <urlencode+0x62>
  422524:	88 55 00             	mov    %dl,0x0(%rbp)
  422527:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  42252b:	eb 51                	jmp    42257e <urlencode+0xb3>
  42252d:	80 fa 20             	cmp    $0x20,%dl
  422530:	75 0a                	jne    42253c <urlencode+0x71>
  422532:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  422536:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  42253a:	eb 42                	jmp    42257e <urlencode+0xb3>
  42253c:	8d 42 e0             	lea    -0x20(%rdx),%eax
  42253f:	3c 5f                	cmp    $0x5f,%al
  422541:	0f 96 c1             	setbe  %cl
  422544:	80 fa 09             	cmp    $0x9,%dl
  422547:	0f 94 c0             	sete   %al
  42254a:	08 c1                	or     %al,%cl
  42254c:	74 45                	je     422593 <urlencode+0xc8>
  42254e:	0f b6 d2             	movzbl %dl,%edx
  422551:	be 25 3d 42 00       	mov    $0x423d25,%esi
  422556:	48 89 e7             	mov    %rsp,%rdi
  422559:	b8 00 00 00 00       	mov    $0x0,%eax
  42255e:	e8 1d e9 fd ff       	callq  400e80 <sprintf@plt>
  422563:	0f b6 04 24          	movzbl (%rsp),%eax
  422567:	88 45 00             	mov    %al,0x0(%rbp)
  42256a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  42256f:	88 45 01             	mov    %al,0x1(%rbp)
  422572:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  422577:	88 45 02             	mov    %al,0x2(%rbp)
  42257a:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  42257e:	48 83 c3 01          	add    $0x1,%rbx
  422582:	44 89 e0             	mov    %r12d,%eax
  422585:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  422589:	85 c0                	test   %eax,%eax
  42258b:	0f 85 61 ff ff ff    	jne    4224f2 <urlencode+0x27>
  422591:	eb 05                	jmp    422598 <urlencode+0xcd>
  422593:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422598:	48 83 c4 10          	add    $0x10,%rsp
  42259c:	5b                   	pop    %rbx
  42259d:	5d                   	pop    %rbp
  42259e:	41 5c                	pop    %r12
  4225a0:	c3                   	retq   

00000000004225a1 <rio_writen>:
  4225a1:	41 55                	push   %r13
  4225a3:	41 54                	push   %r12
  4225a5:	55                   	push   %rbp
  4225a6:	53                   	push   %rbx
  4225a7:	48 83 ec 08          	sub    $0x8,%rsp
  4225ab:	41 89 fc             	mov    %edi,%r12d
  4225ae:	48 89 f5             	mov    %rsi,%rbp
  4225b1:	49 89 d5             	mov    %rdx,%r13
  4225b4:	48 89 d3             	mov    %rdx,%rbx
  4225b7:	eb 28                	jmp    4225e1 <rio_writen+0x40>
  4225b9:	48 89 da             	mov    %rbx,%rdx
  4225bc:	48 89 ee             	mov    %rbp,%rsi
  4225bf:	44 89 e7             	mov    %r12d,%edi
  4225c2:	e8 99 e9 fd ff       	callq  400f60 <write@plt>
  4225c7:	48 85 c0             	test   %rax,%rax
  4225ca:	7f 0f                	jg     4225db <rio_writen+0x3a>
  4225cc:	e8 2f e9 fd ff       	callq  400f00 <__errno_location@plt>
  4225d1:	83 38 04             	cmpl   $0x4,(%rax)
  4225d4:	75 15                	jne    4225eb <rio_writen+0x4a>
  4225d6:	b8 00 00 00 00       	mov    $0x0,%eax
  4225db:	48 29 c3             	sub    %rax,%rbx
  4225de:	48 01 c5             	add    %rax,%rbp
  4225e1:	48 85 db             	test   %rbx,%rbx
  4225e4:	75 d3                	jne    4225b9 <rio_writen+0x18>
  4225e6:	4c 89 e8             	mov    %r13,%rax
  4225e9:	eb 07                	jmp    4225f2 <rio_writen+0x51>
  4225eb:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4225f2:	48 83 c4 08          	add    $0x8,%rsp
  4225f6:	5b                   	pop    %rbx
  4225f7:	5d                   	pop    %rbp
  4225f8:	41 5c                	pop    %r12
  4225fa:	41 5d                	pop    %r13
  4225fc:	c3                   	retq   

00000000004225fd <rio_read>:
  4225fd:	41 56                	push   %r14
  4225ff:	41 55                	push   %r13
  422601:	41 54                	push   %r12
  422603:	55                   	push   %rbp
  422604:	53                   	push   %rbx
  422605:	48 89 fb             	mov    %rdi,%rbx
  422608:	49 89 f6             	mov    %rsi,%r14
  42260b:	49 89 d5             	mov    %rdx,%r13
  42260e:	4c 8d 67 10          	lea    0x10(%rdi),%r12
  422612:	eb 2a                	jmp    42263e <rio_read+0x41>
  422614:	ba 00 20 00 00       	mov    $0x2000,%edx
  422619:	4c 89 e6             	mov    %r12,%rsi
  42261c:	8b 3b                	mov    (%rbx),%edi
  42261e:	e8 dd e7 fd ff       	callq  400e00 <read@plt>
  422623:	89 43 04             	mov    %eax,0x4(%rbx)
  422626:	85 c0                	test   %eax,%eax
  422628:	79 0c                	jns    422636 <rio_read+0x39>
  42262a:	e8 d1 e8 fd ff       	callq  400f00 <__errno_location@plt>
  42262f:	83 38 04             	cmpl   $0x4,(%rax)
  422632:	74 0a                	je     42263e <rio_read+0x41>
  422634:	eb 37                	jmp    42266d <rio_read+0x70>
  422636:	85 c0                	test   %eax,%eax
  422638:	74 3c                	je     422676 <rio_read+0x79>
  42263a:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  42263e:	8b 6b 04             	mov    0x4(%rbx),%ebp
  422641:	85 ed                	test   %ebp,%ebp
  422643:	7e cf                	jle    422614 <rio_read+0x17>
  422645:	89 e8                	mov    %ebp,%eax
  422647:	4c 39 e8             	cmp    %r13,%rax
  42264a:	72 03                	jb     42264f <rio_read+0x52>
  42264c:	44 89 ed             	mov    %r13d,%ebp
  42264f:	4c 63 e5             	movslq %ebp,%r12
  422652:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  422656:	4c 89 e2             	mov    %r12,%rdx
  422659:	4c 89 f7             	mov    %r14,%rdi
  42265c:	e8 1f e9 fd ff       	callq  400f80 <memcpy@plt>
  422661:	4c 01 63 08          	add    %r12,0x8(%rbx)
  422665:	29 6b 04             	sub    %ebp,0x4(%rbx)
  422668:	4c 89 e0             	mov    %r12,%rax
  42266b:	eb 0e                	jmp    42267b <rio_read+0x7e>
  42266d:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  422674:	eb 05                	jmp    42267b <rio_read+0x7e>
  422676:	b8 00 00 00 00       	mov    $0x0,%eax
  42267b:	5b                   	pop    %rbx
  42267c:	5d                   	pop    %rbp
  42267d:	41 5c                	pop    %r12
  42267f:	41 5d                	pop    %r13
  422681:	41 5e                	pop    %r14
  422683:	c3                   	retq   

0000000000422684 <rio_readlineb>:
  422684:	41 55                	push   %r13
  422686:	41 54                	push   %r12
  422688:	55                   	push   %rbp
  422689:	53                   	push   %rbx
  42268a:	48 83 ec 18          	sub    $0x18,%rsp
  42268e:	49 89 fd             	mov    %rdi,%r13
  422691:	48 89 f5             	mov    %rsi,%rbp
  422694:	49 89 d4             	mov    %rdx,%r12
  422697:	bb 01 00 00 00       	mov    $0x1,%ebx
  42269c:	eb 3d                	jmp    4226db <rio_readlineb+0x57>
  42269e:	ba 01 00 00 00       	mov    $0x1,%edx
  4226a3:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  4226a8:	4c 89 ef             	mov    %r13,%rdi
  4226ab:	e8 4d ff ff ff       	callq  4225fd <rio_read>
  4226b0:	83 f8 01             	cmp    $0x1,%eax
  4226b3:	75 12                	jne    4226c7 <rio_readlineb+0x43>
  4226b5:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  4226b9:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  4226be:	88 45 00             	mov    %al,0x0(%rbp)
  4226c1:	3c 0a                	cmp    $0xa,%al
  4226c3:	75 0f                	jne    4226d4 <rio_readlineb+0x50>
  4226c5:	eb 1b                	jmp    4226e2 <rio_readlineb+0x5e>
  4226c7:	85 c0                	test   %eax,%eax
  4226c9:	75 23                	jne    4226ee <rio_readlineb+0x6a>
  4226cb:	48 83 fb 01          	cmp    $0x1,%rbx
  4226cf:	90                   	nop
  4226d0:	75 13                	jne    4226e5 <rio_readlineb+0x61>
  4226d2:	eb 23                	jmp    4226f7 <rio_readlineb+0x73>
  4226d4:	48 83 c3 01          	add    $0x1,%rbx
  4226d8:	48 89 d5             	mov    %rdx,%rbp
  4226db:	4c 39 e3             	cmp    %r12,%rbx
  4226de:	72 be                	jb     42269e <rio_readlineb+0x1a>
  4226e0:	eb 03                	jmp    4226e5 <rio_readlineb+0x61>
  4226e2:	48 89 d5             	mov    %rdx,%rbp
  4226e5:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  4226e9:	48 89 d8             	mov    %rbx,%rax
  4226ec:	eb 0e                	jmp    4226fc <rio_readlineb+0x78>
  4226ee:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4226f5:	eb 05                	jmp    4226fc <rio_readlineb+0x78>
  4226f7:	b8 00 00 00 00       	mov    $0x0,%eax
  4226fc:	48 83 c4 18          	add    $0x18,%rsp
  422700:	5b                   	pop    %rbx
  422701:	5d                   	pop    %rbp
  422702:	41 5c                	pop    %r12
  422704:	41 5d                	pop    %r13
  422706:	c3                   	retq   

0000000000422707 <submitr>:
  422707:	41 57                	push   %r15
  422709:	41 56                	push   %r14
  42270b:	41 55                	push   %r13
  42270d:	41 54                	push   %r12
  42270f:	55                   	push   %rbp
  422710:	53                   	push   %rbx
  422711:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  422718:	49 89 fc             	mov    %rdi,%r12
  42271b:	89 74 24 1c          	mov    %esi,0x1c(%rsp)
  42271f:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  422724:	49 89 cf             	mov    %rcx,%r15
  422727:	4d 89 c6             	mov    %r8,%r14
  42272a:	4d 89 cd             	mov    %r9,%r13
  42272d:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  422734:	00 
  422735:	c7 84 24 2c 20 00 00 	movl   $0x0,0x202c(%rsp)
  42273c:	00 00 00 00 
  422740:	ba 00 00 00 00       	mov    $0x0,%edx
  422745:	be 01 00 00 00       	mov    $0x1,%esi
  42274a:	bf 02 00 00 00       	mov    $0x2,%edi
  42274f:	e8 8c e7 fd ff       	callq  400ee0 <socket@plt>
  422754:	89 c5                	mov    %eax,%ebp
  422756:	85 c0                	test   %eax,%eax
  422758:	79 4e                	jns    4227a8 <submitr+0xa1>
  42275a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  422761:	3a 20 43 
  422764:	48 89 03             	mov    %rax,(%rbx)
  422767:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  42276e:	20 75 6e 
  422771:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422775:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  42277c:	74 6f 20 
  42277f:	48 89 43 10          	mov    %rax,0x10(%rbx)
  422783:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  42278a:	65 20 73 
  42278d:	48 89 43 18          	mov    %rax,0x18(%rbx)
  422791:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  422798:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  42279e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4227a3:	e9 83 06 00 00       	jmpq   422e2b <submitr+0x724>
  4227a8:	4c 89 e7             	mov    %r12,%rdi
  4227ab:	e8 e0 e5 fd ff       	callq  400d90 <gethostbyname@plt>
  4227b0:	48 85 c0             	test   %rax,%rax
  4227b3:	75 75                	jne    42282a <submitr+0x123>
  4227b5:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4227bc:	3a 20 44 
  4227bf:	48 89 03             	mov    %rax,(%rbx)
  4227c2:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4227c9:	20 75 6e 
  4227cc:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4227d0:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4227d7:	74 6f 20 
  4227da:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4227de:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4227e5:	76 65 20 
  4227e8:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4227ec:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  4227f3:	61 62 20 
  4227f6:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4227fa:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  422801:	72 20 61 
  422804:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422808:	c7 43 30 64 64 72 65 	movl   $0x65726464,0x30(%rbx)
  42280f:	66 c7 43 34 73 73    	movw   $0x7373,0x34(%rbx)
  422815:	c6 43 36 00          	movb   $0x0,0x36(%rbx)
  422819:	89 ef                	mov    %ebp,%edi
  42281b:	e8 60 e5 fd ff       	callq  400d80 <close@plt>
  422820:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422825:	e9 01 06 00 00       	jmpq   422e2b <submitr+0x724>
  42282a:	48 c7 84 24 40 a0 00 	movq   $0x0,0xa040(%rsp)
  422831:	00 00 00 00 00 
  422836:	48 c7 84 24 48 a0 00 	movq   $0x0,0xa048(%rsp)
  42283d:	00 00 00 00 00 
  422842:	66 c7 84 24 40 a0 00 	movw   $0x2,0xa040(%rsp)
  422849:	00 02 00 
  42284c:	48 8b 48 18          	mov    0x18(%rax),%rcx
  422850:	48 63 50 14          	movslq 0x14(%rax),%rdx
  422854:	48 8d b4 24 44 a0 00 	lea    0xa044(%rsp),%rsi
  42285b:	00 
  42285c:	48 8b 39             	mov    (%rcx),%rdi
  42285f:	e8 0c e6 fd ff       	callq  400e70 <bcopy@plt>
  422864:	0f b7 44 24 1c       	movzwl 0x1c(%rsp),%eax
  422869:	66 c1 c8 08          	ror    $0x8,%ax
  42286d:	66 89 84 24 42 a0 00 	mov    %ax,0xa042(%rsp)
  422874:	00 
  422875:	ba 10 00 00 00       	mov    $0x10,%edx
  42287a:	48 8d b4 24 40 a0 00 	lea    0xa040(%rsp),%rsi
  422881:	00 
  422882:	89 ef                	mov    %ebp,%edi
  422884:	e8 27 e6 fd ff       	callq  400eb0 <connect@plt>
  422889:	85 c0                	test   %eax,%eax
  42288b:	79 67                	jns    4228f4 <submitr+0x1ed>
  42288d:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  422894:	3a 20 55 
  422897:	48 89 03             	mov    %rax,(%rbx)
  42289a:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  4228a1:	20 74 6f 
  4228a4:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4228a8:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  4228af:	65 63 74 
  4228b2:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4228b6:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  4228bd:	68 65 20 
  4228c0:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4228c4:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  4228cb:	61 62 20 
  4228ce:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4228d2:	c7 43 28 73 65 72 76 	movl   $0x76726573,0x28(%rbx)
  4228d9:	66 c7 43 2c 65 72    	movw   $0x7265,0x2c(%rbx)
  4228df:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  4228e3:	89 ef                	mov    %ebp,%edi
  4228e5:	e8 96 e4 fd ff       	callq  400d80 <close@plt>
  4228ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4228ef:	e9 37 05 00 00       	jmpq   422e2b <submitr+0x724>
  4228f4:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4228fb:	4c 89 ef             	mov    %r13,%rdi
  4228fe:	b8 00 00 00 00       	mov    $0x0,%eax
  422903:	48 89 d1             	mov    %rdx,%rcx
  422906:	f2 ae                	repnz scas %es:(%rdi),%al
  422908:	48 f7 d1             	not    %rcx
  42290b:	48 89 ce             	mov    %rcx,%rsi
  42290e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  422913:	48 89 d1             	mov    %rdx,%rcx
  422916:	f2 ae                	repnz scas %es:(%rdi),%al
  422918:	48 f7 d1             	not    %rcx
  42291b:	49 89 c8             	mov    %rcx,%r8
  42291e:	4c 89 ff             	mov    %r15,%rdi
  422921:	48 89 d1             	mov    %rdx,%rcx
  422924:	f2 ae                	repnz scas %es:(%rdi),%al
  422926:	49 29 c8             	sub    %rcx,%r8
  422929:	4c 89 f7             	mov    %r14,%rdi
  42292c:	48 89 d1             	mov    %rdx,%rcx
  42292f:	f2 ae                	repnz scas %es:(%rdi),%al
  422931:	49 29 c8             	sub    %rcx,%r8
  422934:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  422939:	49 8d 44 00 7b       	lea    0x7b(%r8,%rax,1),%rax
  42293e:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  422944:	76 72                	jbe    4229b8 <submitr+0x2b1>
  422946:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  42294d:	3a 20 52 
  422950:	48 89 03             	mov    %rax,(%rbx)
  422953:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  42295a:	20 73 74 
  42295d:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422961:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  422968:	74 6f 6f 
  42296b:	48 89 43 10          	mov    %rax,0x10(%rbx)
  42296f:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  422976:	65 2e 20 
  422979:	48 89 43 18          	mov    %rax,0x18(%rbx)
  42297d:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  422984:	61 73 65 
  422987:	48 89 43 20          	mov    %rax,0x20(%rbx)
  42298b:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  422992:	49 54 52 
  422995:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422999:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  4229a0:	55 46 00 
  4229a3:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4229a7:	89 ef                	mov    %ebp,%edi
  4229a9:	e8 d2 e3 fd ff       	callq  400d80 <close@plt>
  4229ae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4229b3:	e9 73 04 00 00       	jmpq   422e2b <submitr+0x724>
  4229b8:	48 8d b4 24 30 40 00 	lea    0x4030(%rsp),%rsi
  4229bf:	00 
  4229c0:	b9 00 04 00 00       	mov    $0x400,%ecx
  4229c5:	b8 00 00 00 00       	mov    $0x0,%eax
  4229ca:	48 89 f7             	mov    %rsi,%rdi
  4229cd:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  4229d0:	4c 89 ef             	mov    %r13,%rdi
  4229d3:	e8 f3 fa ff ff       	callq  4224cb <urlencode>
  4229d8:	85 c0                	test   %eax,%eax
  4229da:	0f 89 8a 00 00 00    	jns    422a6a <submitr+0x363>
  4229e0:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4229e7:	3a 20 52 
  4229ea:	48 89 03             	mov    %rax,(%rbx)
  4229ed:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4229f4:	20 73 74 
  4229f7:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4229fb:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  422a02:	63 6f 6e 
  422a05:	48 89 43 10          	mov    %rax,0x10(%rbx)
  422a09:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  422a10:	20 61 6e 
  422a13:	48 89 43 18          	mov    %rax,0x18(%rbx)
  422a17:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  422a1e:	67 61 6c 
  422a21:	48 89 43 20          	mov    %rax,0x20(%rbx)
  422a25:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  422a2c:	6e 70 72 
  422a2f:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422a33:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  422a3a:	6c 65 20 
  422a3d:	48 89 43 30          	mov    %rax,0x30(%rbx)
  422a41:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  422a48:	63 74 65 
  422a4b:	48 89 43 38          	mov    %rax,0x38(%rbx)
  422a4f:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  422a55:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  422a59:	89 ef                	mov    %ebp,%edi
  422a5b:	e8 20 e3 fd ff       	callq  400d80 <close@plt>
  422a60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422a65:	e9 c1 03 00 00       	jmpq   422e2b <submitr+0x724>
  422a6a:	4c 89 24 24          	mov    %r12,(%rsp)
  422a6e:	4c 8d 8c 24 30 40 00 	lea    0x4030(%rsp),%r9
  422a75:	00 
  422a76:	4d 89 f8             	mov    %r15,%r8
  422a79:	4c 89 f1             	mov    %r14,%rcx
  422a7c:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  422a81:	be 98 3c 42 00       	mov    $0x423c98,%esi
  422a86:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  422a8d:	00 
  422a8e:	b8 00 00 00 00       	mov    $0x0,%eax
  422a93:	e8 e8 e3 fd ff       	callq  400e80 <sprintf@plt>
  422a98:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  422a9f:	00 
  422aa0:	b8 00 00 00 00       	mov    $0x0,%eax
  422aa5:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  422aac:	f2 ae                	repnz scas %es:(%rdi),%al
  422aae:	48 f7 d1             	not    %rcx
  422ab1:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  422ab5:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  422abc:	00 
  422abd:	89 ef                	mov    %ebp,%edi
  422abf:	e8 dd fa ff ff       	callq  4225a1 <rio_writen>
  422ac4:	48 85 c0             	test   %rax,%rax
  422ac7:	79 6b                	jns    422b34 <submitr+0x42d>
  422ac9:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  422ad0:	3a 20 43 
  422ad3:	48 89 03             	mov    %rax,(%rbx)
  422ad6:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  422add:	20 75 6e 
  422ae0:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422ae4:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  422aeb:	74 6f 20 
  422aee:	48 89 43 10          	mov    %rax,0x10(%rbx)
  422af2:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  422af9:	20 74 6f 
  422afc:	48 89 43 18          	mov    %rax,0x18(%rbx)
  422b00:	48 b8 20 74 68 65 20 	movabs $0x7475412065687420,%rax
  422b07:	41 75 74 
  422b0a:	48 89 43 20          	mov    %rax,0x20(%rbx)
  422b0e:	48 b8 6f 6c 61 62 20 	movabs $0x7265732062616c6f,%rax
  422b15:	73 65 72 
  422b18:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422b1c:	c7 43 30 76 65 72 00 	movl   $0x726576,0x30(%rbx)
  422b23:	89 ef                	mov    %ebp,%edi
  422b25:	e8 56 e2 fd ff       	callq  400d80 <close@plt>
  422b2a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422b2f:	e9 f7 02 00 00       	jmpq   422e2b <submitr+0x724>
  422b34:	89 ee                	mov    %ebp,%esi
  422b36:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  422b3d:	00 
  422b3e:	e8 4d f9 ff ff       	callq  422490 <rio_readinitb>
  422b43:	ba 00 20 00 00       	mov    $0x2000,%edx
  422b48:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  422b4f:	00 
  422b50:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  422b57:	00 
  422b58:	e8 27 fb ff ff       	callq  422684 <rio_readlineb>
  422b5d:	48 85 c0             	test   %rax,%rax
  422b60:	7f 7f                	jg     422be1 <submitr+0x4da>
  422b62:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  422b69:	3a 20 43 
  422b6c:	48 89 03             	mov    %rax,(%rbx)
  422b6f:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  422b76:	20 75 6e 
  422b79:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422b7d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  422b84:	74 6f 20 
  422b87:	48 89 43 10          	mov    %rax,0x10(%rbx)
  422b8b:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  422b92:	66 69 72 
  422b95:	48 89 43 18          	mov    %rax,0x18(%rbx)
  422b99:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  422ba0:	61 64 65 
  422ba3:	48 89 43 20          	mov    %rax,0x20(%rbx)
  422ba7:	48 b8 72 20 66 72 6f 	movabs $0x41206d6f72662072,%rax
  422bae:	6d 20 41 
  422bb1:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422bb5:	48 b8 75 74 6f 6c 61 	movabs $0x732062616c6f7475,%rax
  422bbc:	62 20 73 
  422bbf:	48 89 43 30          	mov    %rax,0x30(%rbx)
  422bc3:	c7 43 38 65 72 76 65 	movl   $0x65767265,0x38(%rbx)
  422bca:	66 c7 43 3c 72 00    	movw   $0x72,0x3c(%rbx)
  422bd0:	89 ef                	mov    %ebp,%edi
  422bd2:	e8 a9 e1 fd ff       	callq  400d80 <close@plt>
  422bd7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422bdc:	e9 4a 02 00 00       	jmpq   422e2b <submitr+0x724>
  422be1:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  422be6:	48 8d 8c 24 2c 20 00 	lea    0x202c(%rsp),%rcx
  422bed:	00 
  422bee:	48 8d 94 24 30 20 00 	lea    0x2030(%rsp),%rdx
  422bf5:	00 
  422bf6:	be 2c 3d 42 00       	mov    $0x423d2c,%esi
  422bfb:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  422c02:	00 
  422c03:	b8 00 00 00 00       	mov    $0x0,%eax
  422c08:	e8 b3 e1 fd ff       	callq  400dc0 <__isoc99_sscanf@plt>
  422c0d:	e9 95 00 00 00       	jmpq   422ca7 <submitr+0x5a0>
  422c12:	ba 00 20 00 00       	mov    $0x2000,%edx
  422c17:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  422c1e:	00 
  422c1f:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  422c26:	00 
  422c27:	e8 58 fa ff ff       	callq  422684 <rio_readlineb>
  422c2c:	48 85 c0             	test   %rax,%rax
  422c2f:	7f 76                	jg     422ca7 <submitr+0x5a0>
  422c31:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  422c38:	3a 20 43 
  422c3b:	48 89 03             	mov    %rax,(%rbx)
  422c3e:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  422c45:	20 75 6e 
  422c48:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422c4c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  422c53:	74 6f 20 
  422c56:	48 89 43 10          	mov    %rax,0x10(%rbx)
  422c5a:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  422c61:	68 65 61 
  422c64:	48 89 43 18          	mov    %rax,0x18(%rbx)
  422c68:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  422c6f:	66 72 6f 
  422c72:	48 89 43 20          	mov    %rax,0x20(%rbx)
  422c76:	48 b8 6d 20 41 75 74 	movabs $0x616c6f747541206d,%rax
  422c7d:	6f 6c 61 
  422c80:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422c84:	48 b8 62 20 73 65 72 	movabs $0x7265767265732062,%rax
  422c8b:	76 65 72 
  422c8e:	48 89 43 30          	mov    %rax,0x30(%rbx)
  422c92:	c6 43 38 00          	movb   $0x0,0x38(%rbx)
  422c96:	89 ef                	mov    %ebp,%edi
  422c98:	e8 e3 e0 fd ff       	callq  400d80 <close@plt>
  422c9d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422ca2:	e9 84 01 00 00       	jmpq   422e2b <submitr+0x724>
  422ca7:	0f b6 84 24 30 60 00 	movzbl 0x6030(%rsp),%eax
  422cae:	00 
  422caf:	83 e8 0d             	sub    $0xd,%eax
  422cb2:	75 15                	jne    422cc9 <submitr+0x5c2>
  422cb4:	0f b6 84 24 31 60 00 	movzbl 0x6031(%rsp),%eax
  422cbb:	00 
  422cbc:	83 e8 0a             	sub    $0xa,%eax
  422cbf:	75 08                	jne    422cc9 <submitr+0x5c2>
  422cc1:	0f b6 84 24 32 60 00 	movzbl 0x6032(%rsp),%eax
  422cc8:	00 
  422cc9:	85 c0                	test   %eax,%eax
  422ccb:	0f 85 41 ff ff ff    	jne    422c12 <submitr+0x50b>
  422cd1:	ba 00 20 00 00       	mov    $0x2000,%edx
  422cd6:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  422cdd:	00 
  422cde:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  422ce5:	00 
  422ce6:	e8 99 f9 ff ff       	callq  422684 <rio_readlineb>
  422ceb:	48 85 c0             	test   %rax,%rax
  422cee:	0f 8f 80 00 00 00    	jg     422d74 <submitr+0x66d>
  422cf4:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  422cfb:	3a 20 43 
  422cfe:	48 89 03             	mov    %rax,(%rbx)
  422d01:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  422d08:	20 75 6e 
  422d0b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422d0f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  422d16:	74 6f 20 
  422d19:	48 89 43 10          	mov    %rax,0x10(%rbx)
  422d1d:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  422d24:	73 74 61 
  422d27:	48 89 43 18          	mov    %rax,0x18(%rbx)
  422d2b:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  422d32:	65 73 73 
  422d35:	48 89 43 20          	mov    %rax,0x20(%rbx)
  422d39:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  422d40:	72 6f 6d 
  422d43:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422d47:	48 b8 20 41 75 74 6f 	movabs $0x62616c6f74754120,%rax
  422d4e:	6c 61 62 
  422d51:	48 89 43 30          	mov    %rax,0x30(%rbx)
  422d55:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
  422d5c:	65 72 00 
  422d5f:	48 89 43 38          	mov    %rax,0x38(%rbx)
  422d63:	89 ef                	mov    %ebp,%edi
  422d65:	e8 16 e0 fd ff       	callq  400d80 <close@plt>
  422d6a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422d6f:	e9 b7 00 00 00       	jmpq   422e2b <submitr+0x724>
  422d74:	8b 94 24 2c 20 00 00 	mov    0x202c(%rsp),%edx
  422d7b:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  422d81:	74 28                	je     422dab <submitr+0x6a4>
  422d83:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  422d88:	be f8 3c 42 00       	mov    $0x423cf8,%esi
  422d8d:	48 89 df             	mov    %rbx,%rdi
  422d90:	b8 00 00 00 00       	mov    $0x0,%eax
  422d95:	e8 e6 e0 fd ff       	callq  400e80 <sprintf@plt>
  422d9a:	89 ef                	mov    %ebp,%edi
  422d9c:	e8 df df fd ff       	callq  400d80 <close@plt>
  422da1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422da6:	e9 80 00 00 00       	jmpq   422e2b <submitr+0x724>
  422dab:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  422db2:	00 
  422db3:	48 89 df             	mov    %rbx,%rdi
  422db6:	e8 65 e1 fd ff       	callq  400f20 <strcpy@plt>
  422dbb:	89 ef                	mov    %ebp,%edi
  422dbd:	e8 be df fd ff       	callq  400d80 <close@plt>
  422dc2:	0f b6 03             	movzbl (%rbx),%eax
  422dc5:	83 e8 4f             	sub    $0x4f,%eax
  422dc8:	75 18                	jne    422de2 <submitr+0x6db>
  422dca:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
  422dce:	83 ea 4b             	sub    $0x4b,%edx
  422dd1:	75 11                	jne    422de4 <submitr+0x6dd>
  422dd3:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  422dd7:	83 ea 0a             	sub    $0xa,%edx
  422dda:	75 08                	jne    422de4 <submitr+0x6dd>
  422ddc:	0f b6 53 03          	movzbl 0x3(%rbx),%edx
  422de0:	eb 02                	jmp    422de4 <submitr+0x6dd>
  422de2:	89 c2                	mov    %eax,%edx
  422de4:	85 d2                	test   %edx,%edx
  422de6:	74 30                	je     422e18 <submitr+0x711>
  422de8:	bf 3d 3d 42 00       	mov    $0x423d3d,%edi
  422ded:	b9 05 00 00 00       	mov    $0x5,%ecx
  422df2:	48 89 de             	mov    %rbx,%rsi
  422df5:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  422df7:	0f 97 c1             	seta   %cl
  422dfa:	0f 92 c2             	setb   %dl
  422dfd:	38 d1                	cmp    %dl,%cl
  422dff:	74 1e                	je     422e1f <submitr+0x718>
  422e01:	85 c0                	test   %eax,%eax
  422e03:	75 0d                	jne    422e12 <submitr+0x70b>
  422e05:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  422e09:	83 e8 4b             	sub    $0x4b,%eax
  422e0c:	75 04                	jne    422e12 <submitr+0x70b>
  422e0e:	0f b6 43 02          	movzbl 0x2(%rbx),%eax
  422e12:	85 c0                	test   %eax,%eax
  422e14:	75 10                	jne    422e26 <submitr+0x71f>
  422e16:	eb 13                	jmp    422e2b <submitr+0x724>
  422e18:	b8 00 00 00 00       	mov    $0x0,%eax
  422e1d:	eb 0c                	jmp    422e2b <submitr+0x724>
  422e1f:	b8 00 00 00 00       	mov    $0x0,%eax
  422e24:	eb 05                	jmp    422e2b <submitr+0x724>
  422e26:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422e2b:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  422e32:	5b                   	pop    %rbx
  422e33:	5d                   	pop    %rbp
  422e34:	41 5c                	pop    %r12
  422e36:	41 5d                	pop    %r13
  422e38:	41 5e                	pop    %r14
  422e3a:	41 5f                	pop    %r15
  422e3c:	c3                   	retq   

0000000000422e3d <init_timeout>:
  422e3d:	53                   	push   %rbx
  422e3e:	89 fb                	mov    %edi,%ebx
  422e40:	85 ff                	test   %edi,%edi
  422e42:	74 1f                	je     422e63 <init_timeout+0x26>
  422e44:	85 ff                	test   %edi,%edi
  422e46:	79 05                	jns    422e4d <init_timeout+0x10>
  422e48:	bb 00 00 00 00       	mov    $0x0,%ebx
  422e4d:	be a2 24 42 00       	mov    $0x4224a2,%esi
  422e52:	bf 0e 00 00 00       	mov    $0xe,%edi
  422e57:	e8 74 e0 fd ff       	callq  400ed0 <signal@plt>
  422e5c:	89 df                	mov    %ebx,%edi
  422e5e:	e8 8d e0 fd ff       	callq  400ef0 <alarm@plt>
  422e63:	5b                   	pop    %rbx
  422e64:	c3                   	retq   

0000000000422e65 <init_driver>:
  422e65:	55                   	push   %rbp
  422e66:	53                   	push   %rbx
  422e67:	48 83 ec 18          	sub    $0x18,%rsp
  422e6b:	48 89 fd             	mov    %rdi,%rbp
  422e6e:	be 01 00 00 00       	mov    $0x1,%esi
  422e73:	bf 0d 00 00 00       	mov    $0xd,%edi
  422e78:	e8 53 e0 fd ff       	callq  400ed0 <signal@plt>
  422e7d:	be 01 00 00 00       	mov    $0x1,%esi
  422e82:	bf 1d 00 00 00       	mov    $0x1d,%edi
  422e87:	e8 44 e0 fd ff       	callq  400ed0 <signal@plt>
  422e8c:	be 01 00 00 00       	mov    $0x1,%esi
  422e91:	bf 1d 00 00 00       	mov    $0x1d,%edi
  422e96:	e8 35 e0 fd ff       	callq  400ed0 <signal@plt>
  422e9b:	ba 00 00 00 00       	mov    $0x0,%edx
  422ea0:	be 01 00 00 00       	mov    $0x1,%esi
  422ea5:	bf 02 00 00 00       	mov    $0x2,%edi
  422eaa:	e8 31 e0 fd ff       	callq  400ee0 <socket@plt>
  422eaf:	89 c3                	mov    %eax,%ebx
  422eb1:	85 c0                	test   %eax,%eax
  422eb3:	79 4f                	jns    422f04 <init_driver+0x9f>
  422eb5:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  422ebc:	3a 20 43 
  422ebf:	48 89 45 00          	mov    %rax,0x0(%rbp)
  422ec3:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  422eca:	20 75 6e 
  422ecd:	48 89 45 08          	mov    %rax,0x8(%rbp)
  422ed1:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  422ed8:	74 6f 20 
  422edb:	48 89 45 10          	mov    %rax,0x10(%rbp)
  422edf:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  422ee6:	65 20 73 
  422ee9:	48 89 45 18          	mov    %rax,0x18(%rbp)
  422eed:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  422ef4:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  422efa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422eff:	e9 23 01 00 00       	jmpq   423027 <init_driver+0x1c2>
  422f04:	bf 42 3d 42 00       	mov    $0x423d42,%edi
  422f09:	e8 82 de fd ff       	callq  400d90 <gethostbyname@plt>
  422f0e:	48 85 c0             	test   %rax,%rax
  422f11:	75 68                	jne    422f7b <init_driver+0x116>
  422f13:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  422f1a:	3a 20 44 
  422f1d:	48 89 45 00          	mov    %rax,0x0(%rbp)
  422f21:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  422f28:	20 75 6e 
  422f2b:	48 89 45 08          	mov    %rax,0x8(%rbp)
  422f2f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  422f36:	74 6f 20 
  422f39:	48 89 45 10          	mov    %rax,0x10(%rbp)
  422f3d:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  422f44:	76 65 20 
  422f47:	48 89 45 18          	mov    %rax,0x18(%rbp)
  422f4b:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  422f52:	72 20 61 
  422f55:	48 89 45 20          	mov    %rax,0x20(%rbp)
  422f59:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  422f60:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  422f66:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  422f6a:	89 df                	mov    %ebx,%edi
  422f6c:	e8 0f de fd ff       	callq  400d80 <close@plt>
  422f71:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422f76:	e9 ac 00 00 00       	jmpq   423027 <init_driver+0x1c2>
  422f7b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  422f82:	00 
  422f83:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  422f8a:	00 00 
  422f8c:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  422f92:	48 8b 48 18          	mov    0x18(%rax),%rcx
  422f96:	48 63 50 14          	movslq 0x14(%rax),%rdx
  422f9a:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  422f9f:	48 8b 39             	mov    (%rcx),%rdi
  422fa2:	e8 c9 de fd ff       	callq  400e70 <bcopy@plt>
  422fa7:	66 c7 44 24 02 00 50 	movw   $0x5000,0x2(%rsp)
  422fae:	ba 10 00 00 00       	mov    $0x10,%edx
  422fb3:	48 89 e6             	mov    %rsp,%rsi
  422fb6:	89 df                	mov    %ebx,%edi
  422fb8:	e8 f3 de fd ff       	callq  400eb0 <connect@plt>
  422fbd:	85 c0                	test   %eax,%eax
  422fbf:	79 50                	jns    423011 <init_driver+0x1ac>
  422fc1:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  422fc8:	3a 20 55 
  422fcb:	48 89 45 00          	mov    %rax,0x0(%rbp)
  422fcf:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  422fd6:	20 74 6f 
  422fd9:	48 89 45 08          	mov    %rax,0x8(%rbp)
  422fdd:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  422fe4:	65 63 74 
  422fe7:	48 89 45 10          	mov    %rax,0x10(%rbp)
  422feb:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  422ff2:	65 72 76 
  422ff5:	48 89 45 18          	mov    %rax,0x18(%rbp)
  422ff9:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  422fff:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  423003:	89 df                	mov    %ebx,%edi
  423005:	e8 76 dd fd ff       	callq  400d80 <close@plt>
  42300a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  42300f:	eb 16                	jmp    423027 <init_driver+0x1c2>
  423011:	89 df                	mov    %ebx,%edi
  423013:	e8 68 dd fd ff       	callq  400d80 <close@plt>
  423018:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  42301e:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  423022:	b8 00 00 00 00       	mov    $0x0,%eax
  423027:	48 83 c4 18          	add    $0x18,%rsp
  42302b:	5b                   	pop    %rbx
  42302c:	5d                   	pop    %rbp
  42302d:	c3                   	retq   

000000000042302e <driver_post>:
  42302e:	53                   	push   %rbx
  42302f:	48 83 ec 10          	sub    $0x10,%rsp
  423033:	4c 89 cb             	mov    %r9,%rbx
  423036:	45 85 c0             	test   %r8d,%r8d
  423039:	74 22                	je     42305d <driver_post+0x2f>
  42303b:	48 89 ce             	mov    %rcx,%rsi
  42303e:	bf 59 3d 42 00       	mov    $0x423d59,%edi
  423043:	b8 00 00 00 00       	mov    $0x0,%eax
  423048:	e8 13 dd fd ff       	callq  400d60 <printf@plt>
  42304d:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  423052:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  423056:	b8 00 00 00 00       	mov    $0x0,%eax
  42305b:	eb 39                	jmp    423096 <driver_post+0x68>
  42305d:	48 85 ff             	test   %rdi,%rdi
  423060:	74 26                	je     423088 <driver_post+0x5a>
  423062:	80 3f 00             	cmpb   $0x0,(%rdi)
  423065:	74 21                	je     423088 <driver_post+0x5a>
  423067:	4c 89 0c 24          	mov    %r9,(%rsp)
  42306b:	49 89 c9             	mov    %rcx,%r9
  42306e:	49 89 d0             	mov    %rdx,%r8
  423071:	48 89 f9             	mov    %rdi,%rcx
  423074:	48 89 f2             	mov    %rsi,%rdx
  423077:	be 50 00 00 00       	mov    $0x50,%esi
  42307c:	bf 42 3d 42 00       	mov    $0x423d42,%edi
  423081:	e8 81 f6 ff ff       	callq  422707 <submitr>
  423086:	eb 0e                	jmp    423096 <driver_post+0x68>
  423088:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  42308d:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  423091:	b8 00 00 00 00       	mov    $0x0,%eax
  423096:	48 83 c4 10          	add    $0x10,%rsp
  42309a:	5b                   	pop    %rbx
  42309b:	c3                   	retq   

000000000042309c <check>:
  42309c:	89 f8                	mov    %edi,%eax
  42309e:	c1 e8 1c             	shr    $0x1c,%eax
  4230a1:	85 c0                	test   %eax,%eax
  4230a3:	74 1d                	je     4230c2 <check+0x26>
  4230a5:	b9 00 00 00 00       	mov    $0x0,%ecx
  4230aa:	eb 0b                	jmp    4230b7 <check+0x1b>
  4230ac:	89 f8                	mov    %edi,%eax
  4230ae:	d3 e8                	shr    %cl,%eax
  4230b0:	3c 0a                	cmp    $0xa,%al
  4230b2:	74 14                	je     4230c8 <check+0x2c>
  4230b4:	83 c1 08             	add    $0x8,%ecx
  4230b7:	83 f9 1f             	cmp    $0x1f,%ecx
  4230ba:	7e f0                	jle    4230ac <check+0x10>
  4230bc:	b8 01 00 00 00       	mov    $0x1,%eax
  4230c1:	c3                   	retq   
  4230c2:	b8 00 00 00 00       	mov    $0x0,%eax
  4230c7:	c3                   	retq   
  4230c8:	b8 00 00 00 00       	mov    $0x0,%eax
  4230cd:	c3                   	retq   

00000000004230ce <gencookie>:
  4230ce:	53                   	push   %rbx
  4230cf:	83 c7 01             	add    $0x1,%edi
  4230d2:	e8 69 dd fd ff       	callq  400e40 <srandom@plt>
  4230d7:	e8 64 de fd ff       	callq  400f40 <random@plt>
  4230dc:	89 c3                	mov    %eax,%ebx
  4230de:	89 c7                	mov    %eax,%edi
  4230e0:	e8 b7 ff ff ff       	callq  42309c <check>
  4230e5:	85 c0                	test   %eax,%eax
  4230e7:	74 ee                	je     4230d7 <gencookie+0x9>
  4230e9:	89 d8                	mov    %ebx,%eax
  4230eb:	5b                   	pop    %rbx
  4230ec:	c3                   	retq   

00000000004230ed <checkhash>:
  4230ed:	53                   	push   %rbx
  4230ee:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  4230f5:	48 b8 6d 32 30 2d 31 	movabs $0x313638312d30326d,%rax
  4230fc:	38 36 31 
  4230ff:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  423106:	00 
  423107:	66 c7 84 24 e8 00 00 	movw   $0x33,0xe8(%rsp)
  42310e:	00 33 00 
  423111:	48 b8 61 74 74 61 63 	movabs $0x616c6b6361747461,%rax
  423118:	6b 6c 61 
  42311b:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
  423122:	00 
  423123:	66 c7 84 24 d8 00 00 	movw   $0x62,0xd8(%rsp)
  42312a:	00 62 00 
  42312d:	48 b8 42 4f 4f 47 41 	movabs $0x4f4f4241474f4f42,%rax
  423134:	42 4f 4f 
  423137:	48 89 84 24 c0 00 00 	mov    %rax,0xc0(%rsp)
  42313e:	00 
  42313f:	66 c7 84 24 c8 00 00 	movw   $0x4147,0xc8(%rsp)
  423146:	00 47 41 
  423149:	c6 84 24 ca 00 00 00 	movb   $0x0,0xca(%rsp)
  423150:	00 
  423151:	48 b8 6b 65 79 2e 74 	movabs $0x7478742e79656b,%rax
  423158:	78 74 00 
  42315b:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
  423162:	00 
  423163:	be 1d 3a 42 00       	mov    $0x423a1d,%esi
  423168:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  42316f:	00 
  423170:	e8 ab dc fd ff       	callq  400e20 <fopen@plt>
  423175:	48 89 c3             	mov    %rax,%rbx
  423178:	48 85 c0             	test   %rax,%rax
  42317b:	75 21                	jne    42319e <checkhash+0xb1>
  42317d:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
  423184:	00 
  423185:	bf 78 3d 42 00       	mov    $0x423d78,%edi
  42318a:	b8 00 00 00 00       	mov    $0x0,%eax
  42318f:	e8 cc db fd ff       	callq  400d60 <printf@plt>
  423194:	bf 01 00 00 00       	mov    $0x1,%edi
  423199:	e8 32 dc fd ff       	callq  400dd0 <exit@plt>
  42319e:	48 89 c2             	mov    %rax,%rdx
  4231a1:	be 0a 00 00 00       	mov    $0xa,%esi
  4231a6:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  4231ad:	00 
  4231ae:	e8 9d dc fd ff       	callq  400e50 <fgets@plt>
  4231b3:	48 85 c0             	test   %rax,%rax
  4231b6:	75 1c                	jne    4231d4 <checkhash+0xe7>
  4231b8:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
  4231bf:	00 
  4231c0:	bf b0 3d 42 00       	mov    $0x423db0,%edi
  4231c5:	e8 96 db fd ff       	callq  400d60 <printf@plt>
  4231ca:	bf 01 00 00 00       	mov    $0x1,%edi
  4231cf:	e8 fc db fd ff       	callq  400dd0 <exit@plt>
  4231d4:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  4231db:	00 
  4231dc:	b8 00 00 00 00       	mov    $0x0,%eax
  4231e1:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4231e8:	f2 ae                	repnz scas %es:(%rdi),%al
  4231ea:	48 f7 d1             	not    %rcx
  4231ed:	48 83 e9 02          	sub    $0x2,%rcx
  4231f1:	80 bc 0c a0 00 00 00 	cmpb   $0xa,0xa0(%rsp,%rcx,1)
  4231f8:	0a 
  4231f9:	75 08                	jne    423203 <checkhash+0x116>
  4231fb:	c6 84 0c a0 00 00 00 	movb   $0x0,0xa0(%rsp,%rcx,1)
  423202:	00 
  423203:	48 89 da             	mov    %rbx,%rdx
  423206:	be 21 00 00 00       	mov    $0x21,%esi
  42320b:	48 89 e7             	mov    %rsp,%rdi
  42320e:	e8 3d dc fd ff       	callq  400e50 <fgets@plt>
  423213:	48 85 c0             	test   %rax,%rax
  423216:	75 1c                	jne    423234 <checkhash+0x147>
  423218:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
  42321f:	00 
  423220:	bf d8 3d 42 00       	mov    $0x423dd8,%edi
  423225:	e8 36 db fd ff       	callq  400d60 <printf@plt>
  42322a:	bf 01 00 00 00       	mov    $0x1,%edi
  42322f:	e8 9c db fd ff       	callq  400dd0 <exit@plt>
  423234:	48 89 e7             	mov    %rsp,%rdi
  423237:	b8 00 00 00 00       	mov    $0x0,%eax
  42323c:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  423243:	f2 ae                	repnz scas %es:(%rdi),%al
  423245:	48 f7 d1             	not    %rcx
  423248:	48 83 e9 02          	sub    $0x2,%rcx
  42324c:	80 3c 0c 0a          	cmpb   $0xa,(%rsp,%rcx,1)
  423250:	75 04                	jne    423256 <checkhash+0x169>
  423252:	c6 04 0c 00          	movb   $0x0,(%rsp,%rcx,1)
  423256:	c6 44 24 60 00       	movb   $0x0,0x60(%rsp)
  42325b:	48 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%rsi
  423262:	00 
  423263:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  423268:	e8 23 dc fd ff       	callq  400e90 <strcat@plt>
  42326d:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
  423274:	00 
  423275:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  42327a:	e8 11 dc fd ff       	callq  400e90 <strcat@plt>
  42327f:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
  423286:	00 
  423287:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  42328c:	e8 ff db fd ff       	callq  400e90 <strcat@plt>
  423291:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  423298:	00 
  423299:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  42329e:	e8 ed db fd ff       	callq  400e90 <strcat@plt>
  4232a3:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  4232a8:	b8 00 00 00 00       	mov    $0x0,%eax
  4232ad:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4232b4:	f2 ae                	repnz scas %es:(%rdi),%al
  4232b6:	48 f7 d1             	not    %rcx
  4232b9:	48 8d 71 ff          	lea    -0x1(%rcx),%rsi
  4232bd:	48 8d 94 24 90 00 00 	lea    0x90(%rsp),%rdx
  4232c4:	00 
  4232c5:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  4232ca:	e8 81 da fd ff       	callq  400d50 <MD5@plt>
  4232cf:	bb 00 00 00 00       	mov    $0x0,%ebx
  4232d4:	eb 43                	jmp    423319 <checkhash+0x22c>
  4232d6:	48 63 c3             	movslq %ebx,%rax
  4232d9:	8d 3c 1b             	lea    (%rbx,%rbx,1),%edi
  4232dc:	0f b6 94 04 90 00 00 	movzbl 0x90(%rsp,%rax,1),%edx
  4232e3:	00 
  4232e4:	48 63 ff             	movslq %edi,%rdi
  4232e7:	48 8d 44 24 30       	lea    0x30(%rsp),%rax
  4232ec:	48 01 c7             	add    %rax,%rdi
  4232ef:	be 70 3d 42 00       	mov    $0x423d70,%esi
  4232f4:	b8 00 00 00 00       	mov    $0x0,%eax
  4232f9:	e8 82 db fd ff       	callq  400e80 <sprintf@plt>
  4232fe:	85 c0                	test   %eax,%eax
  423300:	79 14                	jns    423316 <checkhash+0x229>
  423302:	bf 00 3e 42 00       	mov    $0x423e00,%edi
  423307:	e8 a4 da fd ff       	callq  400db0 <puts@plt>
  42330c:	bf 01 00 00 00       	mov    $0x1,%edi
  423311:	e8 ba da fd ff       	callq  400dd0 <exit@plt>
  423316:	83 c3 01             	add    $0x1,%ebx
  423319:	83 fb 0f             	cmp    $0xf,%ebx
  42331c:	76 b8                	jbe    4232d6 <checkhash+0x1e9>
  42331e:	48 89 e6             	mov    %rsp,%rsi
  423321:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  423326:	e8 e5 db fd ff       	callq  400f10 <strcmp@plt>
  42332b:	85 c0                	test   %eax,%eax
  42332d:	75 04                	jne    423333 <checkhash+0x246>
  42332f:	b0 01                	mov    $0x1,%al
  423331:	eb 05                	jmp    423338 <checkhash+0x24b>
  423333:	b8 00 00 00 00       	mov    $0x0,%eax
  423338:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
  42333f:	5b                   	pop    %rbx
  423340:	c3                   	retq   
  423341:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  423348:	00 00 00 
  42334b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000423350 <__libc_csu_init>:
  423350:	41 57                	push   %r15
  423352:	41 89 ff             	mov    %edi,%r15d
  423355:	41 56                	push   %r14
  423357:	49 89 f6             	mov    %rsi,%r14
  42335a:	41 55                	push   %r13
  42335c:	49 89 d5             	mov    %rdx,%r13
  42335f:	41 54                	push   %r12
  423361:	4c 8d 25 98 1a 20 00 	lea    0x201a98(%rip),%r12        # 624e00 <__frame_dummy_init_array_entry>
  423368:	55                   	push   %rbp
  423369:	48 8d 2d 98 1a 20 00 	lea    0x201a98(%rip),%rbp        # 624e08 <__init_array_end>
  423370:	53                   	push   %rbx
  423371:	4c 29 e5             	sub    %r12,%rbp
  423374:	31 db                	xor    %ebx,%ebx
  423376:	48 c1 fd 03          	sar    $0x3,%rbp
  42337a:	48 83 ec 08          	sub    $0x8,%rsp
  42337e:	e8 9d d9 fd ff       	callq  400d20 <_init>
  423383:	48 85 ed             	test   %rbp,%rbp
  423386:	74 1e                	je     4233a6 <__libc_csu_init+0x56>
  423388:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  42338f:	00 
  423390:	4c 89 ea             	mov    %r13,%rdx
  423393:	4c 89 f6             	mov    %r14,%rsi
  423396:	44 89 ff             	mov    %r15d,%edi
  423399:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  42339d:	48 83 c3 01          	add    $0x1,%rbx
  4233a1:	48 39 eb             	cmp    %rbp,%rbx
  4233a4:	75 ea                	jne    423390 <__libc_csu_init+0x40>
  4233a6:	48 83 c4 08          	add    $0x8,%rsp
  4233aa:	5b                   	pop    %rbx
  4233ab:	5d                   	pop    %rbp
  4233ac:	41 5c                	pop    %r12
  4233ae:	41 5d                	pop    %r13
  4233b0:	41 5e                	pop    %r14
  4233b2:	41 5f                	pop    %r15
  4233b4:	c3                   	retq   
  4233b5:	90                   	nop
  4233b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4233bd:	00 00 00 

00000000004233c0 <__libc_csu_fini>:
  4233c0:	f3 c3                	repz retq 

Disassembly of section .init:

0000000000400d20 <_init>:
  400d20:	48 83 ec 08          	sub    $0x8,%rsp
  400d24:	48 8b 05 cd 42 22 00 	mov    0x2242cd(%rip),%rax        # 624ff8 <__gmon_start__>
  400d2b:	48 85 c0             	test   %rax,%rax
  400d2e:	74 05                	je     400d35 <_init+0x15>
  400d30:	e8 6b 00 00 00       	callq  400da0 <__gmon_start__@plt>
  400d35:	48 83 c4 08          	add    $0x8,%rsp
  400d39:	c3                   	retq   

Disassembly of section .plt:

0000000000400d40 <.plt>:
  400d40:	ff 35 c2 42 22 00    	pushq  0x2242c2(%rip)        # 625008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400d46:	ff 25 c4 42 22 00    	jmpq   *0x2242c4(%rip)        # 625010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400d4c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400d50 <MD5@plt>:
  400d50:	ff 25 c2 42 22 00    	jmpq   *0x2242c2(%rip)        # 625018 <MD5@libcrypto.so.10>
  400d56:	68 00 00 00 00       	pushq  $0x0
  400d5b:	e9 e0 ff ff ff       	jmpq   400d40 <.plt>

0000000000400d60 <printf@plt>:
  400d60:	ff 25 ba 42 22 00    	jmpq   *0x2242ba(%rip)        # 625020 <printf@GLIBC_2.2.5>
  400d66:	68 01 00 00 00       	pushq  $0x1
  400d6b:	e9 d0 ff ff ff       	jmpq   400d40 <.plt>

0000000000400d70 <memset@plt>:
  400d70:	ff 25 b2 42 22 00    	jmpq   *0x2242b2(%rip)        # 625028 <memset@GLIBC_2.2.5>
  400d76:	68 02 00 00 00       	pushq  $0x2
  400d7b:	e9 c0 ff ff ff       	jmpq   400d40 <.plt>

0000000000400d80 <close@plt>:
  400d80:	ff 25 aa 42 22 00    	jmpq   *0x2242aa(%rip)        # 625030 <close@GLIBC_2.2.5>
  400d86:	68 03 00 00 00       	pushq  $0x3
  400d8b:	e9 b0 ff ff ff       	jmpq   400d40 <.plt>

0000000000400d90 <gethostbyname@plt>:
  400d90:	ff 25 a2 42 22 00    	jmpq   *0x2242a2(%rip)        # 625038 <gethostbyname@GLIBC_2.2.5>
  400d96:	68 04 00 00 00       	pushq  $0x4
  400d9b:	e9 a0 ff ff ff       	jmpq   400d40 <.plt>

0000000000400da0 <__gmon_start__@plt>:
  400da0:	ff 25 9a 42 22 00    	jmpq   *0x22429a(%rip)        # 625040 <__gmon_start__>
  400da6:	68 05 00 00 00       	pushq  $0x5
  400dab:	e9 90 ff ff ff       	jmpq   400d40 <.plt>

0000000000400db0 <puts@plt>:
  400db0:	ff 25 92 42 22 00    	jmpq   *0x224292(%rip)        # 625048 <puts@GLIBC_2.2.5>
  400db6:	68 06 00 00 00       	pushq  $0x6
  400dbb:	e9 80 ff ff ff       	jmpq   400d40 <.plt>

0000000000400dc0 <__isoc99_sscanf@plt>:
  400dc0:	ff 25 8a 42 22 00    	jmpq   *0x22428a(%rip)        # 625050 <__isoc99_sscanf@GLIBC_2.7>
  400dc6:	68 07 00 00 00       	pushq  $0x7
  400dcb:	e9 70 ff ff ff       	jmpq   400d40 <.plt>

0000000000400dd0 <exit@plt>:
  400dd0:	ff 25 82 42 22 00    	jmpq   *0x224282(%rip)        # 625058 <exit@GLIBC_2.2.5>
  400dd6:	68 08 00 00 00       	pushq  $0x8
  400ddb:	e9 60 ff ff ff       	jmpq   400d40 <.plt>

0000000000400de0 <strcasecmp@plt>:
  400de0:	ff 25 7a 42 22 00    	jmpq   *0x22427a(%rip)        # 625060 <strcasecmp@GLIBC_2.2.5>
  400de6:	68 09 00 00 00       	pushq  $0x9
  400deb:	e9 50 ff ff ff       	jmpq   400d40 <.plt>

0000000000400df0 <getopt@plt>:
  400df0:	ff 25 72 42 22 00    	jmpq   *0x224272(%rip)        # 625068 <getopt@GLIBC_2.2.5>
  400df6:	68 0a 00 00 00       	pushq  $0xa
  400dfb:	e9 40 ff ff ff       	jmpq   400d40 <.plt>

0000000000400e00 <read@plt>:
  400e00:	ff 25 6a 42 22 00    	jmpq   *0x22426a(%rip)        # 625070 <read@GLIBC_2.2.5>
  400e06:	68 0b 00 00 00       	pushq  $0xb
  400e0b:	e9 30 ff ff ff       	jmpq   400d40 <.plt>

0000000000400e10 <strncmp@plt>:
  400e10:	ff 25 62 42 22 00    	jmpq   *0x224262(%rip)        # 625078 <strncmp@GLIBC_2.2.5>
  400e16:	68 0c 00 00 00       	pushq  $0xc
  400e1b:	e9 20 ff ff ff       	jmpq   400d40 <.plt>

0000000000400e20 <fopen@plt>:
  400e20:	ff 25 5a 42 22 00    	jmpq   *0x22425a(%rip)        # 625080 <fopen@GLIBC_2.2.5>
  400e26:	68 0d 00 00 00       	pushq  $0xd
  400e2b:	e9 10 ff ff ff       	jmpq   400d40 <.plt>

0000000000400e30 <__libc_start_main@plt>:
  400e30:	ff 25 52 42 22 00    	jmpq   *0x224252(%rip)        # 625088 <__libc_start_main@GLIBC_2.2.5>
  400e36:	68 0e 00 00 00       	pushq  $0xe
  400e3b:	e9 00 ff ff ff       	jmpq   400d40 <.plt>

0000000000400e40 <srandom@plt>:
  400e40:	ff 25 4a 42 22 00    	jmpq   *0x22424a(%rip)        # 625090 <srandom@GLIBC_2.2.5>
  400e46:	68 0f 00 00 00       	pushq  $0xf
  400e4b:	e9 f0 fe ff ff       	jmpq   400d40 <.plt>

0000000000400e50 <fgets@plt>:
  400e50:	ff 25 42 42 22 00    	jmpq   *0x224242(%rip)        # 625098 <fgets@GLIBC_2.2.5>
  400e56:	68 10 00 00 00       	pushq  $0x10
  400e5b:	e9 e0 fe ff ff       	jmpq   400d40 <.plt>

0000000000400e60 <_IO_getc@plt>:
  400e60:	ff 25 3a 42 22 00    	jmpq   *0x22423a(%rip)        # 6250a0 <_IO_getc@GLIBC_2.2.5>
  400e66:	68 11 00 00 00       	pushq  $0x11
  400e6b:	e9 d0 fe ff ff       	jmpq   400d40 <.plt>

0000000000400e70 <bcopy@plt>:
  400e70:	ff 25 32 42 22 00    	jmpq   *0x224232(%rip)        # 6250a8 <bcopy@GLIBC_2.2.5>
  400e76:	68 12 00 00 00       	pushq  $0x12
  400e7b:	e9 c0 fe ff ff       	jmpq   400d40 <.plt>

0000000000400e80 <sprintf@plt>:
  400e80:	ff 25 2a 42 22 00    	jmpq   *0x22422a(%rip)        # 6250b0 <sprintf@GLIBC_2.2.5>
  400e86:	68 13 00 00 00       	pushq  $0x13
  400e8b:	e9 b0 fe ff ff       	jmpq   400d40 <.plt>

0000000000400e90 <strcat@plt>:
  400e90:	ff 25 22 42 22 00    	jmpq   *0x224222(%rip)        # 6250b8 <strcat@GLIBC_2.2.5>
  400e96:	68 14 00 00 00       	pushq  $0x14
  400e9b:	e9 a0 fe ff ff       	jmpq   400d40 <.plt>

0000000000400ea0 <strtol@plt>:
  400ea0:	ff 25 1a 42 22 00    	jmpq   *0x22421a(%rip)        # 6250c0 <strtol@GLIBC_2.2.5>
  400ea6:	68 15 00 00 00       	pushq  $0x15
  400eab:	e9 90 fe ff ff       	jmpq   400d40 <.plt>

0000000000400eb0 <connect@plt>:
  400eb0:	ff 25 12 42 22 00    	jmpq   *0x224212(%rip)        # 6250c8 <connect@GLIBC_2.2.5>
  400eb6:	68 16 00 00 00       	pushq  $0x16
  400ebb:	e9 80 fe ff ff       	jmpq   400d40 <.plt>

0000000000400ec0 <gethostname@plt>:
  400ec0:	ff 25 0a 42 22 00    	jmpq   *0x22420a(%rip)        # 6250d0 <gethostname@GLIBC_2.2.5>
  400ec6:	68 17 00 00 00       	pushq  $0x17
  400ecb:	e9 70 fe ff ff       	jmpq   400d40 <.plt>

0000000000400ed0 <signal@plt>:
  400ed0:	ff 25 02 42 22 00    	jmpq   *0x224202(%rip)        # 6250d8 <signal@GLIBC_2.2.5>
  400ed6:	68 18 00 00 00       	pushq  $0x18
  400edb:	e9 60 fe ff ff       	jmpq   400d40 <.plt>

0000000000400ee0 <socket@plt>:
  400ee0:	ff 25 fa 41 22 00    	jmpq   *0x2241fa(%rip)        # 6250e0 <socket@GLIBC_2.2.5>
  400ee6:	68 19 00 00 00       	pushq  $0x19
  400eeb:	e9 50 fe ff ff       	jmpq   400d40 <.plt>

0000000000400ef0 <alarm@plt>:
  400ef0:	ff 25 f2 41 22 00    	jmpq   *0x2241f2(%rip)        # 6250e8 <alarm@GLIBC_2.2.5>
  400ef6:	68 1a 00 00 00       	pushq  $0x1a
  400efb:	e9 40 fe ff ff       	jmpq   400d40 <.plt>

0000000000400f00 <__errno_location@plt>:
  400f00:	ff 25 ea 41 22 00    	jmpq   *0x2241ea(%rip)        # 6250f0 <__errno_location@GLIBC_2.2.5>
  400f06:	68 1b 00 00 00       	pushq  $0x1b
  400f0b:	e9 30 fe ff ff       	jmpq   400d40 <.plt>

0000000000400f10 <strcmp@plt>:
  400f10:	ff 25 e2 41 22 00    	jmpq   *0x2241e2(%rip)        # 6250f8 <strcmp@GLIBC_2.2.5>
  400f16:	68 1c 00 00 00       	pushq  $0x1c
  400f1b:	e9 20 fe ff ff       	jmpq   400d40 <.plt>

0000000000400f20 <strcpy@plt>:
  400f20:	ff 25 da 41 22 00    	jmpq   *0x2241da(%rip)        # 625100 <strcpy@GLIBC_2.2.5>
  400f26:	68 1d 00 00 00       	pushq  $0x1d
  400f2b:	e9 10 fe ff ff       	jmpq   400d40 <.plt>

0000000000400f30 <munmap@plt>:
  400f30:	ff 25 d2 41 22 00    	jmpq   *0x2241d2(%rip)        # 625108 <munmap@GLIBC_2.2.5>
  400f36:	68 1e 00 00 00       	pushq  $0x1e
  400f3b:	e9 00 fe ff ff       	jmpq   400d40 <.plt>

0000000000400f40 <random@plt>:
  400f40:	ff 25 ca 41 22 00    	jmpq   *0x2241ca(%rip)        # 625110 <random@GLIBC_2.2.5>
  400f46:	68 1f 00 00 00       	pushq  $0x1f
  400f4b:	e9 f0 fd ff ff       	jmpq   400d40 <.plt>

0000000000400f50 <fprintf@plt>:
  400f50:	ff 25 c2 41 22 00    	jmpq   *0x2241c2(%rip)        # 625118 <fprintf@GLIBC_2.2.5>
  400f56:	68 20 00 00 00       	pushq  $0x20
  400f5b:	e9 e0 fd ff ff       	jmpq   400d40 <.plt>

0000000000400f60 <write@plt>:
  400f60:	ff 25 ba 41 22 00    	jmpq   *0x2241ba(%rip)        # 625120 <write@GLIBC_2.2.5>
  400f66:	68 21 00 00 00       	pushq  $0x21
  400f6b:	e9 d0 fd ff ff       	jmpq   400d40 <.plt>

0000000000400f70 <strtoul@plt>:
  400f70:	ff 25 b2 41 22 00    	jmpq   *0x2241b2(%rip)        # 625128 <strtoul@GLIBC_2.2.5>
  400f76:	68 22 00 00 00       	pushq  $0x22
  400f7b:	e9 c0 fd ff ff       	jmpq   400d40 <.plt>

0000000000400f80 <memcpy@plt>:
  400f80:	ff 25 aa 41 22 00    	jmpq   *0x2241aa(%rip)        # 625130 <memcpy@GLIBC_2.14>
  400f86:	68 23 00 00 00       	pushq  $0x23
  400f8b:	e9 b0 fd ff ff       	jmpq   400d40 <.plt>

0000000000400f90 <mmap@plt>:
  400f90:	ff 25 a2 41 22 00    	jmpq   *0x2241a2(%rip)        # 625138 <mmap@GLIBC_2.2.5>
  400f96:	68 24 00 00 00       	pushq  $0x24
  400f9b:	e9 a0 fd ff ff       	jmpq   400d40 <.plt>

0000000000400fa0 <time@plt>:
  400fa0:	ff 25 9a 41 22 00    	jmpq   *0x22419a(%rip)        # 625140 <time@GLIBC_2.2.5>
  400fa6:	68 25 00 00 00       	pushq  $0x25
  400fab:	e9 90 fd ff ff       	jmpq   400d40 <.plt>

Disassembly of section .fini:

00000000004233c4 <_fini>:
  4233c4:	48 83 ec 08          	sub    $0x8,%rsp
  4233c8:	48 83 c4 08          	add    $0x8,%rsp
  4233cc:	c3                   	retq   
