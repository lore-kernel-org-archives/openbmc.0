Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 6CA6B1A10AC
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2015 17:10:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449641409541237.54858631444938;
 Tue, 8 Dec 2015 22:10:09 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge v2 3/3] Improve debugging output,
 timestamps and syslog
Date: Wed,  9 Dec 2015 00:10:06 -0600
Message-Id: <1449641406-15479-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449641406-15479-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449641406-15479-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Wed, 09 Dec 2015 06:10:16 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 btbridged.c | 52 ++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 12 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index 5eccc20..c2e0048 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -35,7 +35,7 @@
 
 #include <systemd/sd-bus.h>
 
-#define PREFIX "[BTBRIDGED] "
+#define PREFIX "BTBRIDGED"
 
 #define BT_HOST_PATH "/dev/bt-host"
 #define BT_HOST_TIMEOUT_SEC 1
@@ -49,13 +49,8 @@
 #define TIMER_FD 2
 #define TOTAL_FDS 3
 
-#define MSG_OUT(f_, ...) do { if (verbose) { printf(PREFIX); printf((f_), ##__VA_ARGS__); } } while(0)
-#define MSG_ERR(f_, ...) do {  \
-                         	if (verbose) { \
-                         		fprintf(stderr, PREFIX); \
-                         		fprintf(stderr, (f_), ##__VA_ARGS__); \
-                         	} \
-                         } while(0)
+#define MSG_OUT(f_, ...) do { if (verbose) { bt_log(LOG_INFO, f_, ##__VA_ARGS__); } } while(0)
+#define MSG_ERR(f_, ...) do { if (verbose) { bt_log(LOG_ERR, f_, ##__VA_ARGS__); } } while(0)
 
 struct ipmi_msg {
 	uint8_t netfn;
@@ -82,10 +77,33 @@ struct btbridged_context {
 	struct bt_queue *bt_q;
 };
 
+static void (*bt_vlog)(int p, const char *fmt, va_list args);
 static int running = 1;
 static int verbose;
 static int debug;
 
+static void bt_log_console(int p, const char *fmt, va_list args)
+{
+	struct timespec time;
+	FILE *s = (p < LOG_WARNING) ? stdout : stderr;
+
+	clock_gettime(CLOCK_REALTIME, &time);
+
+	fprintf(s, "[%s %ld.%.9ld] ", PREFIX, time.tv_sec, time.tv_nsec);
+
+	vfprintf(s, fmt, args);
+}
+
+__attribute__((format(printf, 2, 3)))
+static void bt_log(int p, const char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	bt_vlog(p, fmt, args);
+	va_end(args);
+}
+
 static struct bt_queue *bt_q_get_head(struct btbridged_context *context)
 {
 	return context ? context->bt_q : NULL;
@@ -584,9 +602,10 @@ out:
 
 static void usage(const char *name)
 {
-	fprintf(stderr, "Usage %s [ --debug | --verbose ]\n", name);
+	fprintf(stderr, "Usage %s [ --debug | --verbose | --syslog ]\n", name);
 	fprintf(stderr, "\t--debug\t Implies --verbose\n\t Dumps entire message contents to console\n");
 	fprintf(stderr, "\t--verbose\t Be verbose\n\n");
+	fprintf(stderr, "\t--syslog\t Log output to syslog (pointless without --verbose)\n");
 }
 
 static const sd_bus_vtable ipmid_vtable[] = {
@@ -603,17 +622,26 @@ int main(int argc, char *argv[]) {
 	int opt, polled, r;
 
 	static const struct option long_options[] = {
-		{ "verbose", no_argument, &verbose, 1 },
-		{ "debug",   no_argument, &debug,   1 },
-		{ 0,         0,           0,        0 }
+		{ "debug",   no_argument, &debug,   1   },
+		{ "verbose", no_argument, &verbose, 1   },
+		{ "syslog",  no_argument, 0,        's' },
+		{ 0,         0,           0,        0   }
 	};
 
 	context = calloc(1, sizeof(*context));
 
+	bt_vlog = &bt_log_console;
 	while ((opt = getopt_long(argc, argv, "", long_options, NULL)) != -1) {
 		switch (opt) {
 			case 0:
 				break;
+			case 's':
+				/* Avoid a double openlog() */
+				if (bt_vlog != &vsyslog) {
+					openlog(PREFIX, LOG_ODELAY, LOG_DAEMON);
+					bt_vlog = &vsyslog;
+				}
+				break;
 			default:
 				usage(name);
 				exit(EXIT_FAILURE);
-- 
2.6.3
