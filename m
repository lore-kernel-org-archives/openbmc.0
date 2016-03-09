Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9469A1A0C49
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 20:20:34 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457515231499328.9634941785198;
 Wed, 9 Mar 2016 01:20:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Smart <distroguy@gmail.com>
Subject: [PATCH openbmc-build-scripts v3 3/3] Add missing packages for Fedora
 openpower-build Skip system upgrade,
 just update package database and install packages
Date: Wed,  9 Mar 2016 03:20:28 -0600
Message-Id: <1457515228-12423-4-git-send-email-openbmc-patches@stwcx.xyz>
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
 build-setup.sh           |  4 ++--
 initramfs-build.sh       |  2 +-
 kernel-build-setup.sh    |  4 ++--
 kernel-build.sh          |  2 +-
 openpower-build-setup.sh | 37 +++++++++++++++++++++++++++++--------
 5 files changed, 35 insertions(+), 14 deletions(-)

diff --git a/build-setup.sh b/build-setup.sh
index b899d56..ca51041 100755
--- a/build-setup.sh
+++ b/build-setup.sh
@@ -48,7 +48,7 @@ FROM fedora:latest
 
 ${PROXY}
 
-RUN dnf --refresh upgrade -y && dnf install -y \
+RUN dnf --refresh install -y \
 	bzip2 \
 	chrpath \
 	cpio \
@@ -91,7 +91,7 @@ FROM ubuntu:latest
 ${PROXY}
 
 ENV DEBIAN_FRONTEND noninteractive
-RUN apt-get update && apt-get upgrade -yy && apt-get install -yy \
+RUN apt-get update && apt-get install -yy \
 	build-essential \
 	chrpath \
 	debianutils \
diff --git a/initramfs-build.sh b/initramfs-build.sh
index 5ef7e63..3c08807 100755
--- a/initramfs-build.sh
+++ b/initramfs-build.sh
@@ -24,7 +24,7 @@ FROM ubuntu:15.10
 ${PROXY}
 
 ENV DEBIAN_FRONTEND noninteractive
-RUN apt-get update && apt-get upgrade -yy && apt-get install -yy \
+RUN apt-get update && apt-get install -yy \
 	bc \
 	build-essential \
 	cpio \
diff --git a/kernel-build-setup.sh b/kernel-build-setup.sh
index c17c119..89c2d2f 100755
--- a/kernel-build-setup.sh
+++ b/kernel-build-setup.sh
@@ -29,7 +29,7 @@ FROM fedora:latest
 
 ${PROXY}
 
-RUN dnf --refresh upgrade -y && dnf install -y \
+RUN dnf --refresh install -y \
 	bc \
 	findutils \
 	git \
@@ -59,7 +59,7 @@ FROM ubuntu:latest
 ${PROXY}
 
 ENV DEBIAN_FRONTEND noninteractive
-RUN apt-get update && apt-get upgrade -yy && apt-get install -yy \
+RUN apt-get update && apt-get install -yy \
 	bc \
 	build-essential \
 	git \
diff --git a/kernel-build.sh b/kernel-build.sh
index 141d490..d1a52f2 100755
--- a/kernel-build.sh
+++ b/kernel-build.sh
@@ -24,7 +24,7 @@ FROM ubuntu:15.10
 ${PROXY}
 
 ENV DEBIAN_FRONTEND noninteractive 
-RUN apt-get update && apt-get upgrade -yy && apt-get install -yy \
+RUN apt-get update && apt-get install -yy \
 	bc \
 	build-essential \
 	git \
diff --git a/openpower-build-setup.sh b/openpower-build-setup.sh
index 47dfa32..774cc53 100755
--- a/openpower-build-setup.sh
+++ b/openpower-build-setup.sh
@@ -25,18 +25,39 @@ if [[ "${distro}" == fedora ]];then
   Dockerfile=$(cat << EOF
 FROM fedora:latest
 
-RUN dnf --refresh upgrade -y && dnf install -y \
-	vim \
-	gcc-c++ \
-	flex \
+RUN dnf --refresh repolist && dnf install -y \
+	bc \
 	bison \
-	git \
-	ctags \
+	bzip2 \
+	cpio \
   	cscope \
+	ctags \
 	expat-devel \
+	findutils \
+	flex \
+	gcc-c++ \
+	git \
+	libxml2-devel \
+	ncurses-devel \
 	patch \
+	perl \
+	perl-bignum \
+	"perl(Digest::SHA1)" \
+	perl(Env)" \
+	"perl(Fatal)" \
+	"perl(Thread::Queue)" \
+	"perl(XML::SAX)" \
+	"perl(XML::Simple)" \
+	"perl(YAML)" \
+	"perl(XML::LibXML)" \
+	python \
+	tar \
+	unzip \
+	vim \
+	wget \
+	which \
 	zlib-devel \
-	zlib-static perl
+	zlib-static
 
 RUN grep -q ${GROUPS} /etc/group || groupadd -g ${GROUPS} ${USER}
 RUN grep -q ${UID} /etc/passwd || useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
@@ -53,7 +74,7 @@ elif [[ "${distro}" == ubuntu ]]; then
 FROM ubuntu:15.10
 
 ENV DEBIAN_FRONTEND noninteractive
-RUN apt-get update && apt-get upgrade -yy && apt-get install -yy \
+RUN apt-get update && apt-get install -yy \
 	bc \
 	bison \
 	build-essential \
-- 
2.7.1
