Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 36FFC1A040B
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 00:12:13 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446469929361859.8590616782288;
 Mon, 2 Nov 2015 05:12:09 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 4/4] Bump kernel version to openbmc-20151102-1
Date: Mon,  2 Nov 2015 07:12:01 -0600
Message-Id: <1446469921-23240-5-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446469921-23240-1-git-send-email-patches@stwcx.xyz>
References: <1446469921-23240-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 02 Nov 2015 13:12:14 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
index 247f64c..3284fda 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
 LINUX_VERSION ?= "4.2"
 LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
 
-SRCREV="openbmc-20151028-1"
+SRCREV="openbmc-20151102-1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.6.0
