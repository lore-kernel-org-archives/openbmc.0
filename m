Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 74E9E1A0CEF
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:42:29 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208941474985.1334952874896;
 Fri, 30 Oct 2015 05:42:21 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v4 3/8] Follow dbus naming convention for dbus signal
Date: Fri, 30 Oct 2015 07:42:09 -0500
Message-Id: <1446208934-25969-4-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:42:30 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 btbridged.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index 932355a..25bd9ac 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -293,7 +293,7 @@ static int method_send_message(sd_bus_message *msg, void *userdata, sd_bus_error
 		r = -EINVAL;
 		goto out;
 	}
-	MSG_OUT("Recieved a dbus response for msg with seq 0x%02x\n", seq);
+	MSG_OUT("Received a dbus response for msg with seq 0x%02x\n", seq);
 	bt_msg->call = sd_bus_message_ref(msg);
 	bt_msg->rsp.netfn = netfn;
 	bt_msg->rsp.lun = lun;
@@ -509,7 +509,7 @@ static int dispatch_bt(struct btbridged_context *context)
 		MSG_OUT("Sending dbus signal with netfn 0x%02x, lun 0x%02x, seq 0x%02x, cmd 0x%02x\n",
 				new->req.netfn, new->req.lun, new->req.seq, new->req.cmd);
 		/* Note we only actually keep the request data in the queue when debugging */
-		r = sd_bus_emit_signal(context->bus, OBJ_NAME, DBUS_NAME, "receivedMessage", "yyyyay",
+		r = sd_bus_emit_signal(context->bus, OBJ_NAME, DBUS_NAME, "ReceivedMessage", "yyyyay",
 				               new->req.netfn, new->req.lun, new->req.seq, new->req.cmd,
 				               new->req.data_len, data+4);
 		if (r < 0) {
@@ -553,7 +553,7 @@ static const sd_bus_vtable ipmid_vtable[] = {
 	SD_BUS_VTABLE_START(0),
 	SD_BUS_METHOD("sendMessage", "yyyyyay", "x", &method_send_message, SD_BUS_VTABLE_UNPRIVILEGED),
 	SD_BUS_METHOD("setAttention", "", "x", &method_send_sms_atn, SD_BUS_VTABLE_UNPRIVILEGED),
-	SD_BUS_SIGNAL("receivedMessage", "yyyyay", 0),
+	SD_BUS_SIGNAL("ReceivedMessage", "yyyyay", 0),
 	SD_BUS_VTABLE_END
 };
 
-- 
2.6.0
