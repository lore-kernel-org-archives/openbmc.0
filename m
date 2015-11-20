Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 863EB1A00BF
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2015 10:20:13 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 144806160869898.0413402983337;
 Fri, 20 Nov 2015 15:20:08 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge] crashing deamon on attn call
Date: Fri, 20 Nov 2015 18:20:07 -0500
Message-Id: <1448061607-9128-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448061607-9128-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448061607-9128-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 20 Nov 2015 23:20:14 -0000

From: Chris Austen <austenc@us.ibm.com>

---
 btbridged.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index 89a61b0..d1de79f 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -238,12 +238,16 @@ static struct bt_queue *bt_q_dequeue(struct btbridged_context *context)
 
 static int method_send_sms_atn(sd_bus_message *msg, void *userdata, sd_bus_error *ret_error)
 {
-	int r, bt_fd = *(int *)userdata;
+	int r;
+	struct btbridged_context *bt_fd = (struct btbridged_context *)userdata;
+
 	MSG_OUT("Sending SMS_ATN ioctl() to %s\n", BT_HOST_PATH);
-	r = ioctl(bt_fd, BT_HOST_IOCTL_SMS_ATN);
+
+
+	r = ioctl(bt_fd->fds[BT_FD].fd, BT_HOST_IOCTL_SMS_ATN);
 	if (r == -1) {
 		r = errno;
-		MSG_ERR("Couldn't ioctl() to %s: %s\n", BT_HOST_PATH, strerror(r));
+		MSG_ERR("Couldn't ioctl() to 0x%x, %s: %s\n", bt_fd->fds[BT_FD].fd, BT_HOST_PATH, strerror(r));
 		return sd_bus_reply_method_errno(msg, errno, ret_error);
 	}
 
-- 
2.6.3
