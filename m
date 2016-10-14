Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3swhjs0PWtzDt4v
 for <openbmc@lists.ozlabs.org>; Sat, 15 Oct 2016 09:15:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=LS4rUEPw; 
 dkim-atps=neutral
Received: by mail-pf0-x243.google.com with SMTP id 128so7976589pfz.1
 for <openbmc@lists.ozlabs.org>; Fri, 14 Oct 2016 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=IVs6hDgneZiI7zdKtYD5OP0Njc0kIwwohD4YerhIkbo=;
 b=LS4rUEPwbk9JVjwuoMi925yYlPV45trxqbHJDetl5GRYgqmsnhxHrjO8GUVa6LUUZZ
 PQpoG6Nr021R5j38e1G0WlvHm+8MhEsKzsDW6C1nuTcTisBrCLxq4nRQJN+B0KOKDPUq
 x07oUlYItTDlvfQR1xlQGAZUW0kaDiKeNM9LDwe3m7G0L+RS2CFORGnN5zCvu95jp40p
 RFkcXljUxZdwZQv41PslFE5ywCpUh8wqz8I5pIgABOJd15vJY8qnSaObkanrY0g6TrPT
 VkWE473gsDGj6aiMaP/dy1NJV5D/hD5LMTPLKkZwkO7JjCm1Rf+9IDFgfoZFhpEudJMt
 U+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=IVs6hDgneZiI7zdKtYD5OP0Njc0kIwwohD4YerhIkbo=;
 b=UYRv10fJNc0qiQwJ40wgRpjraMrsaZTt7zJU32M64DpYX9tmM79dDFTMuNAVXgy6/J
 r3Lz0a4j+vSqRe8nU1iSeVPh08gem0H9VgarSuY8qkoJhg7p3AoeKLdL01L9+lGItsdX
 mJPnY6BGRXW90zAAy3Zj//LjveF9bLmQOe5DW3tytTLQkW+iy8k8BQEVja+lEcTmRA6s
 twyDRxjVt2W06YfOscSrRFXKmp9D1PU9Y07XkJI14BnZnDRYPBN77FntslOU5m+QZ2BX
 MHkkYbON/aezOCICZBfMVZ7OKfj8sR8OfgU3vj8uMXkQ0dNf36zTzT9bpLxqZMlAwupg
 pXyA==
X-Gm-Message-State: AA6/9Rm40Dw4UD20iDlarRsy+Ivk+hJQRSnUo3dh207n2qTWCSowzSvBKny3mA3WXh8Djw==
X-Received: by 10.99.146.84 with SMTP id s20mr17887400pgn.9.1476483311054;
 Fri, 14 Oct 2016 15:15:11 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id p7sm29848874paa.3.2016.10.14.15.15.08
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Fri, 14 Oct 2016 15:15:09 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>
Subject: [PATCH linux v4 18/20] drivers/fsi: Add GPIO FSI master functionality
Date: Fri, 14 Oct 2016 17:14:40 -0500
Message-Id: <1476483282-85971-19-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2016 22:15:13 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Add setup of the GPIO pins for FSI master function. Setup I/O directions,
define all pins and setup their initial directions. Define serial out
operation. Encode and decode all transactions on the SDA line.

V3 - Added remainder of base I/O ops (excluding dev tree and crc calcs).

   - Add encoding of all read/write commands and send data over sda

   - Check for and decode response from slave.

   - Add set enable pin in master->link_enable() master specific function.

V4 - Remove unnecessary comments about delays in various locations

   - Define non clock and data pins as optional and check for gpio
     descriptors == NULL before accessing.  Don't return error if
     optional pins cannot be retrieved via devm.

   - serial_in: rearrange order of msg shift and input bit OR op.

   - serial_out: Fix mirror image issue on shift data out and set
     data out as necessary for bit count to be sent.

   - serial_out: make message parm a const

   - serial_out: fix 3x 'msg & data' repeat

   - poll_for_response: bits remaining was calculated with
     sizeof(size) should be size.

   - fsi_master_gpio_break: remove smode read

   - Replace dev_info with dev_dbg in proper places.

   - Add a bit count parm to serial_in, increment msg->bits
     on every bit received.

   - Remove magic numbers in poll_for_response that indicate
     how many bits to receive

   - Utilize the crc utilities to check input data and set
     crc for output data

   - Remove add_crc stub

