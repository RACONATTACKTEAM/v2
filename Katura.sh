#Katura I's Modified Payload Header Sequence Block.
#---
# This block is in high demand due to kiddo's using Katura I's 'effctiv-pwr' attack against OVH.
# This attack is widely used against any load balancer protected server.
#
# Here is the block :
#
iptables -A INPUT -p udp -m u32 --u32 "12&0xFFFFFF00=0xC0A80F00" -j DROP
#
#Note : This only blocks the most concurrent payload type packets.
#       This attack is extremely hard to capture and block.
#
#       The exploit has been abused so much it was classed under CVE-19-35583.