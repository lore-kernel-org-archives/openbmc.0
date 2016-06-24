Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rbpq21zrpzDqlW
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 05:50:53 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466797848968839.6248669609205;
 Fri, 24 Jun 2016 12:50:48 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc v6 09/11] u-boot-fw-utils: Update to latest version.
Date: Fri, 24 Jun 2016 14:50:32 -0500
Message-Id: <20160624195034.27662-10-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160624195034.27662-1-openbmc-patches@stwcx.xyz>
References: <20160624195034.27662-1-openbmc-patches@stwcx.xyz>
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Fri, 24 Jun 2016 19:50:55 -0000

From: Patrick Williams <patrick@stwcx.xyz>

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
index bfbdcf6..a514cf2 100644
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
 # SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
-SRCREV="4b44678c11ac82c7c797bb115e276181752ad54d"
+SRCREV="44f1262bdf39ad93032d39f17a298165372be82e"
 
 PV = "v2013.07+git${SRCPV}"
 
-- 
2.9.0
