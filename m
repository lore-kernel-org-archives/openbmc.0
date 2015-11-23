Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 825581A02B2
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 21:10:12 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448273409077252.88820384820644;
 Mon, 23 Nov 2015 02:10:09 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge v2 2/8] Add missing include for ioctl
Date: Mon, 23 Nov 2015 05:10:01 -0500
Message-Id: <1448273407-11474-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448273407-11474-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448273407-11474-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 10:10:13 -0000

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