Signed-off-by: Chris Bostic <cbostic@us.ibm.com>
---
 .../devicetree/bindings/fsi/fsi-master-gpio.txt    |  13 +
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  30 ++
 drivers/fsi/fsi-master-gpio.c                      | 365 ++++++++++++++++++++-
 3 files changed, 397 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
index 44762a3..4cb2c81 100644
--- a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
+++ b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
@@ -1,8 +1,21 @@
 Device-tree bindings for gpio-based FSI master driver
 -----------------------------------------------------
 
+Required properties:
+	- compatible = "ibm,fsi-master-gpio";
+	- clk-gpio;
+	- data-gpio;
+
+Optional properties:
+	- enable-gpio;
+	- trans-gpio;
+	- mux-gpio;
+
 fsi-master {
 	compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
 	clk-gpio = <&gpio 0>;
 	data-gpio = <&gpio 1>;
+	enable-gpio = <&gpio 2>;
+	trans-gpio = <&gpio 3>;
+	mux-gpio = <&gpio 4>;
 }
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 21619fd..e74dd6b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -167,6 +167,36 @@
 		output-low;
 		line-name = "func_mode2";
 	};
+
+	pin_clk {
+		gpios = <ASPEED_GPIO(A, 4)  GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "clk";
+	};
+
+	pin_data {
+		gpios = <ASPEED_GPIO(A, 5)  GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "data";
+	};
+
+	pin_trans {
+		gpios = <ASPEED_GPIO(H, 6)  GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "trans";
+	};
+
+	pin_enable {
+		gpios = <ASPEED_GPIO(D, 0)  GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "enable";
+	};
+
+	pin_mux {
+		gpios = <ASPEED_GPIO(A, 6)  GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "mux";
+	};
 };
 
 &vuart {
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
index f8e5ca4..58540b8 100644
--- a/drivers/fsi/fsi-master-gpio.c
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -5,13 +5,51 @@
 #include <linux/platform_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 
 #include "fsi-master.h"
 
+#define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo delay */
+#define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for break */
+#define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue break */
+#define	FSI_POST_BREAK_CLOCKS	16000	/* Number clocks to set up cfam */
+#define	FSI_INIT_CLOCKS		5000	/* Clock out any old data */
+#define	FSI_GPIO_STD_DELAY	10	/* Standard GPIO delay in nS */
+					/* todo: adjust down as low as */
+					/* possible or eliminate */
+#define	FSI_GPIO_CMD_DPOLL	0x0000808A
+#define	FSI_GPIO_CMD_DPOLL_SIZE	10
+#define	FSI_GPIO_DPOLL_CLOCKS	24      /* < 21 will cause slave to hang */
+#define	FSI_GPIO_CMD_DEFAULT	0x2000000000000000ULL
+#define	FSI_GPIO_CMD_WRITE	0
+#define	FSI_GPIO_CMD_READ	0x0400000000000000ULL
+#define	FSI_GPIO_CMD_SLAVE_MASK	0xC000000000000000ULL
+#define	FSI_GPIO_CMD_ADDR_SHIFT	3
+#define	FSI_GPIO_CMD_SIZE_16	0x0000001000000000ULL
+#define	FSI_GPIO_CMD_SIZE_32	0x0000003000000000ULL
+#define	FSI_GPIO_CMD_DATA_SHIFT	28
+#define	FSI_GPIO_CMD_DFLT_LEN	32
+#define	FSI_GPIO_RESP_BUSY	1
+#define	FSI_GPIO_RESP_ERRA	2
+#define	FSI_GPIO_RESP_ERRC	3
+#define	FSI_GPIO_RESP_ACK	0
+#define	FSI_GPIO_RESP_ACKD	4
+#define	FSI_GPIO_MAX_BUSY	100
+#define	FSI_GPIO_MTOE_COUNT	1000
+#define	FSI_GPIO_MTOE		1
+#define	FSI_GPIO_DRAIN_BITS	20
+#define	FSI_GPIO_CRC_SIZE	4
+#define FSI_GPIO_MSG_ID_SIZE		2
+#define FSI_GPIO_MSG_RESPID_SIZE	2
+#define FSI_GPIO_CRC_INVAL		5
+
 struct fsi_master_gpio {
 	struct fsi_master	master;
 	struct gpio_desc	*gpio_clk;
 	struct gpio_desc	*gpio_data;
+	struct gpio_desc	*gpio_trans;	/* Voltage translator */
+	struct gpio_desc	*gpio_enable;	/* FSI enable */
+	struct gpio_desc	*gpio_mux;	/* Mux control */
 };
 
 #define to_fsi_master_gpio(m) container_of(m, struct fsi_master_gpio, master)
@@ -21,33 +59,303 @@ struct fsi_gpio_msg {
 	uint8_t		bits;
 };
 
+static void set_clock(struct fsi_master_gpio *master)
+{
+	ndelay(FSI_GPIO_STD_DELAY);
+	gpiod_set_value(master->gpio_clk, 1);
+}
+
+static void clear_clock(struct fsi_master_gpio *master)
+{
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
+	ndelay(FSI_GPIO_STD_DELAY);
+}
+
+static void set_sda_input(struct fsi_master_gpio *master)
+{
+	gpiod_direction_input(master->gpio_data);
+	if (master->gpio_trans)
+		gpiod_direction_output(master->gpio_trans, 0);
+}
+static void set_sda_output(struct fsi_master_gpio *master,
+				int value)
+{
+	gpiod_direction_output(master->gpio_data, value);
+	if (master->gpio_trans)
+		gpiod_direction_output(master->gpio_trans, 1);
+}
+
+static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *cmd,
+			uint8_t num_bits)
+{
+	uint8_t bit;
+	uint64_t msg = 0;
+	uint8_t in_bit = 0;
+
+	set_sda_input(master);
+	cmd->bits = 0;
+
+	for (bit = 0; bit < num_bits; bit++) {
+		clock_toggle(master, 1);
+		in_bit = sda_in(master);
+		cmd->bits++;
+		msg <<= 1;
+		msg |= in_bit;
+	}
+	cmd->msg = ~msg;		/*  Data is negative active */
+}
+
+static void serial_out(struct fsi_master_gpio *master,
+			const struct fsi_gpio_msg *cmd)
+{
+	uint8_t bit;
+	uint64_t msg = ~cmd->msg;	/* Data is negative active */
+	uint64_t sda_mask;
+	uint64_t last_bit = ~0;
+	int next_bit;
+
+	if (!cmd->bits) {
+		dev_warn(master->master.dev, "trying to output 0 bits\n");
+		return;
+	}
+	sda_mask = BIT(cmd->bits - 1);
+	set_sda_output(master, 0);
+
+	/* Send the start bit */
+	sda_out(master, 1);
+	clock_toggle(master, 1);
+
+	/* Send the message */
+	for (bit = 0; bit < cmd->bits; bit++) {
+		next_bit = (msg & sda_mask) >> (cmd->bits - 1);
+		if (last_bit ^ next_bit) {
+			sda_out(master, next_bit);
+			last_bit = next_bit;
+		}
+		clock_toggle(master, 1);
+		msg <<= 1;
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
+	serial_in(master, &msg, FSI_GPIO_DRAIN_BITS);
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
+	uint64_t resp = 0;
+	uint8_t bits_received = 1 + FSI_GPIO_MSG_ID_SIZE +
+				FSI_GPIO_MSG_RESPID_SIZE;
+	uint8_t crc_in;
+
+	do {
+		response.msg = 0;
+		for (i = 0; i < FSI_GPIO_MTOE_COUNT; i++) {
+			serial_in(master, &response, 1);
+			resp = response.msg;
+			if (response.msg)
+				break;
+		}
+		if (unlikely(i >= FSI_GPIO_MTOE_COUNT)) {
+			dev_info(master->master.dev,
+			"Master time out waiting for response\n");
+			drain_response(master);
+			fsi_master_gpio_error(master, FSI_GPIO_MTOE);
+			return FSI_GPIO_MTOE;
+		}
+
+		/* Response received */
+		response.msg = 0;
+		serial_in(master, &response, FSI_GPIO_MSG_ID_SIZE);
+		dev_info(master->master.dev, "cfam id:%d\n", (int)response.msg);
+		resp <<= FSI_GPIO_MSG_ID_SIZE;
+		resp |= response.msg;
+
+		response.msg = 0;
+		serial_in(master, &response, FSI_GPIO_MSG_RESPID_SIZE);
+		dev_info(master->master.dev, "response id:%d\n",
+				(int)response.msg);
+		resp <<= FSI_GPIO_MSG_RESPID_SIZE;
+		resp |= response.msg;
+
+		switch (response.msg) {
+		case FSI_GPIO_RESP_ACK:
+			if (expected == FSI_GPIO_RESP_ACKD)
+				bits_remaining = 8 * size;
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
+			serial_in(master, &response, bits_remaining);
+			resp <<= bits_remaining;
+			resp |= response.msg;
+			bits_received += bits_remaining;
+		}
+
+		/* Read in the crc and check it */
+		response.msg = 0;
+		serial_in(master, &response, FSI_GPIO_CRC_SIZE);
+
+		crc_in = fsi_crc4(0, resp, bits_received);
+		if (crc_in != response.msg) {
+			/* CRC's don't match */
+			dev_info(master->master.dev, "ERR response CRC\n");
+			fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
+			return FSI_GPIO_CRC_INVAL;
+		}
+		return 0;
+
+	} while (busy_count++ < FSI_GPIO_MAX_BUSY);
+
+	return busy_count;
+}
+
+static void build_command(struct fsi_gpio_msg *cmd, uint64_t mode,
+		uint8_t slave, uint32_t addr, size_t size,
+		const void *data)
+{
+	uint8_t crc;
+	uint64_t msg_with_start;
+
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
+
+	if (mode == FSI_GPIO_CMD_WRITE)
+		cmd->bits += (8 * size);
+
+	/* Start bit isn't considered part of command but we need to */
+	/* account for it in crc calcs */
+	msg_with_start = 0x1 << cmd->bits;
+	msg_with_start |= cmd->msg;
+	crc = fsi_crc4(0, msg_with_start, cmd->bits);
+	cmd->msg |= crc >> cmd->bits;
+	cmd->bits += FSI_GPIO_CRC_SIZE;
+}
+
 static int fsi_master_gpio_read(struct fsi_master *_master, int link,
 		uint8_t slave, uint32_t addr, void *val, size_t size)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+	struct fsi_gpio_msg cmd;
 
 	if (link != 0)
 		return -ENODEV;
 
-	/* todo: format read into a message, send, poll for response */
-	(void)master;
+	build_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
+	serial_out(master, &cmd);
+	echo_delay(master);
 
-
-	return 0;
+	return poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
 }
 
 static int fsi_master_gpio_write(struct fsi_master *_master, int link,
 		uint8_t slave, uint32_t addr, const void *val, size_t size)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+	struct fsi_gpio_msg cmd;
 
 	if (link != 0)
 		return -ENODEV;
 
