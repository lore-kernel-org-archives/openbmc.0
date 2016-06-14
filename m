Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rTg4069YXzDqhb
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jun 2016 05:40:48 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465933242085280.9978327070851;
 Tue, 14 Jun 2016 12:40:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] AST2500: defconfig changes required for systemd
Date: Tue, 14 Jun 2016 14:40:39 -0500
Message-Id: <20160614194039.17245-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160614194039.17245-1-openbmc-patches@stwcx.xyz>
References: <20160614194039.17245-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 14 Jun 2016 19:40:49 -0000

From: Rick Altherr <raltherr@google.com>

Change-Id: I43d8d469bce5c61d48506aebda7cfccf1d99f8b3
Signed-off-by: Rick Altherr <raltherr@google.com>
---
 .../meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
index 6ceb00d..d3e77ca 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/linux-obmc/defconfig
@@ -2,6 +2,7 @@ CONFIG_CROSS_COMPILE="arm-linux-"
 CONFIG_KERNEL_XZ=y
 # CONFIG_SWAP is not set
 CONFIG_SYSVIPC=y
+CONFIG_FHANDLE=y
 CONFIG_USELIB=y
 CONFIG_IRQ_DOMAIN_DEBUG=y
 CONFIG_LOG_BUF_SHIFT=14
@@ -9,6 +10,7 @@ CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_KALLSYMS_ALL=y
+CONFIG_SHMEM=y
 CONFIG_EMBEDDED=y
 CONFIG_SLAB=y
 CONFIG_MODULES=y
-- 
2.8.4
