FROM node:12

RUN npm install -g sfdx-cli

RUN apt-get update && apt-get install -y wget libasound2 libasound2-data \
    && wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  https://download.oracle.com/otn-pub/java/jdk/12.0.2+10/e482c34c86bd4bf8b56c0b35558996b9/jdk-12.0.2_linux-x64_bin.deb \
    && dpkg -i jdk-12.0.2_linux-x64_bin.deb \
    && update-alternatives --install /usr/bin/java java  /usr/lib/jvm/jdk-12.0.2/bin/java 2 \
    && update-alternatives --config java \
    && update-alternatives --install /usr/bin/jar jar /usr/lib/jvm/jdk-12.0.2/bin/jar 2 \
    && update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-12.0.2/bin/javac 2 \
    && update-alternatives --set jar /usr/lib/jvm/jdk-12.0.2/bin/jar \
    && update-alternatives --set javac /usr/lib/jvm/jdk-12.0.2/bin/javac \
    && rm jdk-12.0.2_linux-x64_bin.deb

RUN curl -L https://github.com/pmd/pmd/releases/download/pmd_releases%2F6.18.0/pmd-bin-6.18.0.zip > pmd.zip \
    && unzip pmd.zip -d /opt \
    && rm pmd.zip