Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qQbyx5BbkzDqyK
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2016 16:10:33 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458191428236929.9431512248663;
 Wed, 16 Mar 2016 22:10:28 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v6 1/2] Add association interface to each event
 log
Date: Thu, 17 Mar 2016 00:10:25 -0500
Message-Id: <1458191426-19399-2-git-send-email-openbmc-patches@stwcx.xyz>
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

When a new event log is created we will create an interface
with a name of org.openbmc.association.  That will have a
single property named "association" which will be an a(sss).
That will be enough information for the rest server to present
it.

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

Fix warnings due to invalid number of parameters

you cant have a fprintf with two parms but only one %s.
---
 event_messaged_sdbus.c | 105 ++++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 86 insertions(+), 19 deletions(-)

diff --git a/event_messaged_sdbus.c b/event_messaged_sdbus.c
index fc4c911..907ac53 100644
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
@@ -84,6 +87,53 @@ static event_record_t* message_record_open(event_manager *em, uint16_t logid)
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
+	char *token;
+
+	rec = message_record_open(m->em, m->logid);
+	if (!rec) {
+		fprintf(stderr,"Warning missing evnet log for %lx\n", m->logid);
+		sd_bus_error_set(error,
+			SD_BUS_ERROR_FILE_NOT_FOUND,
+			"Could not find log file");
+		return -1;
+	}
+
+	p = rec->association;
+
+	token = strtok(p, " ");
+	if (token) {
+		r = sd_bus_message_open_container(reply, 'a', "(sss)");
+		if (r < 0) {
+			fprintf(stderr,"Error opening container %s to reply %s\n", token, strerror(-r));
+		}
+
+		while(token) {
+
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
+	return r;
+}
 
 
 static int prop_message(sd_bus *bus,
@@ -103,7 +153,7 @@ static int prop_message(sd_bus *bus,
 
 	rec = message_record_open(m->em, m->logid);
 	if (!rec) {
-		fprintf(stderr,"Warning missing evnet log for %d\n", m->logid);
+		fprintf(stderr,"Warning missing evnet log for %lx\n", m->logid);
 		sd_bus_error_set(error,
 			SD_BUS_ERROR_FILE_NOT_FOUND,
 			"Could not find log file");
@@ -114,8 +164,6 @@ static int prop_message(sd_bus *bus,
 		p = rec->message;
 	} else if (!strncmp("severity", property, 8)) {
 		p = rec->severity;
-	} else if (!strncmp("association", property, 11)) {
-		p = rec->association;
 	} else if (!strncmp("reported_by", property, 11)) {
 		p = rec->reportedby;
 	} else if (!strncmp("time", property, 4)) {
@@ -174,7 +222,7 @@ static int method_accept_host_message(sd_bus_message *m,
 				      void *userdata,
 				      sd_bus_error *ret_error)
 {
-	char *message, *severity, *association, *s;
+	char *message, *severity, *association;
 	size_t   n = 4;
 	uint8_t *p;
 	int r;
@@ -201,9 +249,7 @@ static int method_accept_host_message(sd_bus_message *m,
 	rec.p           = (uint8_t*) p;
 	rec.n           = n;
 
-	asprintf(&s, "%s %s (%s)", rec.severity, rec.message, rec.association);
-	syslog(LOG_NOTICE, s);
-	free(s);
+	syslog(LOG_NOTICE, "%s %s (%s)", rec.severity, rec.message, rec.association);
 
 	logid = message_create_new_log_event(em, &rec);
 
@@ -234,10 +280,7 @@ static int method_accept_test_message(sd_bus_message *m,
 	rec.n           = 6;
 
 
-	asprintf(&s, "%s %s (%s)", rec.severity, rec.message, rec.association);
-	syslog(LOG_NOTICE, s);
-	free(s);
-
+	syslog(LOG_NOTICE, "%s %s (%s)", rec.severity, rec.message, rec.association);
 	logid = message_create_new_log_event(em, &rec);
 	send_log_to_dbus(em, logid);
 
@@ -261,7 +304,7 @@ static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_
 
 	while (logid = message_next_event(em)) {
 		snprintf(buffer, sizeof(buffer),
-			"/org/openbmc/records/events/%d", logid);
+			"%s/%d", event_path, logid);
 
 		r = sd_bus_call_method_async(bus,
 					     NULL,
@@ -305,7 +348,6 @@ static const sd_bus_vtable recordlog_vtable[] = {
 
 static const sd_bus_vtable log_vtable[] = {
 	SD_BUS_VTABLE_START(0),   
-	SD_BUS_PROPERTY("association", "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
 	SD_BUS_PROPERTY("message",     "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
 	SD_BUS_PROPERTY("severity",    "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
 	SD_BUS_PROPERTY("reported_by", "s",  prop_message,    0, SD_BUS_VTABLE_PROPERTY_CONST),
@@ -321,13 +363,18 @@ static const sd_bus_vtable recordlog_delete_vtable[] = {
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
 
@@ -338,6 +385,7 @@ static int remove_log_from_dbus(messageEntry_t *p)
 	}	
 	sd_bus_slot_unref(p->messageslot);
 	sd_bus_slot_unref(p->deleteslot);
+	sd_bus_slot_unref(p->associationslot);
 
 	message_entry_close(p);
 
@@ -350,8 +398,7 @@ int send_log_to_dbus(event_manager *em, const uint16_t logid)
 	int r;
 	messageEntry_t *m;
 
-	snprintf(loglocation, sizeof(loglocation),
-		"/org/openbmc/records/events/%d", logid);
+	snprintf(loglocation, sizeof(loglocation), "%s/%d", event_path, logid);
 
 	message_entry_new(&m, logid, em);
 
@@ -374,12 +421,32 @@ int send_log_to_dbus(event_manager *em, const uint16_t logid)
 				     "org.openbmc.Object.Delete",
 				     recordlog_delete_vtable,
 				     m);
+
+	if (r < 0) {
+		fprintf(stderr, "Failed to add delete object for: %s, %s\n",
+			loglocation, strerror(-r));
+		message_entry_close(m);
+		return 0;
+	}
 	
-	printf("Event Log added %s\n", loglocation);
+	r = sd_bus_add_object_vtable(bus,
+				     &m->associationslot,
+				     loglocation,
+				     "org.openbmc.Associations",
+				     recordlog_association_vtable,
+				     m);
+
+	if (r < 0) {
+		fprintf(stderr, "Failed to add association object for: %s %s\n",
+			loglocation, strerror(-r));
+		message_entry_close(m);
+		return 0;
+	}
 
 	r = sd_bus_emit_object_added(bus, loglocation);
 	if (r < 0) {
 		fprintf(stderr, "Failed to emit signal %s\n", strerror(-r));
+		message_entry_close(m);
 		return 0;
 	}
 
@@ -445,7 +512,7 @@ int build_bus(event_manager *em)
 	
 	/* You want to add an object manager to support deleting stuff  */
 	/* without it, dbus can show interfaces that no longer exist */
-	r = sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/events");
+	r = sd_bus_add_object_manager(bus, NULL, event_path);
 	if (r < 0) {
 		fprintf(stderr, "Object Manager failure  %s\n", strerror(-r));
 	}
-- 
2.7.1
