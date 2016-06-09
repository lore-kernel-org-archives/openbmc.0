Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ5Yq1KLVzDr6m
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 10:20:46 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465431641326544.7663931706826;
 Wed, 8 Jun 2016 17:20:41 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v2 06/11] Add a kernel 4.6 recipe
Date: Wed,  8 Jun 2016 19:20:27 -0500
Message-Id: <20160609002032.984-7-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
References: <20160609002032.984-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 09 Jun 2016 00:20:48 -0000

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
index 0000000..78bf3b2
--- /dev/null
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.6.bb
@@ -0,0 +1,5 @@
+KBRANCH ?= "dev-4.6"
+LINUX_VERSION ?= "4.6"
+SRCREV="6bf0b62ef667270f8a8cce46abc6c1f9b68785a5"
+
+require linux-obmc.inc
-- 
2.8.3
