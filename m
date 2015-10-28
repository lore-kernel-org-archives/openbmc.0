Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E3C991A026E
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 00:23:55 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446037366124215.72427727186664;
 Wed, 28 Oct 2015 06:02:46 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event] Handle event messages
Date: Wed, 28 Oct 2015 08:02:41 -0500
Message-Id: <1446037361-5786-2-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446037361-5786-1-git-send-email-patches@stwcx.xyz>
References: <1446037361-5786-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 13:23:57 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 Makefile         |  26 ++++++
 event_messaged.c | 279 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 event_messaged.h |   6 ++
 3 files changed, 311 insertions(+)
 create mode 100644 Makefile
 create mode 100644 event_messaged.c
 create mode 100644 event_messaged.h

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..e977fef
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,26 @@
+TEST      = listfunc
+OBJS_TEST = $(TEST).o
+
+EXE     = event_messaged
+
+OBJS    = $(EXE).o   \
+
+
+DEPPKGS = libsystemd
+CC      ?= $(CROSS_COMPILE)gcc
+INCLUDES += $(shell pkg-config --cflags $(DEPPKGS)) 
+LIBS += $(shell pkg-config --libs $(DEPPKGS))
+
+all: $(EXE)
+
+%.o : %.c 
+	$(CC) -c $< $(CFLAGS) $(INCLUDES) -o $@
+
+$(EXE): $(OBJS)
+	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@
+
+$(TEST): $(OBJS_TEST)
+	$(CC) $^ $(LDFLAGS) $(LIBS) -o $@
+
+clean:
+	rm -f $(OBJS) $(EXE) *.o *.d
diff --git a/event_messaged.c b/event_messaged.c
new file mode 100644
index 0000000..b5d3ff1
--- /dev/null
+++ b/event_messaged.c
@@ -0,0 +1,279 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <stddef.h>
+#include <systemd/sd-bus.h>
+
+uint16_t g_logid = 0;
+sd_bus *bus = NULL;
+
+typedef struct messageEntry_t {
+	char    *message;
+	char    *severity;
+	char    *reportedby;
+	char    *association;
+	uint8_t *debugbytes;
+	size_t   debuglength;
+
+	struct   messageEntry_t *next;
+	struct   messageEntry_t *prev;
+
+} messageEntry_t;
+
+
+messageEntry_t *gp_mtoc      = NULL;
+messageEntry_t *gp_mtoc_last = NULL;
+
+
+// TODO Issue#1 Move to STD libraries
+void message_storage_delete(messageEntry_t *m) {
+
+	messageEntry_t *p;
+
+	p = m->prev;
+
+	if (p)
+		p->next = m->next;
+
+	free(m->message);
+	free(m->severity);
+	free(m->reportedby);
+	free(m->association);
+	free(m->debugbytes);
+
+	if (gp_mtoc_last == m) {
+		gp_mtoc_last = m->prev;
+	}
+
+	m->prev = NULL;
+	m->next = NULL;
+
+	free(m);
+
+	return;
+}
+
+
+messageEntry_t *message_storage_new(void) {
+
+	messageEntry_t *n = (messageEntry_t*) malloc(sizeof(messageEntry_t));
+
+	if (gp_mtoc == NULL) {
+		gp_mtoc      = n;
+		n->prev      = NULL;
+	} else {
+		n->prev = gp_mtoc_last;
+	}
+
+	gp_mtoc_last = n; 
+	n->next      = NULL;
+	return n;
+} 
+
+
+int message_add(messageEntry_t *n, 
+                const char *message, 
+                const char *severity, 
+                const char *association,
+                const char *reportedby, 
+                uint8_t *data, 
+                size_t datalen) 
+{
+	asprintf(&n->message,     "%s", message);
+	asprintf(&n->severity,    "%s", severity);
+	asprintf(&n->association, "%s", association); 
+	asprintf(&n->reportedby,  "%s", reportedby); 
+	
+	n->debugbytes  = (uint8_t*) malloc (datalen);
+	n->debuglength = datalen;
+	memcpy(n->debugbytes, data, datalen);
+
+	return 0;
+}
+
+
+static int get_message_dd(sd_bus *bus,
+                          const char *path,
+                          const char *interface,
+                          const char *property,
+                          sd_bus_message *reply,
+                          void *userdata,
+                          sd_bus_error *error) {
+
+	int r;
+	messageEntry_t *p = (messageEntry_t *)userdata;
+	
+	r = sd_bus_message_append_array(reply, 'y', p->debugbytes, p->debuglength);
+	if (r < 0) {
+	  printf("Error building arry for property %s\n", strerror(-r));
+	}
+	
+	return r;
+}
+
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
+	r = create_new_log_event(message, severity, association, "Host", p, n);
+
+	return sd_bus_reply_method_return(m, "q", g_logid);
+}
+	
+
+static int method_accept_test_message(sd_bus_message *m, 
+                                      void *userdata, 
+                                      sd_bus_error *ret_error) {
+
+	uint8_t p[] = {0x30, 0x32, 0x34, 0x36};
+
+	create_new_log_event("Testing Message", "Info", "Association", "Test", p, 4);
+
+	return sd_bus_reply_method_return(m, "q", g_logid);
+}
+
+
+// TODO Issue#2 Add method to erase all logs
+static int method_clearall(sd_bus_message *m, void *userdata, sd_bus_error *ret_error) {
+	printf("Asked to clear all logs ...TBD... \n");
+	return 0;
+}
+
+
+
+static const sd_bus_vtable recordlog_vtable[] = {
+	SD_BUS_VTABLE_START(0),
+	SD_BUS_METHOD("acceptHostMessage", "sssay", "q", method_accept_host_message, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_METHOD("acceptTestMessage", "i", "q", method_accept_test_message, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_METHOD("ClearAll", NULL, NULL, method_clearall, SD_BUS_VTABLE_UNPRIVILEGED),
+	SD_BUS_VTABLE_END
+};
+
+static const sd_bus_vtable log_vtable[] = {
+	SD_BUS_VTABLE_START(0),
+	SD_BUS_PROPERTY("Association", "s", NULL, offsetof(messageEntry_t, association), SD_BUS_VTABLE_PROPERTY_CONST),
+	SD_BUS_PROPERTY("Message",  "s", NULL, offsetof(messageEntry_t, message), SD_BUS_VTABLE_PROPERTY_CONST),
+	SD_BUS_PROPERTY("Severity", "s", NULL, offsetof(messageEntry_t, severity), SD_BUS_VTABLE_PROPERTY_CONST),
+	SD_BUS_PROPERTY("Reported_By", "s", NULL, offsetof(messageEntry_t, reportedby),  SD_BUS_VTABLE_PROPERTY_CONST),
+	SD_BUS_PROPERTY("DevelopmentData", "ay", get_message_dd,0, SD_BUS_VTABLE_PROPERTY_CONST),
+	SD_BUS_VTABLE_END
+};
+
+int create_new_log_event(const char *message,
+                         const char *severity,
+                         const char *association,
+                         const char *reportedby,
+                         uint8_t *p, 
+                         size_t n) {
+	char loglocation[128];
+	int r;
+	messageEntry_t *m;
+
+	g_logid++;
+	
+	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events/%d", g_logid);
+	
+	m = message_storage_new();
+	
+	r = sd_bus_add_object_vtable(bus,
+	                             NULL,
+	                             loglocation,
+	                             "org.openbmc.record",
+	                             log_vtable,
+	                             m);
+	if (r < 0) {
+		fprintf(stderr, "Failed to acquire service name: %s %s\n", loglocation, strerror(-r));
+		message_storage_delete(m);
+		return 0;
+	}
+
+	message_add(m, message, severity, association, reportedby, p, n);
+	printf("Event created: %s\n", loglocation);
+	
+	return g_logid;
+}
+	
+
+int start_event_recording(void) {
+
+	int r;
+	
+	/* Connect to the user bus this time */
+	r = sd_bus_open_system(&bus);
+	if (r < 0) {
+		fprintf(stderr, "Failed to connect to system bus: %s\n", strerror(-r));
+		goto finish;
+	}
+	/* Install the object */
+	r = sd_bus_add_object_vtable(bus,
+	                             NULL,
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
+		goto finish;
+	}
+
+	for (;;) {
+		r = sd_bus_process(bus, NULL);
+		if (r < 0) {
+			fprintf(stderr, "Failed to process bus: %s\n", strerror(-r));
+			goto finish;
+		}
+		if (r > 0)
+			continue;
+
+		r = sd_bus_wait(bus, (uint64_t) -1);
+		if (r < 0) {
+			fprintf(stderr, "Failed to wait on bus: %s\n", strerror(-r));
+			goto finish;
+		}
+	}
+	finish:
+		sd_bus_unref(bus);
+
+	return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
+}
+
+
+int main(int argc, char *argv[]) {
+
+	return start_event_recording();
+}
\ No newline at end of file
diff --git a/event_messaged.h b/event_messaged.h
new file mode 100644
index 0000000..4cfb31d
--- /dev/null
+++ b/event_messaged.h
@@ -0,0 +1,6 @@
+#include <stdio.h>
+#include <stdlib.h>
+#include <errno.h>
+#include <systemd/sd-bus.h>
+
+extern static const sd_bus_vtable echo_vtable[];
-- 
2.6.0
