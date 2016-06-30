Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgPsh13HCzDrNL
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 02:20:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467303636212402.76716343369174;
 Thu, 30 Jun 2016 09:20:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/3] witherspoon: bump kernel revision
Date: Thu, 30 Jun 2016 11:20:31 -0500
Message-Id: <20160630162033.2330-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630162033.2330-1-openbmc-patches@stwcx.xyz>
References: <20160630162033.2330-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 16:20:40 -0000

From: Joel Stanley <joel@jms.id.au>

Some guy went and rebased so the old commit does not exist.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 .../meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_4.7.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_4.7.bb b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_4.7.bb
index a64e11a..3ef403a 100644
--- a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_4.7.bb
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_4.7.bb
@@ -1,6 +1,6 @@
 KBRANCH ?= "dev-4.7"
 LINUX_VERSION ?= "4.7"
-SRCREV="05543e532c78185ba82057415f96d13e5f500072"
+SRCREV="7e7cc303ea151ef23348b1df5662a2d296c62616"
 KSRC = "git://github.com/shenki/linux;protocol=git;branch=${KBRANCH}"
 
 require common/recipes-kernel/linux/linux-obmc.inc
-- 
2.9.0
