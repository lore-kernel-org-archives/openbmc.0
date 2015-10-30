Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 65AC21A0CD8
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2015 06:48:34 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 144623450921226.37649448419063;
 Fri, 30 Oct 2015 12:48:29 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc] Fix build break
Date: Fri, 30 Oct 2015 14:48:25 -0500
Message-Id: <1446234505-12410-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446234505-12410-1-git-send-email-patches@stwcx.xyz>
References: <1446234505-12410-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 19:48:34 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

Missing a 'file://' in linux-obmc SRC_URI
---
 .../meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
index 0575ac1..bb6f06c 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -1,2 +1,2 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-SRC_URI += "file://defconfig hwmon.cfg"
+SRC_URI += "file://defconfig file://hwmon.cfg"
-- 
2.6.0
