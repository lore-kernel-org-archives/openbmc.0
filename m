Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 27BE91A01DF
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 08:40:58 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445377256589149.58612007063357;
 Tue, 20 Oct 2015 14:40:56 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 2/2] add devmem utility
Date: Tue, 20 Oct 2015 16:40:51 -0500
Message-Id: <1445377251-25832-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445377251-25832-1-git-send-email-patches@stwcx.xyz>
References: <1445377251-25832-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 20 Oct 2015 21:40:59 -0000

From: Norman James <njames@us.ibm.com>

---
 yocto-poky/meta/recipes-core/busybox/busybox/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/yocto-poky/meta/recipes-core/busybox/busybox/defconfig b/yocto-poky/meta/recipes-core/busybox/busybox/defconfig
index 4f5df9e..3deb4e5 100644
--- a/yocto-poky/meta/recipes-core/busybox/busybox/defconfig
+++ b/yocto-poky/meta/recipes-core/busybox/busybox/defconfig
@@ -706,7 +706,7 @@ CONFIG_DC=y
 # CONFIG_DEVFSD_FG_NP is not set
 # CONFIG_DEVFSD_VERBOSE is not set
 # CONFIG_FEATURE_DEVFS is not set
-# CONFIG_DEVMEM is not set
+CONFIG_DEVMEM=y
 # CONFIG_EJECT is not set
 # CONFIG_FEATURE_EJECT_SCSI is not set
 # CONFIG_FBSPLASH is not set
-- 
2.6.0
