# ubuntu-bash-mining

**ubuntu-bash-mining** is a set of bash scripts examples to simplify automatization for mining of cryptocurrency. In this repo example for [ethminer](https://github.com/ethereum-mining/ethminer.git) tool used (for building instructions please visit original repo, but some brief instructions you can find in this Readme file).

## Why are these scripts useful

* Complete example script for starting mining ETH in linux's SCREEN
* Complete example script for connect with mining pool (for [nanopool](https://nanopool.org))
* Example of bash script for checking if mining already run, and start if not
* Example of bash script for stop mining if specific ubuntu users are logged in, and start when logged out
* Using sheduling in CRON

## Usage
  
1. Open `start_mining.sh` script and change field `[etherium address]` to your real etherium address
2. Open `check_mining.sh` script and set actual script path to variable `SCRIPT_START_MINE`
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
If you want checking status of mining no matter what user is in the system, then add this line to crontab (script `check_users.sh` will not be used):
```
* * * * * [ubuntu-bash-mining]/check_mining.sh
```
Else, if you want to use stop-list of users:
```
* * * * * [ubuntu-bash-mining]/check_users.sh
```

## Checked configurations

* Ubuntu 16.04 + NVidia GTX 1060 6GB + CUDA 9.2 + NVidia driver ver: 396.37
* Ubuntu 20.04 + Nvidia GTX 1070 8GB + CUDA 11.2 + NVidia driver ver: 460.39
* Ubuntu 16.04 + Nvidia RTX 2070 Super + CUDA 10.2 + NVidia driver ver: 440.64.00
* Ubuntu 16.04 + NVidia Tesla P40 24GB + Nvdia Tesla P100 16GB + CUDA 11.2 + NVidia driver ver: 460.32.03
* Ubuntu 16.04 + Radeon RX 580 8 GB + amdgpu-pro-17.40-483984

## How to build ethminer for using with CUDA

1. Install nvidia driver and CUDA toolkit. Choose versions which fit your GPU model. This step is beyond the scope of this manual, it is better to use the original instructions from the NVidia site 
2. Install mesa library:
```sh
$ sudo apt-get install git mesa-common-dev cmake
```
3. Download and build ethminer:
```sh
$ git clone https://github.com/ethereum-mining/ethminer.git
$ cd ethminer
$ git submodule update --init --recursive
$ mkdir build 
$ cd build
$ cmake .. -DETHASHCUDA=ON -DETHASHCL=OFF -DETHSTRATUM=ON
```
4. Install ethminer:
```sh
$ sudo make install
```

## How to build ethminer for Radeon RX 580 8GB

1. Check availability of graphic card:
```sh
$ lspci | grep VGA
```
My output:
```sh
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Ellesmere [Radeon RX 470/480/570/570X/580/580X] (rev e7)
```
Use [this](https://askubuntu.com/questions/987778/how-to-fix-broken-packages-after-amdgpu-pro-install-fail) manual if you need to remove previous drivers installations

2. Use [this link](https://amdgpu-install.readthedocs.io/en/latest/) to get installations details from official site

3. Installation (get from [this](https://www.amd.com/en/support/kb/faq/amdgpupro-install))
```sh
$ tar -Jxvf amdgpu-pro-17.40-483984.tar.xz
$ cd amdgpu-pro-17.40-483984
$ ./amdgpu-pro-install -y --compute
```

4. Install OpenCL ICD (installable client driver) and mesa:
```sh
$ apt-get install opencv-amdgpu-pro-icd
$ apt-get install git mesa-common-dev cmake
```

5. Download and install ethminer:
```sh
$ git clone https://github.com/ethereum-mining/ethminer.git
$ cd ethminer
$ git submodule update --init --recursive
$ mkdir build; cd build
$ cmake .. -DETHASHCUDA=OFF -DETHASHCL=ON
$ cmake --build . -- j4 # may be skip this step - don't remember
$ sudo make install
```
