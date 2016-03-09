Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DFB7A1A009D
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 16:00:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457499626427436.4571119276836;
 Tue, 8 Mar 2016 21:00:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Smart <distroguy@gmail.com>
Subject: [PATCH openbmc-build-scripts v2 1/2] fix: Dockerfile set a static
 datestamp so that apt-get/dnf aren't run each time a new docker container is
 built. Increment it if you want to refresh the package databases in order to
 install new software or if something is out of date.
Date: Tue,  8 Mar 2016 23:00:23 -0600
Message-Id: <1457499624-3653-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457499624-3653-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457499624-3653-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 09 Mar 2016 05:00:29 -0000

From: Chris Smart <distroguy@gmail.com>

---
 build-setup.sh           | 7 ++++---
 initramfs-build.sh       | 4 ++--
 kernel-build-setup.sh    | 6 ++++--
 kernel-build.sh          | 4 ++--
 openpower-build-setup.sh | 5 +++--
 5 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/build-setup.sh b/build-setup.sh
index 86891a9..d777906 100755
--- a/build-setup.sh
+++ b/build-setup.sh
@@ -48,7 +48,8 @@ FROM fedora:latest
 
 ${PROXY}
 
-RUN dnf --refresh upgrade -y
+# change datestamp below to force a cache refresh
+RUN echo 201603091439 && dnf --refresh upgrade -y
 RUN dnf install -y git subversion gcc gcc-c++ make perl-Thread-Queue perl-Data-Dumper diffstat texinfo \
 chrpath wget SDL-devel patch bzip2 tar cpio findutils socat which python-devel perl-bignum
 
@@ -71,8 +72,8 @@ FROM ubuntu:latest
 
 ${PROXY}
 
-#RUN echo $(date +%s) && apt-get update
-RUN apt-get update
+# update datestamp below to force a cache refresh
+RUN echo 201603091439 && apt-get update
 RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
 RUN DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git subversion diffstat texinfo \
   chrpath wget libthread-queue-any-perl libdata-dumper-simple-perl python libsdl1.2-dev gawk socat debianutils
diff --git a/initramfs-build.sh b/initramfs-build.sh
index 3ea2e08..26d4bcf 100755
--- a/initramfs-build.sh
+++ b/initramfs-build.sh
@@ -23,8 +23,8 @@ FROM ubuntu:15.10
 
 ${PROXY}
 
-#RUN echo $(date +%s) && apt-get update
-RUN apt-get update
+# update datestamp below to force a cache refresh
+RUN echo 201603091439 && apt-get update
 RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -yy
 RUN DEBIAN_FRONTEND=noninteractive apt-get install -yy bc build-essential cpio git python unzip wget
 RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
diff --git a/kernel-build-setup.sh b/kernel-build-setup.sh
index de3253f..056f902 100755
--- a/kernel-build-setup.sh
+++ b/kernel-build-setup.sh
@@ -29,7 +29,8 @@ FROM fedora:latest
 
 ${PROXY}
 
-RUN dnf --refresh upgrade -y
+# update datestamp below to force a cache refresh
+RUN echo 201603091439 && dnf --refresh upgrade -y
 RUN dnf install -y bc findutils git gcc gcc-arm-linux-gnu hostname make uboot-tools xz
 RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
 
@@ -49,7 +50,8 @@ FROM ubuntu:latest
 
 ${PROXY}
 
-RUN apt-get update
+# update datestamp below to force a cache refresh
+RUN echo 201603091439 && apt-get update
 RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -yy
 RUN DEBIAN_FRONTEND=noninteractive apt-get install -yy bc build-essential git gcc-arm-none-eabi u-boot-tools
 RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
diff --git a/kernel-build.sh b/kernel-build.sh
index af2bec0..a48bea7 100755
--- a/kernel-build.sh
+++ b/kernel-build.sh
@@ -23,8 +23,8 @@ FROM ubuntu:15.10
 
 ${PROXY}
 
-# If we need to fetch new apt repo data, update the timestamp
-RUN echo 201603031716 && apt-get update
+# update datestamp below to force a cache refresh
+RUN echo 201603091439 && apt-get update
 RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -yy
 RUN DEBIAN_FRONTEND=noninteractive apt-get install -yy bc build-essential git gcc-powerpc64le-linux-gnu
 RUN DEBIAN_FRONTEND=noninteractive apt-get install -yy software-properties-common
diff --git a/openpower-build-setup.sh b/openpower-build-setup.sh
index 1c771aa..9ef0f2c 100755
--- a/openpower-build-setup.sh
+++ b/openpower-build-setup.sh
@@ -42,8 +42,9 @@ elif [[ "${distro}" == ubuntu ]]; then
 FROM ubuntu:15.10
 
 ENV DEBIAN_FRONTEND noninteractive
-RUN echo $(date +%s) && apt-get update && \
-	apt-get install -y \
+# update datestamp below to force a cache refresh
+RUN echo 201603091439 && apt-get update
+RUN apt-get install -y \
 	cscope ctags libz-dev libexpat-dev python language-pack-en texinfo \
 	build-essential g++ git bison flex unzip libxml-simple-perl \
 	libxml-sax-perl libxml2-dev libxml2-utils xsltproc wget cpio bc \
-- 
2.7.1
