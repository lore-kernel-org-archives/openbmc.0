Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DBD1A1044
 for <openbmc@lists.ozlabs.org>; Thu, 10 Dec 2015 15:40:16 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449722410201176.29244157003347;
 Wed, 9 Dec 2015 20:40:10 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v3 4/4] Replace --verbose with --v and --debug with
 --vv
Date: Wed,  9 Dec 2015 22:40:06 -0600
Message-Id: <1449722406-13608-5-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449722406-13608-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449722406-13608-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 10 Dec 2015 04:40:16 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 btbridged.c | 46 +++++++++++++++++++++-------------------------
 1 file changed, 21 insertions(+), 25 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index c2e0048..c42cbeb 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -49,8 +49,8 @@
 #define TIMER_FD 2
 #define TOTAL_FDS 3
 
-#define MSG_OUT(f_, ...) do { if (verbose) { bt_log(LOG_INFO, f_, ##__VA_ARGS__); } } while(0)
-#define MSG_ERR(f_, ...) do { if (verbose) { bt_log(LOG_ERR, f_, ##__VA_ARGS__); } } while(0)
+#define MSG_OUT(f_, ...) do { if (verbosity != BT_LOG_NONE) { bt_log(LOG_INFO, f_, ##__VA_ARGS__); } } while(0)
+#define MSG_ERR(f_, ...) do { if (verbosity != BT_LOG_NONE) { bt_log(LOG_ERR, f_, ##__VA_ARGS__); } } while(0)
 
 struct ipmi_msg {
 	uint8_t netfn;
@@ -79,8 +79,11 @@ struct btbridged_context {
 
 static void (*bt_vlog)(int p, const char *fmt, va_list args);
 static int running = 1;
-static int verbose;
-static int debug;
+static enum {
+   BT_LOG_NONE = 0,
+   BT_LOG_VERBOSE,
+   BT_LOG_DEBUG
+} verbosity;
 
 static void bt_log_console(int p, const char *fmt, va_list args)
 {
@@ -161,7 +164,7 @@ static struct bt_queue *bt_q_enqueue(struct btbridged_context *context, uint8_t
 	if (!n)
 		return NULL;
 
-	if (debug) {
+	if (verbosity == BT_LOG_DEBUG) {
 		n->req.data = malloc(len - 4);
 		if (n->req.data)
 			n->req.data = memcpy(n->req.data, bt_data + 4, len - 4);
@@ -550,9 +553,8 @@ static int dispatch_bt(struct btbridged_context *context)
 		MSG_OUT("Sending dbus signal with seq 0x%02x, netfn 0x%02x, lun 0x%02x, cmd 0x%02x\n",
 				new->req.seq, new->req.netfn, new->req.lun, new->req.cmd);
 
-		if (debug) {
+		if (verbosity == BT_LOG_DEBUG) {
 			int i;
-			/* If debug is on, so will verbose */
 			for (i = 0; i < new->req.data_len; i++) {
 				if (i % 8 == 0) {
 					if (i)
@@ -602,10 +604,10 @@ out:
 
 static void usage(const char *name)
 {
-	fprintf(stderr, "Usage %s [ --debug | --verbose | --syslog ]\n", name);
-	fprintf(stderr, "\t--debug\t Implies --verbose\n\t Dumps entire message contents to console\n");
-	fprintf(stderr, "\t--verbose\t Be verbose\n\n");
-	fprintf(stderr, "\t--syslog\t Log output to syslog (pointless without --verbose)\n");
+	fprintf(stderr, "Usage %s [ --v[v] | --syslog ]\n", name);
+	fprintf(stderr, "\t--v\t Be verbose\n");
+	fprintf(stderr, "\t--vv\t Be verbose and dump entire messages\n");
+	fprintf(stderr, "\t--syslog\t Log output to syslog (pointless without --verbose)\n\n");
 }
 
 static const sd_bus_vtable ipmid_vtable[] = {
@@ -622,10 +624,10 @@ int main(int argc, char *argv[]) {
 	int opt, polled, r;
 
 	static const struct option long_options[] = {
-		{ "debug",   no_argument, &debug,   1   },
-		{ "verbose", no_argument, &verbose, 1   },
-		{ "syslog",  no_argument, 0,        's' },
-		{ 0,         0,           0,        0   }
+		{ "v",       no_argument, (int *)&verbosity, BT_LOG_VERBOSE },
+		{ "vv",      no_argument, (int *)&verbosity, BT_LOG_DEBUG   },
+		{ "syslog",  no_argument, 0,          's'         },
+		{ 0,         0,           0,          0           }
 	};
 
 	context = calloc(1, sizeof(*context));
@@ -648,17 +650,11 @@ int main(int argc, char *argv[]) {
 		}
 	}
 
-	if (verbose)
-		MSG_OUT("Found verbosity flag\n");
+	if (verbosity == BT_LOG_VERBOSE)
+		MSG_OUT("Verbose logging\n");
 
-	if (debug) {
-		if (!verbose) {
-			verbose = 1;
-			MSG_OUT("Turning on verbosity because debug flag found\n");
-		} else {
-			MSG_OUT("Found debug flag\n");
-		}
-	}
+	if (verbosity == BT_LOG_DEBUG)
+		MSG_OUT("Debug logging\n");
 
 	MSG_OUT("Starting\n");
 	r = sd_bus_default_system(&context->bus);
-- 
2.6.3
