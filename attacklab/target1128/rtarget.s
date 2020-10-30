
rtarget:     file format elf64-x86-64


Disassembly of section .text:

0000000000421300 <_start>:
  421300:	31 ed                	xor    %ebp,%ebp
  421302:	49 89 d1             	mov    %rdx,%r9
  421305:	5e                   	pop    %rsi
  421306:	48 89 e2             	mov    %rsp,%rdx
  421309:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  42130d:	50                   	push   %rax
  42130e:	54                   	push   %rsp
  42130f:	49 c7 c0 e0 34 42 00 	mov    $0x4234e0,%r8
  421316:	48 c7 c1 70 34 42 00 	mov    $0x423470,%rcx
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
  421400:	bf 00 35 42 00       	mov    $0x423500,%edi
  421405:	b8 00 00 00 00       	mov    $0x0,%eax
  42140a:	e8 51 f9 fd ff       	callq  400d60 <printf@plt>
  42140f:	bf 38 35 42 00       	mov    $0x423538,%edi
  421414:	e8 97 f9 fd ff       	callq  400db0 <puts@plt>
  421419:	bf b0 36 42 00       	mov    $0x4236b0,%edi
  42141e:	e8 8d f9 fd ff       	callq  400db0 <puts@plt>
  421423:	bf 60 35 42 00       	mov    $0x423560,%edi
  421428:	e8 83 f9 fd ff       	callq  400db0 <puts@plt>
  42142d:	bf ca 36 42 00       	mov    $0x4236ca,%edi
  421432:	e8 79 f9 fd ff       	callq  400db0 <puts@plt>
  421437:	eb 2d                	jmp    421466 <usage+0x76>
  421439:	bf e6 36 42 00       	mov    $0x4236e6,%edi
  42143e:	b8 00 00 00 00       	mov    $0x0,%eax
  421443:	e8 18 f9 fd ff       	callq  400d60 <printf@plt>
  421448:	bf 88 35 42 00       	mov    $0x423588,%edi
  42144d:	e8 5e f9 fd ff       	callq  400db0 <puts@plt>
  421452:	bf b0 35 42 00       	mov    $0x4235b0,%edi
  421457:	e8 54 f9 fd ff       	callq  400db0 <puts@plt>
  42145c:	bf 04 37 42 00       	mov    $0x423704,%edi
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
  421487:	e8 62 1d 00 00       	callq  4231ee <gencookie>
  42148c:	89 05 92 40 20 00    	mov    %eax,0x204092(%rip)        # 625524 <cookie>
  421492:	89 c7                	mov    %eax,%edi
  421494:	e8 55 1d 00 00       	callq  4231ee <gencookie>
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
  4214f1:	c6 05 50 4c 20 00 72 	movb   $0x72,0x204c50(%rip)        # 626148 <target_prefix>
  4214f8:	83 3d c9 3f 20 00 00 	cmpl   $0x0,0x203fc9(%rip)        # 6254c8 <notify>
  4214ff:	0f 84 b1 00 00 00    	je     4215b6 <initialize_target+0x146>
  421505:	83 3d 1c 40 20 00 00 	cmpl   $0x0,0x20401c(%rip)        # 625528 <is_checker>
  42150c:	0f 85 a4 00 00 00    	jne    4215b6 <initialize_target+0x146>
  421512:	be 00 01 00 00       	mov    $0x100,%esi
  421517:	48 89 e7             	mov    %rsp,%rdi
  42151a:	e8 a1 f9 fd ff       	callq  400ec0 <gethostname@plt>
  42151f:	85 c0                	test   %eax,%eax
  421521:	74 25                	je     421548 <initialize_target+0xd8>
  421523:	bf e0 35 42 00       	mov    $0x4235e0,%edi
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
  421570:	bf 18 36 42 00       	mov    $0x423618,%edi
  421575:	e8 e6 f7 fd ff       	callq  400d60 <printf@plt>
  42157a:	bf 08 00 00 00       	mov    $0x8,%edi
  42157f:	e8 4c f8 fd ff       	callq  400dd0 <exit@plt>
  421584:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  42158b:	00 
  42158c:	e8 f4 19 00 00       	callq  422f85 <init_driver>
  421591:	85 c0                	test   %eax,%eax
  421593:	79 21                	jns    4215b6 <initialize_target+0x146>
  421595:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  42159c:	00 
  42159d:	bf 58 36 42 00       	mov    $0x423658,%edi
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
  4215ce:	be 91 23 42 00       	mov    $0x422391,%esi
  4215d3:	bf 0b 00 00 00       	mov    $0xb,%edi
  4215d8:	e8 f3 f8 fd ff       	callq  400ed0 <signal@plt>
  4215dd:	be 43 23 42 00       	mov    $0x422343,%esi
  4215e2:	bf 07 00 00 00       	mov    $0x7,%edi
  4215e7:	e8 e4 f8 fd ff       	callq  400ed0 <signal@plt>
  4215ec:	be df 23 42 00       	mov    $0x4223df,%esi
  4215f1:	bf 04 00 00 00       	mov    $0x4,%edi
  4215f6:	e8 d5 f8 fd ff       	callq  400ed0 <signal@plt>
  4215fb:	83 3d 26 3f 20 00 00 	cmpl   $0x0,0x203f26(%rip)        # 625528 <is_checker>
  421602:	74 20                	je     421624 <main+0x64>
  421604:	be 2d 24 42 00       	mov    $0x42242d,%esi
  421609:	bf 0e 00 00 00       	mov    $0xe,%edi
  42160e:	e8 bd f8 fd ff       	callq  400ed0 <signal@plt>
  421613:	bf 05 00 00 00       	mov    $0x5,%edi
  421618:	e8 d3 f8 fd ff       	callq  400ef0 <alarm@plt>
  42161d:	bd 22 37 42 00       	mov    $0x423722,%ebp
  421622:	eb 05                	jmp    421629 <main+0x69>
  421624:	bd 1d 37 42 00       	mov    $0x42371d,%ebp
  421629:	48 8b 05 b0 3e 20 00 	mov    0x203eb0(%rip),%rax        # 6254e0 <stdin@@GLIBC_2.2.5>
  421630:	48 89 05 d9 3e 20 00 	mov    %rax,0x203ed9(%rip)        # 625510 <infile>
  421637:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  42163d:	41 be 00 00 00 00    	mov    $0x0,%r14d
  421643:	e9 b9 00 00 00       	jmpq   421701 <main+0x141>
  421648:	83 e8 61             	sub    $0x61,%eax
  42164b:	3c 10                	cmp    $0x10,%al
  42164d:	0f 87 93 00 00 00    	ja     4216e6 <main+0x126>
  421653:	0f b6 c0             	movzbl %al,%eax
  421656:	ff 24 c5 68 37 42 00 	jmpq   *0x423768(,%rax,8)
  42165d:	48 8b 3b             	mov    (%rbx),%rdi
  421660:	e8 8b fd ff ff       	callq  4213f0 <usage>
  421665:	be 3d 3b 42 00       	mov    $0x423b3d,%esi
  42166a:	48 8b 3d 77 3e 20 00 	mov    0x203e77(%rip),%rdi        # 6254e8 <optarg@@GLIBC_2.2.5>
  421671:	e8 aa f7 fd ff       	callq  400e20 <fopen@plt>
  421676:	48 89 05 93 3e 20 00 	mov    %rax,0x203e93(%rip)        # 625510 <infile>
  42167d:	48 85 c0             	test   %rax,%rax
  421680:	75 7f                	jne    421701 <main+0x141>
  421682:	48 8b 15 5f 3e 20 00 	mov    0x203e5f(%rip),%rdx        # 6254e8 <optarg@@GLIBC_2.2.5>
  421689:	be 2a 37 42 00       	mov    $0x42372a,%esi
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
  4216ea:	bf 47 37 42 00       	mov    $0x423747,%edi
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
  421719:	be 01 00 00 00       	mov    $0x1,%esi
  42171e:	44 89 ef             	mov    %r13d,%edi
  421721:	e8 4a fd ff ff       	callq  421470 <initialize_target>
  421726:	83 3d fb 3d 20 00 00 	cmpl   $0x0,0x203dfb(%rip)        # 625528 <is_checker>
  42172d:	74 25                	je     421754 <main+0x194>
  42172f:	44 3b 35 ea 3d 20 00 	cmp    0x203dea(%rip),%r14d        # 625520 <authkey>
  421736:	74 1c                	je     421754 <main+0x194>
  421738:	44 89 f6             	mov    %r14d,%esi
  42173b:	bf 80 36 42 00       	mov    $0x423680,%edi
  421740:	b8 00 00 00 00       	mov    $0x0,%eax
  421745:	e8 16 f6 fd ff       	callq  400d60 <printf@plt>
  42174a:	b8 00 00 00 00       	mov    $0x0,%eax
  42174f:	e8 f7 08 00 00       	callq  42204b <check_fail>
  421754:	8b 35 ca 3d 20 00    	mov    0x203dca(%rip),%esi        # 625524 <cookie>
  42175a:	bf 5a 37 42 00       	mov    $0x42375a,%edi
  42175f:	b8 00 00 00 00       	mov    $0x0,%eax
  421764:	e8 f7 f5 fd ff       	callq  400d60 <printf@plt>
  421769:	48 8b 3d 50 3d 20 00 	mov    0x203d50(%rip),%rdi        # 6254c0 <buf_offset>
  421770:	e8 06 0d 00 00       	callq  42247b <launch>
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
  421d21:	e8 54 03 00 00       	callq  42207a <Gets>
  421d26:	b8 01 00 00 00       	mov    $0x1,%eax
  421d2b:	48 83 c4 18          	add    $0x18,%rsp
  421d2f:	c3                   	retq   

0000000000421d30 <touch1>:
  421d30:	48 83 ec 08          	sub    $0x8,%rsp
  421d34:	c7 05 de 37 20 00 01 	movl   $0x1,0x2037de(%rip)        # 62551c <vlevel>
  421d3b:	00 00 00 
  421d3e:	bf 8f 39 42 00       	mov    $0x42398f,%edi
  421d43:	e8 68 f0 fd ff       	callq  400db0 <puts@plt>
  421d48:	bf 01 00 00 00       	mov    $0x1,%edi
  421d4d:	e8 17 05 00 00       	callq  422269 <validate>
  421d52:	bf 00 00 00 00       	mov    $0x0,%edi
  421d57:	e8 74 f0 fd ff       	callq  400dd0 <exit@plt>

0000000000421d5c <touch2>:
  421d5c:	48 83 ec 08          	sub    $0x8,%rsp
  421d60:	89 fe                	mov    %edi,%esi
  421d62:	c7 05 b0 37 20 00 02 	movl   $0x2,0x2037b0(%rip)        # 62551c <vlevel>
  421d69:	00 00 00 
  421d6c:	3b 3d b2 37 20 00    	cmp    0x2037b2(%rip),%edi        # 625524 <cookie>
  421d72:	75 1b                	jne    421d8f <touch2+0x33>
  421d74:	bf b8 39 42 00       	mov    $0x4239b8,%edi
  421d79:	b8 00 00 00 00       	mov    $0x0,%eax
  421d7e:	e8 dd ef fd ff       	callq  400d60 <printf@plt>
  421d83:	bf 02 00 00 00       	mov    $0x2,%edi
  421d88:	e8 dc 04 00 00       	callq  422269 <validate>
  421d8d:	eb 19                	jmp    421da8 <touch2+0x4c>
  421d8f:	bf e0 39 42 00       	mov    $0x4239e0,%edi
  421d94:	b8 00 00 00 00       	mov    $0x0,%eax
  421d99:	e8 c2 ef fd ff       	callq  400d60 <printf@plt>
  421d9e:	bf 02 00 00 00       	mov    $0x2,%edi
  421da3:	e8 73 05 00 00       	callq  42231b <fail>
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
  421dfd:	be ac 39 42 00       	mov    $0x4239ac,%esi
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
  421e53:	bf 08 3a 42 00       	mov    $0x423a08,%edi
  421e58:	b8 00 00 00 00       	mov    $0x0,%eax
  421e5d:	e8 fe ee fd ff       	callq  400d60 <printf@plt>
  421e62:	bf 03 00 00 00       	mov    $0x3,%edi
  421e67:	e8 fd 03 00 00       	callq  422269 <validate>
  421e6c:	eb 1c                	jmp    421e8a <touch3+0x5a>
  421e6e:	48 89 de             	mov    %rbx,%rsi
  421e71:	bf 30 3a 42 00       	mov    $0x423a30,%edi
  421e76:	b8 00 00 00 00       	mov    $0x0,%eax
  421e7b:	e8 e0 ee fd ff       	callq  400d60 <printf@plt>
  421e80:	bf 03 00 00 00       	mov    $0x3,%edi
  421e85:	e8 91 04 00 00       	callq  42231b <fail>
  421e8a:	bf 00 00 00 00       	mov    $0x0,%edi
  421e8f:	e8 3c ef fd ff       	callq  400dd0 <exit@plt>

