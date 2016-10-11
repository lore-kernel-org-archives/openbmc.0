Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3str516rXRzDsrb
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 08:40:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=p/ZQOAkj; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id d132so2259980oib.2
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 14:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YxjyXTsZZxmRl1YIiMbOd11EDSPR9yupIAij7SqeHDk=;
 b=p/ZQOAkjN601ZjQIuHtAE9YbeYieCx2cMJoZ0ftA/fesSRAQ2AOrIWTG5syNQQ1e6h
 uaOPdnjw9RnizQ13dTMFTM6+6uSKe2eM0kTzPsM/JkFqP9FikUzHB9LsGJBI3fHpHLN4
 9+pRGqGrlnqhy9T4fqGfpteL8HmOFocDeL0DTkWFFm9LEdSSx2XXeD2HRJIONbC/Mn8k
 k5Mo3DmyiCn9/uWe823r2DurOeTfNPX4ZEcFuaWqx+K0qwMxRLVEYZek1etn57jnPnC0
 6nemhYtrIK77eeguxPRI9Cuu9O6PuJ+fstegXcittmyBV222W++YZ5+mLIG2JtEhs5Md
 zuUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YxjyXTsZZxmRl1YIiMbOd11EDSPR9yupIAij7SqeHDk=;
 b=HlfdHuGoMqTOCL9pc+S6p5cc/gs0u09Gv03oQK0yxs6hs/G9p8Mv/9iZnvyN6GNvX2
 UUDr3sgaC3tNs3SQ8Lp5aC4JNHkAoNu9X+MrcpqgSbZMWy9bIGMOPatEoFiOPZS6SoKs
 uO6kUACwnVEJlSgGqSMTQVf3jfVuY6HiC4IEjI/PE3Mc7W1o0wvpFK8jP5y8tVrKZEkC
 t/1ew0uBF2RKzj1IK0suXw50q2j8Q1DKu3ztwbkPawaJYcML8zJukQncjNQyk3Hrsv8y
 oeROX8hOcgnZLyxa0/C0pWRzDw1spFnreLgvGU/B2R4vf4+MN30Vsx0s0v4ZgkxgSEK/
 q7fw==
X-Gm-Message-State: AA6/9RniPIC37NPdoMgI7p8KBdGOJWEKGcVxhCbqUBlG3L5SQ0AA18BGa+3kfHHvomjoDw==
X-Received: by 10.157.29.229 with SMTP id w34mr3358345otw.62.1476222020194;
 Tue, 11 Oct 2016 14:40:20 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id h91sm1811153oth.40.2016.10.11.14.40.19
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Tue, 11 Oct 2016 14:40:19 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v3 17/18] drivers/fsi: Add GPIO master functionality
Date: Tue, 11 Oct 2016 16:40:02 -0500
Message-Id: <1476222003-99697-18-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Oct 2016 21:40:22 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Add setup of the GPIO pins for FSI master function. Setup I/O directions,
define all pins and setup their initial directions. Define serial out
operation.

V3 - Added remainder of base I/O ops (excluding dev tree and crc calcs).
   - Add encoding of all read/write commands and send data over sda
   - Check for and decode response from slave.
   - Add set enable pin in master->link_enable() master specific function.

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 drivers/fsi/fsi-master-gpio.c | 355 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 344 insertions(+), 11 deletions(-)

diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index 166370a..fe757cc 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -5,15 +5,52 @@
 #include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 
 #include "fsi-master.h"
 #include "fsi-cfam.h"
 #include "fsi-slave.h"
 
