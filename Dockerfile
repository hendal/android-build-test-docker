FROM openjdk:8-jdk

ENV ANDROID_COMPILE_SDK=27 ANDROID_BUILD_TOOLS=27.0.3 ANDROID_SDK_TOOLS=3859397

RUN apt-get --quiet update --yes && apt-get --quiet install --yes wget tar unzip lib32stdc++6 lib32z1 && \
    wget --quiet --output-document=android-sdk.tgz https://dl.google.com/android/repository/sdk-tools-linux-${ANDROID_SDK_TOOLS}.zip && \
    unzip sdk-tools-linux-${ANDROID_SDK_TOOLS}.zip && rm sdk-tools-linux-${ANDROID_SDK_TOOLS}.zip && \
    echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter android-${ANDROID_COMPILE_SDK} && \
    echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter platform-tools && \
    echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter build-tools-${ANDROID_BUILD_TOOLS} && \
    echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-android-m2repository && \
    echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-google_play_services && \
    echo y | android-sdk-linux/tools/android --silent update sdk --no-ui --all --filter extra-google-m2repository
    
    
