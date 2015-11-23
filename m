Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 5E6831A2A7C
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 01:00:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448287211515364.849692288039;
 Mon, 23 Nov 2015 06:00:11 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge 2/9] Add missing include for ioctl
Date: Mon, 23 Nov 2015 09:00:01 -0500
Message-Id: <1448287208-17607-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448287208-17607-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448287208-17607-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 14:00:15 -0000

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 btbridged.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/btbridged.c b/btbridged.c
index 7a094a4..550125c 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -25,6 +25,7 @@
 #include <string.h>
 #include <syslog.h>
 #include <sys/mman.h>
+#include <sys/ioctl.h>
 #include <sys/stat.h>
 #include <sys/timerfd.h>
 #include <time.h>
-- 
2.6.3