0000000000421e94 <test>:
  421e94:	48 83 ec 08          	sub    $0x8,%rsp
  421e98:	b8 00 00 00 00       	mov    $0x0,%eax
  421e9d:	e8 78 fe ff ff       	callq  421d1a <getbuf>
  421ea2:	89 c6                	mov    %eax,%esi
  421ea4:	bf 58 3a 42 00       	mov    $0x423a58,%edi
  421ea9:	b8 00 00 00 00       	mov    $0x0,%eax
  421eae:	e8 ad ee fd ff       	callq  400d60 <printf@plt>
  421eb3:	48 83 c4 08          	add    $0x8,%rsp
  421eb7:	c3                   	retq   

0000000000421eb8 <start_farm>:
  421eb8:	b8 01 00 00 00       	mov    $0x1,%eax
  421ebd:	c3                   	retq   

0000000000421ebe <addval_261>:
  421ebe:	8d 87 87 33 b3 58    	lea    0x58b33387(%rdi),%eax
  421ec4:	c3                   	retq   

0000000000421ec5 <addval_286>:
  421ec5:	8d 87 85 58 90 c7    	lea    -0x386fa77b(%rdi),%eax
  421ecb:	c3                   	retq   

0000000000421ecc <getval_349>:
  421ecc:	b8 48 89 c7 c3       	mov    $0xc3c78948,%eax
  421ed1:	c3                   	retq   

0000000000421ed2 <addval_358>:
  421ed2:	8d 87 48 81 c7 c3    	lea    -0x3c387eb8(%rdi),%eax
  421ed8:	c3                   	retq   

0000000000421ed9 <addval_265>:
  421ed9:	8d 87 e3 bd f1 58    	lea    0x58f1bde3(%rdi),%eax
  421edf:	c3                   	retq   

0000000000421ee0 <setval_143>:
  421ee0:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  421ee6:	c3                   	retq   

0000000000421ee7 <addval_380>:
  421ee7:	8d 87 18 c3 1e 69    	lea    0x691ec318(%rdi),%eax
  421eed:	c3                   	retq   

0000000000421eee <setval_139>:
  421eee:	c7 07 48 89 c7 94    	movl   $0x94c78948,(%rdi)
  421ef4:	c3                   	retq   

0000000000421ef5 <mid_farm>:
  421ef5:	b8 01 00 00 00       	mov    $0x1,%eax
  421efa:	c3                   	retq   

0000000000421efb <add_xy>:
  421efb:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  421eff:	c3                   	retq   

0000000000421f00 <getval_218>:
  421f00:	b8 48 c9 e0 90       	mov    $0x90e0c948,%eax
  421f05:	c3                   	retq   

0000000000421f06 <getval_467>:
  421f06:	b8 99 c2 08 d2       	mov    $0xd208c299,%eax
  421f0b:	c3                   	retq   

0000000000421f0c <setval_445>:
  421f0c:	c7 07 89 d1 c4 c0    	movl   $0xc0c4d189,(%rdi)
  421f12:	c3                   	retq   

0000000000421f13 <setval_363>:
  421f13:	c7 07 5b 48 89 e0    	movl   $0xe089485b,(%rdi)
  421f19:	c3                   	retq   

0000000000421f1a <addval_283>:
  421f1a:	8d 87 89 d1 94 d2    	lea    -0x2d6b2e77(%rdi),%eax
  421f20:	c3                   	retq   

0000000000421f21 <setval_295>:
  421f21:	c7 07 a9 c2 90 90    	movl   $0x9090c2a9,(%rdi)
  421f27:	c3                   	retq   

0000000000421f28 <setval_498>:
  421f28:	c7 07 08 89 e0 c3    	movl   $0xc3e08908,(%rdi)
  421f2e:	c3                   	retq   

0000000000421f2f <addval_168>:
  421f2f:	8d 87 c8 89 e0 90    	lea    -0x6f1f7638(%rdi),%eax
  421f35:	c3                   	retq   

0000000000421f36 <getval_388>:
  421f36:	b8 89 d1 30 db       	mov    $0xdb30d189,%eax
  421f3b:	c3                   	retq   

0000000000421f3c <addval_491>:
  421f3c:	8d 87 8d c2 38 c9    	lea    -0x36c73d73(%rdi),%eax
  421f42:	c3                   	retq   

0000000000421f43 <addval_276>:
  421f43:	8d 87 8b ce 90 90    	lea    -0x6f6f3175(%rdi),%eax
  421f49:	c3                   	retq   

0000000000421f4a <addval_203>:
  421f4a:	8d 87 48 89 e0 c2    	lea    -0x3d1f76b8(%rdi),%eax
  421f50:	c3                   	retq   

0000000000421f51 <addval_237>:
  421f51:	8d 87 89 d1 08 db    	lea    -0x24f72e77(%rdi),%eax
  421f57:	c3                   	retq   

0000000000421f58 <getval_421>:
  421f58:	b8 89 ce 08 db       	mov    $0xdb08ce89,%eax
  421f5d:	c3                   	retq   

0000000000421f5e <addval_391>:
  421f5e:	8d 87 2d 89 d1 c3    	lea    -0x3c2e76d3(%rdi),%eax
  421f64:	c3                   	retq   

0000000000421f65 <getval_427>:
  421f65:	b8 89 ce 08 c9       	mov    $0xc908ce89,%eax
  421f6a:	c3                   	retq   

0000000000421f6b <getval_357>:
  421f6b:	b8 a0 89 d1 c7       	mov    $0xc7d189a0,%eax
  421f70:	c3                   	retq   

0000000000421f71 <setval_186>:
  421f71:	c7 07 c9 ce 20 d2    	movl   $0xd220cec9,(%rdi)
  421f77:	c3                   	retq   

0000000000421f78 <getval_290>:
  421f78:	b8 48 89 e0 c3       	mov    $0xc3e08948,%eax
  421f7d:	c3                   	retq   

0000000000421f7e <getval_247>:
  421f7e:	b8 c9 ce 20 c0       	mov    $0xc020cec9,%eax
  421f83:	c3                   	retq   

0000000000421f84 <getval_396>:
  421f84:	b8 89 d1 60 d2       	mov    $0xd260d189,%eax
  421f89:	c3                   	retq   

0000000000421f8a <getval_384>:
  421f8a:	b8 89 c2 08 db       	mov    $0xdb08c289,%eax
  421f8f:	c3                   	retq   

0000000000421f90 <addval_441>:
  421f90:	8d 87 89 ce 00 c9    	lea    -0x36ff3177(%rdi),%eax
  421f96:	c3                   	retq   

0000000000421f97 <setval_482>:
  421f97:	c7 07 99 ce 20 c0    	movl   $0xc020ce99,(%rdi)
  421f9d:	c3                   	retq   

0000000000421f9e <getval_346>:
  421f9e:	b8 89 c2 60 c0       	mov    $0xc060c289,%eax
  421fa3:	c3                   	retq   

0000000000421fa4 <setval_113>:
  421fa4:	c7 07 7c 89 c2 94    	movl   $0x94c2897c,(%rdi)
  421faa:	c3                   	retq   

0000000000421fab <setval_284>:
  421fab:	c7 07 89 d1 30 db    	movl   $0xdb30d189,(%rdi)
  421fb1:	c3                   	retq   

0000000000421fb2 <addval_461>:
  421fb2:	8d 87 88 c2 20 c9    	lea    -0x36df3d78(%rdi),%eax
  421fb8:	c3                   	retq   

0000000000421fb9 <getval_271>:
  421fb9:	b8 48 89 e0 c7       	mov    $0xc7e08948,%eax
  421fbe:	c3                   	retq   

0000000000421fbf <getval_458>:
  421fbf:	b8 89 c2 20 d2       	mov    $0xd220c289,%eax
  421fc4:	c3                   	retq   

0000000000421fc5 <addval_174>:
  421fc5:	8d 87 8d ce 38 d2    	lea    -0x2dc73173(%rdi),%eax
  421fcb:	c3                   	retq   

0000000000421fcc <addval_130>:
  421fcc:	8d 87 4a 89 e0 90    	lea    -0x6f1f76b6(%rdi),%eax
  421fd2:	c3                   	retq   

0000000000421fd3 <end_farm>:
  421fd3:	b8 01 00 00 00       	mov    $0x1,%eax
  421fd8:	c3                   	retq   
  421fd9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000421fe0 <save_char>:
  421fe0:	8b 05 5e 41 20 00    	mov    0x20415e(%rip),%eax        # 626144 <gets_cnt>
  421fe6:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  421feb:	7f 49                	jg     422036 <save_char+0x56>
  421fed:	8d 14 40             	lea    (%rax,%rax,2),%edx
  421ff0:	89 f9                	mov    %edi,%ecx
  421ff2:	c0 e9 04             	shr    $0x4,%cl
  421ff5:	83 e1 0f             	and    $0xf,%ecx
  421ff8:	0f b6 b1 80 3d 42 00 	movzbl 0x423d80(%rcx),%esi
  421fff:	48 63 ca             	movslq %edx,%rcx
  422002:	40 88 b1 40 55 62 00 	mov    %sil,0x625540(%rcx)
  422009:	8d 4a 01             	lea    0x1(%rdx),%ecx
  42200c:	83 e7 0f             	and    $0xf,%edi
  42200f:	0f b6 b7 80 3d 42 00 	movzbl 0x423d80(%rdi),%esi
  422016:	48 63 c9             	movslq %ecx,%rcx
  422019:	40 88 b1 40 55 62 00 	mov    %sil,0x625540(%rcx)
  422020:	83 c2 02             	add    $0x2,%edx
  422023:	48 63 d2             	movslq %edx,%rdx
  422026:	c6 82 40 55 62 00 20 	movb   $0x20,0x625540(%rdx)
  42202d:	83 c0 01             	add    $0x1,%eax
  422030:	89 05 0e 41 20 00    	mov    %eax,0x20410e(%rip)        # 626144 <gets_cnt>
  422036:	f3 c3                	repz retq 

0000000000422038 <save_term>:
  422038:	8b 05 06 41 20 00    	mov    0x204106(%rip),%eax        # 626144 <gets_cnt>
  42203e:	8d 04 40             	lea    (%rax,%rax,2),%eax
  422041:	48 98                	cltq   
  422043:	c6 80 40 55 62 00 00 	movb   $0x0,0x625540(%rax)
  42204a:	c3                   	retq   

000000000042204b <check_fail>:
  42204b:	48 83 ec 08          	sub    $0x8,%rsp
  42204f:	0f be 35 f2 40 20 00 	movsbl 0x2040f2(%rip),%esi        # 626148 <target_prefix>
  422056:	b9 40 55 62 00       	mov    $0x625540,%ecx
  42205b:	8b 15 b7 34 20 00    	mov    0x2034b7(%rip),%edx        # 625518 <check_level>
  422061:	bf 7b 3a 42 00       	mov    $0x423a7b,%edi
  422066:	b8 00 00 00 00       	mov    $0x0,%eax
  42206b:	e8 f0 ec fd ff       	callq  400d60 <printf@plt>
  422070:	bf 01 00 00 00       	mov    $0x1,%edi
  422075:	e8 56 ed fd ff       	callq  400dd0 <exit@plt>

000000000042207a <Gets>:
  42207a:	41 54                	push   %r12
  42207c:	55                   	push   %rbp
  42207d:	53                   	push   %rbx
  42207e:	49 89 fc             	mov    %rdi,%r12
  422081:	c7 05 b9 40 20 00 00 	movl   $0x0,0x2040b9(%rip)        # 626144 <gets_cnt>
  422088:	00 00 00 
  42208b:	48 89 fb             	mov    %rdi,%rbx
  42208e:	eb 11                	jmp    4220a1 <Gets+0x27>
  422090:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  422094:	88 03                	mov    %al,(%rbx)
  422096:	0f b6 f8             	movzbl %al,%edi
  422099:	e8 42 ff ff ff       	callq  421fe0 <save_char>
  42209e:	48 89 eb             	mov    %rbp,%rbx
  4220a1:	48 8b 3d 68 34 20 00 	mov    0x203468(%rip),%rdi        # 625510 <infile>
  4220a8:	e8 b3 ed fd ff       	callq  400e60 <_IO_getc@plt>
  4220ad:	83 f8 ff             	cmp    $0xffffffff,%eax
  4220b0:	74 05                	je     4220b7 <Gets+0x3d>
  4220b2:	83 f8 0a             	cmp    $0xa,%eax
  4220b5:	75 d9                	jne    422090 <Gets+0x16>
  4220b7:	c6 03 00             	movb   $0x0,(%rbx)
  4220ba:	b8 00 00 00 00       	mov    $0x0,%eax
  4220bf:	e8 74 ff ff ff       	callq  422038 <save_term>
  4220c4:	4c 89 e0             	mov    %r12,%rax
  4220c7:	5b                   	pop    %rbx
  4220c8:	5d                   	pop    %rbp
  4220c9:	41 5c                	pop    %r12
  4220cb:	c3                   	retq   

