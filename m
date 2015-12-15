Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 242F11A0B4F
 for <openbmc@lists.ozlabs.org>; Wed, 16 Dec 2015 09:20:48 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1450218046025867.6854478591794;
 Tue, 15 Dec 2015 14:20:46 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] meta-phosphor: Update kernel to openbmc-20151210-1
Date: Tue, 15 Dec 2015 16:20:44 -0600
Message-Id: <1450218044-12020-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1450218044-12020-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1450218044-12020-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Dec 2015 22:20:50 -0000

From: Joel Stanley <joel@jms.id.au>

 - Temporary AST setup for Palmetto and Barreleye
 - Ensure all IP will be reset on reboot

These changes should help us to be less acceptable to userspace messing
up the configuration and causing bugs like the failure to reboot.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
index e57165b..8958215 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
 LINUX_VERSION ?= "4.3"
 LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
 
-SRCREV="openbmc-20151202-1"
+SRCREV="openbmc-20151210-1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.6.3
