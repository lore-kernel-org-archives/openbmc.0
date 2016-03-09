Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7EC7D1A0313
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 20:20:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14575152306087.318236878725429;
 Wed, 9 Mar 2016 01:20:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Smart <distroguy@gmail.com>
Subject: [PATCH openbmc-build-scripts v3 2/3] fix: Dockerfile remove timestamp
 from apt-get/dnf calls altogether and put on one line so that a new package
 pulls in new everything
Date: Wed,  9 Mar 2016 03:20:27 -0600
Message-Id: <1457515228-12423-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457515228-12423-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457515228-12423-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Mar 2016 09:20:35 -0000

From: Chris Smart <distroguy@gmail.com>

---
 build-setup.sh           | 48 ++++++++++++++++++++++++++++++++++---------
 initramfs-build.sh       | 18 +++++++++++-----
 kernel-build-setup.sh    | 31 ++++++++++++++++++++--------
 kernel-build.sh          | 25 +++++++++++++----------
 openpower-build-setup.sh | 53 +++++++++++++++++++++++++++++++++++++-----------
 5 files changed, 128 insertions(+), 47 deletions(-)

diff --git a/build-setup.sh b/build-setup.sh
index d777906..b899d56 100755
--- a/build-setup.sh
+++ b/build-setup.sh
@@ -48,10 +48,28 @@ FROM fedora:latest
 
 ${PROXY}
 
-# change datestamp below to force a cache refresh
-RUN echo 201603091439 && dnf --refresh upgrade -y
-RUN dnf install -y git subversion gcc gcc-c++ make perl-Thread-Queue perl-Data-Dumper diffstat texinfo \
-chrpath wget SDL-devel patch bzip2 tar cpio findutils socat which python-devel perl-bignum
+RUN dnf --refresh upgrade -y && dnf install -y \
+	bzip2 \
+	chrpath \
+	cpio \
+	diffstat \
+	findutils \
+	gcc \
+	gcc-c++ \
+	git \
+	make \
+	patch \
+	perl-bignum \
+	perl-Data-Dumper \
+	perl-Thread-Queue \
+	python-devel \
+	SDL-devel \
+	socat \
+	subversion \
+	tar \
+	texinfo \
+	wget \
+	which
 
 RUN grep -q ${GROUPS} /etc/group || groupadd -g ${GROUPS} ${USER}
 RUN grep -q ${UID} /etc/passwd || useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
@@ -72,16 +90,26 @@ FROM ubuntu:latest
 
 ${PROXY}
 
-# update datestamp below to force a cache refresh
-RUN echo 201603091439 && apt-get update
-RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
-RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git subversion diffstat texinfo \
-  chrpath wget libthread-queue-any-perl libdata-dumper-simple-perl python libsdl1.2-dev gawk socat debianutils
+ENV DEBIAN_FRONTEND noninteractive
+RUN apt-get update && apt-get upgrade -yy && apt-get install -yy \
+	build-essential \
+	chrpath \
+	debianutils \
+	diffstat \
+	gawk \
+	git \
+	libdata-dumper-simple-perl \
+	libsdl1.2-dev \
+	libthread-queue-any-perl \
+	python \
+	socat \
+	subversion \
+	texinfo \
+	wget
 
 RUN grep -q ${GROUPS} /etc/group || groupadd -g ${GROUPS} ${USER}
 RUN grep -q ${UID} /etc/passwd || useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
 
-
 USER ${USER}
 ENV HOME ${HOME}
 RUN /bin/bash
diff --git a/initramfs-build.sh b/initramfs-build.sh
index 26d4bcf..5ef7e63 100755
--- a/initramfs-build.sh
+++ b/initramfs-build.sh
@@ -23,11 +23,19 @@ FROM ubuntu:15.10
 
 ${PROXY}
 
-# update datestamp below to force a cache refresh
-RUN echo 201603091439 && apt-get update
-RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -yy
-RUN DEBIAN_FRONTEND=noninteractive apt-get install -yy bc build-essential cpio git python unzip wget
-RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+ENV DEBIAN_FRONTEND noninteractive
+RUN apt-get update && apt-get upgrade -yy && apt-get install -yy \
+	bc \
+	build-essential \
+	cpio \
+	git \
+	python \
+	unzip \
+	wget
+
+RUN grep -q ${GROUPS} /etc/group || groupadd -g ${GROUPS} ${USER}
+RUN grep -q ${UID} /etc/passwd || useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+
 RUN locale-gen en_AU.utf8
 
 USER ${USER}
diff --git a/kernel-build-setup.sh b/kernel-build-setup.sh
index 056f902..c17c119 100755
--- a/kernel-build-setup.sh
+++ b/kernel-build-setup.sh
@@ -29,10 +29,18 @@ FROM fedora:latest
 
 ${PROXY}
 
-# update datestamp below to force a cache refresh
-RUN echo 201603091439 && dnf --refresh upgrade -y
-RUN dnf install -y bc findutils git gcc gcc-arm-linux-gnu hostname make uboot-tools xz
-RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+RUN dnf --refresh upgrade -y && dnf install -y \
+	bc \
+	findutils \
+	git \
+	gcc \
+	gcc-arm-linux-gnu \
+	hostname \
+	make \
+	uboot-tools xz
+
+RUN grep -q ${GROUPS} /etc/group || groupadd -g ${GROUPS} ${USER}
+RUN grep -q ${UID} /etc/passwd || useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
 
 USER ${USER}
 ENV HOME ${HOME}
