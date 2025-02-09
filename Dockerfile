# 使用 Ubuntu 14.04
FROM ubuntu:20.04

# 設定環境變數，避免時區選擇交互模式
ENV DEBIAN_FRONTEND=noninteractive

# 更新並安裝必要工具
RUN apt update && apt install -y \
    tzdata openssh-server sudo curl wget software-properties-common \
    nodejs npm python3 python3-pip vim git \
    bash-completion locales xz-utils libx11-xcb1 libfuse2

# 設定時區為 Asia/Taipei，避免互動式選擇
RUN ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
    echo "Asia/Taipei" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

# 安裝語系支援
RUN locale-gen en_US.UTF-8

# 建立 user 使用者，並添加到 sudo 群組
RUN useradd -rm -d /home/user -s /bin/bash -g root -G sudo -u 1000 user
RUN echo 'user:d2tqfp' | chpasswd

# 允許 user 使用 sudo 而不需要輸入密碼
RUN echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 確保 sshd 能夠正常運行
RUN mkdir /run/sshd

# 開放 SSH 端口
EXPOSE 22

# 啟動 SSH 伺服器
CMD ["/usr/sbin/sshd", "-D"]

