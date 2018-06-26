Return-Path: <benh@kernel.crashing.org>
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41Fhzf38l5zF1KG;
 Wed, 27 Jun 2018 09:27:57 +1000 (AEST)
Received: from pasglop.au.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5QNQ6qh022979;
 Tue, 26 Jun 2018 18:27:16 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 linux-kernel@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 10/14] fsi: Move various master definitions to a common header
Date: Wed, 27 Jun 2018 09:26:01 +1000
Message-Id: <20180626232605.13420-11-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180626232605.13420-1-benh@kernel.crashing.org>
References: <20180626232605.13420-1-benh@kernel.crashing.org>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jun 2018 23:27:59 -0000

This moves the definitions for various protocol details
(message & response codes, delays etc...) out of
fsi-master-gpio.c to fsi-master.h in order to share them
with other master implementations.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-master-gpio.c | 29 -----------------------------
 drivers/fsi/fsi-master.h      | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index bad7951a2677..edc257e40102 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -17,35 +17,6 @@
 #include "fsi-master.h"
 
 #define	FSI_GPIO_STD_DLY	1	/* Standard pin delay in nS */
-#define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
-#define	FSI_SEND_DELAY_CLOCKS	16	/* Number clocks for send delay */
-#define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
-#define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
-#define	FSI_POST_BREAK_CLOCKS	16000	/* Number clocks to set up cfam */
-#define	FSI_INIT_CLOCKS		5000	/* Clock out any old data */
-#define	FSI_MASTER_DPOLL_CLOCKS	50      /* < 21 will cause slave to hang */
-#define	FSI_MASTER_EPOLL_CLOCKS	50      /* Number of clocks for E_POLL retry */
-
-#define FSI_CRC_ERR_RETRIES	10
-
-#define	FSI_CMD_DPOLL		0x2
-#define	FSI_CMD_EPOLL		0x3
-#define	FSI_CMD_TERM		0x3f
-#define FSI_CMD_ABS_AR		0x4
-#define FSI_CMD_REL_AR		0x5
-#define FSI_CMD_SAME_AR		0x3	/* but only a 2-bit opcode... */
-
-/* Slave responses */
-#define	FSI_RESP_ACK		0	/* Success */
-#define	FSI_RESP_BUSY		1	/* Slave busy */
-#define	FSI_RESP_ERRA		2	/* Any (misc) Error */
-#define	FSI_RESP_ERRC		3	/* Slave reports master CRC error */
-
-#define	FSI_MASTER_MAX_BUSY	200
-
-#define	FSI_MASTER_MTOE_COUNT	1000
-#define	FSI_CRC_SIZE		4
-
 #define LAST_ADDR_INVALID		0x1
 
 struct fsi_master_gpio {
diff --git a/drivers/fsi/fsi-master.h b/drivers/fsi/fsi-master.h
index 7d619c68ab9b..f653f75da7be 100644
--- a/drivers/fsi/fsi-master.h
+++ b/drivers/fsi/fsi-master.h
@@ -19,6 +19,39 @@
 
 #include <linux/device.h>
 
+/* Various protocol delays */
+#define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
+#define	FSI_SEND_DELAY_CLOCKS	16	/* Number clocks for send delay */
+#define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
+#define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
+#define	FSI_POST_BREAK_CLOCKS	16000	/* Number clocks to set up cfam */
+#define	FSI_INIT_CLOCKS		5000	/* Clock out any old data */
+#define	FSI_MASTER_DPOLL_CLOCKS	50      /* < 21 will cause slave to hang */
+#define	FSI_MASTER_EPOLL_CLOCKS	50      /* Number of clocks for E_POLL retry */
+
+/* Various retry maximums */
+#define FSI_CRC_ERR_RETRIES	10
+#define	FSI_MASTER_MAX_BUSY	200
+#define	FSI_MASTER_MTOE_COUNT	1000
+
+/* Command encodings */
+#define	FSI_CMD_DPOLL		0x2
+#define	FSI_CMD_EPOLL		0x3
+#define	FSI_CMD_TERM		0x3f
+#define FSI_CMD_ABS_AR		0x4
+#define FSI_CMD_REL_AR		0x5
+#define FSI_CMD_SAME_AR		0x3	/* but only a 2-bit opcode... */
+
+/* Slave responses */
+#define	FSI_RESP_ACK		0	/* Success */
+#define	FSI_RESP_BUSY		1	/* Slave busy */
+#define	FSI_RESP_ERRA		2	/* Any (misc) Error */
+#define	FSI_RESP_ERRC		3	/* Slave reports master CRC error */
+
+/* Misc */
+#define	FSI_CRC_SIZE		4
+
+/* fsi-master definition and flags */
 #define FSI_MASTER_FLAG_SWCLOCK		0x1
 
 struct fsi_master {
-- 
2.17.1
