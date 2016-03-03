Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 04E491A0324
 for <openbmc@lists.ozlabs.org>; Thu,  3 Mar 2016 18:00:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456988430839872.2233178348841;
 Wed, 2 Mar 2016 23:00:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Smart <distroguy@gmail.com>
Subject: [PATCH openbmc-build-scripts 2/2] add: build a debug version of the
 kernel with sparse and check structs (need multiverse repo)
Date: Thu,  3 Mar 2016 01:00:28 -0600
Message-Id: <1456988428-5863-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456988428-5863-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456988428-5863-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Mar 2016 07:00:34 -0000

From: Chris Smart <distroguy@gmail.com>

fix: don't need to force apt-get with date all the time
---
 kernel-build.sh | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/kernel-build.sh b/kernel-build.sh
index f74747a..af2bec0 100755
--- a/kernel-build.sh
+++ b/kernel-build.sh
@@ -23,9 +23,16 @@ FROM ubuntu:15.10
 
 ${PROXY}
 
-RUN echo $(date +%s) && apt-get update
+# If we need to fetch new apt repo data, update the timestamp
+RUN echo 201603031716 && apt-get update
 RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -yy
 RUN DEBIAN_FRONTEND=noninteractive apt-get install -yy bc build-essential git gcc-powerpc64le-linux-gnu
+RUN DEBIAN_FRONTEND=noninteractive apt-get install -yy software-properties-common
+RUN apt-add-repository -y multiverse
+# If we need to fetch new apt repo data, update the timestamp
+RUN echo 201603031716 && apt-get update
+RUN apt-get update
+RUN DEBIAN_FRONTEND=noninteractive apt-get install -yy dwarves sparse
 RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
 
 USER ${USER}
@@ -61,9 +68,18 @@ cd linux
 # Record the version in the logs
 powerpc64le-linux-gnu-gcc --version || exit 1
 
-# Build kernel
+# Build kernel prep
 ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- make clean || exit 1
 ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- make mrproper || exit 1
+
+# Build kernel with debug
+ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- make pseries_le_defconfig || exit 1
+echo "CONFIG_DEBUG_INFO=y" >> .config
+ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- make olddefconfig || exit 1
+ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- make -j$(nproc) -s C=2 CF=-D__CHECK_ENDIAN__ 2>&1 | gzip > sparse.log.gz
+pahole vmlinux 2>&1 | gzip > structs.dump.gz
+
+# Build kernel
 ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- make pseries_le_defconfig || exit 1
 ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- make -j$(nproc) || exit 1
 
-- 
2.7.1
