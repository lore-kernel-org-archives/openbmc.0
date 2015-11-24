Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 589B21A02EA
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 06:00:35 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448391629933711.2649829497254;
 Tue, 24 Nov 2015 11:00:29 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] interfaceRemoved missing .record
Date: Tue, 24 Nov 2015 14:00:27 -0500
Message-Id: <1448391627-21716-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448391627-21716-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448391627-21716-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 Nov 2015 19:00:35 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 event_messaged.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/event_messaged.c b/event_messaged.c
index 07430b0..1512310 100644
--- a/event_messaged.c
+++ b/event_messaged.c
@@ -49,17 +49,16 @@ void message_storage_delete(messageEntry_t *m) {
 	free(m->association);
 	free(m->debugbytes);
 
-	
-	sd_bus_slot_unref(m->messageslot);
-	sd_bus_slot_unref(m->deleteslot);
 
-	sd_bus_emit_object_removed(bus, path);
+	r = sd_bus_emit_object_removed(bus, path);
 	if (r < 0) {
-		fprintf(stderr, "Failed to emit the 2nd delete  signal %s\n", strerror(-r));
+		fprintf(stderr, "Failed to emit the delete signal %s\n", strerror(-r));
 		return;
 	}
 
-	
+	sd_bus_slot_unref(m->messageslot);
+	sd_bus_slot_unref(m->deleteslot);
+
 	free(m);
 
 	return;
-- 
2.6.3