00000000004220cc <notify_server>:
  4220cc:	83 3d 55 34 20 00 00 	cmpl   $0x0,0x203455(%rip)        # 625528 <is_checker>
  4220d3:	0f 85 8e 01 00 00    	jne    422267 <notify_server+0x19b>
  4220d9:	53                   	push   %rbx
  4220da:	48 81 ec 10 40 00 00 	sub    $0x4010,%rsp
  4220e1:	89 fb                	mov    %edi,%ebx
  4220e3:	8b 05 5b 40 20 00    	mov    0x20405b(%rip),%eax        # 626144 <gets_cnt>
  4220e9:	83 c0 64             	add    $0x64,%eax
  4220ec:	3d 00 20 00 00       	cmp    $0x2000,%eax
  4220f1:	7e 19                	jle    42210c <notify_server+0x40>
  4220f3:	bf b0 3b 42 00       	mov    $0x423bb0,%edi
  4220f8:	b8 00 00 00 00       	mov    $0x0,%eax
  4220fd:	e8 5e ec fd ff       	callq  400d60 <printf@plt>
  422102:	bf 01 00 00 00       	mov    $0x1,%edi
  422107:	e8 c4 ec fd ff       	callq  400dd0 <exit@plt>
  42210c:	44 0f be 0d 34 40 20 	movsbl 0x204034(%rip),%r9d        # 626148 <target_prefix>
  422113:	00 
  422114:	83 3d ad 33 20 00 00 	cmpl   $0x0,0x2033ad(%rip)        # 6254c8 <notify>
  42211b:	74 09                	je     422126 <notify_server+0x5a>
  42211d:	44 8b 05 fc 33 20 00 	mov    0x2033fc(%rip),%r8d        # 625520 <authkey>
  422124:	eb 06                	jmp    42212c <notify_server+0x60>
  422126:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  42212c:	85 db                	test   %ebx,%ebx
  42212e:	74 07                	je     422137 <notify_server+0x6b>
  422130:	b9 91 3a 42 00       	mov    $0x423a91,%ecx
  422135:	eb 05                	jmp    42213c <notify_server+0x70>
  422137:	b9 96 3a 42 00       	mov    $0x423a96,%ecx
  42213c:	48 c7 44 24 08 40 55 	movq   $0x625540,0x8(%rsp)
  422143:	62 00 
  422145:	89 34 24             	mov    %esi,(%rsp)
  422148:	8b 15 3a 30 20 00    	mov    0x20303a(%rip),%edx        # 625188 <target_id>
  42214e:	be 9b 3a 42 00       	mov    $0x423a9b,%esi
  422153:	48 8d bc 24 10 20 00 	lea    0x2010(%rsp),%rdi
  42215a:	00 
  42215b:	b8 00 00 00 00       	mov    $0x0,%eax
  422160:	e8 1b ed fd ff       	callq  400e80 <sprintf@plt>
  422165:	83 3d 5c 33 20 00 00 	cmpl   $0x0,0x20335c(%rip)        # 6254c8 <notify>
  42216c:	74 78                	je     4221e6 <notify_server+0x11a>
  42216e:	4c 8d 4c 24 10       	lea    0x10(%rsp),%r9
  422173:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  422179:	48 8d 8c 24 10 20 00 	lea    0x2010(%rsp),%rcx
  422180:	00 
  422181:	48 8b 15 08 30 20 00 	mov    0x203008(%rip),%rdx        # 625190 <lab>
  422188:	48 8b 35 09 30 20 00 	mov    0x203009(%rip),%rsi        # 625198 <course>
  42218f:	48 8b 3d ea 2f 20 00 	mov    0x202fea(%rip),%rdi        # 625180 <user_id>
  422196:	e8 b3 0f 00 00       	callq  42314e <driver_post>
  42219b:	85 c0                	test   %eax,%eax
  42219d:	79 1e                	jns    4221bd <notify_server+0xf1>
  42219f:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  4221a4:	bf b7 3a 42 00       	mov    $0x423ab7,%edi
  4221a9:	b8 00 00 00 00       	mov    $0x0,%eax
  4221ae:	e8 ad eb fd ff       	callq  400d60 <printf@plt>
  4221b3:	bf 01 00 00 00       	mov    $0x1,%edi
  4221b8:	e8 13 ec fd ff       	callq  400dd0 <exit@plt>
  4221bd:	85 db                	test   %ebx,%ebx
  4221bf:	74 19                	je     4221da <notify_server+0x10e>
  4221c1:	bf e0 3b 42 00       	mov    $0x423be0,%edi
  4221c6:	e8 e5 eb fd ff       	callq  400db0 <puts@plt>
  4221cb:	bf c3 3a 42 00       	mov    $0x423ac3,%edi
  4221d0:	e8 db eb fd ff       	callq  400db0 <puts@plt>
  4221d5:	e9 85 00 00 00       	jmpq   42225f <notify_server+0x193>
  4221da:	bf cd 3a 42 00       	mov    $0x423acd,%edi
  4221df:	e8 cc eb fd ff       	callq  400db0 <puts@plt>
  4221e4:	eb 79                	jmp    42225f <notify_server+0x193>
  4221e6:	85 db                	test   %ebx,%ebx
  4221e8:	74 08                	je     4221f2 <notify_server+0x126>
  4221ea:	be 91 3a 42 00       	mov    $0x423a91,%esi
  4221ef:	90                   	nop
  4221f0:	eb 05                	jmp    4221f7 <notify_server+0x12b>
  4221f2:	be 96 3a 42 00       	mov    $0x423a96,%esi
  4221f7:	bf 18 3c 42 00       	mov    $0x423c18,%edi
  4221fc:	b8 00 00 00 00       	mov    $0x0,%eax
  422201:	e8 5a eb fd ff       	callq  400d60 <printf@plt>
  422206:	48 8b 35 73 2f 20 00 	mov    0x202f73(%rip),%rsi        # 625180 <user_id>
  42220d:	bf d4 3a 42 00       	mov    $0x423ad4,%edi
  422212:	b8 00 00 00 00       	mov    $0x0,%eax
  422217:	e8 44 eb fd ff       	callq  400d60 <printf@plt>
  42221c:	48 8b 35 75 2f 20 00 	mov    0x202f75(%rip),%rsi        # 625198 <course>
  422223:	bf e1 3a 42 00       	mov    $0x423ae1,%edi
  422228:	b8 00 00 00 00       	mov    $0x0,%eax
  42222d:	e8 2e eb fd ff       	callq  400d60 <printf@plt>
  422232:	48 8b 35 57 2f 20 00 	mov    0x202f57(%rip),%rsi        # 625190 <lab>
  422239:	bf ed 3a 42 00       	mov    $0x423aed,%edi
  42223e:	b8 00 00 00 00       	mov    $0x0,%eax
  422243:	e8 18 eb fd ff       	callq  400d60 <printf@plt>
  422248:	48 8d b4 24 10 20 00 	lea    0x2010(%rsp),%rsi
  42224f:	00 
  422250:	bf f6 3a 42 00       	mov    $0x423af6,%edi
  422255:	b8 00 00 00 00       	mov    $0x0,%eax
  42225a:	e8 01 eb fd ff       	callq  400d60 <printf@plt>
  42225f:	48 81 c4 10 40 00 00 	add    $0x4010,%rsp
  422266:	5b                   	pop    %rbx
  422267:	f3 c3                	repz retq 

0000000000422269 <validate>:
  422269:	53                   	push   %rbx
  42226a:	89 fb                	mov    %edi,%ebx
  42226c:	83 3d b5 32 20 00 00 	cmpl   $0x0,0x2032b5(%rip)        # 625528 <is_checker>
  422273:	74 60                	je     4222d5 <validate+0x6c>
  422275:	39 3d a1 32 20 00    	cmp    %edi,0x2032a1(%rip)        # 62551c <vlevel>
  42227b:	74 14                	je     422291 <validate+0x28>
  42227d:	bf 02 3b 42 00       	mov    $0x423b02,%edi
  422282:	e8 29 eb fd ff       	callq  400db0 <puts@plt>
  422287:	b8 00 00 00 00       	mov    $0x0,%eax
  42228c:	e8 ba fd ff ff       	callq  42204b <check_fail>
  422291:	8b 35 81 32 20 00    	mov    0x203281(%rip),%esi        # 625518 <check_level>
  422297:	39 fe                	cmp    %edi,%esi
  422299:	74 1b                	je     4222b6 <validate+0x4d>
  42229b:	89 fa                	mov    %edi,%edx
  42229d:	bf 40 3c 42 00       	mov    $0x423c40,%edi
  4222a2:	b8 00 00 00 00       	mov    $0x0,%eax
  4222a7:	e8 b4 ea fd ff       	callq  400d60 <printf@plt>
  4222ac:	b8 00 00 00 00       	mov    $0x0,%eax
  4222b1:	e8 95 fd ff ff       	callq  42204b <check_fail>
  4222b6:	0f be 35 8b 3e 20 00 	movsbl 0x203e8b(%rip),%esi        # 626148 <target_prefix>
  4222bd:	b9 40 55 62 00       	mov    $0x625540,%ecx
  4222c2:	89 fa                	mov    %edi,%edx
  4222c4:	bf 20 3b 42 00       	mov    $0x423b20,%edi
  4222c9:	b8 00 00 00 00       	mov    $0x0,%eax
  4222ce:	e8 8d ea fd ff       	callq  400d60 <printf@plt>
  4222d3:	eb 44                	jmp    422319 <validate+0xb0>
  4222d5:	39 3d 41 32 20 00    	cmp    %edi,0x203241(%rip)        # 62551c <vlevel>
  4222db:	74 18                	je     4222f5 <validate+0x8c>
  4222dd:	bf 02 3b 42 00       	mov    $0x423b02,%edi
  4222e2:	e8 c9 ea fd ff       	callq  400db0 <puts@plt>
  4222e7:	89 de                	mov    %ebx,%esi
  4222e9:	bf 00 00 00 00       	mov    $0x0,%edi
  4222ee:	e8 d9 fd ff ff       	callq  4220cc <notify_server>
  4222f3:	eb 24                	jmp    422319 <validate+0xb0>
  4222f5:	0f be 15 4c 3e 20 00 	movsbl 0x203e4c(%rip),%edx        # 626148 <target_prefix>
  4222fc:	89 fe                	mov    %edi,%esi
  4222fe:	bf 68 3c 42 00       	mov    $0x423c68,%edi
  422303:	b8 00 00 00 00       	mov    $0x0,%eax
  422308:	e8 53 ea fd ff       	callq  400d60 <printf@plt>
  42230d:	89 de                	mov    %ebx,%esi
  42230f:	bf 01 00 00 00       	mov    $0x1,%edi
  422314:	e8 b3 fd ff ff       	callq  4220cc <notify_server>
  422319:	5b                   	pop    %rbx
  42231a:	c3                   	retq   

000000000042231b <fail>:
  42231b:	48 83 ec 08          	sub    $0x8,%rsp
  42231f:	83 3d 02 32 20 00 00 	cmpl   $0x0,0x203202(%rip)        # 625528 <is_checker>
  422326:	74 0a                	je     422332 <fail+0x17>
  422328:	b8 00 00 00 00       	mov    $0x0,%eax
  42232d:	e8 19 fd ff ff       	callq  42204b <check_fail>
  422332:	89 fe                	mov    %edi,%esi
  422334:	bf 00 00 00 00       	mov    $0x0,%edi
  422339:	e8 8e fd ff ff       	callq  4220cc <notify_server>
  42233e:	48 83 c4 08          	add    $0x8,%rsp
  422342:	c3                   	retq   

0000000000422343 <bushandler>:
  422343:	48 83 ec 08          	sub    $0x8,%rsp
  422347:	83 3d da 31 20 00 00 	cmpl   $0x0,0x2031da(%rip)        # 625528 <is_checker>
  42234e:	74 14                	je     422364 <bushandler+0x21>
  422350:	bf 35 3b 42 00       	mov    $0x423b35,%edi
  422355:	e8 56 ea fd ff       	callq  400db0 <puts@plt>
  42235a:	b8 00 00 00 00       	mov    $0x0,%eax
  42235f:	e8 e7 fc ff ff       	callq  42204b <check_fail>
  422364:	bf a0 3c 42 00       	mov    $0x423ca0,%edi
  422369:	e8 42 ea fd ff       	callq  400db0 <puts@plt>
  42236e:	bf 3f 3b 42 00       	mov    $0x423b3f,%edi
  422373:	e8 38 ea fd ff       	callq  400db0 <puts@plt>
  422378:	be 00 00 00 00       	mov    $0x0,%esi
  42237d:	bf 00 00 00 00       	mov    $0x0,%edi
  422382:	e8 45 fd ff ff       	callq  4220cc <notify_server>
  422387:	bf 01 00 00 00       	mov    $0x1,%edi
  42238c:	e8 3f ea fd ff       	callq  400dd0 <exit@plt>

0000000000422391 <seghandler>:
  422391:	48 83 ec 08          	sub    $0x8,%rsp
  422395:	83 3d 8c 31 20 00 00 	cmpl   $0x0,0x20318c(%rip)        # 625528 <is_checker>
  42239c:	74 14                	je     4223b2 <seghandler+0x21>
  42239e:	bf 55 3b 42 00       	mov    $0x423b55,%edi
  4223a3:	e8 08 ea fd ff       	callq  400db0 <puts@plt>
  4223a8:	b8 00 00 00 00       	mov    $0x0,%eax
  4223ad:	e8 99 fc ff ff       	callq  42204b <check_fail>
  4223b2:	bf c0 3c 42 00       	mov    $0x423cc0,%edi
  4223b7:	e8 f4 e9 fd ff       	callq  400db0 <puts@plt>
  4223bc:	bf 3f 3b 42 00       	mov    $0x423b3f,%edi
  4223c1:	e8 ea e9 fd ff       	callq  400db0 <puts@plt>
  4223c6:	be 00 00 00 00       	mov    $0x0,%esi
  4223cb:	bf 00 00 00 00       	mov    $0x0,%edi
  4223d0:	e8 f7 fc ff ff       	callq  4220cc <notify_server>
  4223d5:	bf 01 00 00 00       	mov    $0x1,%edi
  4223da:	e8 f1 e9 fd ff       	callq  400dd0 <exit@plt>

