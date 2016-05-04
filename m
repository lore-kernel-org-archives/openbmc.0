Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r00882tRzzDqCD
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2016 11:00:24 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462323618299209.1559051263049;
 Tue, 3 May 2016 18:00:18 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v3 3/5] Add travis dir to keep all the Travis CI
 specific files together
Date: Tue,  3 May 2016 20:00:11 -0500
Message-Id: <1462323613-10640-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462323613-10640-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462323613-10640-1-git-send-email-openbmc-patches@stwcx.xyz>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 04 May 2016 01:00:25 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 .build.sh       | 23 -----------------------
 .travis.yml     |  2 +-
 travis/build.sh | 23 +++++++++++++++++++++++
 3 files changed, 24 insertions(+), 24 deletions(-)
 delete mode 100755 .build.sh
 create mode 100755 travis/build.sh

diff --git a/.build.sh b/.build.sh
deleted file mode 100755
index 79b0b5c..0000000
--- a/.build.sh
+++ /dev/null
@@ -1,23 +0,0 @@
-#!/bin/bash
-
-Dockerfile=$(cat << EOF
-FROM ubuntu:15.10
-RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -yy
-RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yy make gcc libsystemd-dev libc6-dev pkg-config
-RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
-USER ${USER}
-ENV HOME ${HOME}
-RUN /bin/bash
-EOF
-)
-
-docker pull ubuntu:15.10
-docker build -t temp - <<< "${Dockerfile}"
-
-gcc --version
-
-mkdir -p linux
-wget https://raw.githubusercontent.com/openbmc/linux/dev-4.3/include/uapi/linux/bt-host.h -O linux/bt-host.h
-
-docker run --cap-add=sys_admin --net=host --rm=true --user="${USER}" \
- -w "${PWD}" -v "${HOME}":"${HOME}" -t temp make KERNEL_HEADERS=$PWD
diff --git a/.travis.yml b/.travis.yml
index faaa918..bfdedab 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -6,4 +6,4 @@ services:
 language: c
 
 script:
-    - ./.build.sh
+    - ./travis/build.sh
diff --git a/travis/build.sh b/travis/build.sh
new file mode 100755
index 0000000..79b0b5c
--- /dev/null
+++ b/travis/build.sh
@@ -0,0 +1,23 @@
+#!/bin/bash
+
+Dockerfile=$(cat << EOF
+FROM ubuntu:15.10
+RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -yy
+RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yy make gcc libsystemd-dev libc6-dev pkg-config
+RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+USER ${USER}
+ENV HOME ${HOME}
+RUN /bin/bash
+EOF
+)
+
+docker pull ubuntu:15.10
+docker build -t temp - <<< "${Dockerfile}"
+
+gcc --version
+
+mkdir -p linux
+wget https://raw.githubusercontent.com/openbmc/linux/dev-4.3/include/uapi/linux/bt-host.h -O linux/bt-host.h
+
+docker run --cap-add=sys_admin --net=host --rm=true --user="${USER}" \
+ -w "${PWD}" -v "${HOME}":"${HOME}" -t temp make KERNEL_HEADERS=$PWD
-- 
2.8.1
