Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id AF5B61A0672
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2015 22:45:59 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447327825484236.06121678268676;
 Thu, 12 Nov 2015 03:30:25 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: adamliyi <adamliyi@msn.com>
Subject: [PATCH kernel-hwmon-occ v2 04/11] change file name to occ.c
Date: Thu, 12 Nov 2015 06:30:05 -0500
Message-Id: <1447327812-21126-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447327812-21126-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447327812-21126-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 12 Nov 2015 11:46:00 -0000

From: adamliyi <adamliyi@msn.com>

---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index cd9fcba..232508c 100644
--- a/Makefile
+++ b/Makefile
@@ -1,4 +1,4 @@
-obj-m := occ-i2c.o
+obj-m := occ.o
 
 SRC := $(shell pwd)
 
-- 
2.6.3
