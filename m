Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1B2F41A03C3
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 00:12:08 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446469924478327.2628884302226;
 Mon, 2 Nov 2015 05:12:04 -0800 (PST)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@us.ibm.com>
Subject: [PATCH openbmc 1/4] Copy device tree into unpacked kernel source
Date: Mon,  2 Nov 2015 07:11:58 -0600
Message-Id: <1446469921-23240-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446469921-23240-1-git-send-email-patches@stwcx.xyz>
References: <1446469921-23240-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 02 Nov 2015 13:12:09 -0000

From: Brad Bishop <bradleyb@us.ibm.com>

This bit of logic enables out of (kernel) tree device trees but still
use the kernel build and oe support for device tree to compile it.
---
 meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
index f49b3fc..247f64c 100644
--- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
+++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc_4.2.bb
@@ -18,3 +18,13 @@ COMPATIBLE_MACHINE_${MACHINE} = "openbmc"
 
 inherit kernel
 require recipes-kernel/linux/linux-yocto.inc
+
+do_patch_append() {
+        for DTB in "${KERNEL_DEVICETREE}"; do
+		DT=`basename ${DTB} .dtb`
+                if [ -r "${WORKDIR}/${DT}.dts" ]; then
+                        cp ${WORKDIR}/${DT}.dts \
+                                ${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts
+		fi
+	done
+}
-- 
2.6.0
