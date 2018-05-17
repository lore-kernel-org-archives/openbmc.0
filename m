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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40mc2P28rBzF15F
 for <openbmc@lists.ozlabs.org>; Thu, 17 May 2018 13:18:21 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4H3ICvD027877;
 Wed, 16 May 2018 22:18:13 -0500
Message-ID: <f13f4fea7786227977be9a1bdfd1a12a7f072f6a.camel@kernel.crashing.org>
Subject: [PATCH linux dev-4.13 1/3] fsi: Define FSI specific error codes
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 17 May 2018 13:18:12 +1000
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
X-List-Received-Date: Thu, 17 May 2018 03:18:22 -0000

This allows the upper layers to take specific actions based
on what error occurred.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 drivers/fsi/fsi-master-gpio.c | 19 +++++++++++--------
 include/linux/fsi.h           |  7 +++++++
 2 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 0a6799bda294..bf917fadae20 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -379,7 +379,7 @@ static int read_one_response(struct fsi_master_gpio *master,
 			"Master time out waiting for response\n");
 		fsi_master_gpio_error(master, FSI_GPIO_MTOE);
 		spin_unlock_irqrestore(&master->bit_lock, flags);
-		return -EIO;
+		return FSI_ERR_MTOE;
 	}
 
 	msg.bits = 0;
@@ -405,7 +405,7 @@ static int read_one_response(struct fsi_master_gpio *master,
 	if (crc) {
 		dev_dbg(master->dev, "ERR response CRC\n");
 		fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
-		return -EIO;
+		return FSI_ERR_RESP_CRC;
 	}
 
 	if (msgp)
@@ -455,7 +455,7 @@ static int poll_for_response(struct fsi_master_gpio *master,
 retry:
 	rc = read_one_response(master, size, &response, &tag);
 	if (rc)
-		return rc;
+		goto fail;
 
 	switch (tag) {
 	case FSI_GPIO_RESP_ACK:
@@ -492,22 +492,25 @@ static int poll_for_response(struct fsi_master_gpio *master,
 		clock_zeros(master, FSI_GPIO_DPOLL_CLOCKS);
 		spin_unlock_irqrestore(&master->bit_lock, flags);
 		issue_term(master, slave);
-		rc = -EIO;
+		rc = FSI_ERR_BUSY;
 		break;
 
 	case FSI_GPIO_RESP_ERRA:
+		dev_dbg(master->dev, "ERRA received: 0x%x\n", (int)response.msg);
+		fsi_master_gpio_error(master, response.msg);
+		rc = FSI_ERR_ERRA;
+		break;
 	case FSI_GPIO_RESP_ERRC:
-		dev_dbg(master->dev, "ERR%c received: 0x%x\n",
-			tag == FSI_GPIO_RESP_ERRA ? 'A' : 'C',
-			(int)response.msg);
+		dev_dbg(master->dev, "ERRC received: 0x%x\n", (int)response.msg);
 		fsi_master_gpio_error(master, response.msg);
-		rc = -EIO;
+		rc = FSI_ERR_ERRC;
 		break;
 	}
 
 	if (busy_count > 0)
 		trace_fsi_master_gpio_poll_response_busy(master, busy_count);
 
+ fail:
 	/* Clock the slave enough to be ready for next operation */
 	spin_lock_irqsave(&master->bit_lock, flags);
 	clock_zeros(master, FSI_GPIO_PRIME_SLAVE_CLOCKS);
diff --git a/include/linux/fsi.h b/include/linux/fsi.h
index 141fd38d061f..1c6772049f42 100644
--- a/include/linux/fsi.h
+++ b/include/linux/fsi.h
@@ -17,6 +17,13 @@
 
 #include <linux/device.h>
 
+/* FSI specific error codes */
+#define FSI_ERR_ERRA		-1000
+#define FSI_ERR_ERRC		-1001
+#define FSI_ERR_RESP_CRC	-1002
+#define FSI_ERR_BUSY		-1003
+#define FSI_ERR_MTOE		-1004
+
 struct fsi_device {
 	struct device		dev;
 	u8			engine_type;
