Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CBE7E1A04B3
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2016 17:10:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455775829004896.6754780172095;
 Wed, 17 Feb 2016 22:10:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v3 1/5] Add a script to build inside Docker
Date: Thu, 18 Feb 2016 00:10:23 -0600
Message-Id: <1455775827-22005-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455775827-22005-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455775827-22005-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 18 Feb 2016 06:10:33 -0000

From: Joel Stanley <joel@jms.id.au>

This allows phosphor-event to be on a machine with Docker installed
that does not have all the dependencies installed.

A docker container is built and used for the build process, with the
binary built in-place.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .build.sh | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100755 .build.sh

diff --git a/.build.sh b/.build.sh
new file mode 100755
index 0000000..0be2e19
--- /dev/null
+++ b/.build.sh
@@ -0,0 +1,22 @@
+#!/bin/bash
+
+set -ex
+
+Dockerfile=$(cat << EOF
+FROM ubuntu:15.10
+RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -yy
+RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yy \
+	make gcc g++ libsystemd-dev libc6-dev pkg-config
+RUN groupadd -g ${GROUPS} ${USER} && useradd -d ${HOME} -m -u ${UID} -g ${GROUPS} ${USER}
+USER ${USER}
+ENV HOME ${HOME}
+EOF
+)
+
+docker pull ubuntu:15.10
+docker build -t openbmc/phosphor-event - <<< "${Dockerfile}"
+
+gcc --version
+
+docker run --rm=true --user="${USER}" \
+ -w "${PWD}" -v "${HOME}":"${HOME}" openbmc/phosphor-event make
-- 
2.7.1
