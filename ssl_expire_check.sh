#!/bin/bash
#author @mkuwamura
#
SCRIPT_DIR=$(cd $(dirname $0);pwd)
echo "<HTML>"
echo "<head>"
echo "<meta http-equiv=\"Content-Type\" content=\"text/html\;charset=UTF-8\">"
echo "</head>"
echo "<body>"
echo "<BR>"
echo "check_date" `date`"<BR>"
echo "<table border="3">"
echo "<tr>"
echo "<th>FQDN</th>"
echo "<th>Deadline</th>"
echo "<th>Issuer</th>"
echo "<th>expiry date(GMT)</th>"
echo "</tr>"
while read DOMAIN
do
echo "<tr>"
echo "<td>"
echo "<a href="https://$DOMAIN" target="_blank">$DOMAIN</a>"
echo "</td>"

echo "<td>"
  date +"%s" --date="`openssl s_client -connect "$DOMAIN":443 -servername "$DOMAIN" </dev/null 2>/dev/null | openssl x509 -enddate -noout | cut -d'=' -f2`" | gawk '{printf("%d\n",($0-systime())/86400-1/86400+1)}'| tr '\n' ' '

echo "</td>"
echo "<td>"
openssl  s_client -connect "$DOMAIN":443   < /dev/null 2> /dev/null | openssl x509 -text  | grep "Issuer"| awk '{print $3}'|tr '\n' ' ' | cut -c 3- | tr ',-' ' '|tr '\
n' ' '
echo "</td>"
echo "<td>"
openssl s_client -connect "$DOMAIN":443 < /dev/null 2> /dev/null | openssl x509 -text | grep "Not After" | awk '{print $7" " $4" "$5}'|tr '\n' ' '
echo "</td>"
echo "</tr>"
done <$SCRIPT_DIR/check_url_list
echo "</table>"

echo "</body>"
echo "</HTML>"
