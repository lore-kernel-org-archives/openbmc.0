Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rM8SN3w2YzDqBN
 for <openbmc@lists.ozlabs.org>; Sat,  4 Jun 2016 15:20:52 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465017648837987.5670188257026;
 Fri, 3 Jun 2016 22:20:48 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 05/10] AST2400: Set kernel preferred provider version
Date: Sat,  4 Jun 2016 00:20:34 -0500
Message-Id: <20160604052039.6581-6-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sat, 04 Jun 2016 05:20:53 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

In preparation for supporting AST2500 with a different branch.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
index 58af4bb..de98b18 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/conf/machine/include/ast2400.inc
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Common machine configuration for the Aspeed AST2400 Chip
 
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-obmc"
+PREFERRED_VERSION_linux-obmc ?= "4.4+gitAUTOINC+6717e8fec2"
 
 UBOOT_MACHINE ?= "versatileab_config"
 UBOOT_ENTRYPOINT ?= "0x40001000"
-- 
2.8.3
