Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 199191A05B9
 for <openbmc@lists.ozlabs.org>; Wed, 18 Nov 2015 15:30:25 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447821021130350.600697568319;
 Tue, 17 Nov 2015 20:30:21 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] meta-phosphor: Update kernel version
Date: Tue, 17 Nov 2015 23:30:19 -0500
Message-Id: <1447821019-21779-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447821019-21779-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447821019-21779-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 18 Nov 2015 04:30:26 -0000

From: Joel Stanley <joel@jms.id.au>

The kenrel contains many changes, including

  - rewritten i2c driver
  - interrupt facilities for the iBT host driver
  - rebased on Linux 4.3

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
index 1d8106d..09c18a5 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Linux kernel for OpenBMC"
 SECTION = "kernel"
 LICENSE = "GPLv2"
 
-KBRANCH ?= "dev"
+KBRANCH ?= "dev-4.3"
 KCONFIG_MODE="--alldefconfig"
 
 SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/openbmc/linux;protocol=git;branch=${KBRANCH}"
 LINUX_VERSION ?= "4.2"
 LINUX_VERSION_EXTENSION ?= "-${SRCREV}"
 
-SRCREV="openbmc-20151104-1"
+SRCREV="openbmc-20151118-1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.6.3
