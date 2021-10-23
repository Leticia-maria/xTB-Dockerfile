FROM codercom/enterprise-base:ubuntu
# --- xTB docker build ---
# --- Setting arguments ---
ARG NAME=olympus
ARG DEBIAN_FRONTEND=noninteractive
ARG TZ=America/Sao_Paulo
USER root 
RUN apt update && \
# --- Installing Anaconda ---
    apt-get install -y git && \
    apt-get install -y python3-dev && \
    apt-get install python3-pip && \
    apt-get install --yes htop && \
    apt-get install curl && \  
    apt-get install wget && \ 
    apt-get install xz-utils && \
# --- Installing xTB ---
    wget https://github.com/grimme-lab/xtb/releases/download/v6.4.1/xtb-6.4.1-linux-x86_64.tar.xz && \
    tar -xvf xtb-6.4.1-linux-x86_64.tar.xz && \
    export MKL_NUM_THREADS=4 && \
    export OMP_NUM_THREADS=4 && \
    export OMP_STACKSIZE=1G && \
    export OMP_MAX_ACTIVE_LEVELS=1 && \
    ulimit -s unlimited && \
    export XTBHOME=/xtb-6.4.1 && \
    source $XTBHOME/share/xtb/config_env.bash
USER coder
