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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ryHz5nSlzF1LY
 for <openbmc@lists.ozlabs.org>; Thu, 24 May 2018 15:15:11 +1000 (AEST)
Received: from pasglop.ozlabs.ibm.com (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4O5EU5l003638;
 Thu, 24 May 2018 00:14:37 -0500
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 04/10] fsi/fsi-master-gpio: More error handling
 cleanup
Date: Thu, 24 May 2018 15:14:23 +1000
Message-Id: <20180524051429.4638-4-benh@kernel.crashing.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180524051429.4638-1-benh@kernel.crashing.org>
References: <20180524051429.4638-1-benh@kernel.crashing.org>
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
X-List-Received-Date: Thu, 24 May 2018 05:15:12 -0000

Remove calls to the empty and useless fsi_master_gpio_error()
function, and report CRC errors as "FSI_ERR_NO_SLAVE" when
reading an all 1's response.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-master-gpio.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 351c12f2ac55..da556da62846 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -41,13 +41,6 @@
 #define	FSI_GPIO_RESP_BUSY	1	/* Slave busy */
 #define	FSI_GPIO_RESP_ERRA	2	/* Any (misc) Error */
 #define	FSI_GPIO_RESP_ERRC	3	/* Slave reports master CRC error */
-#define	FSI_GPIO_MTOE		4	/* Master time out error */
-#define	FSI_GPIO_CRC_INVAL	5	/* Master reports slave CRC error */
-
-/* Normal slave responses */
-#define	FSI_GPIO_RESP_BUSY	1
-#define	FSI_GPIO_RESP_ACK	0
-#define	FSI_GPIO_RESP_ACKD	4
 
 #define	FSI_GPIO_MAX_BUSY	200
 #define	FSI_GPIO_MTOE_COUNT	1000
@@ -359,15 +352,6 @@ static void build_term_command(struct fsi_gpio_msg *cmd, uint8_t slave_id)
 	msg_push_crc(cmd);
 }
 
-/*
- * Store information on master errors so handler can detect and clean
- * up the bus
- */
-static void fsi_master_gpio_error(struct fsi_master_gpio *master, int error)
-{
-
-}
-
 /*
  * Note: callers rely specifically on this returning -EAGAIN for
  * a CRC error detected in the response. Use other error code
@@ -396,7 +380,6 @@ static int read_one_response(struct fsi_master_gpio *master,
 	if (i == FSI_GPIO_MTOE_COUNT) {
 		dev_dbg(master->dev,
 			"Master time out waiting for response\n");
-		fsi_master_gpio_error(master, FSI_GPIO_MTOE);
 		spin_unlock_irqrestore(&master->bit_lock, flags);
 		return -ETIMEDOUT;
 	}
@@ -422,8 +405,11 @@ static int read_one_response(struct fsi_master_gpio *master,
 	crc = crc4(0, 1, 1);
 	crc = crc4(crc, msg.msg, msg.bits);
 	if (crc) {
-		dev_dbg(master->dev, "ERR response CRC\n");
-		fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
+		/* Check if it's all 1's, that probably means the host is off */
+		if (((~msg.msg) & ((1ull << msg.bits) - 1)) == 0)
+			return -ENODEV;
+		dev_dbg(master->dev, "ERR response CRC msg: 0x%016llx (%d bits)\n",
+			msg.msg, msg.bits);
 		return -EAGAIN;
 	}
 
@@ -538,12 +524,10 @@ static int poll_for_response(struct fsi_master_gpio *master,
 
 	case FSI_GPIO_RESP_ERRA:
 		dev_dbg(master->dev, "ERRA received: 0x%x\n", (int)response.msg);
-		fsi_master_gpio_error(master, response.msg);
 		rc = -EIO;
 		break;
 	case FSI_GPIO_RESP_ERRC:
 		dev_dbg(master->dev, "ERRC received: 0x%x\n", (int)response.msg);
-		fsi_master_gpio_error(master, response.msg);
 		trace_fsi_master_gpio_crc_cmd_error(master);
 		rc = -EAGAIN;
 		break;
-- 
2.17.0
