Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8A21A01D8
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 03:40:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1454431233863209.8791156165306;
 Tue, 2 Feb 2016 08:40:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] Event Logs to survive a reboot
Date: Tue,  2 Feb 2016 10:40:31 -0600
Message-Id: <1454431231-28048-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1454431231-28048-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454431231-28048-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 02 Feb 2016 16:40:39 -0000

From: Chris Austen <austenc@us.ibm.com>

The event service stores the events from the host.  Before this commit all the code was in memory.  That meant once a reboot occured you lost the logs.  With this commit I am storing all logs to the file system.  This refactoring also enables a test suite.  The suite can be invoked by 'make test; ./test'.

1) /var/sys/obmc/events/x
2) logs are stored in binary and saved
3) Each log now has a timestamp of when the log reached the service
4) I added a caching mechanism to reduce the io traffic if the the method is simply being called to capture the next parameter
5) You will notice a mixture of c/c++.  This is because I want the test infrastructure to take advantage of c++ features

Useful REST calls
~~~~~~~~~~~~~~~~~
Note, dont forget to login first

List all events
curl -k https://bmc/org/openbmc/records/events/

Create an event log for testing purposes
curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": []}" https://bmc/org/openbmc/records/events/action/acceptTestMessage

Delete an event
curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": []}" https://bmc/org/openbmc/records/events/1/action/delete

Delete all events
curl -c cjar -b cjar -k -H "Content-Type: application/json" -X POST -d "{\"data\": []}" https://bmc/org/openbmc/records/events/action/clear
---
 Makefile               |  29 ++--
 event_messaged.C       |  44 +++++
 event_messaged.c       | 341 ---------------------------------------
 event_messaged_sdbus.c | 425 +++++++++++++++++++++++++++++++++++++++++++++++++
 event_messaged_sdbus.h |  14 ++
 message.C              | 224 ++++++++++++++++++++++++++
 message.H              |  60 +++++++
 test.C                 |  92 +++++++++++
 8 files changed, 878 insertions(+), 351 deletions(-)
 create mode 100644 event_messaged.C
 delete mode 100644 event_messaged.c
 create mode 100644 event_messaged_sdbus.c
 create mode 100644 event_messaged_sdbus.h
 create mode 100644 message.C
 create mode 100644 message.H
 create mode 100644 test.C

diff --git a/Makefile b/Makefile
index 4c2ba9b..903ac06 100644
--- a/Makefile
+++ b/Makefile
@@ -1,27 +1,36 @@
-TEST      = listfunc
-OBJS_TEST = $(TEST).o
 
-EXE     = event_messaged
+TEST      = test
 
-OBJS    = $(EXE).o   \
-          list.o 	 \
+EXE       = event_messaged
+EXE_OBJS  = $(EXE).o message.o event_messaged_sdbus.o list.o
 
+OBJS_TEST = $(TEST).o message.o
+
+CPPFLAGS  += -g -fpic -Wall -std=c++11
 
 DEPPKGS = libsystemd
-CC      ?= $(CROSS_COMPILE)gcc
 INCLUDES += $(shell pkg-config --cflags $(DEPPKGS)) 
 LIBS += $(shell pkg-config --libs $(DEPPKGS))
 
+
+
 all: $(EXE)
 
 %.o : %.c 
 	$(CC) -c $< $(CFLAGS) $(INCLUDES) -o $@
 
-$(EXE): $(OBJS)
-	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@
+%.o : %.C
+	$(CXX) -c $< $(CPPFLAGS) -o $@
+
+
+$(EXE): $(EXE_OBJS)
+	$(CXX) $^ $(LDFLAGS) $(LIBS) -o $@
+
 
 $(TEST): $(OBJS_TEST)
-	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@
+	$(CXX) $^ $(LDFLAGS) -o $@
 
 clean:
