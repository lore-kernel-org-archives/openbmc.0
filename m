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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40mc1W0ptHzF15F
 for <openbmc@lists.ozlabs.org>; Thu, 17 May 2018 13:17:34 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id w4H3HQWo027843;
 Wed, 16 May 2018 22:17:27 -0500
Message-ID: <1757792fbbffa1e4b9a308e7a285e91f955c09bc.camel@kernel.crashing.org>
Subject: [PATCH linux dev-4.13 2/3] fsi/fsi-master-gpio: Implement CRC error
 recovery
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: openbmc@lists.ozlabs.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Thu, 17 May 2018 13:17:26 +1000
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
X-List-Received-Date: Thu, 17 May 2018 03:17:35 -0000

The FSI protocol defines two modes of recovery from CRC errors,
this implements both:

 - If the device returns an ECRC (it detected a CRC error in the
   command), then we simply issue the command again.

 - If the master detects a CRC error in the response, we send
   an E_POLL command which requests a resend of the response
   without actually re-executing the command (which could otherwise
   have unwanted side effects such as dequeuing a FIFO twice).

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---

Note: This was actually tested by removing some of my fixes, thus
causing us to hit occasional CRC errors during high LPC activity.

 drivers/fsi/fsi-master-gpio.c | 57 ++++++++++++++++++++++++++++-------
 1 file changed, 46 insertions(+), 11 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index bf917fadae20..b22685850837 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -22,20 +22,23 @@
 #define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
 #define	FSI_POST_BREAK_CLOCKS	16000	/* Number clocks to set up cfam */
 #define	FSI_INIT_CLOCKS		5000	/* Clock out any old data */
+#define	FSI_GPIO_DPOLL_CLOCKS	50      /* < 21 will cause slave to hang */
+#define	FSI_GPIO_EPOLL_CLOCKS	50      /* Number of clocks for E_POLL retry */
 #define	FSI_GPIO_STD_DELAY	10	/* Standard GPIO delay in nS */
 					/* todo: adjust down as low as */
 					/* possible or eliminate */
+#define FSI_CRC_ERR_RETRIES	10
+
 #define	FSI_GPIO_CMD_DPOLL      0x2
+#define	FSI_GPIO_CMD_EPOLL      0x3
 #define	FSI_GPIO_CMD_TERM	0x3f
 #define FSI_GPIO_CMD_ABS_AR	0x4
 #define FSI_GPIO_CMD_REL_AR	0x5
 #define FSI_GPIO_CMD_SAME_AR	0x3	/* but only a 2-bit opcode... */
 
-
-#define	FSI_GPIO_DPOLL_CLOCKS	50      /* < 21 will cause slave to hang */
-
-/* Bus errors */
-#define	FSI_GPIO_ERR_BUSY	1	/* Slave stuck in busy state */
+/* Slave responses */
+#define	FSI_GPIO_RESP_ACK	0	/* Success */
+#define	FSI_GPIO_RESP_BUSY	1	/* Slave busy */
 #define	FSI_GPIO_RESP_ERRA	2	/* Any (misc) Error */
 #define	FSI_GPIO_RESP_ERRC	3	/* Slave reports master CRC error */
 #define	FSI_GPIO_MTOE		4	/* Master time out error */
@@ -330,6 +333,16 @@ static void build_dpoll_command(struct fsi_gpio_msg *cmd, uint8_t slave_id)
 	msg_push_crc(cmd);
 }
 
+static void build_epoll_command(struct fsi_gpio_msg *cmd, uint8_t slave_id)
+{
+	cmd->bits = 0;
+	cmd->msg = 0;
+
+	msg_push_bits(cmd, slave_id, 2);
+	msg_push_bits(cmd, FSI_GPIO_CMD_EPOLL, 3);
+	msg_push_crc(cmd);
+}
+
 static void echo_delay(struct fsi_master_gpio *master)
 {
 	set_sda_output(master, 1);
@@ -451,10 +464,24 @@ static int poll_for_response(struct fsi_master_gpio *master,
 	unsigned long flags;
 	uint8_t tag;
 	uint8_t *data_byte = data;
-
+	int crc_err_retries = 0;
 retry:
 	rc = read_one_response(master, size, &response, &tag);
-	if (rc)
+
+	/* Handle retries on CRC errors */
+	if (rc == FSI_ERR_RESP_CRC) {
+		if (crc_err_retries++ > FSI_CRC_ERR_RETRIES)
+			goto fail;
+		dev_warn(master->dev,
+			 "CRC error retry %d\n", crc_err_retries);
+		build_epoll_command(&cmd, slave);
+		spin_lock_irqsave(&master->bit_lock, flags);
+		clock_zeros(master, FSI_GPIO_EPOLL_CLOCKS);
+		serial_out(master, &cmd);
+		echo_delay(master);
+		spin_unlock_irqrestore(&master->bit_lock, flags);
+		goto retry;
+	} else if (rc)
 		goto fail;
 
 	switch (tag) {
@@ -539,11 +566,19 @@ static int send_request(struct fsi_master_gpio *master,
 static int fsi_master_gpio_xfer(struct fsi_master_gpio *master, uint8_t slave,
 		struct fsi_gpio_msg *cmd, size_t resp_len, void *resp)
 {
-	int rc;
+	int rc = FSI_ERR_ERRC, retries = 0;
 
-	rc = send_request(master, cmd);
-	if (!rc)
-		rc = poll_for_response(master, slave, resp_len, resp);
+	while ((retries++) < FSI_CRC_ERR_RETRIES) {
+		rc = send_request(master, cmd);
+		if (!rc)
+			rc = poll_for_response(master, slave, resp_len, resp);
+		if (rc != FSI_ERR_ERRC)
+			break;
+		dev_warn(master->dev, "ECRC retry %d\n", retries);
+
+		/* Pace it a bit before retry */
+		msleep(1);
+	}
 
 	return rc;
 }
