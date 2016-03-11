Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9A75C1A004B
 for <openbmc@lists.ozlabs.org>; Sat, 12 Mar 2016 09:40:37 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1457736032864595.3589853646165;
 Fri, 11 Mar 2016 14:40:32 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-event v4 2/2] Fixed Multiple associations
 occasionally geting truncated
Date: Fri, 11 Mar 2016 16:40:30 -0600
Message-Id: <1457736030-6801-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1457736030-6801-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457736030-6801-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 11 Mar 2016 22:40:38 -0000

From: Chris Austen <austenc@us.ibm.com>

After additional testing it was found that the association list gets truncated
leaving you with only one item.  Upon code review it was realized that the
use of strtok manipulated a cached string and tokenized the string with NULLs.

Changed to use a temp buffer for strtok to manipulate and switched to
strtok_r since it is a best practice to ensure things are thread safe.
---
 event_messaged_sdbus.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/event_messaged_sdbus.c b/event_messaged_sdbus.c
index 907ac53..ff9fd5e 100644
--- a/event_messaged_sdbus.c
+++ b/event_messaged_sdbus.c
@@ -99,7 +99,7 @@ static int prop_message_assoc(sd_bus *bus,
 	messageEntry_t *m = (messageEntry_t*) userdata;
 	event_record_t *rec;
 	char *p;
-	char *token;
+	char *token, *saveptr;
 
 	rec = message_record_open(m->em, m->logid);
 	if (!rec) {
@@ -110,9 +110,13 @@ static int prop_message_assoc(sd_bus *bus,
 		return -1;
 	}
 
-	p = rec->association;
+	/* strtok manipulates a string.  That means if any caching was done   */
+	/* then the original string would get messed up.  To avoid that since */
+	/* I know there is caching done simple make a copy and mess with that */
+	asprintf(&p, "%s", rec->association);
+
+	token = strtok_r(p, " ", &saveptr);
 
-	token = strtok(p, " ");
 	if (token) {
 		r = sd_bus_message_open_container(reply, 'a', "(sss)");
 		if (r < 0) {
@@ -120,18 +124,19 @@ static int prop_message_assoc(sd_bus *bus,
 		}
 
 		while(token) {
-
 			r = sd_bus_message_append(reply, "(sss)", "fru", "event", token);
 			if (r < 0) {
 				fprintf(stderr,"Error adding properties for %s to reply %s\n", token, strerror(-r));
 			}
 
-			token = strtok(NULL, " ");
+			token = strtok_r(NULL, " ", &saveptr);
 		}
 
 		r = sd_bus_message_close_container(reply);
 	}
 
+	free(p);
+
 	return r;
 }
 
-- 
2.7.1