@@ -50,11 +58,16 @@ FROM ubuntu:latest
 
 ${PROXY}
 
-# update datestamp below to force a cache refresh
-RUN echo 201603091439 && apt-get update
-RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -yy
-RUN DEBIAN_FRONTEND=noninteractive apt-get install -yy bc build-essential git gcc-arm-none-eabi u-boot-tools
-RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+ENV DEBIAN_FRONTEND noninteractive
+RUN apt-get update && apt-get upgrade -yy && apt-get install -yy \
+	bc \
+	build-essential \
+	git \
+	gcc-arm-none-eabi \
+	u-boot-tools
+
+RUN grep -q ${GROUPS} /etc/group || groupadd -g ${GROUPS} ${USER}
+RUN grep -q ${UID} /etc/passwd || useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
 
 USER ${USER}
 ENV HOME ${HOME}
diff --git a/kernel-build.sh b/kernel-build.sh
index a48bea7..141d490 100755
--- a/kernel-build.sh
+++ b/kernel-build.sh
@@ -23,17 +23,20 @@ FROM ubuntu:15.10
 
 ${PROXY}
 
-# update datestamp below to force a cache refresh
-RUN echo 201603091439 && apt-get update
-RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -yy
-RUN DEBIAN_FRONTEND=noninteractive apt-get install -yy bc build-essential git gcc-powerpc64le-linux-gnu
-RUN DEBIAN_FRONTEND=noninteractive apt-get install -yy software-properties-common
-RUN apt-add-repository -y multiverse
-# If we need to fetch new apt repo data, update the timestamp
-RUN echo 201603031716 && apt-get update
-RUN apt-get update
-RUN DEBIAN_FRONTEND=noninteractive apt-get install -yy dwarves sparse
-RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+ENV DEBIAN_FRONTEND noninteractive 
+RUN apt-get update && apt-get upgrade -yy && apt-get install -yy \
+	bc \
+	build-essential \
+	git \
+	gcc-powerpc64le-linux-gnu \
+	software-properties-common
+
+RUN apt-add-repository -y multiverse && apt-get update && apt-get install -yy \
+	dwarves \
+	sparse
+
+RUN grep -q ${GROUPS} /etc/group || groupadd -g ${GROUPS} ${USER}
+RUN grep -q ${UID} /etc/passwd || useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
 
 USER ${USER}
 ENV HOME ${HOME}
diff --git a/openpower-build-setup.sh b/openpower-build-setup.sh
index 9ef0f2c..47dfa32 100755
--- a/openpower-build-setup.sh
+++ b/openpower-build-setup.sh
@@ -25,10 +25,21 @@ if [[ "${distro}" == fedora ]];then
   Dockerfile=$(cat << EOF
 FROM fedora:latest
 
-RUN dnf --refresh upgrade -y && \
-	dnf install -y vim gcc-c++ flex bison git ctags cscope expat-devel \
-	patch zlib-devel zlib-static perl
-RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+RUN dnf --refresh upgrade -y && dnf install -y \
+	vim \
+	gcc-c++ \
+	flex \
+	bison \
+	git \
+	ctags \
+  	cscope \
+	expat-devel \
+	patch \
+	zlib-devel \
+	zlib-static perl
+
+RUN grep -q ${GROUPS} /etc/group || groupadd -g ${GROUPS} ${USER}
+RUN grep -q ${UID} /etc/passwd || useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
 
 USER ${USER}
 ENV HOME ${HOME}
@@ -42,14 +53,32 @@ elif [[ "${distro}" == ubuntu ]]; then
 FROM ubuntu:15.10
 
 ENV DEBIAN_FRONTEND noninteractive
-# update datestamp below to force a cache refresh
-RUN echo 201603091439 && apt-get update
-RUN apt-get install -y \
-	cscope ctags libz-dev libexpat-dev python language-pack-en texinfo \
-	build-essential g++ git bison flex unzip libxml-simple-perl \
-	libxml-sax-perl libxml2-dev libxml2-utils xsltproc wget cpio bc \
-	vim-common
-RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+RUN apt-get update && apt-get upgrade -yy && apt-get install -yy \
+	bc \
+	bison \
+	build-essential \
+	cscope \
+       	cpio \
+	ctags \
+	flex \
+	g++ \
+	git \
+	libexpat-dev \
+	libz-dev \
+	libxml-sax-perl \
+	libxml-simple-perl \
+	libxml2-dev \
+	libxml2-utils \
+	language-pack-en \
+	python \
+	texinfo \
+	unzip \
+	vim-common \
+	wget\
+	xsltproc
+
+RUN grep -q ${GROUPS} /etc/group || groupadd -g ${GROUPS} ${USER}
+RUN grep -q ${UID} /etc/passwd || useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
 
 USER ${USER}
 ENV HOME ${HOME}
-- 
2.7.1
