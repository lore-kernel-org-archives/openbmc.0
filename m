Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9B3241A04E1
 for <openbmc@lists.ozlabs.org>; Thu, 25 Feb 2016 05:40:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 145633923445092.43333656875927;
 Wed, 24 Feb 2016 10:40:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 6/9] openbmc: Switch RW FS from ext4 to jffs2
Date: Wed, 24 Feb 2016 12:40:21 -0600
Message-Id: <1456339224-27295-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1456339224-27295-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 24 Feb 2016 18:40:39 -0000

From: Andrew Jeffery <andrew@aj.id.au>

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 meta-phosphor/classes/image-overlay.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/classes/image-overlay.bbclass b/meta-phosphor/classes/image-overlay.bbclass
index 1c6137d..8997aae 100644
--- a/meta-phosphor/classes/image-overlay.bbclass
+++ b/meta-phosphor/classes/image-overlay.bbclass
@@ -3,7 +3,7 @@ INITRD_IMAGE ?= "core-image-minimal-initramfs"
 INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.${INITRD_CTYPE}${uboot}"
 
 IMAGE_BASETYPE ?= "squashfs-xz"
-OVERLAY_BASETYPE ?= "ext4"
+OVERLAY_BASETYPE ?= "jffs2"
 
 IMAGE_TYPES_${PN} += "${IMAGE_BASETYPE}"
 
-- 
2.7.1