00000000004223df <illegalhandler>:
  4223df:	48 83 ec 08          	sub    $0x8,%rsp
  4223e3:	83 3d 3e 31 20 00 00 	cmpl   $0x0,0x20313e(%rip)        # 625528 <is_checker>
  4223ea:	74 14                	je     422400 <illegalhandler+0x21>
  4223ec:	bf 68 3b 42 00       	mov    $0x423b68,%edi
  4223f1:	e8 ba e9 fd ff       	callq  400db0 <puts@plt>
  4223f6:	b8 00 00 00 00       	mov    $0x0,%eax
  4223fb:	e8 4b fc ff ff       	callq  42204b <check_fail>
  422400:	bf e8 3c 42 00       	mov    $0x423ce8,%edi
  422405:	e8 a6 e9 fd ff       	callq  400db0 <puts@plt>
  42240a:	bf 3f 3b 42 00       	mov    $0x423b3f,%edi
  42240f:	e8 9c e9 fd ff       	callq  400db0 <puts@plt>
  422414:	be 00 00 00 00       	mov    $0x0,%esi
  422419:	bf 00 00 00 00       	mov    $0x0,%edi
  42241e:	e8 a9 fc ff ff       	callq  4220cc <notify_server>
  422423:	bf 01 00 00 00       	mov    $0x1,%edi
  422428:	e8 a3 e9 fd ff       	callq  400dd0 <exit@plt>

000000000042242d <sigalrmhandler>:
  42242d:	48 83 ec 08          	sub    $0x8,%rsp
  422431:	83 3d f0 30 20 00 00 	cmpl   $0x0,0x2030f0(%rip)        # 625528 <is_checker>
  422438:	74 14                	je     42244e <sigalrmhandler+0x21>
  42243a:	bf 7c 3b 42 00       	mov    $0x423b7c,%edi
  42243f:	e8 6c e9 fd ff       	callq  400db0 <puts@plt>
  422444:	b8 00 00 00 00       	mov    $0x0,%eax
  422449:	e8 fd fb ff ff       	callq  42204b <check_fail>
  42244e:	be 05 00 00 00       	mov    $0x5,%esi
  422453:	bf 18 3d 42 00       	mov    $0x423d18,%edi
  422458:	b8 00 00 00 00       	mov    $0x0,%eax
  42245d:	e8 fe e8 fd ff       	callq  400d60 <printf@plt>
  422462:	be 00 00 00 00       	mov    $0x0,%esi
  422467:	bf 00 00 00 00       	mov    $0x0,%edi
  42246c:	e8 5b fc ff ff       	callq  4220cc <notify_server>
  422471:	bf 01 00 00 00       	mov    $0x1,%edi
  422476:	e8 55 e9 fd ff       	callq  400dd0 <exit@plt>

000000000042247b <launch>:
  42247b:	55                   	push   %rbp
  42247c:	48 89 e5             	mov    %rsp,%rbp
  42247f:	48 89 fa             	mov    %rdi,%rdx
  422482:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  422486:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  42248a:	48 29 c4             	sub    %rax,%rsp
  42248d:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  422492:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  422496:	be f4 00 00 00       	mov    $0xf4,%esi
  42249b:	e8 d0 e8 fd ff       	callq  400d70 <memset@plt>
  4224a0:	48 8b 05 39 30 20 00 	mov    0x203039(%rip),%rax        # 6254e0 <stdin@@GLIBC_2.2.5>
  4224a7:	48 39 05 62 30 20 00 	cmp    %rax,0x203062(%rip)        # 625510 <infile>
  4224ae:	75 0f                	jne    4224bf <launch+0x44>
  4224b0:	bf 84 3b 42 00       	mov    $0x423b84,%edi
  4224b5:	b8 00 00 00 00       	mov    $0x0,%eax
  4224ba:	e8 a1 e8 fd ff       	callq  400d60 <printf@plt>
  4224bf:	c7 05 53 30 20 00 00 	movl   $0x0,0x203053(%rip)        # 62551c <vlevel>
  4224c6:	00 00 00 
  4224c9:	b8 00 00 00 00       	mov    $0x0,%eax
  4224ce:	e8 c1 f9 ff ff       	callq  421e94 <test>
  4224d3:	83 3d 4e 30 20 00 00 	cmpl   $0x0,0x20304e(%rip)        # 625528 <is_checker>
  4224da:	74 14                	je     4224f0 <launch+0x75>
  4224dc:	bf 91 3b 42 00       	mov    $0x423b91,%edi
  4224e1:	e8 ca e8 fd ff       	callq  400db0 <puts@plt>
  4224e6:	b8 00 00 00 00       	mov    $0x0,%eax
  4224eb:	e8 5b fb ff ff       	callq  42204b <check_fail>
  4224f0:	bf 9c 3b 42 00       	mov    $0x423b9c,%edi
  4224f5:	e8 b6 e8 fd ff       	callq  400db0 <puts@plt>
  4224fa:	c9                   	leaveq 
  4224fb:	c3                   	retq   

00000000004224fc <stable_launch>:
  4224fc:	53                   	push   %rbx
  4224fd:	48 89 3d 04 30 20 00 	mov    %rdi,0x203004(%rip)        # 625508 <global_offset>
  422504:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  42250a:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  422510:	b9 32 01 00 00       	mov    $0x132,%ecx
  422515:	ba 07 00 00 00       	mov    $0x7,%edx
  42251a:	be 00 00 10 00       	mov    $0x100000,%esi
  42251f:	bf 00 60 58 55       	mov    $0x55586000,%edi
  422524:	e8 67 ea fd ff       	callq  400f90 <mmap@plt>
  422529:	48 89 c3             	mov    %rax,%rbx
  42252c:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  422532:	74 32                	je     422566 <stable_launch+0x6a>
  422534:	be 00 00 10 00       	mov    $0x100000,%esi
  422539:	48 89 c7             	mov    %rax,%rdi
  42253c:	e8 ef e9 fd ff       	callq  400f30 <munmap@plt>
  422541:	ba 00 60 58 55       	mov    $0x55586000,%edx
  422546:	be 50 3d 42 00       	mov    $0x423d50,%esi
  42254b:	48 8b 3d 9e 2f 20 00 	mov    0x202f9e(%rip),%rdi        # 6254f0 <stderr@@GLIBC_2.2.5>
  422552:	b8 00 00 00 00       	mov    $0x0,%eax
  422557:	e8 f4 e9 fd ff       	callq  400f50 <fprintf@plt>
  42255c:	bf 01 00 00 00       	mov    $0x1,%edi
  422561:	e8 6a e8 fd ff       	callq  400dd0 <exit@plt>
  422566:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  42256d:	48 89 15 dc 3b 20 00 	mov    %rdx,0x203bdc(%rip)        # 626150 <stack_top>
  422574:	48 89 e0             	mov    %rsp,%rax
  422577:	48 89 d4             	mov    %rdx,%rsp
  42257a:	48 89 c2             	mov    %rax,%rdx
  42257d:	48 89 15 7c 2f 20 00 	mov    %rdx,0x202f7c(%rip)        # 625500 <global_save_stack>
  422584:	48 8b 3d 7d 2f 20 00 	mov    0x202f7d(%rip),%rdi        # 625508 <global_offset>
  42258b:	e8 eb fe ff ff       	callq  42247b <launch>
  422590:	48 8b 05 69 2f 20 00 	mov    0x202f69(%rip),%rax        # 625500 <global_save_stack>
  422597:	48 89 c4             	mov    %rax,%rsp
  42259a:	be 00 00 10 00       	mov    $0x100000,%esi
  42259f:	48 89 df             	mov    %rbx,%rdi
  4225a2:	e8 89 e9 fd ff       	callq  400f30 <munmap@plt>
  4225a7:	5b                   	pop    %rbx
  4225a8:	c3                   	retq   
  4225a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004225b0 <rio_readinitb>:
  4225b0:	89 37                	mov    %esi,(%rdi)
  4225b2:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  4225b9:	48 8d 47 10          	lea    0x10(%rdi),%rax
  4225bd:	48 89 47 08          	mov    %rax,0x8(%rdi)
  4225c1:	c3                   	retq   

00000000004225c2 <sigalrm_handler>:
  4225c2:	48 83 ec 08          	sub    $0x8,%rsp
  4225c6:	ba 00 00 00 00       	mov    $0x0,%edx
  4225cb:	be 90 3d 42 00       	mov    $0x423d90,%esi
  4225d0:	48 8b 3d 19 2f 20 00 	mov    0x202f19(%rip),%rdi        # 6254f0 <stderr@@GLIBC_2.2.5>
  4225d7:	b8 00 00 00 00       	mov    $0x0,%eax
  4225dc:	e8 6f e9 fd ff       	callq  400f50 <fprintf@plt>
  4225e1:	bf 01 00 00 00       	mov    $0x1,%edi
  4225e6:	e8 e5 e7 fd ff       	callq  400dd0 <exit@plt>

00000000004225eb <urlencode>:
  4225eb:	41 54                	push   %r12
  4225ed:	55                   	push   %rbp
  4225ee:	53                   	push   %rbx
  4225ef:	48 83 ec 10          	sub    $0x10,%rsp
  4225f3:	48 89 fb             	mov    %rdi,%rbx
  4225f6:	48 89 f5             	mov    %rsi,%rbp
  4225f9:	b8 00 00 00 00       	mov    $0x0,%eax
  4225fe:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  422605:	f2 ae                	repnz scas %es:(%rdi),%al
  422607:	48 f7 d1             	not    %rcx
  42260a:	8d 41 ff             	lea    -0x1(%rcx),%eax
  42260d:	e9 93 00 00 00       	jmpq   4226a5 <urlencode+0xba>
  422612:	0f b6 13             	movzbl (%rbx),%edx
  422615:	80 fa 2a             	cmp    $0x2a,%dl
  422618:	0f 94 c1             	sete   %cl
  42261b:	80 fa 2d             	cmp    $0x2d,%dl
  42261e:	0f 94 c0             	sete   %al
  422621:	08 c1                	or     %al,%cl
  422623:	75 1f                	jne    422644 <urlencode+0x59>
  422625:	80 fa 2e             	cmp    $0x2e,%dl
  422628:	74 1a                	je     422644 <urlencode+0x59>
  42262a:	80 fa 5f             	cmp    $0x5f,%dl
  42262d:	74 15                	je     422644 <urlencode+0x59>
  42262f:	8d 42 d0             	lea    -0x30(%rdx),%eax
  422632:	3c 09                	cmp    $0x9,%al
  422634:	76 0e                	jbe    422644 <urlencode+0x59>
  422636:	8d 42 bf             	lea    -0x41(%rdx),%eax
  422639:	3c 19                	cmp    $0x19,%al
  42263b:	76 07                	jbe    422644 <urlencode+0x59>
  42263d:	8d 42 9f             	lea    -0x61(%rdx),%eax
  422640:	3c 19                	cmp    $0x19,%al
  422642:	77 09                	ja     42264d <urlencode+0x62>
  422644:	88 55 00             	mov    %dl,0x0(%rbp)
  422647:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  42264b:	eb 51                	jmp    42269e <urlencode+0xb3>
  42264d:	80 fa 20             	cmp    $0x20,%dl
  422650:	75 0a                	jne    42265c <urlencode+0x71>
  422652:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  422656:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  42265a:	eb 42                	jmp    42269e <urlencode+0xb3>
  42265c:	8d 42 e0             	lea    -0x20(%rdx),%eax
  42265f:	3c 5f                	cmp    $0x5f,%al
  422661:	0f 96 c1             	setbe  %cl
  422664:	80 fa 09             	cmp    $0x9,%dl
  422667:	0f 94 c0             	sete   %al
  42266a:	08 c1                	or     %al,%cl
  42266c:	74 45                	je     4226b3 <urlencode+0xc8>
  42266e:	0f b6 d2             	movzbl %dl,%edx
  422671:	be 45 3e 42 00       	mov    $0x423e45,%esi
  422676:	48 89 e7             	mov    %rsp,%rdi
  422679:	b8 00 00 00 00       	mov    $0x0,%eax
  42267e:	e8 fd e7 fd ff       	callq  400e80 <sprintf@plt>
  422683:	0f b6 04 24          	movzbl (%rsp),%eax
  422687:	88 45 00             	mov    %al,0x0(%rbp)
  42268a:	0f b6 44 24 01       	movzbl 0x1(%rsp),%eax
  42268f:	88 45 01             	mov    %al,0x1(%rbp)
  422692:	0f b6 44 24 02       	movzbl 0x2(%rsp),%eax
  422697:	88 45 02             	mov    %al,0x2(%rbp)
  42269a:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  42269e:	48 83 c3 01          	add    $0x1,%rbx
  4226a2:	44 89 e0             	mov    %r12d,%eax
  4226a5:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  4226a9:	85 c0                	test   %eax,%eax
  4226ab:	0f 85 61 ff ff ff    	jne    422612 <urlencode+0x27>
  4226b1:	eb 05                	jmp    4226b8 <urlencode+0xcd>
  4226b3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4226b8:	48 83 c4 10          	add    $0x10,%rsp
  4226bc:	5b                   	pop    %rbx
  4226bd:	5d                   	pop    %rbp
  4226be:	41 5c                	pop    %r12
  4226c0:	c3                   	retq   

