source ./ip_list.sh

for ip in "${ips[@]}"
do
  echo "Issue command in $ip"
  if [ $# -eq 0 ]
  then
    ssh -i ../pems/binhang_ds3_aws_oregon.pem ubuntu@"$ip" "bash -s" < ./local_git_pull.sh &
  else
    token=$1
    ssh -i ../pems/binhang_ds3_aws_oregon.pem ubuntu@"$ip" "bash -s" < ./local_git_pull.sh "$token" &
  fi
done