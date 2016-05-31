Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rK73P06YnzDqd3
 for <openbmc@lists.ozlabs.org>; Wed,  1 Jun 2016 08:10:40 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1464732636753269.3842097288191;
 Tue, 31 May 2016 15:10:36 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc v4] Revert "Back off GCC to 4.9.3"
Date: Tue, 31 May 2016 17:10:34 -0500
Message-Id: <20160531221034.31074-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160531221034.31074-1-openbmc-patches@stwcx.xyz>
References: <20160531221034.31074-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 31 May 2016 22:10:41 -0000

From: Joel Stanley <joel@jms.id.au>

This reverts commit f23f11b41c167f1827c073fa305a46cde1ff4760.

As of linux 4.2 SRA is disabled when building the kernel for ARM.

 https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit?id=a077224fd35b2f7fbc93f14cf67074fc792fbac2

It is suspect that this was the cause of the failure to boot.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 meta-phosphor/conf/distro/openbmc-phosphor.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-phosphor/conf/distro/openbmc-phosphor.conf b/meta-phosphor/conf/distro/openbmc-phosphor.conf
index 4af4a4b..de01009 100644
--- a/meta-phosphor/conf/distro/openbmc-phosphor.conf
+++ b/meta-phosphor/conf/distro/openbmc-phosphor.conf
@@ -5,7 +5,6 @@ DISTRO_NAME = "Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
 DISTRO_VERSION = "0.1.0"
 TARGET_VENDOR="-openbmc"
 
-GCCVERSION ?= "4.9.3"
 IMAGE_FSTYPES += "cpio.gz"
 IMAGE_FSTYPES += "squashfs-xz"
 IMAGE_LINGUAS = "en-us"
-- 
2.8.3
