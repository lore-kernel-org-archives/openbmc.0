Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 32A581A0048
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 16:20:26 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145525442320275.92800233858452;
 Thu, 11 Feb 2016 21:20:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc-build-scripts] build-setup: Ensure we fail the build
 when a step fails
Date: Thu, 11 Feb 2016 23:20:21 -0600
Message-Id: <1455254421-26850-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455254421-26850-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455254421-26850-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 12 Feb 2016 05:20:28 -0000

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 build-setup.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/build-setup.sh b/build-setup.sh
index a96ed44..f2a37fa 100755
--- a/build-setup.sh
+++ b/build-setup.sh
@@ -7,8 +7,8 @@
 #   distro = fedora|ubuntu
 #   WORKSPACE = 
 
-# Trace bash processing
-set -x
+# Trace bash processing. Set -e so when a step fails, we fail the build
+set -xe
 
 # Default variables
 target=${target:-qemu}
@@ -100,7 +100,7 @@ mkdir -p ${WORKSPACE}
 cat > "${WORKSPACE}"/build.sh << EOF_SCRIPT
 #!/bin/bash
 
-set -x
+set -ex
 
 cd ${WORKSPACE}
 
-- 
2.7.1
