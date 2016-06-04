Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rM8SS1bfMzDqBR
 for <openbmc@lists.ozlabs.org>; Sat,  4 Jun 2016 15:20:56 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465017651980510.26377912102976;
 Fri, 3 Jun 2016 22:20:51 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 07/10] Add a kernel 4.6 recipe
Date: Sat,  4 Jun 2016 00:20:36 -0500
Message-Id: <20160604052039.6581-8-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
References: <20160604052039.6581-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 04 Jun 2016 05:20:57 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Adding a 4.6 kernel recipe for the AST2500.  AST2400 remains on
4.4.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb
new file mode 100644
index 0000000..b3891f4
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb
@@ -0,0 +1,5 @@
+KBRANCH ?= "dev-4.6"
+LINUX_VERSION ?= "4.6"
+SRCREV="e377df455809d87488eed132b41583ead909f58a"
+
+require linux-obmc.inc
-- 
2.8.3
