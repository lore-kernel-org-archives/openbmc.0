Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D7FBC1A0FE3
 for <openbmc@lists.ozlabs.org>; Wed,  9 Dec 2015 10:00:15 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1449615610182295.05785948908874;
 Tue, 8 Dec 2015 15:00:10 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Cyril Bur <cyril.bur@au1.ibm.com>
Subject: [PATCH btbridge] Add timestamps to output messages
Date: Tue,  8 Dec 2015 17:00:08 -0600
Message-Id: <1449615608-22161-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1449615608-22161-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1449615608-22161-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Tue, 08 Dec 2015 23:00:16 -0000

From: Cyril Bur <cyril.bur@au1.ibm.com>

---
 btbridged.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index 115ae63..2fd1e4f 100644
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
+#define MSG_OUT(f_, ...) do { if (verbose) { log(stdout, f_, ##__VA_ARGS__); } } while(0)
+#define MSG_ERR(f_, ...) do { if (verbose) { log(stderr, f_, ##__VA_ARGS__); } } while(0)
 
 struct ipmi_msg {
 	uint8_t netfn;
@@ -86,6 +81,22 @@ static int running = 1;
 static int verbose;
 static int debug;
 
+__attribute__((format(printf, 2, 3)))
+static void log(FILE *s, const char *fmt, ...)
+{
+	va_list args;
+	struct timespec time;
+
+	clock_gettime(CLOCK_REALTIME, &time);
+
+	fprintf(s, "[%s %ld.%ld] ", PREFIX, time.tv_sec, time.tv_nsec);
+
+	va_start(args, fmt);
+	vfprintf(s, fmt, args);
+	va_end(args);
+
+}
+
 static struct bt_queue *bt_q_get_head(struct btbridged_context *context)
 {
 	return context ? context->bt_q : NULL;
-- 
2.6.3
