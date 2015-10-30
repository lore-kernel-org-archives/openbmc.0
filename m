Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3FC811A0CE5
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 23:42:35 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446208948744213.81248953187605;
 Fri, 30 Oct 2015 05:42:28 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v4 7/8] Improve debugging
Date: Fri, 30 Oct 2015 07:42:13 -0500
Message-Id: <1446208934-25969-8-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Fri, 30 Oct 2015 12:42:35 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

Add printing of the data portion of the buffer with a --debug option
---
 btbridged.c | 39 ++++++++++++++++++++++++++-------------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index d490c59..89a61b0 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -75,8 +75,7 @@ struct bt_queue {
 	struct bt_queue *next;
 };
 
-struct btbridged_context{
-	int debug;
+struct btbridged_context {
 	struct pollfd fds[TOTAL_FDS];
 	struct sd_bus *bus;
 	struct bt_queue *bt_q;
@@ -84,6 +83,7 @@ struct btbridged_context{
 
 static int running = 1;
 static int verbose;
+static int debug;
 
 static struct bt_queue *bt_q_get_head(struct btbridged_context *context)
 {
@@ -142,7 +142,7 @@ static struct bt_queue *bt_q_enqueue(struct btbridged_context *context, uint8_t
 	if (!n)
 		return NULL;
 
-	if (context->debug) {
+	if (debug) {
 		n->req.data = malloc(len - 4);
 		if (n->req.data)
 			n->req.data = memcpy(n->req.data, bt_data + 4, len - 4);
@@ -528,15 +528,19 @@ static int dispatch_bt(struct btbridged_context *context)
 		MSG_OUT("Sending dbus signal with seq 0x%02x, netfn 0x%02x, lun 0x%02x, cmd 0x%02x\n",
 				new->req.seq, new->req.netfn, new->req.lun, new->req.cmd);
 
-		if (context->debug) {
+		if (debug) {
 			int i;
-
+			/* If debug is on, so will verbose */
 			for (i = 0; i < new->req.data_len; i++) {
-				if (i && i % 8 == 0)
-					MSG_OUT("\n");
-				MSG_OUT("0x%02x ", data[i + 4]);
+				if (i % 8 == 0) {
+					if (i)
+						printf("\n");
+					MSG_OUT("\t");
+				}
+				printf("0x%02x ", data[i + 4]);
 			}
-			MSG_OUT("\n");
+			if (new->req.data_len)
+				printf("\n");
 		}
 
 		/* Note we only actually keep the request data in the queue when debugging */
@@ -597,17 +601,16 @@ int main(int argc, char *argv[]) {
 	uint8_t buf[BT_MAX_MESSAGE];
 
 	static struct option long_options[] = {
-		{"verbose", no_argument, &verbose, 1},
-		{0,         0,           0,        0}
+		{ "verbose", no_argument, &verbose, 1 },
+		{ "debug",   no_argument, &debug,   1 },
+		{ 0,         0,           0,        0 }
 	};
 
-	context.debug = 0;
 	context.bt_q = NULL;
 
 	while ((opt = getopt_long(argc, argv, "", long_options, NULL)) != -1) {
 		switch (opt) {
 			case 0:
-				MSG_OUT("Found verbosity flag\n");
 				break;
 			default:
 				usage(name);
@@ -615,6 +618,16 @@ int main(int argc, char *argv[]) {
 		}
 	}
 
+	if (verbose)
+		MSG_OUT("Found verbosity flag\n");
+
+	if (debug) {
+		if (!verbose)
+			MSG_OUT("Turning on verbosity because debug flag found\n");
+		else
+			MSG_OUT("Found debug flag\n");
+	}
+
 	MSG_OUT("Starting\n");
 	r = sd_bus_default_system(&context.bus);
 	if (r < 0) {
-- 
2.6.0