-	/* todo: format write into a message, send, poll for response */
-	(void)master;
+	build_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
+	serial_out(master, &cmd);
+	echo_delay(master);
 
-	return 0;
+	return poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
 }
 
 /*
@@ -60,12 +368,31 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
 	if (link != 0)
 		return -ENODEV;
 
-	/* todo: send the break pattern over gpio */
-	(void)master;
+	set_sda_output(master, 0);
+	clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
+	sda_out(master, 1);
+	clock_toggle(master, FSI_BREAK_CLOCKS);
+	echo_delay(master);
+	sda_out(master, 0);
+	clock_toggle(master, FSI_POST_BREAK_CLOCKS);
+	udelay(200);		/* Wait for logic reset to take effect */
 
 	return 0;
 }
 
+static void fsi_master_gpio_init(struct fsi_master_gpio *master)
+{
+	if (master->gpio_mux)
+		gpiod_direction_output(master->gpio_mux, 1);
+	gpiod_direction_output(master->gpio_clk, 1);
+	set_sda_output(master, 1);
+	if (master->gpio_enable)
+		gpiod_direction_output(master->gpio_enable, 0);
+
+	/* todo: evaluate if clocks can be reduced */
+	clock_toggle(master, FSI_INIT_CLOCKS);
+}
+
 static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
 {
 	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
@@ -73,8 +400,8 @@ static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
 	if (link != 0)
 		return -ENODEV;
 
-	/* todo: set the enable pin */
-	(void)master;
+	if (master->gpio_enable)
+		gpiod_set_value(master->gpio_enable, 1);
 
 	return 0;
 }
@@ -98,11 +425,27 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(gpio);
 	master->gpio_data = gpio;
 
+	/* Optional pins */
+
+	gpio = devm_gpiod_get(&pdev->dev, "trans", 0);
+	if (!IS_ERR(gpio))
+		master->gpio_trans = gpio;
+
+	gpio = devm_gpiod_get(&pdev->dev, "enable", 0);
+	if (!IS_ERR(gpio))
+		master->gpio_enable = gpio;
+
+	gpio = devm_gpiod_get(&pdev->dev, "mux", 0);
+	if (!IS_ERR(gpio))
+		master->gpio_mux = gpio;
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