+#define FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
+#define FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
+#define FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
+#define FSI_POST_BREAK_CLOCKS	16000	/* Number clocks to set up cfam */
+#define FSI_INIT_CLOCKS		5000	/* Clear out any old data and states */
+
+#define FSI_GPIO_STD_DELAY	10	/* Standard GPIO delay in nS */
+					/* todo: adjust down as low as */
+					/* possible or eliminate */
+
+#define FSI_GPIO_CMD_DPOLL	0x0000808A
+#define FSI_GPIO_CMD_DPOLL_SIZE	10
+#define FSI_GPIO_DPOLL_CLOCKS	24	/* < 21 will cause slave to hang */
+#define FSI_GPIO_CMD_DEFAULT	0x2000000000000000ULL
+#define FSI_GPIO_CMD_WRITE	0
+#define FSI_GPIO_CMD_READ	0x0400000000000000ULL
+#define FSI_GPIO_CMD_SLAVE_MASK	0xC000000000000000ULL
+#define FSI_GPIO_CMD_ADDR_SHIFT	3
+#define FSI_GPIO_CMD_SIZE_16	0x0000001000000000ULL
+#define FSI_GPIO_CMD_SIZE_32	0x0000003000000000ULL
+#define FSI_GPIO_CMD_DATA_SHIFT	28
+#define FSI_GPIO_CMD_DFLT_LEN	32
+#define FSI_GPIO_RESP_BUSY	1
+#define FSI_GPIO_RESP_ERRA	2
+#define FSI_GPIO_RESP_ERRC	3
+#define FSI_GPIO_RESP_ACK	0
+#define FSI_GPIO_RESP_ACKD	4
+#define FSI_GPIO_MAX_BUSY	100
+#define FSI_GPIO_MTOE_COUNT	1000
+#define FSI_GPIO_MTOE		1
+#define FSI_GPIO_DRAIN_BITS	20
+#define FSI_GPIO_CRC_SIZE	4
+
 struct fsi_master_gpio {
 	struct fsi_master	master;
 	struct gpio_desc	*gpio_clk;
 	struct gpio_desc	*gpio_data;
+	struct gpio_desc	*gpio_trans;		/* Voltage translator */
+	struct gpio_desc	*gpio_enable;		/* FSI enable */
+	struct gpio_desc	*gpio_mux;		/* Mux control */
 };
 
 #define to_fsi_master_gpio(m) container_of(m, struct fsi_master_gpio, master)
@@ -23,33 +60,287 @@ struct fsi_gpio_msg {
 	uint8_t		bits;
 };
 
