Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B68451A06F8
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 01:20:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448288425924932.4929444911854;
 Mon, 23 Nov 2015 06:20:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] travis: Add Travis CI building
Date: Mon, 23 Nov 2015 09:20:24 -0500
Message-Id: <1448288424-18295-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448288424-18295-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448288424-18295-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 14:20:29 -0000

From: Joel Stanley <joel@jms.id.au>

Builds on Ubuntu 15.10 under docker.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .build.sh   | 20 ++++++++++++++++++++
 .travis.yml |  9 +++++++++
 2 files changed, 29 insertions(+)
 create mode 100755 .build.sh
 create mode 100644 .travis.yml

diff --git a/.build.sh b/.build.sh
new file mode 100755
index 0000000..97e97bb
--- /dev/null
+++ b/.build.sh
@@ -0,0 +1,20 @@
+#!/bin/bash
+
+Dockerfile=$(cat << EOF
+FROM ubuntu:15.10
+RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -yy
+RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yy make g++ gcc libsystemd-dev libc6-dev pkg-config
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
+docker run --cap-add=sys_admin --net=host --rm=true --user="${USER}" \
+ -w "${PWD}" -v "${HOME}":"${HOME}" -t temp make
diff --git a/.travis.yml b/.travis.yml
new file mode 100644
index 0000000..d8d6c1d
--- /dev/null
+++ b/.travis.yml
@@ -0,0 +1,9 @@
+language: c
+
+sudo: required
+
+services:
+    - docker
+
+script:
+    - ./.build.sh
-- 
2.6.3
