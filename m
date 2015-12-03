Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6FE4D1A078B
 for <openbmc@lists.ozlabs.org>; Thu,  3 Dec 2015 13:50:32 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449111026116462.60507567715604;
 Wed, 2 Dec 2015 18:50:26 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2] Fix alignment error message
Date: Wed,  2 Dec 2015 21:50:24 -0500
Message-Id: <1449111024-20502-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449111024-20502-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449111024-20502-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 03 Dec 2015 02:50:33 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 ipmid.C         | 11 ++++++-----
 storageaddsel.C | 30 ++++++------------------------
 2 files changed, 12 insertions(+), 29 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index f1f938c..76e612d 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -199,13 +199,13 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
     r = sd_bus_message_append(m, "yyyyy", seq, netfn, lun, cmd, cc);
     if (r < 0) {
         fprintf(stderr, "Failed add the netfn and others : %s\n", strerror(-r));
-        return -1;
+        goto final;
     }
 
     r = sd_bus_message_append_array(m, 'y', buf, len);
     if (r < 0) {
         fprintf(stderr, "Failed to add the string of response bytes: %s\n", strerror(-r));
-        return -1;
+        goto final;
     }
 
 
@@ -213,18 +213,19 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
     // Call the IPMI responder on the bus so the message can be sent to the CEC
     r = sd_bus_call(bus, m, 0, &error, &reply);
     if (r < 0) {
-        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
-        return -1;
+        fprintf(stderr, "Failed to call the method: %s\n", strerror(-r));
+        goto final;
     }
 
     r = sd_bus_message_read(reply, "x", &pty);
     if (r < 0) {
        fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
-
     }
 
+final:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
+    sd_bus_message_unref(reply);
 
 
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
diff --git a/storageaddsel.C b/storageaddsel.C
index 345dfd5..991c78d 100644
--- a/storageaddsel.C
+++ b/storageaddsel.C
@@ -155,7 +155,7 @@ int send_esel_to_dbus(const char *desc, const char *sev, const char *details, ui
 	sd_bus *mbus = NULL;
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *reply = NULL, *m=NULL;
-    uint16_t *pty;
+    uint16_t x;
     int r;
 
     mbus = ipmid_get_sd_bus_connection();
@@ -181,26 +181,22 @@ int send_esel_to_dbus(const char *desc, const char *sev, const char *details, ui
         fprintf(stderr, "Failed to add the raw array of bytes: %s\n", strerror(-r));
         return -1;
     }
-
     // Call the IPMI responder on the bus so the message can be sent to the CEC
     r = sd_bus_call(mbus, m, 0, &error, &reply);
     if (r < 0) {
-        fprintf(stderr, "Failed to call the method: %s", strerror(-r));
+        fprintf(stderr, "Failed to call the method: %s %s\n", __FUNCTION__, strerror(-r));
         return -1;
     }
-
-    r = sd_bus_message_read(reply, "q", &pty);
+    r = sd_bus_message_read(reply, "q", &x);
     if (r < 0) {
         fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
-    } else {
-        r = *pty;
     }
 
+finish:
     sd_bus_error_free(&error);
     sd_bus_message_unref(m);
     sd_bus_message_unref(reply);
-
-    return r;
+    return 0;
 }
 
 
@@ -213,41 +209,27 @@ void send_esel(uint16_t recordid) {
 	int r;
 
 	uint8_t hack[] = {0x30, 0x32, 0x34};
-
 	asprintf(&path,"%s%04x", "/tmp/esel", recordid);
-
 	sz = getfilestream(path, &buffer);
-
 	if (sz == 0) {
 		printf("Error file does not exist %d\n",__LINE__);
 		free(path);
 		return;
 	}
 
-
 	sev = create_esel_severity(buffer);
-
 	create_esel_association(buffer, &assoc);
-
 	create_esel_description(buffer, sev, &desc);
 
-
 	// TODO until ISSUE https://github.com/openbmc/rest-dbus/issues/2
 	// I cant send extended ascii chars.  So 0,2,4 for now...
-	r = send_esel_to_dbus(desc, sev, assoc, hack, 3);
-
-	asprintf(&pathsent,"%s_%d", path, r);
-
-
-	rename(path, pathsent);
+	send_esel_to_dbus(desc, sev, assoc, hack, 3);
 
 	free(path);
 	free(pathsent);
 	free(assoc);
 	free(desc);
-
 	delete[] buffer;
 
-
 	return;
 }
-- 
2.6.3
