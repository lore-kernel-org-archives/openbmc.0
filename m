Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPwF919hCzDq70
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 13:20:28 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458094826103693.2273847459854;
 Tue, 15 Mar 2016 19:20:26 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Chris Smart <distroguy@gmail.com>
Subject: [PATCH openbmc-build-scripts] use glibc 2.22 to work around assembler
 error
Date: Tue, 15 Mar 2016 21:20:24 -0500
Message-Id: <1458094824-30066-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458094824-30066-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458094824-30066-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 16 Mar 2016 02:20:29 -0000

From: Chris Smart <distroguy@gmail.com>

---
 initramfs-build.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/initramfs-build.sh b/initramfs-build.sh
index 3c08807..65abf39 100755
--- a/initramfs-build.sh
+++ b/initramfs-build.sh
@@ -73,6 +73,7 @@ BR2_powerpc64le=y
 BR2_TARGET_ROOTFS_CPIO=y
 BR2_TARGET_ROOTFS_CPIO_XZ=y
 BR2_TARGET_GENERIC_GETTY_PORT="hvc0"
+BR2_GLIBC_VERSION_2_22=y
 EOF_BUILDROOT
 
 # Build buildroot
-- 
2.7.1