00000000004226c1 <rio_writen>:
  4226c1:	41 55                	push   %r13
  4226c3:	41 54                	push   %r12
  4226c5:	55                   	push   %rbp
  4226c6:	53                   	push   %rbx
  4226c7:	48 83 ec 08          	sub    $0x8,%rsp
  4226cb:	41 89 fc             	mov    %edi,%r12d
  4226ce:	48 89 f5             	mov    %rsi,%rbp
  4226d1:	49 89 d5             	mov    %rdx,%r13
  4226d4:	48 89 d3             	mov    %rdx,%rbx
  4226d7:	eb 28                	jmp    422701 <rio_writen+0x40>
  4226d9:	48 89 da             	mov    %rbx,%rdx
  4226dc:	48 89 ee             	mov    %rbp,%rsi
  4226df:	44 89 e7             	mov    %r12d,%edi
  4226e2:	e8 79 e8 fd ff       	callq  400f60 <write@plt>
  4226e7:	48 85 c0             	test   %rax,%rax
  4226ea:	7f 0f                	jg     4226fb <rio_writen+0x3a>
  4226ec:	e8 0f e8 fd ff       	callq  400f00 <__errno_location@plt>
  4226f1:	83 38 04             	cmpl   $0x4,(%rax)
  4226f4:	75 15                	jne    42270b <rio_writen+0x4a>
  4226f6:	b8 00 00 00 00       	mov    $0x0,%eax
  4226fb:	48 29 c3             	sub    %rax,%rbx
  4226fe:	48 01 c5             	add    %rax,%rbp
  422701:	48 85 db             	test   %rbx,%rbx
  422704:	75 d3                	jne    4226d9 <rio_writen+0x18>
  422706:	4c 89 e8             	mov    %r13,%rax
  422709:	eb 07                	jmp    422712 <rio_writen+0x51>
  42270b:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  422712:	48 83 c4 08          	add    $0x8,%rsp
  422716:	5b                   	pop    %rbx
  422717:	5d                   	pop    %rbp
  422718:	41 5c                	pop    %r12
  42271a:	41 5d                	pop    %r13
  42271c:	c3                   	retq   

000000000042271d <rio_read>:
  42271d:	41 56                	push   %r14
  42271f:	41 55                	push   %r13
  422721:	41 54                	push   %r12
  422723:	55                   	push   %rbp
  422724:	53                   	push   %rbx
  422725:	48 89 fb             	mov    %rdi,%rbx
  422728:	49 89 f6             	mov    %rsi,%r14
  42272b:	49 89 d5             	mov    %rdx,%r13
  42272e:	4c 8d 67 10          	lea    0x10(%rdi),%r12
  422732:	eb 2a                	jmp    42275e <rio_read+0x41>
  422734:	ba 00 20 00 00       	mov    $0x2000,%edx
  422739:	4c 89 e6             	mov    %r12,%rsi
  42273c:	8b 3b                	mov    (%rbx),%edi
  42273e:	e8 bd e6 fd ff       	callq  400e00 <read@plt>
  422743:	89 43 04             	mov    %eax,0x4(%rbx)
  422746:	85 c0                	test   %eax,%eax
  422748:	79 0c                	jns    422756 <rio_read+0x39>
  42274a:	e8 b1 e7 fd ff       	callq  400f00 <__errno_location@plt>
  42274f:	83 38 04             	cmpl   $0x4,(%rax)
  422752:	74 0a                	je     42275e <rio_read+0x41>
  422754:	eb 37                	jmp    42278d <rio_read+0x70>
  422756:	85 c0                	test   %eax,%eax
  422758:	74 3c                	je     422796 <rio_read+0x79>
  42275a:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  42275e:	8b 6b 04             	mov    0x4(%rbx),%ebp
  422761:	85 ed                	test   %ebp,%ebp
  422763:	7e cf                	jle    422734 <rio_read+0x17>
  422765:	89 e8                	mov    %ebp,%eax
  422767:	4c 39 e8             	cmp    %r13,%rax
  42276a:	72 03                	jb     42276f <rio_read+0x52>
  42276c:	44 89 ed             	mov    %r13d,%ebp
  42276f:	4c 63 e5             	movslq %ebp,%r12
  422772:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  422776:	4c 89 e2             	mov    %r12,%rdx
  422779:	4c 89 f7             	mov    %r14,%rdi
  42277c:	e8 ff e7 fd ff       	callq  400f80 <memcpy@plt>
  422781:	4c 01 63 08          	add    %r12,0x8(%rbx)
  422785:	29 6b 04             	sub    %ebp,0x4(%rbx)
  422788:	4c 89 e0             	mov    %r12,%rax
  42278b:	eb 0e                	jmp    42279b <rio_read+0x7e>
  42278d:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  422794:	eb 05                	jmp    42279b <rio_read+0x7e>
  422796:	b8 00 00 00 00       	mov    $0x0,%eax
  42279b:	5b                   	pop    %rbx
  42279c:	5d                   	pop    %rbp
  42279d:	41 5c                	pop    %r12
  42279f:	41 5d                	pop    %r13
  4227a1:	41 5e                	pop    %r14
  4227a3:	c3                   	retq   

00000000004227a4 <rio_readlineb>:
  4227a4:	41 55                	push   %r13
  4227a6:	41 54                	push   %r12
  4227a8:	55                   	push   %rbp
  4227a9:	53                   	push   %rbx
  4227aa:	48 83 ec 18          	sub    $0x18,%rsp
  4227ae:	49 89 fd             	mov    %rdi,%r13
  4227b1:	48 89 f5             	mov    %rsi,%rbp
  4227b4:	49 89 d4             	mov    %rdx,%r12
  4227b7:	bb 01 00 00 00       	mov    $0x1,%ebx
  4227bc:	eb 3d                	jmp    4227fb <rio_readlineb+0x57>
  4227be:	ba 01 00 00 00       	mov    $0x1,%edx
  4227c3:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  4227c8:	4c 89 ef             	mov    %r13,%rdi
  4227cb:	e8 4d ff ff ff       	callq  42271d <rio_read>
  4227d0:	83 f8 01             	cmp    $0x1,%eax
  4227d3:	75 12                	jne    4227e7 <rio_readlineb+0x43>
  4227d5:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  4227d9:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  4227de:	88 45 00             	mov    %al,0x0(%rbp)
  4227e1:	3c 0a                	cmp    $0xa,%al
  4227e3:	75 0f                	jne    4227f4 <rio_readlineb+0x50>
  4227e5:	eb 1b                	jmp    422802 <rio_readlineb+0x5e>
  4227e7:	85 c0                	test   %eax,%eax
  4227e9:	75 23                	jne    42280e <rio_readlineb+0x6a>
  4227eb:	48 83 fb 01          	cmp    $0x1,%rbx
  4227ef:	90                   	nop
  4227f0:	75 13                	jne    422805 <rio_readlineb+0x61>
  4227f2:	eb 23                	jmp    422817 <rio_readlineb+0x73>
  4227f4:	48 83 c3 01          	add    $0x1,%rbx
  4227f8:	48 89 d5             	mov    %rdx,%rbp
  4227fb:	4c 39 e3             	cmp    %r12,%rbx
  4227fe:	72 be                	jb     4227be <rio_readlineb+0x1a>
  422800:	eb 03                	jmp    422805 <rio_readlineb+0x61>
  422802:	48 89 d5             	mov    %rdx,%rbp
  422805:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  422809:	48 89 d8             	mov    %rbx,%rax
  42280c:	eb 0e                	jmp    42281c <rio_readlineb+0x78>
  42280e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  422815:	eb 05                	jmp    42281c <rio_readlineb+0x78>
  422817:	b8 00 00 00 00       	mov    $0x0,%eax
  42281c:	48 83 c4 18          	add    $0x18,%rsp
  422820:	5b                   	pop    %rbx
  422821:	5d                   	pop    %rbp
  422822:	41 5c                	pop    %r12
  422824:	41 5d                	pop    %r13
  422826:	c3                   	retq   