-	rm -f $(OBJS) $(EXE) *.o *.d
+	rm -f $(TEST) *.o *.so $(EXE)
+
+
diff --git a/event_messaged.C b/event_messaged.C
new file mode 100644
index 0000000..4376431
--- /dev/null
+++ b/event_messaged.C
@@ -0,0 +1,44 @@
+#include <iostream>
+#include "message.H"
+#include "event_messaged_sdbus.h"
+
+const char *glogname = "/var/lib/obmc/events";
+
+using namespace std;
+
+
+// Walk through all the saved logs and reload them in to dbus objects
+// Needed because on a reboot the existing logs need to be reloaded
+int load_existing_events(void) {
+
+    event_log_list log_list;
+    uint16_t       logid=0;
+
+    while (message_get_next_log(&logid, &log_list)) {
+        send_log_to_dbus(logid);
+    }
+    
+    return 0;
+}
+
+int main(int argc, char *argv[]) {
+
+    int rc = 0;
+
+    if ((rc = build_bus()) < 0) {
+        fprintf(stderr, "Event Messager failed to connect to dbus rc=%d", rc);
+        goto finish;
+    }
+
+    if ((rc = load_existing_events()) < 0) {
+        fprintf(stderr, "Event Messager failed add previous logs to dbus rc=%d", rc);
+        goto finish;
+    }
+
+    rc = start_event_monitor();
+
+    finish:
+    cleanup_event_monitor();
+
+    return rc;
+}
\ No newline at end of file
diff --git a/event_messaged.c b/event_messaged.c
deleted file mode 100644
index 0c75e3a..0000000
--- a/event_messaged.c
+++ /dev/null
@@ -1,341 +0,0 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <errno.h>
-#include <stddef.h>
-#include <systemd/sd-bus.h>
-#include "list.h"
-
-uint16_t g_logid = 0;
-sd_bus *bus = NULL;
-List *glist;
-
-
-int create_new_log_event(void *userdata,
-                         const char *message,
-                         const char *severity,
-                         const char *association,
-                         const char *reportedby,
-                         uint8_t *p,
-                         size_t n);
-
-typedef struct messageEntry_t {
-	char    *message;
-	char    *severity;
-	char    *reportedby;
-	char    *association;
-	uint8_t *debugbytes;
-	size_t   debuglength;
-	size_t   logid;
-
-	sd_bus_slot *messageslot;
-	sd_bus_slot *deleteslot;
-
-} messageEntry_t;
-
-
-void message_storage_delete(messageEntry_t *m) {
-
-	char *path;
-	int r;
-
-	asprintf(&path, "/org/openbmc/records/events/%d", m->logid);
-
-
-	printf("Attempting to delete %s\n", path);
-
-	free(m->message);
-	free(m->severity);
-	free(m->reportedby);
-	free(m->association);
-	free(m->debugbytes);
-
-
-	r = sd_bus_emit_object_removed(bus, path);
-	if (r < 0) {
-		fprintf(stderr, "Failed to emit the delete signal %s\n", strerror(-r));
-		return;
-	}
-
-	sd_bus_slot_unref(m->messageslot);
-	sd_bus_slot_unref(m->deleteslot);
-
-	free(m);
-
-	return;
-}
-
-
-
-void message_add(messageEntry_t **n, 
-                const char *message,
-                const char *severity,
-                const char *association,
-                const char *reportedby,
-                size_t      logid,
-                uint8_t    *data,
-                size_t      datalen)
-{
-
-	messageEntry_t *p = *n = malloc(sizeof(messageEntry_t));
-
-	asprintf(&(*n)->message,     "%s", message);
-	asprintf(&(*n)->severity,    "%s", severity);
-	asprintf(&(*n)->association, "%s", association);
-	asprintf(&(*n)->reportedby,  "%s", reportedby);
-
-	(*n)->logid       = logid;
-	(*n)->debugbytes  = (uint8_t*) malloc (datalen);
-	(*n)->debuglength = datalen;
-	memcpy((*n)->debugbytes, data, datalen);
-
-	(*n)->messageslot = NULL;
-	(*n)->deleteslot  = NULL;
-	return;
-}
-
-
-static int get_message_dd(sd_bus *bus,
-                          const char *path,
-                          const char *interface,
-                          const char *property,
-                          sd_bus_message *reply,
-                          void *userdata,
-                          sd_bus_error *error) {
-
-	int r;
-	messageEntry_t *p = (messageEntry_t *)userdata;
-	
-	r = sd_bus_message_append_array(reply, 'y', p->debugbytes, p->debuglength);
-	if (r < 0) {
-	  printf("Error building array for property %s\n", strerror(-r));
-	}
-
-	return r;
-}
-
-
-/////////////////////////////////////////////////////////////
-// Receives an array of bytes as an esel error log
-// returns the messageid in 2 byte format
-//  
-//  S1 - Message - Simple sentence about the fail
-//  S2 - Severity - How bad of a problem is this
-//  S3 - Association - sensor path
-//  ay - Detailed data - developer debug information
-//
-/////////////////////////////////////////////////////////////
-static int method_accept_host_message(sd_bus_message *m, 
-                                      void *userdata, 
-                                      sd_bus_error *ret_error) {
-
-	char *message, *severity, *association;
-	size_t   n = 4;
-	uint8_t *p;
-	int r;
-
-	r = sd_bus_message_read(m, "sss", &message, &severity, &association);
-	if (r < 0) {
-		fprintf(stderr, "Failed to parse the String parameter: %s\n", strerror(-r));
-		return r;
-	}
-
-	r = sd_bus_message_read_array(m, 'y', (const void **)&p, &n);
-	if (r < 0) {
-		fprintf(stderr, "Failed to parse the array of bytes parameter: %s\n", strerror(-r));
-		return r;
-	}
-
-	create_new_log_event(userdata, message, severity, association, "Host", p, n);
-
-	return sd_bus_reply_method_return(m, "q", g_logid);
-}
-
-
-static int method_accept_test_message(sd_bus_message *m, 
-                                      void *userdata, 
-                                      sd_bus_error *ret_error) {
-
-	uint8_t p[] = {0x30, 0x32, 0x34, 0x36};
-
-	create_new_log_event(userdata, "Testing Message", "Info", "Association", "Test", p, 4);
-
-	return sd_bus_reply_method_return(m, "q", g_logid);
-}
-
-
-static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
-
-	Node *n;
-
-	// This deletes one log at a time and seeing how the
-	// list shrinks using the NULL works fine here
-	while (n = list_get_next_node(glist, NULL)) {
-		message_storage_delete(n->data);
-		list_delete_node(glist, n);
-	}
-
-	return sd_bus_reply_method_return(m, "q", 0);
-}
-
-
-static int method_deletelog(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
-
-	Node *n = (Node*)userdata;
-
-	message_storage_delete(n->data);
-	list_delete_node(glist, n);
-
-	return sd_bus_reply_method_return(m, "q", 0);
-}
-
-
-
-static const sd_bus_vtable recordlog_vtable[] = {
-	SD_BUS_VTABLE_START(0),
-	SD_BUS_METHOD("acceptHostMessage", "sssay", "q", method_accept_host_message, SD_BUS_VTABLE_UNPRIVILEGED),
-	SD_BUS_METHOD("acceptTestMessage", NULL, "q", method_accept_test_message, SD_BUS_VTABLE_UNPRIVILEGED),
-	SD_BUS_METHOD("Clear", NULL, "q", method_clearall, SD_BUS_VTABLE_UNPRIVILEGED),
-	SD_BUS_VTABLE_END
-};
-
-static const sd_bus_vtable log_vtable[] = {
-	SD_BUS_VTABLE_START(0),
-	SD_BUS_PROPERTY("Association", "s", NULL, offsetof(messageEntry_t, association), SD_BUS_VTABLE_PROPERTY_CONST),
-	SD_BUS_PROPERTY("Message",  "s", NULL, offsetof(messageEntry_t, message), SD_BUS_VTABLE_PROPERTY_CONST),
-	SD_BUS_PROPERTY("Severity", "s", NULL, offsetof(messageEntry_t, severity), SD_BUS_VTABLE_PROPERTY_CONST),
-	SD_BUS_PROPERTY("Reported_By", "s", NULL, offsetof(messageEntry_t, reportedby),  SD_BUS_VTABLE_PROPERTY_CONST),
-	SD_BUS_PROPERTY("DevelopmentData", "ay", get_message_dd,0, SD_BUS_VTABLE_PROPERTY_CONST),
-	SD_BUS_VTABLE_END
-};
-
-
-static const sd_bus_vtable recordlog_delete_vtable[] = {
-	SD_BUS_VTABLE_START(0),
-	SD_BUS_METHOD("Delete", NULL, "q", method_deletelog, SD_BUS_VTABLE_UNPRIVILEGED),
-	SD_BUS_VTABLE_END
-};
-
-uint16_t get_new_log_number() {
-	return ++g_logid;
-}
-
-int create_new_log_event(void *userdata,
-                         const char *message,
-                         const char *severity,
-                         const char *association,
-                         const char *reportedby,
-                         uint8_t *p, 
-                         size_t n) {
-	char loglocation[64];
-	int r;
-	messageEntry_t *m;
-	Node *node;
-	uint16_t logid = get_new_log_number();
-
-
-	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events/%d", logid);
-
-	message_add(&m, message, severity, association, reportedby, logid, p, n);
-
-	node = list_add_node(glist, m);
-
-	r = sd_bus_add_object_vtable(bus,
-	                             &m->messageslot,
-	                             loglocation,
-	                             "org.openbmc.record",
-	                             log_vtable,
-	                             m);
-	if (r < 0) {
-		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocation, strerror(-r));
-		message_storage_delete(m);
-		list_delete_last_node(glist);
-		return 0;
-	}
-
-	r = sd_bus_add_object_vtable(bus,
-	                             &m->deleteslot,
-	                             loglocation,
-	                             "org.openbmc.Object.Delete",
-	                             recordlog_delete_vtable,
-	                             node);
-
-	printf("Event Log added %s\n", loglocation);
-
-	r = sd_bus_emit_object_added(bus, loglocation);
-	if (r < 0) {
-		fprintf(stderr, "Failed to emit signal %s\n", strerror(-r));
-		return 0;
-	}
-
-
-
-	return logid;
-}
-
-
-int start_event_recording(void) {
-
-	int r;
-
-	sd_bus_slot *slot;
-
-	/* Connect to the user bus this time */
-	r = sd_bus_open_system(&bus);
-	if (r < 0) {
-		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
-		goto finish;
-	}
-
-	/* Install the object */
-	r = sd_bus_add_object_vtable(bus,
-	                             &slot,
-	                             "/org/openbmc/records/events",  /* object path */
-	                             "org.openbmc.recordlog",   /* interface name */
-	                             recordlog_vtable,
-	                             NULL);
-	if (r < 0) {
-		fprintf(stderr, "Failed to issue method call: %s\n", strerror(-r));
-		goto finish;
-	}
-	
-	/* Take a well-known service name so that clients can find us */
-	r = sd_bus_request_name(bus, "org.openbmc.records.events", 0);
-	if (r < 0) {
-		fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
-		goto finish;
-	}
-
-	r = sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/events") ;
-	if (r < 0) {
-		fprintf(stderr, "Object Manager failure  %s\n", strerror(-r));
-		return 0;
-	}
-
-	for (;;) {
-		r = sd_bus_process(bus, NULL);
-		if (r < 0) {
-			fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
-			goto finish;
-		}
-		if (r > 0)
-			continue;
-
-		r = sd_bus_wait(bus, (uint64_t) -1);
-		if (r < 0) {
-			fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
-			goto finish;
-		}
-	}
-	finish:
-		sd_bus_slot_unref(slot);
-		sd_bus_unref(bus);
-
-	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
-}
-
-
-int main(int argc, char *argv[]) {
-
-	glist = list_create();
-	return start_event_recording();
-}
\ No newline at end of file
diff --git a/event_messaged_sdbus.c b/event_messaged_sdbus.c
new file mode 100644
index 0000000..fa83e5c
--- /dev/null
+++ b/event_messaged_sdbus.c
@@ -0,0 +1,425 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <stddef.h>
+#include <systemd/sd-bus.h>
+#include "message.H"
+#include "list.h"
+#include "event_messaged_sdbus.h"
+
+/*****************************************************************************/
+/* This set of functions are responsible for interactions with events over   */
+/* dbus.  Logs come in a couple of different ways...                         */ 
+/*     1) From the calls from acceptHostMessage, acceptTestMessage           */
+/*     2) At startup and logs that exist alreafy are re-added                */
+/*                                                                           */
+/* event_record_t when loaded contain all strings and data stream for a log  */
+/*                                                                           */
+/* Functions naming convention                                               */
+/*     prop_x    : callable dbus properties.                                 */
+/*     method_x  : callable dbus functions.                                  */
+/*                                                                           */
+/*****************************************************************************/
+
+
+
+sd_bus      *bus   = NULL;
+sd_bus_slot *slot  = NULL;
+List        *glist = NULL;
+
+event_record_t *gCachedRec = NULL;
+
+static int remove_log_from_dbus(Node *node);
+
+typedef struct messageEntry_t {
+
+	size_t       logid;
+	sd_bus_slot *messageslot;
+	sd_bus_slot *deleteslot;
+
+} messageEntry_t;
+
+
+static void message_entry_close(messageEntry_t *m) {
+	free(m);
+	return;
+}
+
+static void message_entry_new(messageEntry_t **m, uint16_t logid) {
+	*m          = malloc(sizeof(messageEntry_t));
+	(*m)->logid = logid;
+	return;
+}
+
+// After calling this function the gCachedRec will be set
+static event_record_t* message_record_open(uint16_t logid) {
+
+	int r = 0;
+	event_record_t *rec;
+
+	// A simple caching technique because each 
+	// property needs to extract data from the
+	// same data blob.  
+	if (gCachedRec == NULL) {
+		if (message_load_log(logid, &rec)) {
+			gCachedRec = rec;
+			return gCachedRec;
+		} else 
+			return NULL;
+	} 
+
+	if (logid == gCachedRec->logid) {
+		r = 1;
+
+	} else {
+		message_free_log(gCachedRec);
+		gCachedRec = NULL;
+
+		r = message_load_log(logid, &rec);
+		if (r)
+			gCachedRec = rec;
+	}
+
+	return (r ? gCachedRec : NULL);
+}
+
+
+
+static int prop_message(sd_bus *bus,
+                       const char *path,
+                       const char *interface,
+                       const char *property,
+                       sd_bus_message *reply,
+                       void *userdata,
+                       sd_bus_error *error) {
+
+	int r=0;
+	messageEntry_t *m = (messageEntry_t*) userdata;
+	char *p;
+	struct tm *tm_info;
+    char buffer[32];
+    event_record_t *rec;
+
+	rec = message_record_open(m->logid);
+
+	if (!rec) {
+		fprintf(stderr,"Warning missing evnet log for %d\n", m->logid);
+		sd_bus_error_set(error,  SD_BUS_ERROR_FILE_NOT_FOUND,"Could not find log file");
+        return -1;
+	}
+
+	if (!strncmp("Message", property, 7)) 
+		p = rec->message;
+	else if (!strncmp("Severity", property, 8))
+		p = rec->severity;
+	else if (!strncmp("Association", property, 11))
+		p = rec->association;
+	else if (!strncmp("Reported_By", property, 11))
+		p = rec->reportedby;
+	else if (!strncmp("Time", property, 4)) {
+		tm_info = localtime(&rec->timestamp);
+		strftime(buffer, 26, "%Y:%m:%d %H:%M:%S", tm_info);
+		p    = buffer;
+	}
+	else
+		p = "";
+
+	r = sd_bus_message_append(reply, "s", p);
+	if (r < 0) {
+	    fprintf(stderr,"Error building array for property %s\n", strerror(-r));
+	}
+
+
+	return r;
+}
+
+
+static int prop_message_dd(sd_bus *bus,
+                       const char *path,
+                       const char *interface,
+                       const char *property,
+                       sd_bus_message *reply,
+                       void *userdata,
+                       sd_bus_error *error) {
+
+    event_record_t *rec;
+    messageEntry_t *m = (messageEntry_t*) userdata;
+
+	rec = message_record_open(m->logid);
+
+	if (!rec) {
+		sd_bus_error_set(error,  SD_BUS_ERROR_FILE_NOT_FOUND,"Could not find log file");
+        return -1;
+    }
+	return sd_bus_message_append_array(reply, 'y', rec->p, rec->n);
+}
+
+/////////////////////////////////////////////////////////////
+// Receives an array of bytes as an esel error log
+// returns the messageid in 2 byte format
+//  
+//  S1 - Message - Simple sentence about the fail
+//  S2 - Severity - How bad of a problem is this
+//  S3 - Association - sensor path
+//  ay - Detailed data - developer debug information
+//
+/////////////////////////////////////////////////////////////
+static int method_accept_host_message(sd_bus_message *m,
+                                      void *userdata,
+                                      sd_bus_error *ret_error) {
+
+	char *message, *severity, *association;
+	size_t   n = 4;
+	uint8_t *p;
+	int r;
+	uint16_t logid;
+	event_record_t rec;
+
+	r = sd_bus_message_read(m, "sss", &message, &severity, &association);
+	if (r < 0) {
+		fprintf(stderr, "Failed to parse the String parameter: %s\n", strerror(-r));
+		return r;
+	}
+
+	r = sd_bus_message_read_array(m, 'y', (const void **)&p, &n);
+	if (r < 0) {
+		fprintf(stderr, "Failed to parse the array of bytes parameter: %s\n", strerror(-r));
+		return r;
+	}
+
+    rec.message     = (char*) message;
+    rec.severity    = (char*) severity;
+    rec.association = (char*) association;
+    rec.reportedby  = (char*) "Host";
+    rec.p           = (uint8_t*) p;
+    rec.n           = n;
+
+
+	logid = message_create_new_log_event(&rec);
+
+	if (logid) 
+		r = send_log_to_dbus(logid);
+
+	return sd_bus_reply_method_return(m, "q", logid);
+}
+
+
+static int method_accept_test_message(sd_bus_message *m,
+                                      void *userdata, 
+                                      sd_bus_error *ret_error) {
+
+	uint8_t p[] = {0x30, 0x32, 0x34, 0x36};
+	uint16_t logid;
+	event_record_t rec;
+
+    rec.message     = (char*) "Testing Message";
+    rec.severity    = (char*) "Info";
+    rec.association = (char*) "Association";
+    rec.reportedby  = (char*) "Test";
+    rec.p           = (uint8_t*) p;
+    rec.n           = sizeof(*p);
+
+	logid = message_create_new_log_event(&rec);
+	send_log_to_dbus(logid);
+
+	return sd_bus_reply_method_return(m, "q", logid);
+}
+
+
+static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
+	Node *n;
+	messageEntry_t *p;
+	
+	// This deletes one log at a time and seeing how the
+	// list shrinks using the NULL works fine here
+	while (n = list_get_next_node(glist, NULL)) {
+		p = (messageEntry_t *) n->data;
+		message_delete_log(p->logid);
+		remove_log_from_dbus(n);
+	}
+
+	return sd_bus_reply_method_return(m, "q", 0);
+}
+
+
+static int method_deletelog(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
+
+	Node *n = (Node*)userdata;
+	messageEntry_t *p = (messageEntry_t *) n->data;
+
+	message_delete_log(p->logid);
+	remove_log_from_dbus(n);
+	return sd_bus_reply_method_return(m, "q", 0);
+}
+
+
+
+static const sd_bus_vtable recordlog_vtable[] = {
+	SD_BUS_VTABLE_START(0),
+	SD_BUS_METHOD("acceptHostMessage", "sssay", "q", method_accept_host_message, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_METHOD("acceptTestMessage", NULL, "q", method_accept_test_message, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_METHOD("Clear", NULL, "q", method_clearall, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_VTABLE_END
+};
+
+static const sd_bus_vtable log_vtable[] = {
+	SD_BUS_VTABLE_START(0),   
+	SD_BUS_PROPERTY("Association",      "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
+	SD_BUS_PROPERTY("Message",          "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
+	SD_BUS_PROPERTY("Severity",         "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
+	SD_BUS_PROPERTY("Reported_By",      "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
+	SD_BUS_PROPERTY("Time",             "s", prop_message, 0, SD_BUS_VTABLE_PROPERTY_CONST),
+	SD_BUS_PROPERTY("DevelopmentData", "ay", prop_message_dd ,0, SD_BUS_VTABLE_PROPERTY_CONST),
+	SD_BUS_VTABLE_END
+};
+
+
+static const sd_bus_vtable recordlog_delete_vtable[] = {
+	SD_BUS_VTABLE_START(0),
+	SD_BUS_METHOD("delete", NULL, "q", method_deletelog, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_VTABLE_END
+};
+
+static int remove_log_from_dbus(Node *node) {
+	
+	messageEntry_t *p = (messageEntry_t *) node->data;
+	int r;
+	char buffer[32];
+
+	snprintf(buffer, sizeof(buffer), "/org/openbmc/records/events/%d", p->logid);
+
+	printf("Attempting to delete %s\n", buffer);
+
+	r = sd_bus_emit_object_removed(bus, buffer);
+	if (r < 0) {
+		fprintf(stderr, "Failed to emit the delete signal %s\n", strerror(-r));
+		return -1;
+	}	
+	sd_bus_slot_unref(p->messageslot);
+	sd_bus_slot_unref(p->deleteslot);
+
+	message_entry_close(p);
+	list_delete_node(glist, node);
+
+	return 0;
+}
+
+int send_log_to_dbus(const uint16_t logid) {
+
+	char loglocation[64];
+	int r;
+	messageEntry_t *m;
+	Node *node;
+
+
+	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events/%d", logid);
+
+	message_entry_new(&m, logid);
+
+	node = list_add_node(glist, m);
+
+	r = sd_bus_add_object_vtable(bus,
+	                             &m->messageslot,
+	                             loglocation,
+	                             "org.openbmc.record",
+	                             log_vtable,
+	                             m);
+	if (r < 0) {
+		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocation, strerror(-r));
+		message_entry_close(m);
+		list_delete_last_node(glist);
+		return 0;
+	}
+
+	r = sd_bus_add_object_vtable(bus,
+	                             &m->deleteslot,
+	                             loglocation,
+	                             "org.openbmc.Object.Delete",
+	                             recordlog_delete_vtable,
+	                             node);
+	
+	printf("Event Log added %s\n", loglocation);
+
+	r = sd_bus_emit_object_added(bus, loglocation);
+	if (r < 0) {
+		fprintf(stderr, "Failed to emit signal %s\n", strerror(-r));
+		return 0;
+	}
+
+	return logid;
+}
+
+
+int start_event_monitor(void) {
+
+	int r;
+
+	for (;;) {
+
+		r = sd_bus_process(bus, NULL);
+		if (r < 0) {
+			fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
+			break;
+		}
+
+		if (r > 0)
+			continue;
+
+		r = sd_bus_wait(bus, (uint64_t) -1);
+		if (r < 0) {
+			fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
+			break;
+		}
+	}
+
+	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+}
+
+
+/* Only thing we are doing in this function is to get a connection on the dbus */
+int build_bus(void) {
+
+	int r = 0;
+
+	glist = list_create();
+	/* Connect to the system bus */
+	r = sd_bus_open_system(&bus);
+	if (r < 0) {
+		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
+		goto finish;
+	}
+
+	/* Install the object */
+	r = sd_bus_add_object_vtable(bus,
+	                             &slot,
+	                             "/org/openbmc/records/events",  /* object path */
+	                             "org.openbmc.recordlog",   /* interface name */
+	                             recordlog_vtable,
+	                             NULL);
+	if (r < 0) {
+		fprintf(stderr, "Failed to issue method call: %s\n", strerror(-r));
+		goto finish;
+	}
+
+	/* Take a well-known service name so that clients can find us */
+	r = sd_bus_request_name(bus, "org.openbmc.records.events", 0);
+	if (r < 0) {
+		fprintf(stderr, "Failed to acquire service name: %s\n", strerror(-r));
+	}	
+	
+	/* You want to add an object manager to support deleting stuff  */
+	/* without it, dbus can show interfaces that no longer exist */
+	r = sd_bus_add_object_manager(bus, NULL, "/org/openbmc/records/events");
+	if (r < 0) {
+		fprintf(stderr, "Object Manager failure  %s\n", strerror(-r));
+	}
+
+
+	finish:
+	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+}
+
+void cleanup_event_monitor(void) {
+	sd_bus_slot_unref(slot);
+	sd_bus_unref(bus);
+}
\ No newline at end of file
diff --git a/event_messaged_sdbus.h b/event_messaged_sdbus.h
new file mode 100644
index 0000000..a6aac94
--- /dev/null
+++ b/event_messaged_sdbus.h
@@ -0,0 +1,14 @@
+#include <stddef.h>
+
+#ifdef __cplusplus
+extern "C"  {
+#endif
+	int start_event_monitor(void);
+	int build_bus(void);
+	int send_log_to_dbus(const uint16_t logid);
+	void cleanup_event_monitor(void);
+#ifdef __cplusplus
+}
+#endif
+
+
diff --git a/message.C b/message.C
new file mode 100644
index 0000000..31a545a
--- /dev/null
+++ b/message.C
@@ -0,0 +1,224 @@
+#include <iostream>
+#include <fstream>
+#include <iomanip>
+#include <cstdint>
+#include <string>
+#include <sys/types.h> 
+#include <dirent.h> 
+#include <sstream>
+#include <sys/stat.h>
+#include <cstring>
+#include "message.H"
+#include <time.h>
+#include <stddef.h>
+#include <cstdio>
+
+using namespace std;
+
+const uint32_t g_eyecatcher = 0x4F424D43; // OBMC
+const uint16_t g_version    = 1;
+
+struct logheader_t {
+    uint32_t eyecatcher;
+    uint16_t version;
+    uint16_t logid;
+    time_t   timestamp;
+    uint16_t detailsoffset;
+    uint16_t messagelen;
+    uint16_t severitylen;
+    uint16_t associationlen;
+    uint16_t reportedbylen;
+    uint16_t debugdatalen;
+};
+
+uint16_t g_logid = 0;
+
+extern const char *glogname;
+
+static uint16_t get_new_log_number(void) {
+    return ++g_logid;
+}
+
+static void update_latest_logid(uint16_t logid) {
+    if (logid > g_logid)
+        g_logid = logid;
+    return;
+}
+
+inline uint16_t GETLEN(const char *s) {
+    return (uint16_t) (1 + strlen(s));
+}
+
+static uint16_t create_log_event(event_record_t *rec) {
+
+    std::ostringstream buffer;
+    ofstream myfile;
+    logheader_t hdr;
+
+
+    buffer << glogname << "/" << int(rec->logid) ;
+
+    cout << buffer.str() << endl;
+
+    hdr.eyecatcher     = g_eyecatcher;
+    hdr.version        = g_version;
+    hdr.logid          = rec->logid;
+    hdr.timestamp      = time(NULL);
+    hdr.detailsoffset  = offsetof(logheader_t, messagelen);
+    hdr.messagelen     = GETLEN(rec->message);
+    hdr.severitylen    = GETLEN(rec->severity);
+    hdr.associationlen = GETLEN(rec->association);
+    hdr.reportedbylen  = GETLEN(rec->reportedby);
+    hdr.debugdatalen   = rec->n;
+
+    myfile.open(buffer.str() , ios::out|ios::binary);
+    myfile.write((char*) &hdr, sizeof(hdr));
+    myfile.write((char*) rec->message, hdr.messagelen);
+    myfile.write((char*) rec->severity, hdr.severitylen);
+    myfile.write((char*) rec->association, hdr.associationlen);
+    myfile.write((char*) rec->reportedby, hdr.reportedbylen);
+    myfile.write((char*) rec->p, hdr.debugdatalen);
+    myfile.close();
+
+    return rec->logid;
+}
+
+static int is_file_a_log(string str) {
+
+    std::ostringstream buffer;
+    ifstream f;
+    logheader_t hdr;
+
+    if (!str.compare("."))
+        return 0;
+    if (!str.compare(".."))
+        return 0;
+
+    buffer << glogname << "/" << str;
+
+    f.open( buffer.str(), ios::binary);
+
+    if (!f.good()) {
+        return 0;
+    }
+
+    f.read((char*)&hdr, sizeof(hdr));
+
+    if (hdr.eyecatcher != g_eyecatcher)
+        return 0;
+
+    return 1;
+}
+
+
+
+int message_load_log(uint16_t logid, event_record_t **rec) {
+
+    std::ostringstream buffer;
+    ifstream f;
+    logheader_t hdr;
+
+    buffer << glogname << "/" << int(logid);
+
+    f.open( buffer.str(), ios::binary);
+
+    if (!f.good()) {
+        return 0;
+    }
+
+    *rec = new event_record_t;
+
+    f.read((char*)&hdr, sizeof(hdr));
+
+    (*rec)->logid     = hdr.logid;
+    (*rec)->timestamp = hdr.timestamp;
+
+
+    (*rec)->message = new char[hdr.messagelen];
+    f.read((*rec)->message, hdr.messagelen);
+
+    (*rec)->severity = new char[hdr.severitylen];
+    f.read((*rec)->severity, hdr.severitylen);
+
+    (*rec)->association = new char[hdr.associationlen];
+    f.read((*rec)->association, hdr.associationlen);
+
+    (*rec)->reportedby = new char[hdr.reportedbylen];
+    f.read((*rec)->reportedby, hdr.reportedbylen);
+
+    (*rec)->p = new uint8_t[hdr.debugdatalen];
+    f.read((char*)(*rec)->p, hdr.debugdatalen);
+    (*rec)->n = hdr.debugdatalen;
+
+
+    f.close();
+    return logid;
+}
+
+void message_free_log(event_record_t *rec) {
+
+    delete[] rec->message;
+    delete[] rec->severity;
+    delete[] rec->association;
+    delete[] rec->reportedby;
+    delete[] rec->p;
+    delete rec;
+
+    return ;
+}
+
+int message_delete_log(uint16_t logid) {
+
+    std::stringstream buffer;
+    string s;
+
+    buffer << glogname << "/" << int(logid);
+
+    s = buffer.str();
+    std::remove(s.c_str());
+
+    return 0;
+}
+
+
+int message_get_next_log(uint16_t *logid, event_log_list *log_list) {
+
+    std::ostringstream buffer;
+    struct dirent *ent;
+
+    if (*logid==0)
+        log_list->dirp = opendir(glogname);
+
+    if(log_list->dirp)
+    {
+        do {
+            ent = readdir(log_list->dirp);
+
+            if (ent == NULL)
+                break;
+
+            string str(ent->d_name);
+
+            if (is_file_a_log(str)) {
+                *logid = (uint16_t) atoi(str.c_str());
+                update_latest_logid(*logid);
+                break;
+            }
+
+        } while( 1 );
+    } 
+    else
+    { 
+        cerr << "Error opening directory" << glogname << endl;
+        ent    = NULL;
+        *logid = 0;
+    }
+    return  ((ent == NULL) ? 0 : 1);
+}
+
+
+uint16_t message_create_new_log_event(event_record_t *rec) {
+
+    rec->logid = get_new_log_number();
+    return create_log_event(rec);
+}
diff --git a/message.H b/message.H
new file mode 100644
index 0000000..26ebe19
--- /dev/null
+++ b/message.H
@@ -0,0 +1,60 @@
+
+#include <dirent.h>
+#include <time.h>
+
+#ifdef __cplusplus
+    #include <cstdint>
+#else
+    #include <stdint.h>
+#endif
+
+
+#ifdef __cplusplus
+    struct event_log_list {
+#else
+    typedef struct _event_log_list {        
+#endif
+        DIR *dirp;
+#ifdef __cplusplus
+    };
+#else    
+    } event_log_list;
+#endif
+
+
+#ifdef __cplusplus
+    struct event_record_t {
+#else     
+    typedef struct _event_record_t {
+#endif
+        char *message;
+        char *severity;
+        char *association;
+        char *reportedby;
+        uint8_t *p;
+        size_t n;
+
+        // These get filled in for you
+        time_t  timestamp;        
+        int16_t logid;
+#ifdef __cplusplus
+    };
+#else     
+    } event_record_t;
+#endif
+
+
+#ifdef __cplusplus
+extern "C"  {
+#endif
+
+
+uint16_t message_create_new_log_event(event_record_t *rec);
+int      message_load_log(uint16_t logid, event_record_t **rec);
+void     message_free_log(event_record_t *rec);
+int      message_get_next_log(uint16_t *logid, event_log_list *log_list);
+int      message_delete_log(uint16_t logid);
+
+#ifdef __cplusplus
+}
+#endif
diff --git a/test.C b/test.C
new file mode 100644
index 0000000..afd834e
--- /dev/null
+++ b/test.C
@@ -0,0 +1,92 @@
+#include <iostream>
+#include <stdio.h>
+#include <stdlib.h>
+#include <stdint.h>
+
+#include "message.H"
+using namespace std;
+
+const char *glogname = "./events";
+
+#define ASSERT(a,b)  if(a!=b) {cout << "ASSERT ERROR: line " << __LINE__ << endl; exit(1);}
+
+void build_event_record(event_record_t *rec,
+						uint16_t logid,
+                        const char *message,
+                        const char *severity,
+                        const char *association,
+                        const char *reportedby,
+                        const uint8_t *p,
+                        size_t n) {
+
+
+    rec->message     = (char*) message;
+    rec->severity    = (char*) severity;
+    rec->association = (char*) association;
+    rec->reportedby  = (char*) reportedby;
+    rec->p           = (uint8_t*) p;
+    rec->n           = n;
+
+    return;
+}
+
+int load_existing_events(void) {
+
+	event_log_list log_list;
+	uint16_t       logid=0;
+	event_record_t *rec;
+
+	cout << "Loading event log... ";
+
+	while (message_get_next_log(&logid, &log_list)) {
+		cout << " " << int(logid);
+		message_load_log(logid, &rec);
+
+		cout << rec->message << endl;
+
+		message_free_log(rec);
+	}
+	cout << endl;
+	
+	return 0;
+}
+
+
+int main(int argc, char *argv[]) {
+
+	int rc = 0;
+
+	uint8_t p[] = {0x3, 0x32, 0x34, 0x36};
+	event_record_t rec, *prec;
+	event_log_list log_list;
+	uint16_t logid=0;
+	int i;
+
+	build_event_record(&rec,0, "Testing Message1", "Info", "Association", "Test", p, 4);
+	ASSERT(message_create_new_log_event(&rec),1);
+	build_event_record(&rec,0, "Testing Message2", "Info", "/dev", "Test", p, 4);
+	ASSERT(message_create_new_log_event(&rec),2);
+	build_event_record(&rec,0, "Testing Message3", "Info", "Association", "Test", p, 4);
+	ASSERT(message_create_new_log_event(&rec),3);
+
+	ASSERT(message_load_log(13, &prec), 0);
+	ASSERT(message_load_log(1, &prec), 1); message_free_log(prec);
+
+	// Test the number of valid logs so far
+	i = 0;
+	while (message_get_next_log(&logid, &log_list)) {
+
+
+		cout << int(logid) << endl;
+		i++;
+	}
+	//ASSERT(i,3);
+
+	cout << "LOADLOG TEST" << endl;
+
+	load_existing_events();
+
+	message_delete_log(1);
+
+	return rc;
+}
\ No newline at end of file
-- 
2.6.4
