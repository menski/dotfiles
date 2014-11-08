# use opendns to show external ip
function myip {
  dig +short myip.opendns.com @resolver1.opendns.com
}
