Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6FD641A0225
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 07:40:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457383230093397.56802943152593;
 Mon, 7 Mar 2016 12:40:30 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc] Use commit number instead of autorev for u-boot
Date: Mon,  7 Mar 2016 14:40:28 -0600
Message-Id: <1457383228-4149-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457383228-4149-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457383228-4149-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 07 Mar 2016 20:40:35 -0000

From: Adriana Kobylak <anoo@us.ibm.com>

Change the u-boot recipes from picking up the most recent
commit to a specific commit (the most current one a of today)
so that development can be done in u-boot without affecting the
stability of the image.
---
 meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 2 +-
 meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
index c8ae846..bfbdcf6 100644
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
 # We use the revision in order to avoid having to fetch it from the
 # repo during parse
 # SRCREV = "62c175fbb8a0f9a926c88294ea9f7e88eb898f6c"
-SRCREV="${AUTOREV}"
+SRCREV="4b44678c11ac82c7c797bb115e276181752ad54d"
 
 PV = "v2013.07+git${SRCPV}"
 
diff --git a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
index 80715e7..6070fbf 100644
--- a/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
+++ b/meta-phosphor/common/recipes-bsp/u-boot/u-boot_2013.07.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb \
 
 # This revision corresponds to the tag "v2013.07"
 # We use the revision in order to avoid having to fetch it from the repo during parse
-SRCREV = "${AUTOREV}"
+SRCREV = "4b44678c11ac82c7c797bb115e276181752ad54d"
 
 PV = "v2013.07+git${SRCPV}"
 
-- 
2.7.1
