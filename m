Return-Path: <patches@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender-p126.zohomail.com
 [74.201.154.126])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A20DA1A0E4F
 for <openbmc@lists.ozlabs.org>; Thu, 29 Oct 2015 13:37:14 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1446086230550355.65705008771045;
 Wed, 28 Oct 2015 19:37:10 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-host-ipmid v2 3/4] ipmid: Use updated dbus HostIpmi
 interface
Date: Wed, 28 Oct 2015 21:37:04 -0500
Message-Id: <1446086225-30746-4-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446086225-30746-1-git-send-email-patches@stwcx.xyz>
References: <1446086225-30746-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 29 Oct 2015 02:37:15 -0000

From: Jeremy Kerr <jk@ozlabs.org>

With the updated HostIpmi dbus interface, netfns are not packed with
LUNs, and the CC is separate from the data.  This means we no longer
have to define NETFN_* as arbitrarily shifted, and we have the added
bonus of replying to messages where lun != 0.

We may want to separate the CC returned from the handlers in future too.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
---
 ipmid-api.h | 20 ++++++++++----------
 ipmid.C     | 13 +++++++------
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/ipmid-api.h b/ipmid-api.h
index aa54dd7..a78846c 100644
--- a/ipmid-api.h
+++ b/ipmid-api.h
@@ -62,16 +62,16 @@ extern "C" void ipmi_register_callback(ipmi_netfn_t, ipmi_cmd_t,
 // Note: these are also shifted left to make room for the LUN.
 enum ipmi_net_fns
 {
-    NETFUN_CHASSIS  =   (0x00 << 2),
-    NETFUN_BRIDGE   =   (0x02 << 2),
-    NETFUN_SENSOR   =   (0x04 << 2),
-    NETFUN_APP      =   (0x06 << 2),
-    NETFUN_FIRMWARE =   (0x08 << 2),
-    NETFUN_STORAGE  =   (0x0a << 2),
-    NETFUN_TRANPORT =   (0x0c << 2),
-    NETFUN_GRPEXT   =   (0x2c << 2),
-    NETFUN_NONE     =   (0x30 << 2),
-    NETFUN_OEM      =   (0x32 << 2)
+    NETFUN_CHASSIS  =   0x00,
+    NETFUN_BRIDGE   =   0x02,
+    NETFUN_SENSOR   =   0x04,
+    NETFUN_APP      =   0x06,
+    NETFUN_FIRMWARE =   0x08,
+    NETFUN_STORAGE  =   0x0a,
+    NETFUN_TRANPORT =   0x0c,
+    NETFUN_GRPEXT   =   0x2c,
+    NETFUN_NONE     =   0x30,
+    NETFUN_OEM      =   0x32
 };
 
 // IPMI commands for net functions. Since this is to be used both by the ipmi
diff --git a/ipmid.C b/ipmid.C
index 4ea4771..fbaf78c 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -174,7 +174,7 @@ ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t
 
 
 
-static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned char netfn, unsigned char cmd, unsigned char *buf, unsigned char len) {
+static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned char netfn, unsigned char lun, unsigned char cmd, unsigned char cc, unsigned char *buf, unsigned char len) {
 
     sd_bus_error error = SD_BUS_ERROR_NULL;
     sd_bus_message *reply = NULL, *m=NULL;
@@ -192,11 +192,11 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
 
 
     // Responses in IPMI require a bit set.  So there ya go...
-    netfn |= 0x04;
+    netfn |= 0x01;
 
 
     // Add the bytes needed for the methods to be called
-    r = sd_bus_message_append(m, "yyy", seq, netfn, cmd);
+    r = sd_bus_message_append(m, "yyyyy", seq, netfn, lun, cmd, cc);
     if (r < 0) {
         fprintf(stderr, "Failed add the netfn and others : %s\n", strerror(-r));
         return -1;
@@ -234,7 +234,7 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
                          *ret_error) {
     int r = 0;
     const char *msg = NULL;
-    char sequence, netfn, cmd;
+    unsigned char sequence, netfn, lun, cmd;
     const void *request;
     size_t sz;
     size_t resplen =MAX_IPMI_BUFFER;
@@ -242,7 +242,7 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
 
     memset(response, 0, MAX_IPMI_BUFFER);
 
-    r = sd_bus_message_read(m, "yyy",  &sequence, &netfn, &cmd);
+    r = sd_bus_message_read(m, "yyyy",  &sequence, &netfn, &lun, &cmd);
     if (r < 0) {
         fprintf(stderr, "Failed to parse signal message: %s\n", strerror(-r));
         return -1;
@@ -273,7 +273,8 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
     hexdump(ipmiio,  (void*)response, resplen);
 
     // Send the response buffer from the ipmi command
-    r = send_ipmi_message(m, sequence, netfn, cmd, response, resplen);
+    r = send_ipmi_message(m, sequence, netfn, lun, cmd, response[0],
+		    ((unsigned char *)response) + 1, resplen - 1);
     if (r < 0) {
         fprintf(stderr, "Failed to send the response message\n");
         return -1;
-- 
2.6.0
