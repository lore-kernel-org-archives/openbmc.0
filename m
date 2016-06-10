Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rRGZv5c5MzDqXM
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 08:10:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465596640482516.3805419224565;
 Fri, 10 Jun 2016 15:10:40 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v3 06/11] Add a kernel 4.6 recipe
Date: Fri, 10 Jun 2016 17:10:25 -0500
Message-Id: <20160610221030.3943-7-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160610221030.3943-1-openbmc-patches@stwcx.xyz>
References: <20160610221030.3943-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 10 Jun 2016 22:10:48 -0000

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
