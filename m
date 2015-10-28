Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 333541A0B21
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 03:29:23 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1446049428854348.0054155564708;
 Wed, 28 Oct 2015 09:23:48 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc] Don't AUTOREV kernel
Date: Wed, 28 Oct 2015 11:23:46 -0500
Message-Id: <1446049426-31886-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446049426-31886-1-git-send-email-patches@stwcx.xyz>
References: <1446049426-31886-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 16:29:24 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
index 3e5bc94..81edb70 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
@@ -14,7 +14,7 @@ SRC_URI += "file://obmc-bsp.scc \
 LINUX_VERSION ?= "4.2"
 LINUX_VERSION_EXTENSION ?= "-openbmc-${SRCPV}"
 
-SRCREV="${AUTOREV}"
+SRCREV="openbmc-20151028-1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.6.0
