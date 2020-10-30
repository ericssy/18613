 ./port-for-user.pl siyuans



pxy/pxydrive.py -p ./proxy -f tests/A01-single-fetch.cmd

pxy/pxydrive.py -p ./proxy -f tests/B01-sigpipe.cmd

```
./proxy-ref [port number] &; 
curl --proxy http://localhost:[port number] http://www.google.com
```



int clients = socket(AF_INET, SOCK_STREAM, 0); 



./proxy-ref 17638 &

./proxy 17638 &

curl --proxy http://localhost:17638 http://www.google.com

curl --proxy http://localhost:17638 http://www.cmu.edu/ini/admissions/index.html

curl --proxy http://localhost:17638 http://www.andrew.cmu.edu/course/18-613/proxylab/scs.html

curl --proxy http://localhost:17638 http://lemonshark.ics.cs.cmu.edu:17639/random-text.txt

port: 17638



curl http://lemonshark.ics.cs.cmu.edu:17639/random-text.txt



pxy/pxydrive.py -P localhost:17638 -f tests/A01-single-fetch.cmd

pxy/pxydrive.py -P localhost:17638 -f tests/B01-sigpipe.cmd

hammerheadshark.ics.cs.cmu.edu:8542

pxy/pxydrive.py -P localhost:17638 -f tests/

http://hammerheadshark.ics.cs.cmu.edu:8542/random-text.txt

curl -v --proxy http://localhost:17638 http://localhost:17639/home.html

curl -v --proxy http://localhost:17638 http://localhost:17639/google.com



./tiny/tiny 17639 &



```
Proxy set up at lemonshark.ics.cs.cmu.edu:10299
># Test ability to fetch very small text file
>serve s1                       # Set up server
Server s1 running at lemonshark.ics.cs.cmu.edu:5967
>generate random-text.txt 50    # Create file
>fetch f1 random-text.txt s1    # Fetch it from server
Client: Fetching '/random-text.txt' from lemonshark.ics.cs.cmu.edu:5967
>wait *
>check f1                       # Make sure it's correct
Request f1 yielded expected status 'ok'
>trace f1                       # Run trace on transaction
== Trace of request f1 =========================================================
Initial request by client had header:
GET http://lemonshark.ics.cs.cmu.edu:5967/random-text.txt HTTP/1.0\r\n
Host: lemonshark.ics.cs.cmu.edu:5967\r\n
Request-ID: f1\r\n
Response: Immediate\r\n
Connection: close\r\n
Proxy-Connection: close \r\n
User-Agent: CMU/1.0 Iguana/20180704 PxyDrive/0.0.1\r\n
\r\n
--------------------------------------------------------------------------------
Message received by server had header:
GET /random-text.txt HTTP/1.0\r\n
Host: lemonshark.ics.cs.cmu.edu:5967\r\n
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:3.10.0) Gecko/20190401 Firefox/63.0.1\r\n
Connection: close\r\n
Proxy-Connection: close\r\n
Request-ID: f1\r\n
Response: Immediate\r\n
\r\n
--------------------------------------------------------------------------------
Message sent by server had header:
HTTP/1.0 200 OK\r\n
Server: Proxylab driver\r\n
Request-ID: f1\r\n
Content-length: 50\r\n
Content-type: text/plain\r\n
Content-Identifier: s1-/random-text.txt\r\n
Sequence-Identifier: 1\r\n
\r\n
--------------------------------------------------------------------------------
Message received by client had header:
HTTP/1.0 200 OK
Server: Proxylab driver\r\n
Request-ID: f1\r\n
Content-length: 50\r\n
Content-type: text/plain\r\n
Content-Identifier: s1-/random-text.txt\r\n
Sequence-Identifier: 1\r\n
\r\n
--------------------------------------------------------------------------------
Response status: ok
  Source file in ./source_files/random/random-text.txt
Request status:  ok (OK)
  Result file in ./response_files/f1-random-text.txt
>quit                           # Exit program
Testing done.  Elapsed time = 1.20 seconds
ALL TESTS PASSED
```



```
bash-4.2$ pxy/pxydrive.py -p ./proxy-ref -f tests/A02-basic-text.cmd
Proxy set up at hammerheadshark.ics.cs.cmu.edu:8356
># Test ability to retrieve text file
>serve s1
Server s1 running at hammerheadshark.ics.cs.cmu.edu:15835
>generate random-text.txt 10K
># Request file from server
>request r1 random-text.txt s1
Client: Requesting '/random-text.txt' from hammerheadshark.ics.cs.cmu.edu:15835
>wait *
># Allow server to respond to request
>respond r1
Server responded to request r1 with status ok
>wait *
>check r1
Request r1 yielded expected status 'ok'
>quit
Testing done.  Elapsed time = 1.20 seconds
ALL TESTS PASSED
```









```
-bash-4.2$ curl -v --proxy http://localhost:17638 http://localhost:17639/home.html
* About to connect() to proxy localhost port 17638 (#0)
*   Trying ::1...
* Connection refused
*   Trying 127.0.0.1...
* Connected to localhost (127.0.0.1) port 17638 (#0)
> GET http://localhost:17639/home.html HTTP/1.1
> User-Agent: curl/7.29.0
> Host: localhost:17639
> Accept: */*
> Proxy-Connection: Keep-Alive
> 
Accepted connection from localhost:42578
GET /home.html HTTP/1.0
Host: localhost:17639
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:3.10.0) Gecko/20190401 Firefox/63.0.1
Connection: close
Proxy-Connection: close
Accept: */*

Response headers:
HTTP/1.0 200 OK
Server: Tiny Web Server
Connection: close
Content-Length: 119
Content-Type: text/html

* HTTP 1.0, assume close after body
< HTTP/1.0 200 OK
< Server: Tiny Web Server
< Connection: close
< Content-Length: 119
< Content-Type: text/html
< 
<html>
<head><title>test</title></head>
<body>
<img align="middle" src="godzilla.gif">
Dave O'Hallaron
</body>
</html>
* Closing connection 0
```

​    // rio_readinitb(&rio_server, serverfd);





​    // rio_writen(serverfd, buf_request, buf_request_len);

​    

​    // printf("buf_request: %s", buf_request);

​    // // printf(buf_request);

​    // while ((n = rio_readlineb(&rio_server, buf_server, MAXLINE)) != 0)

​    // {

​    //     printf("server received %d bytes\n", (int)n);

​    //     rio_writen(connfd, buf_server, n);

​    // }



 



​    // close(serverfd);



​    buf_request_len = snprintf(buf_request, MAXBUF,

​            "Host: %s:%s\r\n" \

​            "User-Agent: %s\r\n" \

​            "Connection: close\r\n" \

​            "Proxy-Connection: close\r\n" \

​            "Content-Type: %s\r\n\r\n", \

​            host, port, header_user_agent, filetype);