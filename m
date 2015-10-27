Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 810431A0475
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 00:14:22 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445951622916897.606633559444;
 Tue, 27 Oct 2015 06:13:42 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid 2/4] ipmid: Remove assumptions about host
 IPMI sender objects
Date: Tue, 27 Oct 2015 08:13:36 -0500
Message-Id: <1445951618-17631-3-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1445951618-17631-1-git-send-email-patches@stwcx.xyz>
References: <1445951618-17631-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 27 Oct 2015 13:14:23 -0000

From: Jeremy Kerr <jk@ozlabs.org>

Currently, the IPMI daemon will only receive messages from a specific
(arbitrary) object path that the debug daemon used.

Instead, we should be listening to any signal that matches our interface
(org.openbmc.HostIpmi.ReceivedMessage). When replying to the message,
we should be using the signal sender info to properly address the
reply method.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 ipmid.C | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index 6514849..c466984 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -16,11 +16,9 @@
 
 sd_bus *bus = NULL;
 
-// Channel that is used for OpenBMC Barreleye
-const char * DBUS_NAME = "org.openbmc.HostIpmi";
-const char * OBJ_NAME = "/org/openbmc/HostIpmi/1";
+const char * DBUS_INTF = "org.openbmc.HostIpmi";
 
-const char * FILTER = "type='signal',sender='org.openbmc.HostIpmi',member='ReceivedMessage'";
+const char * FILTER = "type='signal',interface='org.openbmc.HostIpmi',member='ReceivedMessage'";
 
 
 typedef std::pair<ipmi_netfn_t, ipmi_cmd_t> ipmi_fn_cmd_t;
@@ -165,17 +163,17 @@ ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t
 
 
 
-static int send_ipmi_message(unsigned char seq, unsigned char netfn, unsigned char cmd, unsigned char *buf, unsigned char len) {
+static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned char netfn, unsigned char cmd, unsigned char *buf, unsigned char len) {
 
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *reply = NULL, *m=NULL;
-
-
-    const char *path;
+    const char *dest, *path;
     int r, pty;
 
+    dest = sd_bus_message_get_sender(req);
+    path = sd_bus_message_get_path(req);
 
-    r = sd_bus_message_new_method_call(bus,&m,DBUS_NAME,OBJ_NAME,DBUS_NAME,"sendMessage");
+    r = sd_bus_message_new_method_call(bus,&m,dest,path,DBUS_INTF,"sendMessage");
     if (r < 0) {
         fprintf(stderr, "Failed to add the method object: %s\n", strerror(-r));
         return -1;
@@ -275,7 +273,7 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
     hexdump((void*)response, resplen);
 
     // Send the response buffer from the ipmi command
-    r = send_ipmi_message(sequence, netfn, cmd, response, resplen);
+    r = send_ipmi_message(m, sequence, netfn, cmd, response, resplen);
     if (r < 0) {
         fprintf(stderr, "Failed to send the response message\n");
         return -1;
-- 
2.6.0
