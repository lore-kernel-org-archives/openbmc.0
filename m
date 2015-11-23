Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 824EC1A2A82
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2015 01:00:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448287213021105.47630483776413;
 Mon, 23 Nov 2015 06:00:13 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge 3/9] Remove unused variables
Date: Mon, 23 Nov 2015 09:00:02 -0500
Message-Id: <1448287208-17607-4-git-send-email-openbmc-patches@stwcx.xyz>
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
 btbridged.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index 550125c..bee4974 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -260,10 +260,9 @@ static int method_send_message(sd_bus_message *msg, void *userdata, sd_bus_error
 {
 	struct btbridged_context *context;
 	struct bt_queue *bt_msg;
-	uint8_t *data, *all_data;
-	size_t data_sz, all_data_sz;
+	uint8_t *data;
+	size_t data_sz;
 	uint8_t netfn, lun, seq, cmd, cc;
-	uint64_t cookie;
 	/*
 	 * Doesn't say it anywhere explicitly but it looks like returning 0 or
 	 * negative is BAD...
@@ -477,7 +476,6 @@ static int dispatch_bt(struct btbridged_context *context)
 
 	if (context->fds[BT_FD].revents & POLLIN) {
 		sd_bus_message *msg;
-		int data_len;
 		struct bt_queue *new;
 		uint8_t data[BT_MAX_MESSAGE] = { 0 };
 
@@ -599,11 +597,8 @@ static const sd_bus_vtable ipmid_vtable[] = {
 
 int main(int argc, char *argv[]) {
 	struct btbridged_context context;
-	struct bt_queue *bt_q;
-	const char *path;
 	const char *name = argv[0];
-	int opt, polled, r, daemonise;
-	uint8_t buf[BT_MAX_MESSAGE];
+	int opt, polled, r;
 
 	static struct option long_options[] = {
 		{ "verbose", no_argument, &verbose, 1 },
-- 
2.6.3
