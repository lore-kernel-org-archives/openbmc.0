Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 656DA1A0216
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2015 17:30:29 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1447223424279171.11965728869257;
 Tue, 10 Nov 2015 22:30:24 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid] Hostboot not clearing out its cached logs
Date: Wed, 11 Nov 2015 01:30:22 -0500
Message-Id: <1447223422-20179-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447223422-20179-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1447223422-20179-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 11 Nov 2015 06:30:29 -0000

From: Chris Austen <austenc@us.ibm.com>

renaming sent to dbus logs for debug
---
 storageaddsel.C  | 15 ++++++++++++---
 storagehandler.C |  2 +-
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/storageaddsel.C b/storageaddsel.C
index c36e1d3..94e037c 100644
--- a/storageaddsel.C
+++ b/storageaddsel.C
@@ -199,7 +199,9 @@ int send_esel_to_dbus(const char *desc, const char *sev, const char *details, ui
 
     r = sd_bus_message_read(reply, "q", &pty);
     if (r < 0) {
-       fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
+        fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
+    } else {
+        r = *pty;
     }
 
 finish:
@@ -217,8 +219,9 @@ void send_esel(uint16_t recordid) {
 	char *desc, *assoc, *ascii;
 	const char *sev;
 	uint8_t *buffer = NULL;
-	char *path;
+	char *path, *pathsent;
 	size_t sz;
+	int r;
 
 	uint8_t hack[] = {0x30, 0x32, 0x34};
 
@@ -242,14 +245,20 @@ void send_esel(uint16_t recordid) {
 
 	// TODO until ISSUE https://github.com/openbmc/rest-dbus/issues/2
 	// I cant send extended ascii chars.  So 0,2,4 for now...
-	send_esel_to_dbus(desc, sev, assoc, hack, 3);
+	r = send_esel_to_dbus(desc, sev, assoc, hack, 3);
+
+	asprintf(&pathsent,"%s_%d", path, r);
 
 
+	rename(path, pathsent);
+
 	free(path);
+	free(pathsent);
 	free(assoc);
 	free(desc);
 
 	delete[] buffer;
 
+
 	return;
 }
diff --git a/storagehandler.C b/storagehandler.C
index eee9540..1459f94 100644
--- a/storagehandler.C
+++ b/storagehandler.C
@@ -123,7 +123,7 @@ ipmi_ret_t ipmi_storage_add_sel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
     *data_len = sizeof(g_sel_reserve);
 
     // Pack the actual response
-    memcpy(response, &recordid, 2);
+    memcpy(response, &p->eventdata[1], 2);
 
     // TODO This code should grab the completed partial esel located in
     // the /tmp/esel0100 file and commit it to the error log handler.
-- 
2.6.3
