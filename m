Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQcs81NvfzDqjr
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 16:50:36 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458193829020566.7078932143738;
 Wed, 16 Mar 2016 22:50:29 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v7] Add association interface capabilities for
 event logs
Date: Thu, 17 Mar 2016 00:50:27 -0500
Message-Id: <1458193827-20868-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458193827-20868-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458193827-20868-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 17 Mar 2016 05:50:36 -0000

From: Chris Austen <austenc@us.ibm.com>

When a new event log is created it may create an interface
with a name of org.openbmc.association.  If there are associations
between the log and other entites it will have a single property
named "association" which will be an a(sss).
That will be enough information for the rest server to present
it.

Note if the log does not have FRU call outs no association interface will exist

Lets say you want to run the acceptTestMessage method.  It
will create an association between the event log and 2 dimms.

So
/org/openbmc/inventory/system/chassis/motherboard/dimm2
/org/openbmc/inventory/system/chassis/motherboard/dimm3

/org/openbmc/records/events/1/fru
should return
data : {/org/openbmc/inventory/system/chassis/motherboard/dimm2 , /org/openbmc/inventory/system/chassis/motherboard/dimm3}

You should also be able to go to the dimm and get the association in reverse

/org/openbmc/inventory/system/chassis/motherboard/dimm2/event
should return
data : {/org/openbmc/records/events/1/}
---
 event_messaged.C       |   6 ++-
 event_messaged_sdbus.c | 135 ++++++++++++++++++++++++++++++++++++++++---------
 event_messaged_sdbus.h |   2 +-
 3 files changed, 117 insertions(+), 26 deletions(-)

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
index fc4c911..af09c36 100644
--- a/event_messaged_sdbus.c
+++ b/event_messaged_sdbus.c
@@ -1,3 +1,4 @@
+#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <errno.h>
@@ -20,6 +21,7 @@
 /*     method_x  : callable dbus functions.                                  */
 /*                                                                           */
 /*****************************************************************************/
+const char *event_path = "/org/openbmc/records/events";
 
 sd_bus      *bus   = NULL;
 sd_bus_slot *slot  = NULL;
@@ -31,6 +33,7 @@ typedef struct messageEntry_t {
 	size_t         logid;
 	sd_bus_slot   *messageslot;
 	sd_bus_slot   *deleteslot;
+	sd_bus_slot   *associationslot;
 	event_manager *em;
 
 } messageEntry_t;
@@ -84,6 +87,67 @@ static event_record_t* message_record_open(event_manager *em, uint16_t logid)
 	return (r ? gCachedRec : NULL);
 }
 