0000000000422827 <submitr>:
  422827:	41 57                	push   %r15
  422829:	41 56                	push   %r14
  42282b:	41 55                	push   %r13
  42282d:	41 54                	push   %r12
  42282f:	55                   	push   %rbp
  422830:	53                   	push   %rbx
  422831:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  422838:	49 89 fc             	mov    %rdi,%r12
  42283b:	89 74 24 1c          	mov    %esi,0x1c(%rsp)
  42283f:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  422844:	49 89 cf             	mov    %rcx,%r15
  422847:	4d 89 c6             	mov    %r8,%r14
  42284a:	4d 89 cd             	mov    %r9,%r13
  42284d:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  422854:	00 
  422855:	c7 84 24 2c 20 00 00 	movl   $0x0,0x202c(%rsp)
  42285c:	00 00 00 00 
  422860:	ba 00 00 00 00       	mov    $0x0,%edx
  422865:	be 01 00 00 00       	mov    $0x1,%esi
  42286a:	bf 02 00 00 00       	mov    $0x2,%edi
  42286f:	e8 6c e6 fd ff       	callq  400ee0 <socket@plt>
  422874:	89 c5                	mov    %eax,%ebp
  422876:	85 c0                	test   %eax,%eax
  422878:	79 4e                	jns    4228c8 <submitr+0xa1>
  42287a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  422881:	3a 20 43 
  422884:	48 89 03             	mov    %rax,(%rbx)
  422887:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  42288e:	20 75 6e 
  422891:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422895:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  42289c:	74 6f 20 
  42289f:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4228a3:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  4228aa:	65 20 73 
  4228ad:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4228b1:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  4228b8:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  4228be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4228c3:	e9 83 06 00 00       	jmpq   422f4b <submitr+0x724>
  4228c8:	4c 89 e7             	mov    %r12,%rdi
  4228cb:	e8 c0 e4 fd ff       	callq  400d90 <gethostbyname@plt>
  4228d0:	48 85 c0             	test   %rax,%rax
  4228d3:	75 75                	jne    42294a <submitr+0x123>
  4228d5:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4228dc:	3a 20 44 
  4228df:	48 89 03             	mov    %rax,(%rbx)
  4228e2:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4228e9:	20 75 6e 
  4228ec:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4228f0:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4228f7:	74 6f 20 
  4228fa:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4228fe:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  422905:	76 65 20 
  422908:	48 89 43 18          	mov    %rax,0x18(%rbx)
  42290c:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  422913:	61 62 20 
  422916:	48 89 43 20          	mov    %rax,0x20(%rbx)
  42291a:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  422921:	72 20 61 
  422924:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422928:	c7 43 30 64 64 72 65 	movl   $0x65726464,0x30(%rbx)
  42292f:	66 c7 43 34 73 73    	movw   $0x7373,0x34(%rbx)
  422935:	c6 43 36 00          	movb   $0x0,0x36(%rbx)
  422939:	89 ef                	mov    %ebp,%edi
  42293b:	e8 40 e4 fd ff       	callq  400d80 <close@plt>
  422940:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422945:	e9 01 06 00 00       	jmpq   422f4b <submitr+0x724>
  42294a:	48 c7 84 24 40 a0 00 	movq   $0x0,0xa040(%rsp)
  422951:	00 00 00 00 00 
  422956:	48 c7 84 24 48 a0 00 	movq   $0x0,0xa048(%rsp)
  42295d:	00 00 00 00 00 
  422962:	66 c7 84 24 40 a0 00 	movw   $0x2,0xa040(%rsp)
  422969:	00 02 00 
  42296c:	48 8b 48 18          	mov    0x18(%rax),%rcx
  422970:	48 63 50 14          	movslq 0x14(%rax),%rdx
  422974:	48 8d b4 24 44 a0 00 	lea    0xa044(%rsp),%rsi
  42297b:	00 
  42297c:	48 8b 39             	mov    (%rcx),%rdi
  42297f:	e8 ec e4 fd ff       	callq  400e70 <bcopy@plt>
  422984:	0f b7 44 24 1c       	movzwl 0x1c(%rsp),%eax
  422989:	66 c1 c8 08          	ror    $0x8,%ax
  42298d:	66 89 84 24 42 a0 00 	mov    %ax,0xa042(%rsp)
  422994:	00 
  422995:	ba 10 00 00 00       	mov    $0x10,%edx
  42299a:	48 8d b4 24 40 a0 00 	lea    0xa040(%rsp),%rsi
  4229a1:	00 
  4229a2:	89 ef                	mov    %ebp,%edi
  4229a4:	e8 07 e5 fd ff       	callq  400eb0 <connect@plt>
  4229a9:	85 c0                	test   %eax,%eax
  4229ab:	79 67                	jns    422a14 <submitr+0x1ed>
  4229ad:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  4229b4:	3a 20 55 
  4229b7:	48 89 03             	mov    %rax,(%rbx)
  4229ba:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  4229c1:	20 74 6f 
  4229c4:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4229c8:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  4229cf:	65 63 74 
  4229d2:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4229d6:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  4229dd:	68 65 20 
  4229e0:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4229e4:	48 b8 41 75 74 6f 6c 	movabs $0x2062616c6f747541,%rax
  4229eb:	61 62 20 
  4229ee:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4229f2:	c7 43 28 73 65 72 76 	movl   $0x76726573,0x28(%rbx)
  4229f9:	66 c7 43 2c 65 72    	movw   $0x7265,0x2c(%rbx)
  4229ff:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  422a03:	89 ef                	mov    %ebp,%edi
  422a05:	e8 76 e3 fd ff       	callq  400d80 <close@plt>
  422a0a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422a0f:	e9 37 05 00 00       	jmpq   422f4b <submitr+0x724>
  422a14:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  422a1b:	4c 89 ef             	mov    %r13,%rdi
  422a1e:	b8 00 00 00 00       	mov    $0x0,%eax
  422a23:	48 89 d1             	mov    %rdx,%rcx
  422a26:	f2 ae                	repnz scas %es:(%rdi),%al
  422a28:	48 f7 d1             	not    %rcx
  422a2b:	48 89 ce             	mov    %rcx,%rsi
  422a2e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  422a33:	48 89 d1             	mov    %rdx,%rcx
  422a36:	f2 ae                	repnz scas %es:(%rdi),%al
  422a38:	48 f7 d1             	not    %rcx
  422a3b:	49 89 c8             	mov    %rcx,%r8
  422a3e:	4c 89 ff             	mov    %r15,%rdi
  422a41:	48 89 d1             	mov    %rdx,%rcx
  422a44:	f2 ae                	repnz scas %es:(%rdi),%al
  422a46:	49 29 c8             	sub    %rcx,%r8
  422a49:	4c 89 f7             	mov    %r14,%rdi
  422a4c:	48 89 d1             	mov    %rdx,%rcx
  422a4f:	f2 ae                	repnz scas %es:(%rdi),%al
  422a51:	49 29 c8             	sub    %rcx,%r8
  422a54:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  422a59:	49 8d 44 00 7b       	lea    0x7b(%r8,%rax,1),%rax
  422a5e:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  422a64:	76 72                	jbe    422ad8 <submitr+0x2b1>
  422a66:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  422a6d:	3a 20 52 
  422a70:	48 89 03             	mov    %rax,(%rbx)
  422a73:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  422a7a:	20 73 74 
  422a7d:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422a81:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  422a88:	74 6f 6f 
  422a8b:	48 89 43 10          	mov    %rax,0x10(%rbx)
  422a8f:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  422a96:	65 2e 20 
  422a99:	48 89 43 18          	mov    %rax,0x18(%rbx)
  422a9d:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  422aa4:	61 73 65 
  422aa7:	48 89 43 20          	mov    %rax,0x20(%rbx)
  422aab:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  422ab2:	49 54 52 
  422ab5:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422ab9:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  422ac0:	55 46 00 
  422ac3:	48 89 43 30          	mov    %rax,0x30(%rbx)
  422ac7:	89 ef                	mov    %ebp,%edi
  422ac9:	e8 b2 e2 fd ff       	callq  400d80 <close@plt>
  422ace:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422ad3:	e9 73 04 00 00       	jmpq   422f4b <submitr+0x724>
  422ad8:	48 8d b4 24 30 40 00 	lea    0x4030(%rsp),%rsi
  422adf:	00 
  422ae0:	b9 00 04 00 00       	mov    $0x400,%ecx
  422ae5:	b8 00 00 00 00       	mov    $0x0,%eax
  422aea:	48 89 f7             	mov    %rsi,%rdi
  422aed:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  422af0:	4c 89 ef             	mov    %r13,%rdi
  422af3:	e8 f3 fa ff ff       	callq  4225eb <urlencode>
  422af8:	85 c0                	test   %eax,%eax
  422afa:	0f 89 8a 00 00 00    	jns    422b8a <submitr+0x363>
  422b00:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  422b07:	3a 20 52 
  422b0a:	48 89 03             	mov    %rax,(%rbx)
  422b0d:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  422b14:	20 73 74 
  422b17:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422b1b:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  422b22:	63 6f 6e 
  422b25:	48 89 43 10          	mov    %rax,0x10(%rbx)
  422b29:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  422b30:	20 61 6e 
  422b33:	48 89 43 18          	mov    %rax,0x18(%rbx)
  422b37:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  422b3e:	67 61 6c 
  422b41:	48 89 43 20          	mov    %rax,0x20(%rbx)
  422b45:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  422b4c:	6e 70 72 
  422b4f:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422b53:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  422b5a:	6c 65 20 
  422b5d:	48 89 43 30          	mov    %rax,0x30(%rbx)
  422b61:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  422b68:	63 74 65 
  422b6b:	48 89 43 38          	mov    %rax,0x38(%rbx)
  422b6f:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  422b75:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  422b79:	89 ef                	mov    %ebp,%edi
  422b7b:	e8 00 e2 fd ff       	callq  400d80 <close@plt>
  422b80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422b85:	e9 c1 03 00 00       	jmpq   422f4b <submitr+0x724>
  422b8a:	4c 89 24 24          	mov    %r12,(%rsp)
  422b8e:	4c 8d 8c 24 30 40 00 	lea    0x4030(%rsp),%r9
  422b95:	00 
  422b96:	4d 89 f8             	mov    %r15,%r8
  422b99:	4c 89 f1             	mov    %r14,%rcx
  422b9c:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  422ba1:	be b8 3d 42 00       	mov    $0x423db8,%esi
  422ba6:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  422bad:	00 
  422bae:	b8 00 00 00 00       	mov    $0x0,%eax
  422bb3:	e8 c8 e2 fd ff       	callq  400e80 <sprintf@plt>
  422bb8:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  422bbf:	00 
  422bc0:	b8 00 00 00 00       	mov    $0x0,%eax
  422bc5:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  422bcc:	f2 ae                	repnz scas %es:(%rdi),%al
  422bce:	48 f7 d1             	not    %rcx
  422bd1:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  422bd5:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  422bdc:	00 
  422bdd:	89 ef                	mov    %ebp,%edi
  422bdf:	e8 dd fa ff ff       	callq  4226c1 <rio_writen>
  422be4:	48 85 c0             	test   %rax,%rax
  422be7:	79 6b                	jns    422c54 <submitr+0x42d>
  422be9:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  422bf0:	3a 20 43 
  422bf3:	48 89 03             	mov    %rax,(%rbx)
  422bf6:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  422bfd:	20 75 6e 
  422c00:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422c04:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  422c0b:	74 6f 20 
  422c0e:	48 89 43 10          	mov    %rax,0x10(%rbx)
  422c12:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  422c19:	20 74 6f 
  422c1c:	48 89 43 18          	mov    %rax,0x18(%rbx)
  422c20:	48 b8 20 74 68 65 20 	movabs $0x7475412065687420,%rax
  422c27:	41 75 74 
  422c2a:	48 89 43 20          	mov    %rax,0x20(%rbx)
  422c2e:	48 b8 6f 6c 61 62 20 	movabs $0x7265732062616c6f,%rax
  422c35:	73 65 72 
  422c38:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422c3c:	c7 43 30 76 65 72 00 	movl   $0x726576,0x30(%rbx)
  422c43:	89 ef                	mov    %ebp,%edi
  422c45:	e8 36 e1 fd ff       	callq  400d80 <close@plt>
  422c4a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422c4f:	e9 f7 02 00 00       	jmpq   422f4b <submitr+0x724>
  422c54:	89 ee                	mov    %ebp,%esi
  422c56:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  422c5d:	00 
  422c5e:	e8 4d f9 ff ff       	callq  4225b0 <rio_readinitb>
  422c63:	ba 00 20 00 00       	mov    $0x2000,%edx
  422c68:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  422c6f:	00 
  422c70:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  422c77:	00 
  422c78:	e8 27 fb ff ff       	callq  4227a4 <rio_readlineb>
  422c7d:	48 85 c0             	test   %rax,%rax
  422c80:	7f 7f                	jg     422d01 <submitr+0x4da>
  422c82:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  422c89:	3a 20 43 
  422c8c:	48 89 03             	mov    %rax,(%rbx)
  422c8f:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  422c96:	20 75 6e 
  422c99:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422c9d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  422ca4:	74 6f 20 
  422ca7:	48 89 43 10          	mov    %rax,0x10(%rbx)
  422cab:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  422cb2:	66 69 72 
  422cb5:	48 89 43 18          	mov    %rax,0x18(%rbx)
  422cb9:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  422cc0:	61 64 65 
  422cc3:	48 89 43 20          	mov    %rax,0x20(%rbx)
  422cc7:	48 b8 72 20 66 72 6f 	movabs $0x41206d6f72662072,%rax
  422cce:	6d 20 41 
  422cd1:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422cd5:	48 b8 75 74 6f 6c 61 	movabs $0x732062616c6f7475,%rax
  422cdc:	62 20 73 
  422cdf:	48 89 43 30          	mov    %rax,0x30(%rbx)
  422ce3:	c7 43 38 65 72 76 65 	movl   $0x65767265,0x38(%rbx)
  422cea:	66 c7 43 3c 72 00    	movw   $0x72,0x3c(%rbx)
  422cf0:	89 ef                	mov    %ebp,%edi
  422cf2:	e8 89 e0 fd ff       	callq  400d80 <close@plt>
  422cf7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422cfc:	e9 4a 02 00 00       	jmpq   422f4b <submitr+0x724>
  422d01:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  422d06:	48 8d 8c 24 2c 20 00 	lea    0x202c(%rsp),%rcx
  422d0d:	00 
  422d0e:	48 8d 94 24 30 20 00 	lea    0x2030(%rsp),%rdx
  422d15:	00 
  422d16:	be 4c 3e 42 00       	mov    $0x423e4c,%esi
  422d1b:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  422d22:	00 
  422d23:	b8 00 00 00 00       	mov    $0x0,%eax
  422d28:	e8 93 e0 fd ff       	callq  400dc0 <__isoc99_sscanf@plt>
  422d2d:	e9 95 00 00 00       	jmpq   422dc7 <submitr+0x5a0>
  422d32:	ba 00 20 00 00       	mov    $0x2000,%edx
  422d37:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  422d3e:	00 
  422d3f:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  422d46:	00 
  422d47:	e8 58 fa ff ff       	callq  4227a4 <rio_readlineb>
  422d4c:	48 85 c0             	test   %rax,%rax
  422d4f:	7f 76                	jg     422dc7 <submitr+0x5a0>
  422d51:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  422d58:	3a 20 43 
  422d5b:	48 89 03             	mov    %rax,(%rbx)
  422d5e:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  422d65:	20 75 6e 
  422d68:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422d6c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  422d73:	74 6f 20 
  422d76:	48 89 43 10          	mov    %rax,0x10(%rbx)
  422d7a:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  422d81:	68 65 61 
  422d84:	48 89 43 18          	mov    %rax,0x18(%rbx)
  422d88:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  422d8f:	66 72 6f 
  422d92:	48 89 43 20          	mov    %rax,0x20(%rbx)
  422d96:	48 b8 6d 20 41 75 74 	movabs $0x616c6f747541206d,%rax
  422d9d:	6f 6c 61 
  422da0:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422da4:	48 b8 62 20 73 65 72 	movabs $0x7265767265732062,%rax
  422dab:	76 65 72 
  422dae:	48 89 43 30          	mov    %rax,0x30(%rbx)
  422db2:	c6 43 38 00          	movb   $0x0,0x38(%rbx)
  422db6:	89 ef                	mov    %ebp,%edi
  422db8:	e8 c3 df fd ff       	callq  400d80 <close@plt>
  422dbd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422dc2:	e9 84 01 00 00       	jmpq   422f4b <submitr+0x724>
  422dc7:	0f b6 84 24 30 60 00 	movzbl 0x6030(%rsp),%eax
  422dce:	00 
  422dcf:	83 e8 0d             	sub    $0xd,%eax
  422dd2:	75 15                	jne    422de9 <submitr+0x5c2>
  422dd4:	0f b6 84 24 31 60 00 	movzbl 0x6031(%rsp),%eax
  422ddb:	00 
  422ddc:	83 e8 0a             	sub    $0xa,%eax
  422ddf:	75 08                	jne    422de9 <submitr+0x5c2>
  422de1:	0f b6 84 24 32 60 00 	movzbl 0x6032(%rsp),%eax
  422de8:	00 
  422de9:	85 c0                	test   %eax,%eax
  422deb:	0f 85 41 ff ff ff    	jne    422d32 <submitr+0x50b>
  422df1:	ba 00 20 00 00       	mov    $0x2000,%edx
  422df6:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  422dfd:	00 
  422dfe:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  422e05:	00 
  422e06:	e8 99 f9 ff ff       	callq  4227a4 <rio_readlineb>
  422e0b:	48 85 c0             	test   %rax,%rax
  422e0e:	0f 8f 80 00 00 00    	jg     422e94 <submitr+0x66d>
  422e14:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  422e1b:	3a 20 43 
  422e1e:	48 89 03             	mov    %rax,(%rbx)
  422e21:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  422e28:	20 75 6e 
  422e2b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  422e2f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  422e36:	74 6f 20 
  422e39:	48 89 43 10          	mov    %rax,0x10(%rbx)
  422e3d:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  422e44:	73 74 61 
  422e47:	48 89 43 18          	mov    %rax,0x18(%rbx)
  422e4b:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  422e52:	65 73 73 
  422e55:	48 89 43 20          	mov    %rax,0x20(%rbx)
  422e59:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  422e60:	72 6f 6d 
  422e63:	48 89 43 28          	mov    %rax,0x28(%rbx)
  422e67:	48 b8 20 41 75 74 6f 	movabs $0x62616c6f74754120,%rax
  422e6e:	6c 61 62 
  422e71:	48 89 43 30          	mov    %rax,0x30(%rbx)
  422e75:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
  422e7c:	65 72 00 
  422e7f:	48 89 43 38          	mov    %rax,0x38(%rbx)
  422e83:	89 ef                	mov    %ebp,%edi
  422e85:	e8 f6 de fd ff       	callq  400d80 <close@plt>
  422e8a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422e8f:	e9 b7 00 00 00       	jmpq   422f4b <submitr+0x724>
  422e94:	8b 94 24 2c 20 00 00 	mov    0x202c(%rsp),%edx
  422e9b:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  422ea1:	74 28                	je     422ecb <submitr+0x6a4>
  422ea3:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  422ea8:	be 18 3e 42 00       	mov    $0x423e18,%esi
  422ead:	48 89 df             	mov    %rbx,%rdi
  422eb0:	b8 00 00 00 00       	mov    $0x0,%eax
  422eb5:	e8 c6 df fd ff       	callq  400e80 <sprintf@plt>
  422eba:	89 ef                	mov    %ebp,%edi
  422ebc:	e8 bf de fd ff       	callq  400d80 <close@plt>
  422ec1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422ec6:	e9 80 00 00 00       	jmpq   422f4b <submitr+0x724>
  422ecb:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  422ed2:	00 
  422ed3:	48 89 df             	mov    %rbx,%rdi
  422ed6:	e8 45 e0 fd ff       	callq  400f20 <strcpy@plt>
  422edb:	89 ef                	mov    %ebp,%edi
  422edd:	e8 9e de fd ff       	callq  400d80 <close@plt>
  422ee2:	0f b6 03             	movzbl (%rbx),%eax
  422ee5:	83 e8 4f             	sub    $0x4f,%eax
  422ee8:	75 18                	jne    422f02 <submitr+0x6db>
  422eea:	0f b6 53 01          	movzbl 0x1(%rbx),%edx
  422eee:	83 ea 4b             	sub    $0x4b,%edx
  422ef1:	75 11                	jne    422f04 <submitr+0x6dd>
  422ef3:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  422ef7:	83 ea 0a             	sub    $0xa,%edx
  422efa:	75 08                	jne    422f04 <submitr+0x6dd>
  422efc:	0f b6 53 03          	movzbl 0x3(%rbx),%edx
  422f00:	eb 02                	jmp    422f04 <submitr+0x6dd>
  422f02:	89 c2                	mov    %eax,%edx
  422f04:	85 d2                	test   %edx,%edx
  422f06:	74 30                	je     422f38 <submitr+0x711>
  422f08:	bf 5d 3e 42 00       	mov    $0x423e5d,%edi
  422f0d:	b9 05 00 00 00       	mov    $0x5,%ecx
  422f12:	48 89 de             	mov    %rbx,%rsi
  422f15:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  422f17:	0f 97 c1             	seta   %cl
  422f1a:	0f 92 c2             	setb   %dl
  422f1d:	38 d1                	cmp    %dl,%cl
  422f1f:	74 1e                	je     422f3f <submitr+0x718>
  422f21:	85 c0                	test   %eax,%eax
  422f23:	75 0d                	jne    422f32 <submitr+0x70b>
  422f25:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  422f29:	83 e8 4b             	sub    $0x4b,%eax
  422f2c:	75 04                	jne    422f32 <submitr+0x70b>
  422f2e:	0f b6 43 02          	movzbl 0x2(%rbx),%eax
  422f32:	85 c0                	test   %eax,%eax
  422f34:	75 10                	jne    422f46 <submitr+0x71f>
  422f36:	eb 13                	jmp    422f4b <submitr+0x724>
  422f38:	b8 00 00 00 00       	mov    $0x0,%eax
  422f3d:	eb 0c                	jmp    422f4b <submitr+0x724>
  422f3f:	b8 00 00 00 00       	mov    $0x0,%eax
  422f44:	eb 05                	jmp    422f4b <submitr+0x724>
  422f46:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  422f4b:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  422f52:	5b                   	pop    %rbx
  422f53:	5d                   	pop    %rbp
  422f54:	41 5c                	pop    %r12
  422f56:	41 5d                	pop    %r13
  422f58:	41 5e                	pop    %r14
  422f5a:	41 5f                	pop    %r15
  422f5c:	c3                   	retq   

