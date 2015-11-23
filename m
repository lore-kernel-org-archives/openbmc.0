Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B27271A2A86
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 01:00:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448287213695545.0205887705321;
 Mon, 23 Nov 2015 06:00:13 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge 4/9] Fix printf format warnings
Date: Mon, 23 Nov 2015 09:00:03 -0500
Message-Id: <1448287208-17607-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448287208-17607-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448287208-17607-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 14:00:17 -0000

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 btbridged.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index bee4974..a8c84aa 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -351,7 +351,7 @@ static int bt_host_write(struct btbridged_context *context, struct bt_queue *bt_
 	data[3] = bt_msg->rsp.cmd;
 	data[4] = bt_msg->rsp.cc;
 	if (bt_msg->rsp.data_len > sizeof(data) - 5) {
-		MSG_ERR("Response message size (%d) too big, truncating\n", bt_msg->rsp.data_len);
+		MSG_ERR("Response message size (%zu) too big, truncating\n", bt_msg->rsp.data_len);
 		bt_msg->rsp.data_len = sizeof(data) - 5;
 	}
 	/* netfn/len + seq + cmd + cc = 4 */
@@ -524,7 +524,7 @@ static int dispatch_bt(struct btbridged_context *context)
 
 		r = sd_bus_message_append_array(msg, 'y', data + 4, new->req.data_len);
 		if (r < 0) {
-			MSG_ERR("Couldn't append array to signal\n", strerror(-r));
+			MSG_ERR("Couldn't append array to signal: %s\n", strerror(-r));
 			goto out1_free;
 		}
 
@@ -564,15 +564,15 @@ out1:
 		bt_msg = bt_q_get_msg(context);
 		if (!bt_msg) {
 			/* Odd, this shouldn't really happen */
-			MSG_ERR("Got a POLLOUT on %s but no message is ready to be written\n");
+			MSG_ERR("Got a POLLOUT but no message is ready to be written\n");
 			r = 0;
 			goto out;
 		}
 		r = bt_host_write(context, bt_msg);
 		if (r < 0)
 			MSG_ERR("Problem putting request with seq 0x%02x, netfn 0x%02x, lun 0x%02x, cmd 0x%02x, cc 0x%02x\n"
-					"out to %s", BT_HOST_PATH, bt_msg->rsp.seq, bt_msg->rsp.netfn, bt_msg->rsp.lun,
-					bt_msg->rsp.cmd, bt_msg->rsp.cc);
+					"out to %s", bt_msg->rsp.seq, bt_msg->rsp.netfn, bt_msg->rsp.lun,
+					bt_msg->rsp.cmd, bt_msg->rsp.cc, BT_HOST_PATH);
 		else
 			MSG_OUT("Completed request with seq 0x%02x, netfn 0x%02x, lun 0x%02x, cmd 0x%02x, cc 0x%02x\n",
 					bt_msg->rsp.seq, bt_msg->rsp.netfn, bt_msg->rsp.lun, bt_msg->rsp.cmd, bt_msg->rsp.cc);
-- 
2.6.3
