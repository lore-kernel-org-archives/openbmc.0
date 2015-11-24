Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 259FC1A004E
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 03:20:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448382033317896.9666249644324;
 Tue, 24 Nov 2015 08:20:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v4 2/4] Add signal support add/remove
Date: Tue, 24 Nov 2015 11:20:28 -0500
Message-Id: <1448382030-17201-3-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 24 Nov 2015 16:20:39 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 event_messaged.c | 32 +++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/event_messaged.c b/event_messaged.c
index 15412d2..dbfa1da 100644
--- a/event_messaged.c
+++ b/event_messaged.c
@@ -27,7 +27,13 @@ typedef struct messageEntry_t {
 
 void message_storage_delete(messageEntry_t *m) {
 
-	printf("Attempting to delete /org/openbmc/records/events/%d\n", m->logid);
+	char *path;
+	int r;
+
+	asprintf(&path, "/org/openbmc/records/events/%d", m->logid);
+
+
+	printf("Attempting to delete %s\n", path);
 
 	free(m->message);
 	free(m->severity);
@@ -35,9 +41,17 @@ void message_storage_delete(messageEntry_t *m) {
 	free(m->association);
 	free(m->debugbytes);
 
+	
 	sd_bus_slot_unref(m->messageslot);
 	sd_bus_slot_unref(m->deleteslot);
 
+	sd_bus_emit_object_removed(bus, path);
+	if (r < 0) {
+		fprintf(stderr, "Failed to emit the 2nd delete  signal %s\n", strerror(-r));
+		return;
+	}
+
+	
 	free(m);
 
 	return;
@@ -238,6 +252,22 @@ int create_new_log_event(void *userdata,
 	                             recordlog_delete_vtable,
 	                             node);
 
+	printf("Event Log added %s\n", loglocation);
+
+	r = sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/events") ;
+	if (r < 0) {
+		fprintf(stderr, "Object Manager failure  %s\n", strerror(-r));
+		return 0;
+	}
+
+	r = sd_bus_emit_object_added(bus, loglocation);
+	if (r < 0) {
+		fprintf(stderr, "Failed to emit signal %s\n", strerror(-r));
+		return 0;
+	}
+
+
+
 	return logid;
 }
 
-- 
2.6.3
