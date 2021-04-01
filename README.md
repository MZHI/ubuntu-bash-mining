# ubuntu-bash-mining

**ubuntu-bash-mining** is a set of bash scripts examples to simplify automatization for mining of cryptocurrency. In this repo example for [ethminer](https://github.com/ethereum-mining/ethminer.git) tool used (for building instructions please visit original repo, but some brief instructions you can find in this Readme file).

## Why are these scripts useful

* Complete example script for starting mining ETH in linux's SCREEN
* Sample pool connection string syntax (pool [nanopool](https://nanopool.org))
* Example of bash script for checking if mining already run, and start if not
* Example of bash script for stop mining if specific ubuntu users are logged in
* Example how use sheduling in CRON

## Usage
  
1. Open **start_mining.sh** script and change field `[etherium address]` to your real etherium address
2. Open **check_mining.sh** script and set actual path to variable `SCRIPT_START_MINE`
3. Run command:
```sh
$ echo $PATH
```
Then get this value and set to variable `PATH` from script **check_users.sh** 
4. Set needed list of users into variable `USERS` in script **check_users.sh**. Mining will stop when one of these users is logged in. Also, set actual paths for variables `SCRIPT_CHECK` and `SCRIPT_STOP`
5. Change mode for all bash scripts:
```sh
$ chmod +x start_mining.sh
$ chmod +x stop_mining.sh
$ chmod +x check_mining.sh
$ chmod +x check_users.sh
```
5. Open crontab:
```sh
$ crontab -e
```
and set your shedule for checking. 
If you want checking status of mining no matter what user is in the system, then add this line to crontab:
```
* * * * * [ubuntu-bash-mining]/check_mining.sh
```
Else, if you want to use stop-list of users:
```
* * * * * [ubuntu-bash-mining]/check_users.sh
```

## Checked configurations

* Ubuntu 16.04 + NVidia GTX 1060 6GB + CUDA 9.2 + driver ver: 396.37
* Ubuntu 16.04 + NVidia Tesla P40 24GB + Nvdia Tesla P100 16GB + CUDA 11.2 + driver ver: 460.32.03
* Ubuntu 20.04 + Nvidia GTX 1070 8GB + CUDA 11.2 + driver ver: 460.39
* Ubuntu 16.04 + Radeon RX 580 8 GB + amdgpu-pro-17.40-483984

## (Optional) Build ethminer for using with CUDA (TODO)

## (Optional) Build ethminer for Radeon RX 580 8GB
