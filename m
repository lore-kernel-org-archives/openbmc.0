Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r008C0x34zDqCG
 for <openbmc@lists.ozlabs.org>; Wed,  4 May 2016 11:00:26 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1462323620303358.29011086025434;
 Tue, 3 May 2016 18:00:20 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v3 5/5] Travis CI: Bump to Ubuntu 16.04
Date: Tue,  3 May 2016 20:00:13 -0500
Message-Id: <1462323613-10640-6-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 04 May 2016 01:00:27 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 travis/build.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/travis/build.sh b/travis/build.sh
index e330afd..6b7f0fb 100755
--- a/travis/build.sh
+++ b/travis/build.sh
@@ -2,7 +2,7 @@
 set -evx
 
 Dockerfile=$(cat << EOF
-FROM ubuntu:15.10
+FROM ubuntu:16.04
 RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get upgrade -yy
 RUN DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -yy make gcc libsystemd-dev libc6-dev pkg-config
 RUN mkdir /var/run/dbus
@@ -13,7 +13,7 @@ RUN /bin/bash
 EOF
 )
 
-docker pull ubuntu:15.10
+docker pull ubuntu:16.04
 docker build -t temp - <<< "${Dockerfile}"
 
 sudo cp ./travis/org.openbmc.HostIpmi.conf.test /etc/dbus-1/system.d/org.openbmc.HostIpmi.conf
-- 
2.8.1
