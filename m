Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F95F1A02BE
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 03:20:40 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448382034674270.5733536000747;
 Tue, 24 Nov 2015 08:20:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v4 4/4] Object manager doesn't show until first
 log
Date: Tue, 24 Nov 2015 11:20:30 -0500
Message-Id: <1448382030-17201-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448382030-17201-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448382030-17201-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 Nov 2015 16:20:40 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 event_messaged.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/event_messaged.c b/event_messaged.c
index 5a0c3da..07430b0 100644
--- a/event_messaged.c
+++ b/event_messaged.c
@@ -262,12 +262,6 @@ int create_new_log_event(void *userdata,
 
 	printf("Event Log added %s\n", loglocation);
 
-	r = sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/events") ;
-	if (r < 0) {
-		fprintf(stderr, "Object Manager failure  %s\n", strerror(-r));
-		return 0;
-	}
-
 	r = sd_bus_emit_object_added(bus, loglocation);
 	if (r < 0) {
 		fprintf(stderr, "Failed to emit signal %s\n", strerror(-r));
@@ -312,6 +306,12 @@ int start_event_recording(void) {
 		goto finish;
 	}
 
+	r = sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/events") ;
+	if (r < 0) {
+		fprintf(stderr, "Object Manager failure  %s\n", strerror(-r));
+		return 0;
+	}
+
 	for (;;) {
 		r = sd_bus_process(bus, NULL);
 		if (r < 0) {
-- 
2.6.3
