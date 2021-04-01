# ubuntu-bash-mining

ubuntu-bash-mining is a set of bash scripts examples to simplify automatization of your cryptocurrency mining. In this repo used example for [ethminer](https://github.com/ethereum-mining/ethminer.git) tool. For building instructions please visit original repo.

## Why are these scripts useful

* Complete example script for starting mining ETH in linux's screen
* Sample pool connection string syntax (pool [nanopool](https://nanopool.org))
* Example of bash script for checking if mining already run, and start if not run (TODO)
* Example of bash script for stop mining if specific ubuntu users are logging (TODO)

## Checked configurations

* Ubuntu 16.04 + NVidia GTX 1060 6GB + CUDA 9.2 + driver ver: 396.37
* Ubuntu 16.04 + NVidia Tesla P40 24GB + Nvdia Tesla P100 16GB + CUDA 11.2 + driver ver: 460.32.03
* Ubuntu 20.04 + Nvidia GTX 1070 8GB + CUDA 11.2 + driver ver: 460.39
* Ubuntu 16.04 + Radeon RX 580 8 GB + amdgpu-pro-17.40-483984

## Usage

<details><summary><b>Show instructions</b></summary>
  
1. Open start_mining.sh script and change field [etherium address] to your real etherium address
2. Open check_mining.sh script and set actual path to variable SCRIPT_START_MINE

</details>

## (Optional) Build ethminer for using with CUDA (TODO)

## (Optional) Build ethminer for Radeon RX 580 8GB
