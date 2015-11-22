Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 691B51A0076
 for <openbmc@lists.ozlabs.org>; Sun, 22 Nov 2015 17:10:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448172623878540.0881817582754;
 Sat, 21 Nov 2015 22:10:23 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] Add delete for error logs
Date: Sun, 22 Nov 2015 01:10:22 -0500
Message-Id: <1448172622-30414-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448172622-30414-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448172622-30414-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Sun, 22 Nov 2015 06:10:30 -0000

From: Chris Austen <austenc@us.ibm.com>

This supports both deleting individual logs
and all logs
---
 Makefile         |   1 +
 event_messaged.c | 175 +++++++++++++++++++++++++++++++------------------------
 list.c           |  75 ++++++++++++++++++++++++
 list.h           |  23 ++++++++
 4 files changed, 199 insertions(+), 75 deletions(-)
 create mode 100644 list.c
 create mode 100644 list.h

diff --git a/Makefile b/Makefile
index e977fef..4c2ba9b 100644
--- a/Makefile
+++ b/Makefile
@@ -4,6 +4,7 @@ OBJS_TEST = $(TEST).o
 EXE     = event_messaged
 
 OBJS    = $(EXE).o   \
+          list.o 	 \
 
 
 DEPPKGS = libsystemd
diff --git a/event_messaged.c b/event_messaged.c
index b5d3ff1..15412d2 100644
--- a/event_messaged.c
+++ b/event_messaged.c
@@ -3,9 +3,12 @@
 #include <errno.h>
 #include <stddef.h>
 #include <systemd/sd-bus.h>
+#include "list.h"
 
 uint16_t g_logid = 0;
 sd_bus *bus = NULL;
