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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41FhzH3GRNzF1Kr;
 Wed, 27 Jun 2018 09:27:38 +1000 (AEST)
Received: from pasglop.au.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w5QNQ6qe022979;
 Tue, 26 Jun 2018 18:26:54 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Joel Stanley <joel@jms.id.au>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 linux-kernel@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH 07/14] fsi: master-gpio: Remove unused definitions
Date: Wed, 27 Jun 2018 09:25:58 +1000
Message-Id: <20180626232605.13420-8-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 26 Jun 2018 23:27:41 -0000

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-master-gpio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index a00a85aa6d56..2bc85514bb0c 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -25,9 +25,6 @@
 #define	FSI_INIT_CLOCKS		5000	/* Clock out any old data */
 #define	FSI_GPIO_DPOLL_CLOCKS	50      /* < 21 will cause slave to hang */
 #define	FSI_GPIO_EPOLL_CLOCKS	50      /* Number of clocks for E_POLL retry */
-#define	FSI_GPIO_STD_DELAY	10	/* Standard GPIO delay in nS */
-					/* todo: adjust down as low as */
-					/* possible or eliminate */
 #define FSI_CRC_ERR_RETRIES	10
 
 #define	FSI_GPIO_CMD_DPOLL      0x2
@@ -45,10 +42,7 @@
 
 #define	FSI_GPIO_MAX_BUSY	200
 #define	FSI_GPIO_MTOE_COUNT	1000
-#define	FSI_GPIO_DRAIN_BITS	20
 #define	FSI_GPIO_CRC_SIZE	4
-#define	FSI_GPIO_MSG_ID_SIZE		2
-#define	FSI_GPIO_MSG_RESPID_SIZE	2
 
 #define LAST_ADDR_INVALID		0x1
 
-- 
2.17.1
