Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qdGj81pFhzDq94
 for <openbmc@lists.ozlabs.org>; Sun,  3 Apr 2016 23:50:35 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14596914315051004.8567847277427;
 Sun, 3 Apr 2016 06:50:31 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v2 1/2] meta-phosphor/u-boot: Move to newer version
Date: Sun,  3 Apr 2016 08:50:28 -0500
Message-Id: <1459691429-1357-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1459691429-1357-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1459691429-1357-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Apr 2016 13:50:36 -0000

From: Joel Stanley <joel@jms.id.au>

Patches from Milton to fix u-boot leaving ethernet device running after
loading linux.

Patch from me to support building under modern GCC versions, required
for GCC 5.

Milton D. Miller II :
      net: aspeednic: Create aspeed_write_hwaddr from set_mac_address
      net: aspeednic: Do not start hardware in initialize
      net: aspeednic: Remove extra spaces before assignments
      net: aspeednic: Do not fill in a random MAC address
      net: Implement random ethaddr fallback in eth.c

Joel Stanley:
      compiler*.h: sync include/linux/compiler*.h with Linux 4.5-rc6

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
index 6070fbf..eb6aad2 100644
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
@@ -10,9 +10,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
                     file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
 
-# This revision corresponds to the tag "v2013.07"
 # We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "4b44678c11ac82c7c797bb115e276181752ad54d"
+SRCREV = "83618d8df001f152cfe3cfb31862549e0b32e2a8"
 
 PV = "v2013.07+git${SRCPV}"
 
-- 
2.7.1
