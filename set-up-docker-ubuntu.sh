#!/ bin / bash

#Get Updates
sudo apt update

#Get GCC
sudo apt install gcc

#Install Docker
sudo snap install docker
sudo apt install docker-compose

#Install Anaconda
cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
source ~/.bashrc

#Install PySyft req
conda create -n pysyft python=3.7
conda activate pysyft
conda install jupyter notebook
pip install --upgrade --force-reinstall zstd

# Install PySyft Library
cd ~
git clone https://github.com/OpenMined/PySyft.git
cd PySyft/
pip install .

#Install PyGrid
cd ~
git clone https://github.com/OpenMined/PyGrid.git
cd PyGrid
pip install .

#Build node and gateway images
sudo docker build -t openmined/grid-node ./app/websocket/
sudo docker build -t openmined/grid-gateway ./gateway/

# Run envirnment from docker-compose.yml file
sudo docker-compose up

#RUN FROM OTHER TERMINAL

# Run jupyter notebook to interact with Grid network using tutorials
# jupyter notebook --ip 0.0.0.0 --port 8888
