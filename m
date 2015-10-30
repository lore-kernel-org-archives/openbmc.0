Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C8E261A0CD8
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:42:31 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208945235920.3852383633113;
 Fri, 30 Oct 2015 05:42:25 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v4 5/8] Fix incorrect sending of data bytes by
 ReceivedMessage signal
Date: Fri, 30 Oct 2015 07:42:11 -0500
Message-Id: <1446208934-25969-6-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
In-Reply-To: <1446208934-25969-1-git-send-email-patches@stwcx.xyz>
References: <1446208934-25969-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:42:32 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 btbridged.c | 43 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 6 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index 93fadf3..c829c46 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -471,6 +471,7 @@ static int dispatch_bt(struct btbridged_context *context)
 	assert(context);
 
 	if (context->fds[BT_FD].revents & POLLIN) {
+		sd_bus_message *msg;
 		int data_len;
 		struct bt_queue *new;
 		uint8_t data[BT_MAX_MESSAGE] = { 0 };
@@ -506,17 +507,47 @@ static int dispatch_bt(struct btbridged_context *context)
 				MSG_ERR("Couldn't set timerfd\n");
 		}
 
-		MSG_OUT("Sending dbus signal with netfn 0x%02x, lun 0x%02x, seq 0x%02x, cmd 0x%02x\n",
-				new->req.netfn, new->req.lun, new->req.seq, new->req.cmd);
+		r = sd_bus_message_new_signal(context->bus, &msg, OBJ_NAME, DBUS_NAME, "ReceivedMessage");
+		if (r < 0) {
+			MSG_ERR("Failed to create signal: %s\n", strerror(-r));
+			goto out1;
+		}
+
+		r = sd_bus_message_append(msg, "yyyy", new->req.seq, new->req.netfn, new->req.lun, new->req.cmd);
+		if (r < 0) {
+			MSG_ERR("Couldn't append to signal: %s\n", strerror(-r));
+			goto out1_free;
+		}
+
+		r = sd_bus_message_append_array(msg, 'y', data + 4, new->req.data_len);
+		if (r < 0) {
+			MSG_ERR("Couldn't append array to signal\n", strerror(-r));
+			goto out1_free;
+		}
+
+		MSG_OUT("Sending dbus signal with seq 0x%02x, netfn 0x%02x, lun 0x%02x, cmd 0x%02x\n",
+				new->req.seq, new->req.netfn, new->req.lun, new->req.cmd);
+
+		if (context->debug) {
+			int i;
+
+			for (i = 0; i < new->req.data_len; i++) {
+				if (i && i % 8 == 0)
+					MSG_OUT("\n");
+				MSG_OUT("0x%02x ", data[i + 4]);
+			}
+			MSG_OUT("\n");
+		}
+
 		/* Note we only actually keep the request data in the queue when debugging */
-		r = sd_bus_emit_signal(context->bus, OBJ_NAME, DBUS_NAME, "ReceivedMessage", "yyyyay",
-				               new->req.seq, new->req.netfn, new->req.lun, new->req.cmd,
-				               new->req.data_len, data+4);
+		r = sd_bus_send(context->bus, msg, NULL);
 		if (r < 0) {
 			MSG_ERR("Couldn't emit dbus signal: %s\n", strerror(-r));
-			goto out1;
+			goto out1_free;
 		}
 		r = 0;
+out1_free:
+		sd_bus_message_unref(msg);
 out1:
 		err = r;
 	}
-- 
2.6.0