0000000000422f5d <init_timeout>:
  422f5d:	53                   	push   %rbx
  422f5e:	89 fb                	mov    %edi,%ebx
  422f60:	85 ff                	test   %edi,%edi
  422f62:	74 1f                	je     422f83 <init_timeout+0x26>
  422f64:	85 ff                	test   %edi,%edi
  422f66:	79 05                	jns    422f6d <init_timeout+0x10>
  422f68:	bb 00 00 00 00       	mov    $0x0,%ebx
  422f6d:	be c2 25 42 00       	mov    $0x4225c2,%esi
  422f72:	bf 0e 00 00 00       	mov    $0xe,%edi
  422f77:	e8 54 df fd ff       	callq  400ed0 <signal@plt>
  422f7c:	89 df                	mov    %ebx,%edi
  422f7e:	e8 6d df fd ff       	callq  400ef0 <alarm@plt>
  422f83:	5b                   	pop    %rbx
  422f84:	c3                   	retq   

0000000000422f85 <init_driver>:
  422f85:	55                   	push   %rbp
  422f86:	53                   	push   %rbx
  422f87:	48 83 ec 18          	sub    $0x18,%rsp
  422f8b:	48 89 fd             	mov    %rdi,%rbp
  422f8e:	be 01 00 00 00       	mov    $0x1,%esi
  422f93:	bf 0d 00 00 00       	mov    $0xd,%edi
  422f98:	e8 33 df fd ff       	callq  400ed0 <signal@plt>
  422f9d:	be 01 00 00 00       	mov    $0x1,%esi
  422fa2:	bf 1d 00 00 00       	mov    $0x1d,%edi
  422fa7:	e8 24 df fd ff       	callq  400ed0 <signal@plt>
  422fac:	be 01 00 00 00       	mov    $0x1,%esi
  422fb1:	bf 1d 00 00 00       	mov    $0x1d,%edi
  422fb6:	e8 15 df fd ff       	callq  400ed0 <signal@plt>
  422fbb:	ba 00 00 00 00       	mov    $0x0,%edx
  422fc0:	be 01 00 00 00       	mov    $0x1,%esi
  422fc5:	bf 02 00 00 00       	mov    $0x2,%edi
  422fca:	e8 11 df fd ff       	callq  400ee0 <socket@plt>
  422fcf:	89 c3                	mov    %eax,%ebx
  422fd1:	85 c0                	test   %eax,%eax
  422fd3:	79 4f                	jns    423024 <init_driver+0x9f>
  422fd5:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  422fdc:	3a 20 43 
  422fdf:	48 89 45 00          	mov    %rax,0x0(%rbp)
  422fe3:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  422fea:	20 75 6e 
  422fed:	48 89 45 08          	mov    %rax,0x8(%rbp)
  422ff1:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  422ff8:	74 6f 20 
  422ffb:	48 89 45 10          	mov    %rax,0x10(%rbp)
  422fff:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  423006:	65 20 73 
  423009:	48 89 45 18          	mov    %rax,0x18(%rbp)
  42300d:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  423014:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  42301a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  42301f:	e9 23 01 00 00       	jmpq   423147 <init_driver+0x1c2>
  423024:	bf 62 3e 42 00       	mov    $0x423e62,%edi
  423029:	e8 62 dd fd ff       	callq  400d90 <gethostbyname@plt>
  42302e:	48 85 c0             	test   %rax,%rax
  423031:	75 68                	jne    42309b <init_driver+0x116>
  423033:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  42303a:	3a 20 44 
  42303d:	48 89 45 00          	mov    %rax,0x0(%rbp)
  423041:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  423048:	20 75 6e 
  42304b:	48 89 45 08          	mov    %rax,0x8(%rbp)
  42304f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  423056:	74 6f 20 
  423059:	48 89 45 10          	mov    %rax,0x10(%rbp)
  42305d:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  423064:	76 65 20 
  423067:	48 89 45 18          	mov    %rax,0x18(%rbp)
  42306b:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  423072:	72 20 61 
  423075:	48 89 45 20          	mov    %rax,0x20(%rbp)
  423079:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  423080:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  423086:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  42308a:	89 df                	mov    %ebx,%edi
  42308c:	e8 ef dc fd ff       	callq  400d80 <close@plt>
  423091:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  423096:	e9 ac 00 00 00       	jmpq   423147 <init_driver+0x1c2>
  42309b:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  4230a2:	00 
  4230a3:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  4230aa:	00 00 
  4230ac:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  4230b2:	48 8b 48 18          	mov    0x18(%rax),%rcx
  4230b6:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4230ba:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  4230bf:	48 8b 39             	mov    (%rcx),%rdi
  4230c2:	e8 a9 dd fd ff       	callq  400e70 <bcopy@plt>
  4230c7:	66 c7 44 24 02 00 50 	movw   $0x5000,0x2(%rsp)
  4230ce:	ba 10 00 00 00       	mov    $0x10,%edx
  4230d3:	48 89 e6             	mov    %rsp,%rsi
  4230d6:	89 df                	mov    %ebx,%edi
  4230d8:	e8 d3 dd fd ff       	callq  400eb0 <connect@plt>
  4230dd:	85 c0                	test   %eax,%eax
  4230df:	79 50                	jns    423131 <init_driver+0x1ac>
  4230e1:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  4230e8:	3a 20 55 
  4230eb:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4230ef:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  4230f6:	20 74 6f 
  4230f9:	48 89 45 08          	mov    %rax,0x8(%rbp)
  4230fd:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  423104:	65 63 74 
  423107:	48 89 45 10          	mov    %rax,0x10(%rbp)
  42310b:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  423112:	65 72 76 
  423115:	48 89 45 18          	mov    %rax,0x18(%rbp)
  423119:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  42311f:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  423123:	89 df                	mov    %ebx,%edi
  423125:	e8 56 dc fd ff       	callq  400d80 <close@plt>
  42312a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  42312f:	eb 16                	jmp    423147 <init_driver+0x1c2>
  423131:	89 df                	mov    %ebx,%edi
  423133:	e8 48 dc fd ff       	callq  400d80 <close@plt>
  423138:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  42313e:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  423142:	b8 00 00 00 00       	mov    $0x0,%eax
  423147:	48 83 c4 18          	add    $0x18,%rsp
  42314b:	5b                   	pop    %rbx
  42314c:	5d                   	pop    %rbp
  42314d:	c3                   	retq   

000000000042314e <driver_post>:
  42314e:	53                   	push   %rbx
  42314f:	48 83 ec 10          	sub    $0x10,%rsp
  423153:	4c 89 cb             	mov    %r9,%rbx
  423156:	45 85 c0             	test   %r8d,%r8d
  423159:	74 22                	je     42317d <driver_post+0x2f>
  42315b:	48 89 ce             	mov    %rcx,%rsi
  42315e:	bf 79 3e 42 00       	mov    $0x423e79,%edi
  423163:	b8 00 00 00 00       	mov    $0x0,%eax
  423168:	e8 f3 db fd ff       	callq  400d60 <printf@plt>
  42316d:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  423172:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  423176:	b8 00 00 00 00       	mov    $0x0,%eax
  42317b:	eb 39                	jmp    4231b6 <driver_post+0x68>
  42317d:	48 85 ff             	test   %rdi,%rdi
  423180:	74 26                	je     4231a8 <driver_post+0x5a>
  423182:	80 3f 00             	cmpb   $0x0,(%rdi)
  423185:	74 21                	je     4231a8 <driver_post+0x5a>
  423187:	4c 89 0c 24          	mov    %r9,(%rsp)
  42318b:	49 89 c9             	mov    %rcx,%r9
  42318e:	49 89 d0             	mov    %rdx,%r8
  423191:	48 89 f9             	mov    %rdi,%rcx
  423194:	48 89 f2             	mov    %rsi,%rdx
  423197:	be 50 00 00 00       	mov    $0x50,%esi
  42319c:	bf 62 3e 42 00       	mov    $0x423e62,%edi
  4231a1:	e8 81 f6 ff ff       	callq  422827 <submitr>
  4231a6:	eb 0e                	jmp    4231b6 <driver_post+0x68>
  4231a8:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4231ad:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4231b1:	b8 00 00 00 00       	mov    $0x0,%eax
  4231b6:	48 83 c4 10          	add    $0x10,%rsp
  4231ba:	5b                   	pop    %rbx
  4231bb:	c3                   	retq   

