Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qrWr60LQgzDqhH
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2016 07:20:37 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1461273632463865.4239208557572;
 Thu, 21 Apr 2016 14:20:32 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc] Build a tftpboot friendly image.
Date: Thu, 21 Apr 2016 16:20:29 -0500
Message-Id: <1461273629-24609-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1461273629-24609-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1461273629-24609-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 21 Apr 2016 21:20:38 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

Build a rootfs cpio uimage with everything along with the other
images.
---
 meta-phosphor/conf/machine/include/obmc-bsp-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
index 60ed088..260cc90 100644
--- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
+++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
@@ -14,6 +14,7 @@ UBOOT_SUFFIX ?= "bin"
 MACHINEOVERRIDES =. "openbmc:"
 
 IMAGE_FSTYPES += "overlay"
+IMAGE_FSTYPES += "cpio.${INITRAMFS_CTYPE}.u-boot"
 IMAGE_INSTALL += "u-boot-fw-utils"
 
 IMAGE_CLASSES += "obmc-phosphor-image_types_uboot"
-- 
2.8.1
