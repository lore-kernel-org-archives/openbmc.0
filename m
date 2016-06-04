Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rM8SS3SrDzDq9H
 for <openbmc@lists.ozlabs.org>; Sat,  4 Jun 2016 15:20:56 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146501765315769.69194433024381;
 Fri, 3 Jun 2016 22:20:53 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 08/10] AST2400: Use Palmetto as the default uboot
 target
Date: Sat,  4 Jun 2016 00:20:37 -0500
Message-Id: <20160604052039.6581-9-openbmc-patches@stwcx.xyz>
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

An evaluation board target would be nice here but at least Palmetto is
an improvement over the generic ARM target.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
index de98b18..0a44975 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
@@ -5,7 +5,7 @@
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
 PREFERRED_VERSION_linux-obmc ?= "4.4+gitAUTOINC+6717e8fec2"
 
-UBOOT_MACHINE ?= "versatileab_config"
+UBOOT_MACHINE ?= "palmetto_config"
 UBOOT_ENTRYPOINT ?= "0x40001000"
 UBOOT_LOADADDRESS ?= "0x40001000"
 
-- 
2.8.3