00000000004231bc <check>:
  4231bc:	89 f8                	mov    %edi,%eax
  4231be:	c1 e8 1c             	shr    $0x1c,%eax
  4231c1:	85 c0                	test   %eax,%eax
  4231c3:	74 1d                	je     4231e2 <check+0x26>
  4231c5:	b9 00 00 00 00       	mov    $0x0,%ecx
  4231ca:	eb 0b                	jmp    4231d7 <check+0x1b>
  4231cc:	89 f8                	mov    %edi,%eax
  4231ce:	d3 e8                	shr    %cl,%eax
  4231d0:	3c 0a                	cmp    $0xa,%al
  4231d2:	74 14                	je     4231e8 <check+0x2c>
  4231d4:	83 c1 08             	add    $0x8,%ecx
  4231d7:	83 f9 1f             	cmp    $0x1f,%ecx
  4231da:	7e f0                	jle    4231cc <check+0x10>
  4231dc:	b8 01 00 00 00       	mov    $0x1,%eax
  4231e1:	c3                   	retq   
  4231e2:	b8 00 00 00 00       	mov    $0x0,%eax
  4231e7:	c3                   	retq   
  4231e8:	b8 00 00 00 00       	mov    $0x0,%eax
  4231ed:	c3                   	retq   

00000000004231ee <gencookie>:
  4231ee:	53                   	push   %rbx
  4231ef:	83 c7 01             	add    $0x1,%edi
  4231f2:	e8 49 dc fd ff       	callq  400e40 <srandom@plt>
  4231f7:	e8 44 dd fd ff       	callq  400f40 <random@plt>
  4231fc:	89 c3                	mov    %eax,%ebx
  4231fe:	89 c7                	mov    %eax,%edi
  423200:	e8 b7 ff ff ff       	callq  4231bc <check>
  423205:	85 c0                	test   %eax,%eax
  423207:	74 ee                	je     4231f7 <gencookie+0x9>
  423209:	89 d8                	mov    %ebx,%eax
  42320b:	5b                   	pop    %rbx
  42320c:	c3                   	retq   

000000000042320d <checkhash>:
  42320d:	53                   	push   %rbx
  42320e:	48 81 ec f0 00 00 00 	sub    $0xf0,%rsp
  423215:	48 b8 6d 32 30 2d 31 	movabs $0x313638312d30326d,%rax
  42321c:	38 36 31 
  42321f:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
  423226:	00 
  423227:	66 c7 84 24 e8 00 00 	movw   $0x33,0xe8(%rsp)
  42322e:	00 33 00 
  423231:	48 b8 61 74 74 61 63 	movabs $0x616c6b6361747461,%rax
  423238:	6b 6c 61 
  42323b:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
  423242:	00 
  423243:	66 c7 84 24 d8 00 00 	movw   $0x62,0xd8(%rsp)
  42324a:	00 62 00 
  42324d:	48 b8 42 4f 4f 47 41 	movabs $0x4f4f4241474f4f42,%rax
  423254:	42 4f 4f 
  423257:	48 89 84 24 c0 00 00 	mov    %rax,0xc0(%rsp)
  42325e:	00 
  42325f:	66 c7 84 24 c8 00 00 	movw   $0x4147,0xc8(%rsp)
  423266:	00 47 41 
  423269:	c6 84 24 ca 00 00 00 	movb   $0x0,0xca(%rsp)
  423270:	00 
  423271:	48 b8 6b 65 79 2e 74 	movabs $0x7478742e79656b,%rax
  423278:	78 74 00 
  42327b:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
  423282:	00 
  423283:	be 3d 3b 42 00       	mov    $0x423b3d,%esi
  423288:	48 8d bc 24 b0 00 00 	lea    0xb0(%rsp),%rdi
  42328f:	00 
  423290:	e8 8b db fd ff       	callq  400e20 <fopen@plt>
  423295:	48 89 c3             	mov    %rax,%rbx
  423298:	48 85 c0             	test   %rax,%rax
  42329b:	75 21                	jne    4232be <checkhash+0xb1>
  42329d:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
  4232a4:	00 
  4232a5:	bf 98 3e 42 00       	mov    $0x423e98,%edi
  4232aa:	b8 00 00 00 00       	mov    $0x0,%eax
  4232af:	e8 ac da fd ff       	callq  400d60 <printf@plt>
  4232b4:	bf 01 00 00 00       	mov    $0x1,%edi
  4232b9:	e8 12 db fd ff       	callq  400dd0 <exit@plt>
  4232be:	48 89 c2             	mov    %rax,%rdx
  4232c1:	be 0a 00 00 00       	mov    $0xa,%esi
  4232c6:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  4232cd:	00 
  4232ce:	e8 7d db fd ff       	callq  400e50 <fgets@plt>
  4232d3:	48 85 c0             	test   %rax,%rax
  4232d6:	75 1c                	jne    4232f4 <checkhash+0xe7>
  4232d8:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
  4232df:	00 
  4232e0:	bf d0 3e 42 00       	mov    $0x423ed0,%edi
  4232e5:	e8 76 da fd ff       	callq  400d60 <printf@plt>
  4232ea:	bf 01 00 00 00       	mov    $0x1,%edi
  4232ef:	e8 dc da fd ff       	callq  400dd0 <exit@plt>
  4232f4:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  4232fb:	00 
  4232fc:	b8 00 00 00 00       	mov    $0x0,%eax
  423301:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  423308:	f2 ae                	repnz scas %es:(%rdi),%al
  42330a:	48 f7 d1             	not    %rcx
  42330d:	48 83 e9 02          	sub    $0x2,%rcx
  423311:	80 bc 0c a0 00 00 00 	cmpb   $0xa,0xa0(%rsp,%rcx,1)
  423318:	0a 
  423319:	75 08                	jne    423323 <checkhash+0x116>
  42331b:	c6 84 0c a0 00 00 00 	movb   $0x0,0xa0(%rsp,%rcx,1)
  423322:	00 
  423323:	48 89 da             	mov    %rbx,%rdx
  423326:	be 21 00 00 00       	mov    $0x21,%esi
  42332b:	48 89 e7             	mov    %rsp,%rdi
  42332e:	e8 1d db fd ff       	callq  400e50 <fgets@plt>
  423333:	48 85 c0             	test   %rax,%rax
  423336:	75 1c                	jne    423354 <checkhash+0x147>
  423338:	48 8d b4 24 b0 00 00 	lea    0xb0(%rsp),%rsi
  42333f:	00 
  423340:	bf f8 3e 42 00       	mov    $0x423ef8,%edi
  423345:	e8 16 da fd ff       	callq  400d60 <printf@plt>
  42334a:	bf 01 00 00 00       	mov    $0x1,%edi
  42334f:	e8 7c da fd ff       	callq  400dd0 <exit@plt>
  423354:	48 89 e7             	mov    %rsp,%rdi
  423357:	b8 00 00 00 00       	mov    $0x0,%eax
  42335c:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  423363:	f2 ae                	repnz scas %es:(%rdi),%al
  423365:	48 f7 d1             	not    %rcx
  423368:	48 83 e9 02          	sub    $0x2,%rcx
  42336c:	80 3c 0c 0a          	cmpb   $0xa,(%rsp,%rcx,1)
  423370:	75 04                	jne    423376 <checkhash+0x169>
  423372:	c6 04 0c 00          	movb   $0x0,(%rsp,%rcx,1)
  423376:	c6 44 24 60 00       	movb   $0x0,0x60(%rsp)
  42337b:	48 8d b4 24 e0 00 00 	lea    0xe0(%rsp),%rsi
  423382:	00 
  423383:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  423388:	e8 03 db fd ff       	callq  400e90 <strcat@plt>
  42338d:	48 8d b4 24 d0 00 00 	lea    0xd0(%rsp),%rsi
  423394:	00 
  423395:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  42339a:	e8 f1 da fd ff       	callq  400e90 <strcat@plt>
  42339f:	48 8d b4 24 a0 00 00 	lea    0xa0(%rsp),%rsi
  4233a6:	00 
  4233a7:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  4233ac:	e8 df da fd ff       	callq  400e90 <strcat@plt>
  4233b1:	48 8d b4 24 c0 00 00 	lea    0xc0(%rsp),%rsi
  4233b8:	00 
  4233b9:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  4233be:	e8 cd da fd ff       	callq  400e90 <strcat@plt>
  4233c3:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  4233c8:	b8 00 00 00 00       	mov    $0x0,%eax
  4233cd:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4233d4:	f2 ae                	repnz scas %es:(%rdi),%al
  4233d6:	48 f7 d1             	not    %rcx
  4233d9:	48 8d 71 ff          	lea    -0x1(%rcx),%rsi
  4233dd:	48 8d 94 24 90 00 00 	lea    0x90(%rsp),%rdx
  4233e4:	00 
  4233e5:	48 8d 7c 24 60       	lea    0x60(%rsp),%rdi
  4233ea:	e8 61 d9 fd ff       	callq  400d50 <MD5@plt>
  4233ef:	bb 00 00 00 00       	mov    $0x0,%ebx
  4233f4:	eb 43                	jmp    423439 <checkhash+0x22c>
  4233f6:	48 63 c3             	movslq %ebx,%rax
  4233f9:	8d 3c 1b             	lea    (%rbx,%rbx,1),%edi
  4233fc:	0f b6 94 04 90 00 00 	movzbl 0x90(%rsp,%rax,1),%edx
  423403:	00 
  423404:	48 63 ff             	movslq %edi,%rdi
  423407:	48 8d 44 24 30       	lea    0x30(%rsp),%rax
  42340c:	48 01 c7             	add    %rax,%rdi
  42340f:	be 90 3e 42 00       	mov    $0x423e90,%esi
  423414:	b8 00 00 00 00       	mov    $0x0,%eax
  423419:	e8 62 da fd ff       	callq  400e80 <sprintf@plt>
  42341e:	85 c0                	test   %eax,%eax
  423420:	79 14                	jns    423436 <checkhash+0x229>
  423422:	bf 20 3f 42 00       	mov    $0x423f20,%edi
  423427:	e8 84 d9 fd ff       	callq  400db0 <puts@plt>
  42342c:	bf 01 00 00 00       	mov    $0x1,%edi
  423431:	e8 9a d9 fd ff       	callq  400dd0 <exit@plt>
  423436:	83 c3 01             	add    $0x1,%ebx
  423439:	83 fb 0f             	cmp    $0xf,%ebx
  42343c:	76 b8                	jbe    4233f6 <checkhash+0x1e9>
  42343e:	48 89 e6             	mov    %rsp,%rsi
  423441:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
  423446:	e8 c5 da fd ff       	callq  400f10 <strcmp@plt>
  42344b:	85 c0                	test   %eax,%eax
  42344d:	75 04                	jne    423453 <checkhash+0x246>
  42344f:	b0 01                	mov    $0x1,%al
  423451:	eb 05                	jmp    423458 <checkhash+0x24b>
  423453:	b8 00 00 00 00       	mov    $0x0,%eax
  423458:	48 81 c4 f0 00 00 00 	add    $0xf0,%rsp
  42345f:	5b                   	pop    %rbx
  423460:	c3                   	retq   
  423461:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  423468:	00 00 00 
  42346b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000423470 <__libc_csu_init>:
  423470:	41 57                	push   %r15
  423472:	41 89 ff             	mov    %edi,%r15d
  423475:	41 56                	push   %r14
  423477:	49 89 f6             	mov    %rsi,%r14
  42347a:	41 55                	push   %r13
  42347c:	49 89 d5             	mov    %rdx,%r13
  42347f:	41 54                	push   %r12
  423481:	4c 8d 25 78 19 20 00 	lea    0x201978(%rip),%r12        # 624e00 <__frame_dummy_init_array_entry>
  423488:	55                   	push   %rbp
  423489:	48 8d 2d 78 19 20 00 	lea    0x201978(%rip),%rbp        # 624e08 <__init_array_end>
  423490:	53                   	push   %rbx
  423491:	4c 29 e5             	sub    %r12,%rbp
  423494:	31 db                	xor    %ebx,%ebx
  423496:	48 c1 fd 03          	sar    $0x3,%rbp
  42349a:	48 83 ec 08          	sub    $0x8,%rsp
  42349e:	e8 7d d8 fd ff       	callq  400d20 <_init>
  4234a3:	48 85 ed             	test   %rbp,%rbp
  4234a6:	74 1e                	je     4234c6 <__libc_csu_init+0x56>
  4234a8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4234af:	00 
  4234b0:	4c 89 ea             	mov    %r13,%rdx
  4234b3:	4c 89 f6             	mov    %r14,%rsi
  4234b6:	44 89 ff             	mov    %r15d,%edi
  4234b9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4234bd:	48 83 c3 01          	add    $0x1,%rbx
  4234c1:	48 39 eb             	cmp    %rbp,%rbx
  4234c4:	75 ea                	jne    4234b0 <__libc_csu_init+0x40>
  4234c6:	48 83 c4 08          	add    $0x8,%rsp
  4234ca:	5b                   	pop    %rbx
  4234cb:	5d                   	pop    %rbp
  4234cc:	41 5c                	pop    %r12
  4234ce:	41 5d                	pop    %r13
  4234d0:	41 5e                	pop    %r14
  4234d2:	41 5f                	pop    %r15
  4234d4:	c3                   	retq   
  4234d5:	90                   	nop
  4234d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  4234dd:	00 00 00 

00000000004234e0 <__libc_csu_fini>:
  4234e0:	f3 c3                	repz retq 

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

00000000004234e4 <_fini>:
  4234e4:	48 83 ec 08          	sub    $0x8,%rsp
  4234e8:	48 83 c4 08          	add    $0x8,%rsp
  4234ec:	c3                   	retq   
