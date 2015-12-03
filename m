Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 386361A078B
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 17:00:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449122431684926.0519180346262;
 Wed, 2 Dec 2015 22:00:31 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] Clear all logs not working
Date: Thu,  3 Dec 2015 01:00:25 -0500
Message-Id: <1449122425-25388-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449122425-25388-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449122425-25388-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Dec 2015 06:00:37 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 event_messaged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/event_messaged.c b/event_messaged.c
index 1512310..0c75e3a 100644
--- a/event_messaged.c
+++ b/event_messaged.c
@@ -194,7 +194,7 @@ static const sd_bus_vtable recordlog_vtable[] = {
 	SD_BUS_VTABLE_START(0),
 	SD_BUS_METHOD("acceptHostMessage", "sssay", "q", method_accept_host_message, SD_BUS_VTABLE_UNPRIVILEGED),
 	SD_BUS_METHOD("acceptTestMessage", NULL, "q", method_accept_test_message, SD_BUS_VTABLE_UNPRIVILEGED),
-	SD_BUS_METHOD("Clear", NULL, NULL, method_clearall, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_METHOD("Clear", NULL, "q", method_clearall, SD_BUS_VTABLE_UNPRIVILEGED),
 	SD_BUS_VTABLE_END
 };
 
-- 
2.6.3
