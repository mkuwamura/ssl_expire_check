﻿#!/bin/bash
#author @mkuwamura
#

echo "check_date" `date`"<BR>"

while read DOMAIN
do
  date +"%s" --date="`openssl s_client -connect "$DOMAIN":443 -servername "$DOMAIN" </dev/null 2>/dev/null | openssl x509 -enddate -noout | cut -d'=' -f2`" | gawk '{printf("%d\n",($0-systime())/86400-1/86400+1)}'| tr '\n' ', '
  echo -e "\t$DOMAIN<BR>"
  echo -e "\r\n"
done <check_url_list
