Tiny shell is able to execute basic command line inputs, including Input/Output redirection, and background job control.

#### Start the shell by the command

```
./tsh
```

An interface of `tsh>` will be prompted



## Sample command lines

#### Running a testing executable 

```sh
tsh> testprogs/myspin1
```



#### Running a testing executable with argument

```bash
tsh> testprogs/myspin2 1
```



#### Running a process in the background by adding `&`

```bash
tsh> testprogs/myspin1 &
```



#### show background jobs and stopped foreground jobs with `jobs`

```bash
tsh> jobs
```

```
tsh> jobs        
[1] (11451) Stopped    testprogs/myspin1
[2] (17079) Running    testprogs/myspin2 &
```

it will list the process id, job id, name of the process, and its status 



#### Stop the current foreground process by `Ctr + Z`



#### Kill the current process by `Ctr + C`



#### Run an existing process in background by either specifying the job id with `bg % jid` or  process id `bg pid`

```
tsh> bg %1
```

```
tsh> bg 11451
```



#### Switch an existing process to running in background by either specifying the job id with `bg % jid` or  process id `bg pid`

```bash
tsh> bg %1
```

```bash
tsh> bg 11451
```



#### Switch an existing process to running in foreground by either specifying the job id with `fg % jid` or  process id `fg pid`

```bash
tsh> fg %1
```

```bash
tsh> fg 11451
```



#### I/O redirection with `<` and `>`

```bash
 tsh> testprogs/mycat < input.txt
 tsh> /bin/cat < foo > bar
```



#### Quit the shell 

```
quit
```


