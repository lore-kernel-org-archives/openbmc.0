Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rZbM14z5hzDql8
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2016 06:10:53 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1466626249973477.4521659809782;
 Wed, 22 Jun 2016 13:10:49 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH openbmc v4 8/9] btbridged: Change how kernel-source depend is
 specified
Date: Wed, 22 Jun 2016 15:10:38 -0500
Message-Id: <20160622201039.25078-9-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160622201039.25078-1-openbmc-patches@stwcx.xyz>
References: <20160622201039.25078-1-openbmc-patches@stwcx.xyz>
X-ZohoMail: Z_56716065 SPT_1 Z_56716064 SPT_1 SLF_D
X-Zoho-Virus-Status: 2
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
X-List-Received-Date: Wed, 22 Jun 2016 20:10:55 -0000

From: Patrick Williams <patrick@stwcx.xyz>

As of Yocto commit 46cdaf1 we are suppose to use:
   do_configure[depends] += "virtual/kernel:do_shared_workdir"
Instead of:
    DEPENDS += "virtual/kernel"

Without this, the kernel source is not unpacked if you compile with
the sstate cache and so btbridged fails to find the bt-host header.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
index a1a32d9..f3a7003 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
@@ -15,4 +15,4 @@ SRCREV="39b3700766d851009258544aa0f75365f024c597"
 
 # This is how linux-libc-headers says to include custom uapi headers
 EXTRA_OEMAKE_append = "CFLAGS=-I${STAGING_KERNEL_DIR}/include/uapi"
-DEPENDS += "virtual/kernel"
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
-- 
2.9.0
