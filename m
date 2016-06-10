Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rRGZw3Qk9zDqWf
 for <openbmc@lists.ozlabs.org>; Sat, 11 Jun 2016 08:10:48 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14655966423841015.8052619346101;
 Fri, 10 Jun 2016 15:10:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc v3 08/11] AST2400: Use Palmetto as the default uboot
 target
Date: Fri, 10 Jun 2016 17:10:27 -0500
Message-Id: <20160610221030.3943-9-openbmc-patches@stwcx.xyz>
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

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

An evaluation board target would be nice here but at least Palmetto is
an improvement over the generic ARM target.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
index 97a8834..964de9a 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
@@ -5,7 +5,7 @@
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
 PREFERRED_VERSION_linux-obmc ?= "4.4+git%"
 
-UBOOT_MACHINE ?= "versatileab_config"
+UBOOT_MACHINE ?= "palmetto_config"
 UBOOT_ENTRYPOINT ?= "0x40001000"
 UBOOT_LOADADDRESS ?= "0x40001000"
 
-- 
2.8.3
