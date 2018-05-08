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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40g1Zq0HDWzF1mt
 for <openbmc@lists.ozlabs.org>; Tue,  8 May 2018 11:08:33 +1000 (AEST)
Received: from pasglop.au.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4816hrS022397;
 Mon, 7 May 2018 20:07:32 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH linux dev-4.13 5/6] fsi/fsi-master-gpio: Reduce turnaround
 clocks
Date: Tue,  8 May 2018 11:06:39 +1000
Message-Id: <20180508010640.14113-5-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180508010640.14113-1-benh@kernel.crashing.org>
References: <20180508010640.14113-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Tue, 08 May 2018 01:08:38 -0000

FSI_GPIO_PRIME_SLAVE_CLOCKS is the number of clocks if the
"idle" phase between the end of a response and the beginning
of the next one. It corresponds to tSendDelay in the FSI
specification.

The default value in the slave is 16 clocks. 100 is way overkill
and significantly reduces the driver performance.

This changes it to 20 (which gives the HW a bit of margin still
just in case).

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-master-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index c82bbd35276e..029b0a5b6d89 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -49,7 +49,7 @@
 #define	FSI_GPIO_CRC_SIZE	4
 #define	FSI_GPIO_MSG_ID_SIZE		2
 #define	FSI_GPIO_MSG_RESPID_SIZE	2
-#define	FSI_GPIO_PRIME_SLAVE_CLOCKS	100
+#define	FSI_GPIO_PRIME_SLAVE_CLOCKS	20
 
 struct fsi_master_gpio {
 	struct fsi_master	master;
-- 
2.17.0
