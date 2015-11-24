Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 68D6E1A004B
 for <openbmc@lists.ozlabs.org>; Wed, 25 Nov 2015 03:20:38 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448382033975119.74594700515411;
 Tue, 24 Nov 2015 08:20:33 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v4 3/4] Move to size_t for logid
Date: Tue, 24 Nov 2015 11:20:29 -0500
Message-Id: <1448382030-17201-4-git-send-email-openbmc-patches@stwcx.xyz>
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

Fixes openbmc/phosphor-event#2
---
 event_messaged.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/event_messaged.c b/event_messaged.c
index dbfa1da..5a0c3da 100644
--- a/event_messaged.c
+++ b/event_messaged.c
@@ -10,6 +10,14 @@ sd_bus *bus = NULL;
 List *glist;
 
 
+int create_new_log_event(void *userdata,
+                         const char *message,
+                         const char *severity,
+                         const char *association,
+                         const char *reportedby,
+                         uint8_t *p,
+                         size_t n);
+
 typedef struct messageEntry_t {
 	char    *message;
 	char    *severity;
@@ -17,7 +25,7 @@ typedef struct messageEntry_t {
 	char    *association;
 	uint8_t *debugbytes;
 	size_t   debuglength;
-	uint16_t logid;
+	size_t   logid;
 
 	sd_bus_slot *messageslot;
 	sd_bus_slot *deleteslot;
@@ -64,7 +72,7 @@ void message_add(messageEntry_t **n,
                 const char *severity,
                 const char *association,
                 const char *reportedby,
-                uint16_t     logid,
+                size_t      logid,
                 uint8_t    *data,
                 size_t      datalen)
 {
@@ -138,7 +146,7 @@ static int method_accept_host_message(sd_bus_message *m,
 		return r;
 	}
 
-	r = create_new_log_event(userdata, message, severity, association, "Host", p, n);
+	create_new_log_event(userdata, message, severity, association, "Host", p, n);
 
 	return sd_bus_reply_method_return(m, "q", g_logid);
 }
@@ -208,7 +216,7 @@ static const sd_bus_vtable recordlog_delete_vtable[] = {
 	SD_BUS_VTABLE_END
 };
 
-int get_new_log_number() {
+uint16_t get_new_log_number() {
 	return ++g_logid;
 }
 
@@ -223,7 +231,7 @@ int create_new_log_event(void *userdata,
 	int r;
 	messageEntry_t *m;
 	Node *node;
-	int logid = get_new_log_number();
+	uint16_t logid = get_new_log_number();
 
 
 	snprintf(loglocation, sizeof(loglocation), "/org/openbmc/records/events/%d", logid);
-- 
2.6.3
