Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rW6y33cnkzDqsR
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 14:40:43 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466138436042330.14256916804493;
 Thu, 16 Jun 2016 21:40:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v3 2/2] Add 4.7 kernel recipe
Date: Thu, 16 Jun 2016 23:40:31 -0500
Message-Id: <20160617044031.15231-3-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.4
In-Reply-To: <20160617044031.15231-1-openbmc-patches@stwcx.xyz>
References: <20160617044031.15231-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 17 Jun 2016 04:40:44 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Using this kernel tree for Witherspoon until the necessary support
is backported to 4.6 or 4.7 is released.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-witherspoon/recipes-kernel/linux/linux-obmc_4.7.bb         | 6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_4.7.bb

diff --git a/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_4.7.bb b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_4.7.bb
new file mode 100644
index 0000000..a64e11a
--- /dev/null
+++ b/meta-openbmc-machines/meta-openpower/meta-ibm/meta-witherspoon/recipes-kernel/linux/linux-obmc_4.7.bb
@@ -0,0 +1,6 @@
+KBRANCH ?= "dev-4.7"
+LINUX_VERSION ?= "4.7"
+SRCREV="05543e532c78185ba82057415f96d13e5f500072"
+KSRC = "git://github.com/shenki/linux;protocol=git;branch=${KBRANCH}"
+
+require common/recipes-kernel/linux/linux-obmc.inc
-- 
2.8.4