+static void add_crc(struct fsi_gpio_msg *cmd)
+{
+
+}
+
+static void set_clock(struct fsi_master_gpio *master)
+{
+	/* This delay is required - do not remove */
+	ndelay(FSI_GPIO_STD_DELAY);
+	gpiod_set_value(master->gpio_clk, 1);
+}
+
+static void clear_clock(struct fsi_master_gpio *master)
+{
+	/* This delay is required - do not remove */
+	ndelay(FSI_GPIO_STD_DELAY);
+	gpiod_set_value(master->gpio_clk, 0);
+}
+
+static void clock_toggle(struct fsi_master_gpio *master, int count)
+{
+	int i;
+
+	for (i = 0; i < count; i++) {
+		clear_clock(master);
+		set_clock(master);
+	}
+}
+
+static int sda_in(struct fsi_master_gpio *master)
+{
+	return gpiod_get_value(master->gpio_data);
+}
+
+static void sda_out(struct fsi_master_gpio *master, int value)
+{
+	gpiod_set_value(master->gpio_data, value);
+
+	/* Required -do not remove */
+	ndelay(FSI_GPIO_STD_DELAY);
+}
+
+static void set_sda_input(struct fsi_master_gpio *master)
+{
+	gpiod_direction_input(master->gpio_data);
+	gpiod_direction_output(master->gpio_trans, 0);
+}
+
+static void set_sda_output(struct fsi_master_gpio *master,
+			   int value)
+{
+	gpiod_direction_output(master->gpio_data, value);
+	gpiod_direction_output(master->gpio_trans, 1);
+}
+
+static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *cmd)
+{
+	uint8_t bit;
+	uint64_t msg = 0;
+	uint8_t in_bit = 0;
+
+	set_sda_input(master);
+
+	for (bit = 0; bit < cmd->bits; bit++) {
+		clock_toggle(master, 1);
+		in_bit = sda_in(master);
+		msg |= in_bit;
+		msg <<= 1;
+	}
+	cmd->msg = ~msg;		/*  Data is negative active */
+}
+
+static void serial_out(struct fsi_master_gpio *master, struct fsi_gpio_msg *cmd)
+{
+	uint8_t bit;
+	uint64_t msg = ~cmd->msg;	/* Data is negative active */
+	uint64_t sda_mask = 1;
+	uint64_t last_bit = ~0;
+
+	set_sda_output(master, 0);
+
+	/* Send the start bit */
+	sda_out(master, 1);
+	clock_toggle(master, 1);
+
+	/* Send the message */
+	for (bit = 0; bit < cmd->bits; bit++) {
+		if (last_bit ^ (msg & sda_mask)) {
+			sda_out(master, msg & sda_mask);
+			last_bit = msg & sda_mask;
+		}
+		clock_toggle(master, 1);
+		msg >>= 1;
+	}
+}
+
+/*
+ * Clock out some 0's after every message to ride out line reflections
+ */
+static void echo_delay(struct fsi_master_gpio *master)
+{
+	set_sda_output(master, 0);
+	clock_toggle(master, FSI_ECHO_DELAY_CLOCKS);
+}
+
+/*
+ * Used in bus error cases only.  Clears out any remaining data the slave
+ * is attempting to send
+ */
+static void drain_response(struct fsi_master_gpio *master)
+{
+	struct fsi_gpio_msg msg;
+
+	msg.bits = FSI_GPIO_DRAIN_BITS;
+	serial_in(master, &msg);
+}
+
+/*
+ * Store information on master errors so handler can detect and clean
+ * up the bus
+ */
+static void fsi_master_gpio_error(struct fsi_master_gpio *master, int error)
+{
+
+}
+
+static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
+			uint8_t size, void *data)
+{
+	int busy_count = 0, i;
+	struct fsi_gpio_msg response, cmd;
+	int bits_remaining = 0;
+
+	do {
+		response.msg = 0;
+		response.bits = 1;
+		for (i = 0; i < FSI_GPIO_MTOE_COUNT; i++) {
+			serial_in(master, &response);
+			if (response.msg)
+				break;
+		}
+		if (unlikely(i >= FSI_GPIO_MTOE_COUNT)) {
+			dev_info(master->master.dev,
+				"Master time out waiting for response\n");
+			drain_response(master);
+			fsi_master_gpio_error(master, FSI_GPIO_MTOE);
+			return FSI_GPIO_MTOE;
+		}
+
+		/* Response received */
+		response.msg = 0;
+		response.bits = 2;
+		serial_in(master, &response);
+		dev_info(master->master.dev, "cfam id:%d\n", (int)response.msg);
+
+		response.msg = 0;
+		response.bits = 2;
+		serial_in(master, &response);
+		dev_info(master->master.dev, "response id:%d\n",
+							(int)response.msg);
+
+		switch (response.msg) {
+		case FSI_GPIO_RESP_ACK:
+			if (expected == FSI_GPIO_RESP_ACKD)
+				bits_remaining = 8 * sizeof(size);
+			break;
+
+		case FSI_GPIO_RESP_BUSY:
+			/*
+			 * Its necessary to clock slave before issuing
+			 * d-poll, not indicated in the hardware protocol
+			 * spec. < 20 clocks causes slave to hang, 21 ok.
+			 */
+			set_sda_output(master, 0);
+			clock_toggle(master, FSI_GPIO_DPOLL_CLOCKS);
+			cmd.msg = FSI_GPIO_CMD_DPOLL;
+			cmd.bits = FSI_GPIO_CMD_DPOLL_SIZE;
+			serial_out(master, &cmd);
+			continue;
+
+		case FSI_GPIO_RESP_ERRA:
+		case FSI_GPIO_RESP_ERRC:
+			dev_info(master->master.dev, "ERR received: %d\n",
+				(int)response.msg);
+			drain_response(master);
+			fsi_master_gpio_error(master, response.msg);
+			return response.msg;
+		}
+
+		/* Read in the data field if applicable */
+		if (bits_remaining) {
+			response.msg = 0;
+			response.bits = bits_remaining;
+			serial_in(master, &response);
+		}
+
+		/* Read in the crc and check it */
+		response.msg = 0;
+		response.bits = FSI_GPIO_CRC_SIZE;
+		serial_in(master, &response);
+
+		/* todo: verify crc is correct, flag error if not */
+
+		return 0;
+
+	} while (busy_count++ < FSI_GPIO_MAX_BUSY);
+
+	return busy_count;
+}
+
+static void build_command(struct fsi_gpio_msg *cmd, uint64_t mode,
+			uint8_t slave, uint32_t addr, size_t size,
+			const void *data)
+{
+	cmd->bits = FSI_GPIO_CMD_DFLT_LEN;
+	cmd->msg = FSI_GPIO_CMD_DEFAULT;
+	cmd->msg |= mode;
+
+	/* todo: handle more than just slave id 0 */
+	cmd->msg &= ~FSI_GPIO_CMD_SLAVE_MASK;
+
+	cmd->msg |= (addr << FSI_GPIO_CMD_ADDR_SHIFT);
+	if (size == sizeof(uint8_t)) {
+		if (data)
+			cmd->msg |=
+				*((uint8_t *)data) >> FSI_GPIO_CMD_DATA_SHIFT;
+	} else if (size == sizeof(uint16_t)) {
+		cmd->msg |= FSI_GPIO_CMD_SIZE_16;
+		if (data)
+			cmd->msg |=
+				*((uint16_t *)data) >> FSI_GPIO_CMD_DATA_SHIFT;
+	} else {
+		cmd->msg |= FSI_GPIO_CMD_SIZE_32;
+		if (data)
+			cmd->msg |=
+				*((uint32_t *)data) >> FSI_GPIO_CMD_DATA_SHIFT;
+	}
+	if (mode == FSI_GPIO_CMD_WRITE)
+		cmd->bits += (8 * size);
+
+	add_crc(cmd);
+}
+
 static int fsi_master_gpio_read(struct fsi_master *_master, int link,
 		uint8_t slave, uint32_t addr, void *val, size_t size)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+	struct fsi_gpio_msg cmd;
