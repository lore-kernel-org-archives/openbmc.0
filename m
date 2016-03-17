Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQkZt4vKpzDq7K
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 21:08:38 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1023)
 id 3qQkZt4R9Nz9sD3; Thu, 17 Mar 2016 21:08:38 +1100 (AEDT)
From: Jeremy Kerr <jk@ozlabs.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] inarp: Update to 19ed5170
Date: Thu, 17 Mar 2016 18:08:32 +0800
Message-Id: <1458209312-4881-1-git-send-email-jk@ozlabs.org>
X-Mailer: git-send-email 2.5.0
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
X-List-Received-Date: Thu, 17 Mar 2016 10:08:39 -0000

This change updates us to 19ed5170, which supports dynamic interface
configuration, and better syslog support.

Jeremy Kerr (3):
      Rename inarp_ctx.socket
      Use netlink for link state queries
      Use syslog for log output

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 meta-phosphor/common/recipes-phosphor/inarp/inarp.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb b/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb
index a36bba1..d7d96c0 100644
--- a/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb
+++ b/meta-phosphor/common/recipes-phosphor/inarp/inarp.bb
@@ -11,7 +11,7 @@ TARGET_CFLAGS   += "-fpic -O2"
 RDEPENDS_${PN} += "network"
 SRC_URI += "git://github.com/openbmc/inarp"
 
-SRCREV = "19ed5170356495f5fc67189513c5739780ee6a81"
+SRCREV = "e3f27cf06cc2ca93ae9746ba705a0d9fc307cec2"
 
 S = "${WORKDIR}/git"
 INSTALL_NAME = "inarp"
-- 
2.5.0
