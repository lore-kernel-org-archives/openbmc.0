Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQ5Yv0qpSzDqJp
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 10:20:50 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146543164400668.64117084752388;
 Wed, 8 Jun 2016 17:20:44 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 09/11] AST2400: Set u-boot preferred provider
 version
Date: Wed,  8 Jun 2016 19:20:30 -0500
Message-Id: <20160609002032.984-10-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 09 Jun 2016 00:20:52 -0000

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
