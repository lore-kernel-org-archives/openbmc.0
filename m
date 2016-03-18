Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qRMhg1D0MzDqjb
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2016 22:00:51 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14582988451941017.150953730521;
 Fri, 18 Mar 2016 04:00:45 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] inarp: Update to 19ed5170
Date: Fri, 18 Mar 2016 06:00:32 -0500
Message-Id: <1458298832-18215-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458298832-18215-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458298832-18215-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 18 Mar 2016 11:00:51 -0000

From: Jeremy Kerr <jk@ozlabs.org>

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
2.7.1
