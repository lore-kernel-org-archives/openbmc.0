Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rRGZw0THCzDqXT
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 08:10:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465596643302718.1704646465706;
 Fri, 10 Jun 2016 15:10:43 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v3 09/11] AST2400: Set u-boot preferred provider
 version
Date: Fri, 10 Jun 2016 17:10:28 -0500
Message-Id: <20160610221030.3943-10-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 10 Jun 2016 22:10:49 -0000

From: Rick Altherr <raltherr@google.com>

In preparation for supporting AST2500 with a different branch.

Signed-off-by: Rick Altherr <raltherr@google.com>
---
 .../meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
index 964de9a..8510a03 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
@@ -4,6 +4,8 @@
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
 PREFERRED_VERSION_linux-obmc ?= "4.4+git%"
+PREFERRED_VERSION_u-boot ?= "v2013.07+git%"
+PREFERRED_VERSION_u-boot-fw-utils ?= "v2013.07+git%"
 
 UBOOT_MACHINE ?= "palmetto_config"
 UBOOT_ENTRYPOINT ?= "0x40001000"
-- 
2.8.3