+static int prop_message_assoc(sd_bus *bus,
+			const char *path,
+			const char *interface,
+			const char *property,
+			sd_bus_message *reply,
+			void *userdata,
+			sd_bus_error *error)
+{
+	int r=0;
+	messageEntry_t *m = (messageEntry_t*) userdata;
+	event_record_t *rec;
+	char *p;
+	char *token, *saveptr;
+
+	rec = message_record_open(m->em, m->logid);
+	if (!rec) {
+		fprintf(stderr,"Warning missing event log for %lx\n", m->logid);
+		sd_bus_error_set(error,
+			SD_BUS_ERROR_FILE_NOT_FOUND,
+			"Could not find log file");
+		return -1;
+	}
+
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
+
+	token = strtok(p, " ");
+
+	if (token) {
+
+		r = sd_bus_message_open_container(reply, 'a', "(sss)");
+		if (r < 0) {
+			fprintf(stderr,"Error opening container %s to reply %s\n", token, strerror(-r));
+		}
+
+		while(token) {
+			r = sd_bus_message_append(reply, "(sss)", "fru", "event", token);
+			if (r < 0) {
+				fprintf(stderr,"Error adding properties for %s to reply %s\n", token, strerror(-r));
+			}
+
+			token = strtok(NULL, " ");
+		}
+
+		r = sd_bus_message_close_container(reply);
+	}
+
+	free(p);
+
+	return r;
+}
 
 
 static int prop_message(sd_bus *bus,
@@ -98,12 +162,12 @@ static int prop_message(sd_bus *bus,
 	messageEntry_t *m = (messageEntry_t*) userdata;
 	char *p;
 	struct tm *tm_info;
-	char buffer[32];
+	char buffer[36];
 	event_record_t *rec;
 
 	rec = message_record_open(m->em, m->logid);
 	if (!rec) {
-		fprintf(stderr,"Warning missing evnet log for %d\n", m->logid);
+		fprintf(stderr,"Warning missing event log for %lx\n", m->logid);
 		sd_bus_error_set(error,
 			SD_BUS_ERROR_FILE_NOT_FOUND,
 			"Could not find log file");
@@ -114,8 +178,6 @@ static int prop_message(sd_bus *bus,
 		p = rec->message;
 	} else if (!strncmp("severity", property, 8)) {
 		p = rec->severity;
-	} else if (!strncmp("association", property, 11)) {
-		p = rec->association;
 	} else if (!strncmp("reported_by", property, 11)) {
 		p = rec->reportedby;
 	} else if (!strncmp("time", property, 4)) {
@@ -174,7 +236,7 @@ static int method_accept_host_message(sd_bus_message *m,
 				      void *userdata,
 				      sd_bus_error *ret_error)
 {
-	char *message, *severity, *association, *s;
+	char *message, *severity, *association;
 	size_t   n = 4;
 	uint8_t *p;
 	int r;
@@ -201,14 +263,12 @@ static int method_accept_host_message(sd_bus_message *m,
 	rec.p           = (uint8_t*) p;
 	rec.n           = n;
 
-	asprintf(&s, "%s %s (%s)", rec.severity, rec.message, rec.association);
-	syslog(LOG_NOTICE, s);
-	free(s);
+	syslog(LOG_NOTICE, "%s %s (%s)", rec.severity, rec.message, rec.association);
 
 	logid = message_create_new_log_event(em, &rec);
 
 	if (logid) 
-		r = send_log_to_dbus(em, logid);
+		r = send_log_to_dbus(em, logid, rec.association);
 
 	return sd_bus_reply_method_return(m, "q", logid);
 }
@@ -234,12 +294,11 @@ static int method_accept_test_message(sd_bus_message *m,
 	rec.n           = 6;
 
 
-	asprintf(&s, "%s %s (%s)", rec.severity, rec.message, rec.association);
-	syslog(LOG_NOTICE, s);
-	free(s);
-
+	syslog(LOG_NOTICE, "%s %s (%s)", rec.severity, rec.message, rec.association);
 	logid = message_create_new_log_event(em, &rec);
-	send_log_to_dbus(em, logid);
+
+	if (logid)
+		send_log_to_dbus(em, logid, rec.association);
 
 	return sd_bus_reply_method_return(m, "q", logid);
 }
@@ -261,7 +320,7 @@ static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_
 
 	while (logid = message_next_event(em)) {
 		snprintf(buffer, sizeof(buffer),
-			"/org/openbmc/records/events/%d", logid);
+			"%s/%d", event_path, logid);
 
 		r = sd_bus_call_method_async(bus,
 					     NULL,
@@ -305,7 +364,6 @@ static const sd_bus_vtable recordlog_vtable[] = {
 
 static const sd_bus_vtable log_vtable[] = {
 	SD_BUS_VTABLE_START(0),   
-	SD_BUS_PROPERTY("association", "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
 	SD_BUS_PROPERTY("message",     "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
 	SD_BUS_PROPERTY("severity",    "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
 	SD_BUS_PROPERTY("reported_by", "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
@@ -321,13 +379,18 @@ static const sd_bus_vtable recordlog_delete_vtable[] = {
 	SD_BUS_VTABLE_END
 };
 
+static const sd_bus_vtable recordlog_association_vtable[] = {
+	SD_BUS_VTABLE_START(0),
+	SD_BUS_PROPERTY("associations", "a(sss)",  prop_message_assoc, 0, SD_BUS_VTABLE_PROPERTY_CONST),
+	SD_BUS_VTABLE_END
+};
+
 static int remove_log_from_dbus(messageEntry_t *p)
 {
 	int r;
 	char buffer[32];
 
-	snprintf(buffer, sizeof(buffer),
-		"/org/openbmc/records/events/%d", p->logid);
+	snprintf(buffer, sizeof(buffer), "%s/%lu", event_path, p->logid);
 
 	printf("Attempting to delete %s\n", buffer);
 
@@ -339,19 +402,21 @@ static int remove_log_from_dbus(messageEntry_t *p)
 	sd_bus_slot_unref(p->messageslot);
 	sd_bus_slot_unref(p->deleteslot);
 
+	if (p->associationslot)
+		sd_bus_slot_unref(p->associationslot);
+
 	message_entry_close(p);
 
 	return 0;
 }
 
-int send_log_to_dbus(event_manager *em, const uint16_t logid)
+int send_log_to_dbus(event_manager *em, const uint16_t logid, const char *association)
 {
 	char loglocation[64];
 	int r;
 	messageEntry_t *m;
 
-	snprintf(loglocation, sizeof(loglocation),
-		"/org/openbmc/records/events/%d", logid);
+	snprintf(loglocation, sizeof(loglocation), "%s/%d", event_path, logid);
 
 	message_entry_new(&m, logid, em);
 
@@ -374,12 +439,34 @@ int send_log_to_dbus(event_manager *em, const uint16_t logid)
 				     "org.openbmc.Object.Delete",
 				     recordlog_delete_vtable,
 				     m);
-	
-	printf("Event Log added %s\n", loglocation);
+
+	if (r < 0) {
+		fprintf(stderr, "Failed to add delete object for: %s, %s\n",
+			loglocation, strerror(-r));
+		message_entry_close(m);
+		return 0;
+	}
+
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
+	}
 
 	r = sd_bus_emit_object_added(bus, loglocation);
 	if (r < 0) {
 		fprintf(stderr, "Failed to emit signal %s\n", strerror(-r));
+		message_entry_close(m);
 		return 0;
 	}
 
@@ -445,7 +532,7 @@ int build_bus(event_manager *em)
 	
 	/* You want to add an object manager to support deleting stuff  */
 	/* without it, dbus can show interfaces that no longer exist */
-	r = sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/events");
+	r = sd_bus_add_object_manager(bus, NULL, event_path);
 	if (r < 0) {
 		fprintf(stderr, "Object Manager failure  %s\n", strerror(-r));
 	}
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
