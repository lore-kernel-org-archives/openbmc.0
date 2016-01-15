Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2A92E1A02A5
 for <openbmc@lists.ozlabs.org>; Fri, 15 Jan 2016 14:30:27 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1452828622629975.1288913012152;
 Thu, 14 Jan 2016 19:30:22 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH openbmc] btbridged: Update to include bt_q_drop() bugfix
Date: Thu, 14 Jan 2016 21:30:21 -0600
Message-Id: <1452828621-2189-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452828621-2189-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1452828621-2189-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 15 Jan 2016 03:30:28 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
index 595214e..a1a32d9 100644
--- a/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
+++ b/meta-phosphor/common/recipes-phosphor/host-ipmid/btbridged.bb
@@ -11,7 +11,7 @@ inherit obmc-phosphor-host-ipmi-hw
 
 S = "${WORKDIR}/git"
 SRC_URI += "git://github.com/openbmc/btbridge"
-SRCREV="e640165dfac0b35d69544ec725edb77cee1ae747"
+SRCREV="39b3700766d851009258544aa0f75365f024c597"
 
 # This is how linux-libc-headers says to include custom uapi headers
 EXTRA_OEMAKE_append = "CFLAGS=-I${STAGING_KERNEL_DIR}/include/uapi"
-- 
2.6.4