+	int rc;
 
 	if (link != 0)
 		return -ENODEV;
 
-	/* todo: format read into a message, send, poll for response */
-	(void)master;
+	/* Send the command */
+	build_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
+	serial_out(master, &cmd);
+	echo_delay(master);
 
+	rc = poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
 
-	return 0;
+	return rc;
 }
 
 static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 		uint8_t slave, uint32_t addr, const void *val, size_t size)
 {
+	int rc;
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+	struct fsi_gpio_msg cmd;
 
 	if (link != 0)
 		return -ENODEV;
 
-	/* todo: format write into a message, send, poll for response */
-	(void)master;
+	/* Send the command */
+	build_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
+	serial_out(master, &cmd);
+	echo_delay(master);
 
-	return 0;
+	rc = poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
+
+	return rc;
 }
 
 /*
@@ -58,14 +349,40 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+	uint32_t smode;
+	int rc;
 
 	if (link != 0)
 		return -ENODEV;
 
-	/* todo: send the break pattern over gpio */
-	(void)master;
+	set_sda_output(master, 0);
+	clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
 
-	return 0;
+	sda_out(master, 1);
+	clock_toggle(master, FSI_BREAK_CLOCKS);
+
+	echo_delay(master);
+
+	sda_out(master, 0);
+	clock_toggle(master, FSI_POST_BREAK_CLOCKS);
+
+	udelay(200);		/* wait for logic reset to take effect */
+	rc = _master->read(_master, link, 3, FSI_SLAVE_BASE + FSI_SMODE,
+			&smode, sizeof(smode));
+	dev_info(_master->dev, "smode after break:%08x rc:%d\n", smode, rc);
+
+	return rc;
+}
+
+static void fsi_master_gpio_init(struct fsi_master_gpio *master)
+{
+	gpiod_direction_output(master->gpio_mux, 1);
+	gpiod_direction_output(master->gpio_clk, 1);
+	set_sda_output(master, 1);
+	gpiod_direction_output(master->gpio_enable, 0);
+
+	/* todo: evaluate if clocks can be reduced */
+	clock_toggle(master, FSI_INIT_CLOCKS);
 }
 
 static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
@@ -75,8 +392,7 @@ static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
 	if (link != 0)
 		return -ENODEV;
 
-	/* todo: set the enable pin */
-	(void)master;
+	gpiod_set_value(master->gpio_enable, 1);
 
 	return 0;
 }
@@ -100,11 +416,28 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gpio);
 	master->gpio_data = gpio;
 
+	gpio = devm_gpiod_get(&pdev->dev, "trans", 0);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+	master->gpio_trans = gpio;
+
+	gpio = devm_gpiod_get(&pdev->dev, "enable", 0);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+	master->gpio_enable = gpio;
+
+	gpio = devm_gpiod_get(&pdev->dev, "mux", 0);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+	master->gpio_mux = gpio;
+
 	master->master.read = fsi_master_gpio_read;
 	master->master.write = fsi_master_gpio_write;
 	master->master.send_break = fsi_master_gpio_break;
 	master->master.link_enable = fsi_master_gpio_link_enable;
 
+	fsi_master_gpio_init(master);
+
 	return fsi_master_register(&master->master);
 }
 
-- 
1.8.2.2
