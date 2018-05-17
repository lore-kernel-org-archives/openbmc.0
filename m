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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40mc2l6lLczF1Q1
 for <openbmc@lists.ozlabs.org>; Thu, 17 May 2018 13:18:39 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4H3IGgf027890;
 Wed, 16 May 2018 22:18:22 -0500
Message-ID: <e509138d253224a324ecea3c05224fe977f51fd6.camel@kernel.crashing.org>
Subject: [PATCH linux dev-4.13 3/3] fsi/fsi-master-gpio: More error handling
 cleanup
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 17 May 2018 13:18:16 +1000
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
X-List-Received-Date: Thu, 17 May 2018 03:18:41 -0000

Remove calls to the empty and useless fsi_master_gpio_error()
function, and report CRC errors as "FSI_ERR_NO_SLAVE" when
reading an all 1's response.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-master-gpio.c | 26 +++++---------------------
 include/linux/fsi.h           |  1 +
 2 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index b22685850837..f5cd7a70f0d2 100644
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
 static int read_one_response(struct fsi_master_gpio *master,
 		uint8_t data_size, struct fsi_gpio_msg *msgp, uint8_t *tagp)
 {
@@ -390,7 +374,6 @@ static int read_one_response(struct fsi_master_gpio *master,
 	if (i == FSI_GPIO_MTOE_COUNT) {
 		dev_dbg(master->dev,
 			"Master time out waiting for response\n");
-		fsi_master_gpio_error(master, FSI_GPIO_MTOE);
 		spin_unlock_irqrestore(&master->bit_lock, flags);
 		return FSI_ERR_MTOE;
 	}
@@ -416,8 +399,11 @@ static int read_one_response(struct fsi_master_gpio *master,
 	crc = crc4(0, 1, 1);
 	crc = crc4(crc, msg.msg, msg.bits);
 	if (crc) {
-		dev_dbg(master->dev, "ERR response CRC\n");
-		fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
+		/* Check if it's all 1's, that probably means the host is off */
+		if (((~msg.msg) & ((1ull << msg.bits) - 1)) == 0)
+			return FSI_ERR_NO_SLAVE;
+		dev_dbg(master->dev, "ERR response CRC msg: 0x%016llx (%d bits)\n",
+			msg.msg, msg.bits);
 		return FSI_ERR_RESP_CRC;
 	}
 
@@ -524,12 +510,10 @@ static int poll_for_response(struct fsi_master_gpio *master,
 
 	case FSI_GPIO_RESP_ERRA:
 		dev_dbg(master->dev, "ERRA received: 0x%x\n", (int)response.msg);
-		fsi_master_gpio_error(master, response.msg);
 		rc = FSI_ERR_ERRA;
 		break;
 	case FSI_GPIO_RESP_ERRC:
 		dev_dbg(master->dev, "ERRC received: 0x%x\n", (int)response.msg);
-		fsi_master_gpio_error(master, response.msg);
 		rc = FSI_ERR_ERRC;
 		break;
 	}
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 1c6772049f42..6d5600f6403b 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -23,6 +23,7 @@
 #define FSI_ERR_RESP_CRC	-1002
 #define FSI_ERR_BUSY		-1003
 #define FSI_ERR_MTOE		-1004
+#define FSI_ERR_NO_SLAVE	-1005
 
 struct fsi_device {
 	struct device		dev;
