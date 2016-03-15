Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPKd500BqzDqyS
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 14:20:40 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458012035292295.01501887011773;
 Mon, 14 Mar 2016 20:20:35 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH phosphor-host-ipmid 2/3] Remove unused dbus call
Date: Mon, 14 Mar 2016 22:20:31 -0500
Message-Id: <1458012032-16656-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458012032-16656-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458012032-16656-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 15 Mar 2016 03:20:41 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

It appears that the reply to org.openbmc.HostIpmi sendMessage dbus method is
unused. Remove it.
---
 ipmid.C | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/ipmid.C b/ipmid.C
index a42e2c1..a12ff10 100644
--- a/ipmid.C
+++ b/ipmid.C
@@ -176,9 +176,9 @@ ipmi_ret_t ipmi_netfn_router(ipmi_netfn_t netfn, ipmi_cmd_t cmd, ipmi_request_t
 
 static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned char netfn, unsigned char lun, unsigned char cmd, unsigned char cc, unsigned char *buf, unsigned char len) {
 
-    sd_bus_message *reply = NULL, *m=NULL;
+    sd_bus_message *m=NULL;
     const char *dest, *path;
-    int r, pty;
+    int r;
 
     dest = sd_bus_message_get_sender(req);
     path = sd_bus_message_get_path(req);
@@ -210,21 +210,15 @@ static int send_ipmi_message(sd_bus_message *req, unsigned char seq, unsigned ch
 
 
     // Call the IPMI responder on the bus so the message can be sent to the CEC
-    r = sd_bus_call(bus, m, 0, NULL, &reply);
+    r = sd_bus_call(bus, m, 0, NULL, NULL);
     if (r < 0) {
         fprintf(stderr, "Failed to call the method: %s\n", strerror(-r));
         fprintf(stderr, "Dest: %s, Path: %s\n", dest, path);
         goto final;
     }
 
-    r = sd_bus_message_read(reply, "x", &pty);
-    if (r < 0) {
-       fprintf(stderr, "Failed to get a rc from the method: %s\n", strerror(-r));
-    }
-
 final:
     sd_bus_message_unref(m);
-    sd_bus_message_unref(reply);
 
     return r < 0 ? EXIT_FAILURE : EXIT_SUCCESS;
 }
-- 
2.7.1
