cd ~/tc_cluster_setting
source activate pytorch_p38

ip=$1
title=$2

export NCCL_SOCKET_IFNAME=wg0
export GLOO_SOCKET_IFNAME=wg0
export NCCL_SOCKET_NTHREADS=4
export NCCL_NSOCKS_PERTHREAD=4


echo "My IP "$ip" recv, and log."
python pytorch_send_recv_test.py --iter 30 --dist-url tcp://"$ip":9000 --world-size 2 --dist-backend cupy_nccl --use-cuda True --rank 0 >> "./nccl_run_logs/${title}_wg0_4_4.log"

