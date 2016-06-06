Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rNmKM0TmFzDqFJ
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 06:20:22 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1465244415991663.1722866803044;
 Mon, 6 Jun 2016 13:20:15 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH inarp 1/3] Makefile: Do not override CC.
Date: Mon,  6 Jun 2016 15:20:11 -0500
Message-Id: <20160606202013.20287-2-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160606202013.20287-1-openbmc-patches@stwcx.xyz>
References: <20160606202013.20287-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 06 Jun 2016 20:20:24 -0000

From: Patrick Williams <patrick@stwcx.xyz>

The makefile currently forces CC = gcc, which prevents building against
a Yocto SDK.

Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ebf69f3..0755653 100644
--- a/Makefile
+++ b/Makefile
@@ -1,5 +1,5 @@
 
-CC = gcc
+CC ?= gcc
 CFLAGS = -Wall -Wextra -Werror
 INSTALL = install
 prefix = /usr/local
-- 
2.8.3
