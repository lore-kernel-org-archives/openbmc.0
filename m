Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rFHnx6zbvzDqWF
 for <openbmc@lists.ozlabs.org>; Thu, 26 May 2016 02:30:45 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 14641938394841016.4987755876992;
 Wed, 25 May 2016 09:30:39 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] meta-phosphor/u-boot: Move to newer version
Date: Wed, 25 May 2016 11:30:36 -0500
Message-Id: <20160525163036.14329-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160525163036.14329-1-openbmc-patches@stwcx.xyz>
References: <20160525163036.14329-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 25 May 2016 16:30:46 -0000

From: Joel Stanley <joel@jms.id.au>

Fixes from Milton for u-boot leaving ethernet device running after
loading linux:

      net: aspeednic: Create aspeed_write_hwaddr from set_mac_address
      net: aspeednic: Do not start hardware in initialize
      net: aspeednic: Remove extra spaces before assignments
      net: aspeednic: Do not fill in a random MAC address
      net: Implement random ethaddr fallback in eth.c

Backports from upstream from me to support building under modern GCC
versions:

      common: main.c: make show_boot_progress __weak
      ARM:asm:io.h use static inline
      arm: board: use __weak
      net: Implement random ethaddr fallback in eth.c
      compiler*.h: sync include/linux/compiler*.h with Linux 4.5-rc6

Signeo-off-by: Joel Stanley <joel@jms.id.au>
---
 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
index 6070fbf..f2434ad 100644
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
@@ -10,9 +10,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
                     file://README;beginline=1;endline=22;md5=78b195c11cb6ef63e6985140db7d7bab"
 
-# This revision corresponds to the tag "v2013.07"
 # We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "4b44678c11ac82c7c797bb115e276181752ad54d"
+SRCREV = "44f1262bdf39ad93032d39f17a298165372be82e"
 
 PV = "v2013.07+git${SRCPV}"
 
-- 
2.8.3
