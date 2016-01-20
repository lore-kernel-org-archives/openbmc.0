Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C971A180C
 for <openbmc@lists.ozlabs.org>; Thu, 21 Jan 2016 10:10:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453331422701243.96815648665188;
 Wed, 20 Jan 2016 15:10:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: "Milton D. Miller II" <miltonm@us.ibm.com>
Subject: [PATCH openbmc 2/6] phosphor: modify use obmc-phosphor-initfs
Date: Wed, 20 Jan 2016 17:10:16 -0600
Message-Id: <1453331420-6524-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1453331420-6524-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 20 Jan 2016 23:10:28 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

This bbappend changes core-image-minimal-initramfs to use the
obmc-phosphor-initfs scripts instead of the x86 syslinux centric live
scripts.

Perhaps they and this could be a virtural/initscript provider or similar?

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 .../common/recipes-core/images/core-image-minimal-initramfs.bbappend   | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend

diff --git a/meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend b/meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend
new file mode 100644
index 0000000..90a1c3f
--- /dev/null
+++ b/meta-phosphor/common/recipes-core/images/core-image-minimal-initramfs.bbappend
@@ -0,0 +1,3 @@
+PACKAGE_INSTALL_remove = "initramfs-live-boot initramfs-live-install initramfs-live-install-efi"
+PACKAGE_INSTALL += "obmc-phosphor-initfs"
+INITRAMFS_FSTYPES = "cpio.${INITRAMFS_CTYPE}"
-- 
2.6.4
