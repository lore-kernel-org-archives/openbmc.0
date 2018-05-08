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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40g2Qp0VwjzF1dn
 for <openbmc@lists.ozlabs.org>; Tue,  8 May 2018 11:46:41 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w481kINR024078;
 Mon, 7 May 2018 20:46:19 -0500
Message-ID: <05e89ea8549634e750d783360590f2802954437d.camel@kernel.crashing.org>
Subject: [PATCH linux dev-4.13 6/6] fsi/fsi-master-gpio: Reduce dpoll clocks
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>
Date: Tue, 08 May 2018 11:46:18 +1000
In-Reply-To: <20180508010640.14113-1-benh@kernel.crashing.org>
References: <20180508010640.14113-1-benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.1 (3.28.1-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 08 May 2018 01:46:42 -0000

FSI_GPIO_DPOLL_CLOCKS is the number of clocks before sending
a DPOLL command after receiving a BUSY status. It should be
at least tSendDelay (16 clocks).

According to comments in the code, it needs to also be at least
21 clocks due to HW issues.

It's currently 100 clocks which impacts performances negatively
in some cases. Reduces it in half to 50 clocks which seems to
still be solid.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-master-gpio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 029b0a5b6d89..bd2b2cbd5eb5 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -29,7 +29,8 @@
 #define	FSI_GPIO_CMD_TERM	0x3f
 #define FSI_GPIO_CMD_ABS_AR	0x4
 
-#define	FSI_GPIO_DPOLL_CLOCKS	100      /* < 21 will cause slave to hang */
+
+#define	FSI_GPIO_DPOLL_CLOCKS	50      /* < 21 will cause slave to hang */
 
 /* Bus errors */
 #define	FSI_GPIO_ERR_BUSY	1	/* Slave stuck in busy state */
@@ -43,7 +44,7 @@
 #define	FSI_GPIO_RESP_ACK	0
 #define	FSI_GPIO_RESP_ACKD	4
 
-#define	FSI_GPIO_MAX_BUSY	100
+#define	FSI_GPIO_MAX_BUSY	200
 #define	FSI_GPIO_MTOE_COUNT	1000
 #define	FSI_GPIO_DRAIN_BITS	20
 #define	FSI_GPIO_CRC_SIZE	4
