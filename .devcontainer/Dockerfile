FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-17-jdk \
    wget \
    ca-certificates \
    bash \
    sudo \
    && rm -rf /var/lib/apt/lists/*

ARG USERNAME=youralternative
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME
WORKDIR /home/$USERNAME

ENV ANDROID_SDK_ROOT=/home/$USERNAME/android-sdk
ENV ANDROID_HOME=$ANDROID_SDK_ROOT
ENV PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools

RUN mkdir -p $ANDROID_SDK_ROOT/cmdline-tools

RUN wget https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdline-tools.zip \
    && unzip cmdline-tools.zip \
    && mv cmdline-tools $ANDROID_SDK_ROOT/cmdline-tools/latest \
    && rm cmdline-tools.zip

RUN yes | sdkmanager --licenses && \
    sdkmanager \
    "platform-tools" \
    "platforms;android-36" \
    "build-tools;35.0.0" \
    "ndk;28.2.13676358" \
    "cmake;3.22.1"

ENV FLUTTER_HOME=/home/$USERNAME/flutter
ENV PATH=$PATH:$FLUTTER_HOME/bin

RUN git clone https://github.com/flutter/flutter.git -b stable --depth=1 $FLUTTER_HOME \
    && cd $FLUTTER_HOME \
    && git fetch --depth=1 origin 57c3f8b665259d34b0b3e544ec44e837cfc917f6 \
    && git checkout 57c3f8b665259d34b0b3e544ec44e837cfc917f6

RUN flutter precache --android

SHELL ["/bin/bash", "-c"]