+List *glist;
+
 
 typedef struct messageEntry_t {
 	char    *message;
@@ -14,26 +17,17 @@ typedef struct messageEntry_t {
 	char    *association;
 	uint8_t *debugbytes;
 	size_t   debuglength;
+	uint16_t logid;
 
-	struct   messageEntry_t *next;
-	struct   messageEntry_t *prev;
+	sd_bus_slot *messageslot;
+	sd_bus_slot *deleteslot;
 
 } messageEntry_t;
 
 
-messageEntry_t *gp_mtoc      = NULL;
-messageEntry_t *gp_mtoc_last = NULL;
-
-
-// TODO Issue#1 Move to STD libraries
 void message_storage_delete(messageEntry_t *m) {
 
-	messageEntry_t *p;
-
-	p = m->prev;
-
-	if (p)
-		p->next = m->next;
+	printf("Attempting to delete /org/openbmc/records/events/%d\n", m->logid);
 
 	free(m->message);
 	free(m->severity);
@@ -41,12 +35,8 @@ void message_storage_delete(messageEntry_t *m) {
 	free(m->association);
 	free(m->debugbytes);
 
-	if (gp_mtoc_last == m) {
-		gp_mtoc_last = m->prev;
-	}
-
-	m->prev = NULL;
-	m->next = NULL;
+	sd_bus_slot_unref(m->messageslot);
+	sd_bus_slot_unref(m->deleteslot);
 
 	free(m);
 
@@ -54,41 +44,32 @@ void message_storage_delete(messageEntry_t *m) {
 }
 
 
-messageEntry_t *message_storage_new(void) {
 
-	messageEntry_t *n = (messageEntry_t*) malloc(sizeof(messageEntry_t));
-
-	if (gp_mtoc == NULL) {
-		gp_mtoc      = n;
-		n->prev      = NULL;
-	} else {
-		n->prev = gp_mtoc_last;
-	}
+void message_add(messageEntry_t **n, 
+                const char *message,
+                const char *severity,
+                const char *association,
+                const char *reportedby,
+                uint16_t     logid,
+                uint8_t    *data,
+                size_t      datalen)
+{
 
-	gp_mtoc_last = n; 
-	n->next      = NULL;
-	return n;
-} 
+	messageEntry_t *p = *n = malloc(sizeof(messageEntry_t));
 
+	asprintf(&(*n)->message,     "%s", message);
+	asprintf(&(*n)->severity,    "%s", severity);
+	asprintf(&(*n)->association, "%s", association);
+	asprintf(&(*n)->reportedby,  "%s", reportedby);
 
-int message_add(messageEntry_t *n, 
-                const char *message, 
-                const char *severity, 
-                const char *association,
-                const char *reportedby, 
-                uint8_t *data, 
-                size_t datalen) 
-{
-	asprintf(&n->message,     "%s", message);
-	asprintf(&n->severity,    "%s", severity);
-	asprintf(&n->association, "%s", association); 
-	asprintf(&n->reportedby,  "%s", reportedby); 
-	
-	n->debugbytes  = (uint8_t*) malloc (datalen);
-	n->debuglength = datalen;
-	memcpy(n->debugbytes, data, datalen);
+	(*n)->logid       = logid;
+	(*n)->debugbytes  = (uint8_t*) malloc (datalen);
+	(*n)->debuglength = datalen;
+	memcpy((*n)->debugbytes, data, datalen);
 
-	return 0;
+	(*n)->messageslot = NULL;
+	(*n)->deleteslot  = NULL;
+	return;
 }
 
 
@@ -105,9 +86,9 @@ static int get_message_dd(sd_bus *bus,
 	
 	r = sd_bus_message_append_array(reply, 'y', p->debugbytes, p->debuglength);
 	if (r < 0) {
-	  printf("Error building arry for property %s\n", strerror(-r));
+	  printf("Error building array for property %s\n", strerror(-r));
 	}
-	
+
 	return r;
 }
 
@@ -143,11 +124,11 @@ static int method_accept_host_message(sd_bus_message *m,
 		return r;
 	}
 
-	r = create_new_log_event(message, severity, association, "Host", p, n);
+	r = create_new_log_event(userdata, message, severity, association, "Host", p, n);
 
 	return sd_bus_reply_method_return(m, "q", g_logid);
 }
-	
+
 
 static int method_accept_test_message(sd_bus_message *m, 
                                       void *userdata, 
@@ -155,16 +136,35 @@ static int method_accept_test_message(sd_bus_message *m,
 
 	uint8_t p[] = {0x30, 0x32, 0x34, 0x36};
 
-	create_new_log_event("Testing Message", "Info", "Association", "Test", p, 4);
+	create_new_log_event(userdata, "Testing Message", "Info", "Association", "Test", p, 4);
 
 	return sd_bus_reply_method_return(m, "q", g_logid);
 }
 
 
-// TODO Issue#2 Add method to erase all logs
 static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
-	printf("Asked to clear all logs ...TBD... \n");
-	return 0;
+
+	Node *n;
+
+	// This deletes one log at a time and seeing how the
+	// list shrinks using the NULL works fine here
+	while (n = list_get_next_node(glist, NULL)) {
+		message_storage_delete(n->data);
+		list_delete_node(glist, n);
+	}
+
+	return sd_bus_reply_method_return(m, "q", 0);
+}
+
+
+static int method_deletelog(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
+
+	Node *n = (Node*)userdata;
+
+	message_storage_delete(n->data);
+	list_delete_node(glist, n);
+
+	return sd_bus_reply_method_return(m, "q", 0);
 }
 
 
@@ -172,8 +172,8 @@ static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_
 static const sd_bus_vtable recordlog_vtable[] = {
 	SD_BUS_VTABLE_START(0),
 	SD_BUS_METHOD("acceptHostMessage", "sssay", "q", method_accept_host_message, SD_BUS_VTABLE_UNPRIVILEGED),
-	SD_BUS_METHOD("acceptTestMessage", "i", "q", method_accept_test_message, SD_BUS_VTABLE_UNPRIVILEGED),
-	SD_BUS_METHOD("ClearAll", NULL, NULL, method_clearall, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_METHOD("acceptTestMessage", NULL, "q", method_accept_test_message, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_METHOD("Clear", NULL, NULL, method_clearall, SD_BUS_VTABLE_UNPRIVILEGED),
 	SD_BUS_VTABLE_END
 };
 
@@ -187,24 +187,39 @@ static const sd_bus_vtable log_vtable[] = {
 	SD_BUS_VTABLE_END
 };
 
-int create_new_log_event(const char *message,
+
+static const sd_bus_vtable recordlog_delete_vtable[] = {
+	SD_BUS_VTABLE_START(0),
+	SD_BUS_METHOD("Delete", NULL, "q", method_deletelog, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_VTABLE_END
+};
+
+int get_new_log_number() {
+	return ++g_logid;
+}
+
+int create_new_log_event(void *userdata,
+                         const char *message,
                          const char *severity,
                          const char *association,
                          const char *reportedby,
                          uint8_t *p, 
                          size_t n) {
-	char loglocation[128];
+	char loglocation[64];
 	int r;
 	messageEntry_t *m;
+	Node *node;
+	int logid = get_new_log_number();
+
+
+	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events/%d", logid);
+
+	message_add(&m, message, severity, association, reportedby, logid, p, n);
+
+	node = list_add_node(glist, m);
 
-	g_logid++;
-	
-	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events/%d", g_logid);
-	
-	m = message_storage_new();
-	
 	r = sd_bus_add_object_vtable(bus,
-	                             NULL,
+	                             &m->messageslot,
 	                             loglocation,
 	                             "org.openbmc.record",
 	                             log_vtable,
@@ -212,29 +227,37 @@ int create_new_log_event(const char *message,
 	if (r < 0) {
 		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocation, strerror(-r));
 		message_storage_delete(m);
+		list_delete_last_node(glist);
 		return 0;
 	}
 
-	message_add(m, message, severity, association, reportedby, p, n);
-	printf("Event created: %s\n", loglocation);
-	
-	return g_logid;
+	r = sd_bus_add_object_vtable(bus,
+	                             &m->deleteslot,
+	                             loglocation,
+	                             "org.openbmc.Object.Delete",
+	                             recordlog_delete_vtable,
+	                             node);
+
+	return logid;
 }
-	
+
 
 int start_event_recording(void) {
 
 	int r;
-	
+
+	sd_bus_slot *slot;
+
 	/* Connect to the user bus this time */
 	r = sd_bus_open_system(&bus);
 	if (r < 0) {
 		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
 		goto finish;
 	}
+
 	/* Install the object */
 	r = sd_bus_add_object_vtable(bus,
-	                             NULL,
+	                             &slot,
 	                             "/org/openbmc/records/events",  /* object path */
 	                             "org.openbmc.recordlog",   /* interface name */
 	                             recordlog_vtable,
@@ -267,6 +290,7 @@ int start_event_recording(void) {
 		}
 	}
 	finish:
+		sd_bus_slot_unref(slot);
 		sd_bus_unref(bus);
 
 	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
@@ -275,5 +299,6 @@ int start_event_recording(void) {
 
 int main(int argc, char *argv[]) {
 
+	glist = list_create();
 	return start_event_recording();
 }
\ No newline at end of file
diff --git a/list.c b/list.c
new file mode 100644
index 0000000..ccff50b
--- /dev/null
+++ b/list.c
@@ -0,0 +1,75 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include "list.h"
+
+List *list_create(void) {
+	return calloc(1, sizeof(List));
+}
+
+Node *list_add_node(List* l, void *data) {
+
+	Node *n = calloc(1, sizeof(Node));
+
+	if(l->last == NULL) {
+		l->first = n;
+		l->last  = n;
+	} else {
+		l->last->next = n;
+		n->prev = l->last;
+		l->last = n;
+	}
+
+	l->count++;
+	n->data = data;
+
+	return n;
+}
+
+int list_delete_node(List *l, Node *n) {
+	void *result = NULL;
+	Node *after, *before;
+
+	if(n == l->first && n == l->last) {
+		l->first = NULL;
+		l->last  = NULL;
+
+	} else if(n == l->first) {
+		l->first       = n->next;
+		l->first->prev = NULL;
+
+	} else if (n == l->last) {
+		l->last       = n->prev;
+		l->last->next = NULL;
+
+	} else {
+		after = n->next;
+		before = n->prev;
+		after->prev = before;
+		before->next = after;
+	}
+
+	l->count--;
+	
+	free(n);
+
+	return l->count;
+}
+
+
+int list_delete_last_node(List *l)  {
+
+	list_delete_node(l, l->last);
+}
+
+Node * list_get_next_node(List *l, Node *n) {
+
+	Node *t;
+
+	if (n==NULL) {
+		t = l->first;
+	} else {
+		t = n->next;
+	}
+
+	return t;
+}
\ No newline at end of file
diff --git a/list.h b/list.h
new file mode 100644
index 0000000..d635164
--- /dev/null
+++ b/list.h
@@ -0,0 +1,23 @@
+#include <stdio.h>
+#include <stdlib.h>
+
+
+typedef struct Node {
+	void *data;
+	struct Node *next;
+	struct Node *prev;
+} Node;
+
+typedef struct List {
+	int count;
+	Node *first;
+	Node *last;
+} List;
+
+
+List *list_create(void);
+Node *list_add_node(List* l, void *data);
+Node *list_get_next_node(List *l, Node *n);
+int   list_delete_node(List *l, Node *n);
+int   list_delete_last_node(List *l);
+
-- 
2.6.3
