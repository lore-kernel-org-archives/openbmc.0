Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A65FD1A0976
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 01:30:45 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444746643418440.39044193720645;
 Tue, 13 Oct 2015 07:30:43 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 1/3] Use lzma compression for rootfs
Date: Tue, 13 Oct 2015 09:30:35 -0500
Message-Id: <1444746637-10175-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1444746637-10175-1-git-send-email-patches@stwcx.xyz>
References: <1444746637-10175-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 13 Oct 2015 14:30:47 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

This saves almost 30 percent.
---
 meta-phosphor/conf/machine/include/obmc-bsp-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
index 4a800dd..d7a681c 100644
--- a/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
+++ b/meta-phosphor/conf/machine/include/obmc-bsp-common.inc
@@ -14,5 +14,5 @@ UBOOT_SUFFIX ?= "bin"
 MACHINEOVERRIDES =. "openbmc:"
 
 IMAGE_CLASSES += "obmc-phosphor-image_types_uboot"
-IMAGE_CTYPE = "gz"
+IMAGE_CTYPE = "lzma"
 IMAGE_FSTYPES += "cpio.${IMAGE_CTYPE}.u-boot"
-- 
2.6.0
