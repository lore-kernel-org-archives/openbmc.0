Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 271E01A0CE6
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:42:28 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208943250999.5146204026489;
 Fri, 30 Oct 2015 05:42:23 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v4 4/8] Respect the /org/openbmc/HostIpmi interface
Date: Fri, 30 Oct 2015 07:42:10 -0500
Message-Id: <1446208934-25969-5-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:42:29 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

https://github.com/openbmc/docs/blob/master/dbus-interfaces.md

Put the seq first.
---
 btbridged.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index 25bd9ac..93fadf3 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -271,7 +271,7 @@ static int method_send_message(sd_bus_message *msg, void *userdata, sd_bus_error
 		r = 0;
 		goto out;
 	}
-	r = sd_bus_message_read(msg, "yyyyy", &netfn, &lun, &seq, &cmd, &cc);
+	r = sd_bus_message_read(msg, "yyyyy", &seq, &netfn, &lun, &cmd, &cc);
 	if (r < 0) {
 		MSG_ERR("Couldn't parse leading bytes of message: %s\n", strerror(-r));
 		sd_bus_error_set_const(ret_error, "org.openbmc.error", "Bad message");
@@ -510,7 +510,7 @@ static int dispatch_bt(struct btbridged_context *context)
 				new->req.netfn, new->req.lun, new->req.seq, new->req.cmd);
 		/* Note we only actually keep the request data in the queue when debugging */
 		r = sd_bus_emit_signal(context->bus, OBJ_NAME, DBUS_NAME, "ReceivedMessage", "yyyyay",
-				               new->req.netfn, new->req.lun, new->req.seq, new->req.cmd,
+				               new->req.seq, new->req.netfn, new->req.lun, new->req.cmd,
 				               new->req.data_len, data+4);
 		if (r < 0) {
 			MSG_ERR("Couldn't emit dbus signal: %s\n", strerror(-r));
@@ -532,12 +532,12 @@ out1:
 		}
 		r = bt_host_write(context, bt_msg);
 		if (r < 0)
-			MSG_ERR("Problem putting request with netfn 0x%02x, lun 0x%02x, seq 0x%02x, cmd 0x%02x, cc 0x%02x\n"
-					"out to %s", BT_HOST_PATH, bt_msg->rsp.netfn, bt_msg->rsp.lun, bt_msg->rsp.seq,
+			MSG_ERR("Problem putting request with seq 0x%02x, netfn 0x%02x, lun 0x%02x, cmd 0x%02x, cc 0x%02x\n"
+					"out to %s", BT_HOST_PATH, bt_msg->rsp.seq, bt_msg->rsp.netfn, bt_msg->rsp.lun,
 					bt_msg->rsp.cmd, bt_msg->rsp.cc);
 		else
-			MSG_OUT("Completed request with netfn 0x%02x, lun 0x%02x, seq 0x%02x, cmd 0x%02x, cc 0x%02x\n",
-					bt_msg->rsp.netfn, bt_msg->rsp.lun, bt_msg->rsp.seq, bt_msg->rsp.cmd, bt_msg->rsp.cc);
+			MSG_OUT("Completed request with seq 0x%02x, netfn 0x%02x, lun 0x%02x, cmd 0x%02x, cc 0x%02x\n",
+					bt_msg->rsp.seq, bt_msg->rsp.netfn, bt_msg->rsp.lun, bt_msg->rsp.cmd, bt_msg->rsp.cc);
 	}
 out:
 	return err ? err : r;
-- 
2.6.0
