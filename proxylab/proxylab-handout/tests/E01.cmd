# Make sure evict objects
serve s1
generate random-text01.txt 100K
generate random-text02.txt 100K
generate random-text03.txt 100K
generate random-text04.txt 100K
generate random-text05.txt 100K
generate random-text06.txt 100K
generate random-text07.txt 100K
generate random-text08.txt 100K
generate random-text09.txt 100K
generate random-text10.txt 100K
generate random-text11.txt 100K
generate random-text12.txt 100K
generate random-text13.txt 100K
generate random-text14.txt 100K
generate random-text15.txt 100K
request r01 random-text01.txt s1
wait *
request r02 random-text02.txt s1
wait *
request r03 random-text03.txt s1
wait *
respond r03 r01 r02
wait *
check r01
check r02
check r03
wait *
# More request 
request r04 random-text04.txt s1
wait *
request r05 random-text05.txt s1
wait *
request r06 random-text06.txt s1
wait *
respond r04 r05 r06
wait *
check r04
check r05
check r06
request r07 random-text07.txt s1
wait *
request r08 random-text08.txt s1
wait *
request r09 random-text09.txt s1
wait *
respond r07 r08 r09
wait *
check r07
check r08
check r09
request r10 random-text10.txt s1
wait *
request r11 random-text11.txt s1
wait *
request r12 random-text12.txt s1
wait *
respond r10 r11 r12
wait *
check r10
check r11
check r12
quit