Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 013211A2A8B
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 01:00:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448287214356741.5531775896367;
 Mon, 23 Nov 2015 06:00:14 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge 5/9] method_send_sms_atn: Log the ioctl number
Date: Mon, 23 Nov 2015 09:00:04 -0500
Message-Id: <1448287208-17607-6-git-send-email-openbmc-patches@stwcx.xyz>
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

This may help with debugging issues with old kernel headers.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 btbridged.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index a8c84aa..9dbed09 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -237,13 +237,14 @@ static struct bt_queue *bt_q_dequeue(struct btbridged_context *context)
 	return r;
 }
 
-static int method_send_sms_atn(sd_bus_message *msg, void *userdata, sd_bus_error *ret_error)
+static int method_send_sms_atn(sd_bus_message *msg, void *userdata,
+			       sd_bus_error *ret_error)
 {
 	int r;
-	struct btbridged_context *bt_fd = (struct btbridged_context *)userdata;
-
-	MSG_OUT("Sending SMS_ATN ioctl() to %s\n", BT_HOST_PATH);
+	struct btbridged_context *bt_fd = userdata;
 
+	MSG_OUT("Sending SMS_ATN ioctl (%d) to %s\n",
+			BT_HOST_IOCTL_SMS_ATN, BT_HOST_PATH);
 
 	r = ioctl(bt_fd->fds[BT_FD].fd, BT_HOST_IOCTL_SMS_ATN);
 	if (r == -1) {
-- 
2.6.3
