Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D62C01A0316
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 21:10:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448273412215209.73591810843266;
 Mon, 23 Nov 2015 02:10:12 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge v2 6/8] bt_host_write: fix invalid check
Date: Mon, 23 Nov 2015 05:10:05 -0500
Message-Id: <1448273407-11474-7-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448273407-11474-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448273407-11474-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 10:10:16 -0000

From: Joel Stanley <joel@jms.id.au>

r is uninitalised, so this check is undefined. Change it to check len
instead.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 btbridged.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/btbridged.c b/btbridged.c
index 9dbed09..c57843d 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -361,7 +361,7 @@ static int bt_host_write(struct btbridged_context *context, struct bt_queue *bt_
 		memcpy(data + 5, bt_msg->rsp.data, bt_msg->rsp.data_len);
 	/* Count the data[0] byte */
 	len = write(context->fds[BT_FD].fd, data, data[0] + 1);
-	if (r == -1) {
+	if (len == -1) {
 		r = errno;
 		MSG_ERR("Error writing to %s: %s\n", BT_HOST_PATH, strerror(errno));
 		if (bt_msg->call) {
-- 
2.6.3
