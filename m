Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQbyx4x5KzDqyJ
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 16:10:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458191429125352.870745100126;
 Wed, 16 Mar 2016 22:10:29 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v6 2/2] Fixed Multiple associations
 occasionally geting truncated
Date: Thu, 17 Mar 2016 00:10:26 -0500
Message-Id: <1458191426-19399-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458191426-19399-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458191426-19399-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 17 Mar 2016 05:10:34 -0000

From: Chris Austen <austenc@us.ibm.com>

After additional testing it was found that the association list gets truncated
leaving you with only one item.  Upon code review it was realized that the
use of strtok manipulated a cached string and tokenized the string with NULLs.

Changed to use a temp buffer for strtok to manipulate and switched to
strtok_r since it is a best practice to ensure things are thread safe.
---
 event_messaged.C       |  6 ++++-
 event_messaged_sdbus.c | 64 +++++++++++++++++++++++++++++++++-----------------
 event_messaged_sdbus.h |  2 +-
 3 files changed, 48 insertions(+), 24 deletions(-)

diff --git a/event_messaged.C b/event_messaged.C
index 9addd3f..f2a308a 100644
--- a/event_messaged.C
+++ b/event_messaged.C
@@ -36,9 +36,13 @@ int message_delete_log(event_manager *em, uint16_t logid)
 int load_existing_events(event_manager *em)
 {
 	uint16_t id;
+	event_record_t *rec;
 
 	while ( (id = em->next_log()) != 0) {
-		send_log_to_dbus(em, id);
+
+		em->open(id, &rec);
+		send_log_to_dbus(em, id, rec->association);
+		em->close(rec);
 	}
 
 	return 0;
diff --git a/event_messaged_sdbus.c b/event_messaged_sdbus.c
index 907ac53..af09c36 100644
--- a/event_messaged_sdbus.c
+++ b/event_messaged_sdbus.c
@@ -99,28 +99,40 @@ static int prop_message_assoc(sd_bus *bus,
 	messageEntry_t *m = (messageEntry_t*) userdata;
 	event_record_t *rec;
 	char *p;
-	char *token;
+	char *token, *saveptr;
 
 	rec = message_record_open(m->em, m->logid);
 	if (!rec) {
-		fprintf(stderr,"Warning missing evnet log for %lx\n", m->logid);
+		fprintf(stderr,"Warning missing event log for %lx\n", m->logid);
 		sd_bus_error_set(error,
 			SD_BUS_ERROR_FILE_NOT_FOUND,
 			"Could not find log file");
 		return -1;
 	}
 
-	p = rec->association;
+	/* strtok manipulates a string.  It turns out that message_record_open */
+	/* implements a caching mechcanism which means the oiginal string is   */
+	/* To avoid that, I will make a copy and mess with that                */
+	p = strdup(rec->association);
+
+	if (!p) {
+		/* no association string == no associations */
+		sd_bus_error_set(error,
+			SD_BUS_ERROR_NO_MEMORY,
+			"Not enough memory for association");
+		return -1;
+	}
 
 	token = strtok(p, " ");
+
 	if (token) {
+
 		r = sd_bus_message_open_container(reply, 'a', "(sss)");
 		if (r < 0) {
 			fprintf(stderr,"Error opening container %s to reply %s\n", token, strerror(-r));
 		}
 
 		while(token) {
-
 			r = sd_bus_message_append(reply, "(sss)", "fru", "event", token);
 			if (r < 0) {
 				fprintf(stderr,"Error adding properties for %s to reply %s\n", token, strerror(-r));
@@ -132,6 +144,8 @@ static int prop_message_assoc(sd_bus *bus,
 		r = sd_bus_message_close_container(reply);
 	}
 
+	free(p);
+
 	return r;
 }
 
@@ -148,12 +162,12 @@ static int prop_message(sd_bus *bus,
 	messageEntry_t *m = (messageEntry_t*) userdata;
 	char *p;
 	struct tm *tm_info;
-	char buffer[32];
+	char buffer[36];
 	event_record_t *rec;
 
 	rec = message_record_open(m->em, m->logid);
 	if (!rec) {
-		fprintf(stderr,"Warning missing evnet log for %lx\n", m->logid);
+		fprintf(stderr,"Warning missing event log for %lx\n", m->logid);
 		sd_bus_error_set(error,
 			SD_BUS_ERROR_FILE_NOT_FOUND,
 			"Could not find log file");
@@ -254,7 +268,7 @@ static int method_accept_host_message(sd_bus_message *m,
 	logid = message_create_new_log_event(em, &rec);
 
 	if (logid) 
-		r = send_log_to_dbus(em, logid);
+		r = send_log_to_dbus(em, logid, rec.association);
 
 	return sd_bus_reply_method_return(m, "q", logid);
 }
@@ -282,7 +296,9 @@ static int method_accept_test_message(sd_bus_message *m,
 
 	syslog(LOG_NOTICE, "%s %s (%s)", rec.severity, rec.message, rec.association);
 	logid = message_create_new_log_event(em, &rec);
-	send_log_to_dbus(em, logid);
+
+	if (logid)
+		send_log_to_dbus(em, logid, rec.association);
 
 	return sd_bus_reply_method_return(m, "q", logid);
 }
@@ -385,14 +401,16 @@ static int remove_log_from_dbus(messageEntry_t *p)
 	}	
 	sd_bus_slot_unref(p->messageslot);
 	sd_bus_slot_unref(p->deleteslot);
-	sd_bus_slot_unref(p->associationslot);
+
+	if (p->associationslot)
+		sd_bus_slot_unref(p->associationslot);
 
 	message_entry_close(p);
 
 	return 0;
 }
 
-int send_log_to_dbus(event_manager *em, const uint16_t logid)
+int send_log_to_dbus(event_manager *em, const uint16_t logid, const char *association)
 {
 	char loglocation[64];
 	int r;
@@ -428,19 +446,21 @@ int send_log_to_dbus(event_manager *em, const uint16_t logid)
 		message_entry_close(m);
 		return 0;
 	}
-	
-	r = sd_bus_add_object_vtable(bus,
-				     &m->associationslot,
-				     loglocation,
-				     "org.openbmc.Associations",
-				     recordlog_association_vtable,
-				     m);
 
-	if (r < 0) {
-		fprintf(stderr, "Failed to add association object for: %s %s\n",
-			loglocation, strerror(-r));
-		message_entry_close(m);
-		return 0;
+	m->associationslot = NULL;
+	if (strlen(association) > 0) {
+		r = sd_bus_add_object_vtable(bus,
+					     &m->associationslot,
+					     loglocation,
+					     "org.openbmc.Associations",
+					     recordlog_association_vtable,
+					     m);
+		if (r < 0) {
+			fprintf(stderr, "Failed to add association object for: %s %s\n",
+				loglocation, strerror(-r));
+			message_entry_close(m);
+			return 0;
+		}
 	}
 
 	r = sd_bus_emit_object_added(bus, loglocation);
diff --git a/event_messaged_sdbus.h b/event_messaged_sdbus.h
index 4565af8..b3cec2c 100644
--- a/event_messaged_sdbus.h
+++ b/event_messaged_sdbus.h
@@ -5,7 +5,7 @@ extern "C" {
 #endif
 	int start_event_monitor(void);
 	int build_bus(event_manager *em);
-	int send_log_to_dbus(event_manager *em, const uint16_t logid);
+	int send_log_to_dbus(event_manager *em, const uint16_t logid, const char* association);
 	void cleanup_event_monitor(void);
 #ifdef __cplusplus
 }
-- 
2.7.1
