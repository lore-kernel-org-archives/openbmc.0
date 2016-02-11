Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B351B1A004B
 for <openbmc@lists.ozlabs.org>; Fri, 12 Feb 2016 10:10:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1455232234093498.83586620484914;
 Thu, 11 Feb 2016 15:10:34 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event 1/2] Remove dependency on linked lists
Date: Thu, 11 Feb 2016 17:10:31 -0600
Message-Id: <1455232232-15412-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455232232-15412-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455232232-15412-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 11 Feb 2016 23:10:38 -0000

From: Chris Austen <austenc@us.ibm.com>

I was using a linked list to keep track of each dbus object.
It was because during a "Clear All Logs" I had to run through
all existing events and delete them.  That meant I had to
record the slotid's for each interface.  I have since
discovered the sd_bus_call_method_async sdbus call.  It will
call the individual delete methods per log.  So with that
along with the fact that all events are file based I simply
had to swap my linked list traverser with a directory listing
of all valid event logs.
---
 Makefile               |  2 +-
 event_messaged.C       |  7 +++++
 event_messaged_sdbus.c | 58 +++++++++++++++++++++-----------------
 list.c                 | 75 --------------------------------------------------
 list.h                 | 23 ----------------
 message.H              |  3 +-
 6 files changed, 42 insertions(+), 126 deletions(-)
 delete mode 100644 list.c
 delete mode 100644 list.h

diff --git a/Makefile b/Makefile
index 0a2248a..dc08af0 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 CHECK      = check
 
 EXE       = event_messaged
-EXE_OBJS  = $(EXE).o message.o event_messaged_sdbus.o list.o
+EXE_OBJS  = $(EXE).o message.o event_messaged_sdbus.o
 
 OBJS_CHECK = test.o message.o
 
diff --git a/event_messaged.C b/event_messaged.C
index 0a92f44..174d7d7 100644
--- a/event_messaged.C
+++ b/event_messaged.C
@@ -6,6 +6,13 @@ const char *path_to_messages = "/var/lib/obmc/events";
 
 using namespace std;
 
