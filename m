Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r4Q2H4RghzDqCQ
 for <openbmc@lists.ozlabs.org>; Wed, 11 May 2016 15:40:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146294523574349.19096718540595;
 Tue, 10 May 2016 22:40:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] meta-phosphor: Move to openbmc-20160511-1
Date: Wed, 11 May 2016 00:40:33 -0500
Message-Id: <1462945233-30855-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1462945233-30855-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1462945233-30855-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 11 May 2016 05:40:40 -0000

From: Joel Stanley <joel@jms.id.au>

 - Enables network cable link detection
 - Adds support for VOUT sampling to the adm1275 driver

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
index 2e2c9ce..24cde9f 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.4.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
 LINUX_VERSION ?= "4.4"
 LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
 
-SRCREV="openbmc-20160329-2"
+SRCREV="openbmc-20160511-1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.8.1
