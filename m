Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1379A1A02AD
 for <openbmc@lists.ozlabs.org>; Mon, 23 Nov 2015 20:50:12 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1448272208679558.3916097152998;
 Mon, 23 Nov 2015 01:50:08 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH btbridge 1/7] Sort headers
Date: Mon, 23 Nov 2015 04:50:01 -0500
Message-Id: <1448272207-10877-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1448272207-10877-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1448272207-10877-1-git-send-email-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 23 Nov 2015 09:50:13 -0000

From: Joel Stanley <joel@jms.id.au>

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 btbridged.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/btbridged.c b/btbridged.c
index d1de79f..7a094a4 100644
--- a/btbridged.c
+++ b/btbridged.c
@@ -13,22 +13,22 @@
  *	limitations under the License.
  */
 
+#include <assert.h>
 #include <errno.h>
+#include <fcntl.h>
+#include <getopt.h>
+#include <limits.h>
+#include <poll.h>
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <fcntl.h>
-#include <unistd.h>
-#include <sys/stat.h>
+#include <syslog.h>
 #include <sys/mman.h>
+#include <sys/stat.h>
 #include <sys/timerfd.h>
-#include <syslog.h>
-#include <poll.h>
-#include <limits.h>
-#include <getopt.h>
 #include <time.h>
-#include <assert.h>
+#include <unistd.h>
 
 #include <linux/bt-host.h>
 
-- 
2.6.3