+void message_refresh_events(event_manager *em) {
+    em->next_log_refresh();
+    return;
+}
+uint16_t message_next_event(event_manager *em) {
+    return em->next_log();
+}
 
 uint16_t message_create_new_log_event(event_manager *em, event_record_t *rec) {
     return em->create(rec);
diff --git a/event_messaged_sdbus.c b/event_messaged_sdbus.c
index 1b78179..7ba45a3 100644
--- a/event_messaged_sdbus.c
+++ b/event_messaged_sdbus.c
@@ -4,7 +4,6 @@
 #include <stddef.h>
 #include <systemd/sd-bus.h>
 #include "message.H"
-#include "list.h"
 #include "event_messaged_sdbus.h"
 #include <syslog.h>
 
@@ -26,12 +25,9 @@
 
 sd_bus      *bus   = NULL;
 sd_bus_slot *slot  = NULL;
-List        *glist = NULL;
 
 event_record_t *gCachedRec = NULL;
 
-static int remove_log_from_dbus(Node *node);
-
 typedef struct messageEntry_t {
 
 	size_t         logid;
@@ -41,6 +37,7 @@ typedef struct messageEntry_t {
 
 } messageEntry_t;
 
+static int remove_log_from_dbus(messageEntry_t *node);
 
 static void message_entry_close(messageEntry_t *m) {
 	free(m);
@@ -242,17 +239,35 @@ static int method_accept_test_message(sd_bus_message *m,
 	return sd_bus_reply_method_return(m, "q", logid);
 }
 
+static int finish_delete_log(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
+	return 0;
+}
 
 static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
-	Node *n;
-	messageEntry_t *p;
-	
-	// This deletes one log at a time and seeing how the
-	// list shrinks using the NULL works fine here
-	while (n = list_get_next_node(glist, NULL)) {
-		p = (messageEntry_t *) n->data;
-		message_delete_log(p->em, p->logid);
-		remove_log_from_dbus(n);
+	event_manager *em = (event_manager *) userdata;
+	uint16_t logid;
+	char buffer[32];
+	int r;
+	sd_bus_message *reply;
+
+	message_refresh_events(em);
+
+	while (logid = message_next_event(em)) {
+		snprintf(buffer, sizeof(buffer), "/org/openbmc/records/events/%d", logid);
+
+		r = sd_bus_call_method_async(bus,
+									 NULL,
+									 "org.openbmc.records.events",
+									 buffer,
+									 "org.openbmc.Object.Delete",
+									 "delete",
+									 finish_delete_log,
+									 NULL,
+									 NULL);
+		if (r < 0) {
+			fprintf(stderr, "sd_bus_call_method_async Failed : %s\n", strerror(-r));
+			return -1;
+		}
 	}
 
 	return sd_bus_reply_method_return(m, "q", 0);
@@ -261,11 +276,10 @@ static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_
 
 static int method_deletelog(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
 
-	Node *n = (Node*)userdata;
-	messageEntry_t *p = (messageEntry_t *) n->data;
+	messageEntry_t *p = (messageEntry_t *) userdata;
 
 	message_delete_log(p->em, p->logid);
-	remove_log_from_dbus(n);
+	remove_log_from_dbus(p);
 	return sd_bus_reply_method_return(m, "q", 0);
 }
 
@@ -297,9 +311,8 @@ static const sd_bus_vtable recordlog_delete_vtable[] = {
 	SD_BUS_VTABLE_END
 };
 
-static int remove_log_from_dbus(Node *node) {
+static int remove_log_from_dbus(messageEntry_t *p) {
 
-	messageEntry_t *p = (messageEntry_t *) node->data;
 	int r;
 	char buffer[32];
 
@@ -316,7 +329,6 @@ static int remove_log_from_dbus(Node *node) {
 	sd_bus_slot_unref(p->deleteslot);
 
 	message_entry_close(p);
-	list_delete_node(glist, node);
 
 	return 0;
 }
@@ -326,15 +338,11 @@ int send_log_to_dbus(event_manager *em, const uint16_t logid) {
 	char loglocation[64];
 	int r;
 	messageEntry_t *m;
-	Node *node;
-
 
 	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events/%d", logid);
 
 	message_entry_new(&m, logid, em);
 
-	node = list_add_node(glist, m);
-
 	r = sd_bus_add_object_vtable(bus,
 	                             &m->messageslot,
 	                             loglocation,
@@ -344,7 +352,6 @@ int send_log_to_dbus(event_manager *em, const uint16_t logid) {
 	if (r < 0) {
 		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocation, strerror(-r));
 		message_entry_close(m);
-		list_delete_last_node(glist);
 		return 0;
 	}
 
@@ -353,7 +360,7 @@ int send_log_to_dbus(event_manager *em, const uint16_t logid) {
 	                             loglocation,
 	                             "org.openbmc.Object.Delete",
 	                             recordlog_delete_vtable,
-	                             node);
+	                             m);
 	
 	printf("Event Log added %s\n", loglocation);
 
@@ -398,7 +405,6 @@ int build_bus(event_manager *em) {
 
 	int r = 0;
 
-	glist = list_create();
 	/* Connect to the system bus */
 	r = sd_bus_open_system(&bus);
 	if (r < 0) {
diff --git a/list.c b/list.c
deleted file mode 100644
index ccff50b..0000000
--- a/list.c
+++ /dev/null
@@ -1,75 +0,0 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include "list.h"
-
-List *list_create(void) {
-	return calloc(1, sizeof(List));
-}
-
-Node *list_add_node(List* l, void *data) {
-
-	Node *n = calloc(1, sizeof(Node));
-
-	if(l->last == NULL) {
-		l->first = n;
-		l->last  = n;
-	} else {
-		l->last->next = n;
-		n->prev = l->last;
-		l->last = n;
-	}
-
-	l->count++;
-	n->data = data;
-
-	return n;
-}
-
-int list_delete_node(List *l, Node *n) {
-	void *result = NULL;
-	Node *after, *before;
-
-	if(n == l->first && n == l->last) {
-		l->first = NULL;
-		l->last  = NULL;
-
-	} else if(n == l->first) {
-		l->first       = n->next;
-		l->first->prev = NULL;
-
-	} else if (n == l->last) {
-		l->last       = n->prev;
-		l->last->next = NULL;
-
-	} else {
-		after = n->next;
-		before = n->prev;
-		after->prev = before;
-		before->next = after;
-	}
-
-	l->count--;
-	
-	free(n);
-
-	return l->count;
-}
-
-
-int list_delete_last_node(List *l)  {
-
-	list_delete_node(l, l->last);
-}
-
-Node * list_get_next_node(List *l, Node *n) {
-
-	Node *t;
-
-	if (n==NULL) {
-		t = l->first;
-	} else {
-		t = n->next;
-	}
-
-	return t;
-}
\ No newline at end of file
diff --git a/list.h b/list.h
deleted file mode 100644
index d635164..0000000
--- a/list.h
+++ /dev/null
@@ -1,23 +0,0 @@
-#include <stdio.h>
-#include <stdlib.h>
-
-
-typedef struct Node {
-	void *data;
-	struct Node *next;
-	struct Node *prev;
-} Node;
-
-typedef struct List {
-	int count;
-	Node *first;
-	Node *last;
-} List;
-
-
-List *list_create(void);
-Node *list_add_node(List* l, void *data);
-Node *list_get_next_node(List *l, Node *n);
-int   list_delete_node(List *l, Node *n);
-int   list_delete_last_node(List *l);
-
diff --git a/message.H b/message.H
index 96c7544..8025ecd 100644
--- a/message.H
+++ b/message.H
@@ -81,7 +81,8 @@ uint16_t message_create_new_log_event(event_manager *em, event_record_t *rec);
 int      message_load_log(event_manager *em, uint16_t logid, event_record_t **rec);
 void     message_free_log(event_manager *em, event_record_t *rec);
 int      message_delete_log(event_manager *em, uint16_t logid);
-
+void     message_refresh_events(event_manager *em);
+uint16_t message_next_event(event_manager *em);
 #ifdef __cplusplus
 }
 #endif
-- 
2.7.1
