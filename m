Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9E81C1A06D3
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2016 16:50:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1456120221857495.08677706284357;
 Sun, 21 Feb 2016 21:50:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] meta-phosphor: Update Linux to openbmc-20160222-1
Date: Sun, 21 Feb 2016 23:50:20 -0600
Message-Id: <1456120220-8844-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456120220-8844-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456120220-8844-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 22 Feb 2016 05:50:26 -0000

From: Joel Stanley <joel@jms.id.au>

 - 4.3.6 stable release
 - mtd: spi-nor: aspeed-smc: Use io string accessors to fifo
 - i2c: aspeed: Don't rename added devices
 - Remove GPIO and LPC from WDT reset list

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
index cd20762..3e74f7c 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.3.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
 LINUX_VERSION ?= "4.3"
 LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
 
-SRCREV="openbmc-20160212-1"
+SRCREV="openbmc-20160222-1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.7.1
