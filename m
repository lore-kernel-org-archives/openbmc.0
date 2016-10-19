Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sznhr0RJdzDvWt
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 10:10:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=wD6XqB2s; 
 dkim-atps=neutral
Received: by mail-it0-x242.google.com with SMTP id 139so3150275itm.2
 for <openbmc@lists.ozlabs.org>; Wed, 19 Oct 2016 16:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=OgCgDbifcUZjUavfsgfItdu1PjxAEo1xSh87myS/Uo4=;
 b=wD6XqB2sYO+Vwg9J34uPVqRbjoFjMHRzA8tB7pOEEQ3nu6sd3t6kpT2PJ1mV413zms
 VwxCgbgL1pYZEvFr20BkRX00vS3oOSAmyUalQGl9FM6+ybug6pyq9CX0iVVHEUvvT80V
 8Pvgcpwv99qcW3OhDu5025MY7K96T0LKDwC+8Be0/s3pccIXt8bmKIy0oeNIckizvblF
 UiEd+WNIcLQIDn4xYlTSxKScdbq9/9dUImxBw6CFBxORranL1vpHtWsuYScjuMSJww96
 3IO5P12PW08vHoBpm/JbCY3liWI+kiVyhtLWct5/5PxhQfgec7XpqlFMsj5UmJwMqMd4
 6A2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=OgCgDbifcUZjUavfsgfItdu1PjxAEo1xSh87myS/Uo4=;
 b=nERt470hB1J58T56N9utMFM8OZ+KxmScsE8nk0U7BU7DAn5lxFHW/VQyWk3eWz6x3v
 r6DWbHC6QUAP+6LsKH4NRq6BRIuoYAnEFoxwZ7Qnf9w+JzS57u4sdDGD7Zw1x4a9KJSw
 02oEvFsAhytSpwCi5WsN41izOdnhYqZgJk8/tikJr0l/9p+aZrXx91IZVCNlIyzPqFZx
 j319+t/1Po6hxoAd0gTP2JzMw/AcrS9pjCxlaE8wWinJa7mettbHhJN4SQFkKMO9H8lP
 yUs8XVlXmTAYKM7WptFLdcDwMMt2KI7kwg95rSga737oBZk+YBeSTkpDmgJZEgdxbSi1
 nzfQ==
X-Gm-Message-State: AA6/9RmYrtLrID9UdKZnUvKRldCoyWjU2fBj28VA/HiGkJsYoBg2+0ivDArpqqtN9uGucQ==
X-Received: by 10.202.240.11 with SMTP id o11mr6217918oih.23.1476918602020;
 Wed, 19 Oct 2016 16:10:02 -0700 (PDT)
Received: from Christophers-MacBook-Pro.local.com
 (45-20-192-79.lightspeed.austtx.sbcglobal.net. [45.20.192.79])
 by smtp.gmail.com with ESMTPSA id n196sm15487618oig.8.2016.10.19.16.10.01
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 19 Oct 2016 16:10:01 -0700 (PDT)
From: christopher.lee.bostic@gmail.com
To: openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, zahrens@us.ibm.com, xxpetri@de.ibm.com,
 Chris Bostic <cbostic@us.ibm.com>, Jeremy Kerr <jk@0zlabs.org>
Subject: [PATCH linux v5 15/18] drivers/fsi: Add GPIO FSI master
Date: Wed, 19 Oct 2016 18:09:43 -0500
Message-Id: <1476918586-13475-16-git-send-email-christopher.lee.bostic@gmail.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
In-Reply-To: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 19 Oct 2016 23:10:04 -0000

From: Chris Bostic <cbostic@us.ibm.com>

Implement a FSI master using GPIO.  Will generate FSI protocol for
read and write commands to particular addresses.  Sends master command
and waits for and decodes a slave response.  Includes Jeremy Kerr's
original GPIO master base commit.

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

V5 - Rename pins from generic 'clk', 'data', etc in dts file to
     'fsi_clk', 'fsi_data', etc...

   - serial_in: invert data bit during message assembly
     instead of inverting whole message after assembly.

   - Remove all instances of clearing out message field prior
     to calling serial_in, redundant.

   - Change name of build_command() to build_abs_ar_command()
     to make it more obvious its creating ABS AR type commands.

   - Remove unlikely( ) checks.

   - Indent dev_info string "master time out waiting for response"

   - poll_for_response: return FSI_GPIO_MAX busy instead of
     busy_count.

   - fsi_master_gpio_break: move 'logic reset' comment to above
     the delay call.

   - Add crc4 calculation initialization since data includes
     a start bit.

Signed-off-by: Jeremy Kerr <jk@0zlabs.org>
---
 .../devicetree/bindings/fsi/fsi-master-gpio.txt    |  21 +
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  30 ++
 drivers/fsi/Kconfig                                |   7 +
 drivers/fsi/Makefile                               |   1 +
 drivers/fsi/fsi-master-gpio.c                      | 464 +++++++++++++++++++++
 5 files changed, 523 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
 create mode 100644 drivers/fsi/fsi-master-gpio.c

diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
new file mode 100644
index 0000000..4cb2c81
--- /dev/null
+++ b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
@@ -0,0 +1,21 @@
+Device-tree bindings for gpio-based FSI master driver
+-----------------------------------------------------
+
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
+fsi-master {
+	compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
+	clk-gpio = <&gpio 0>;
+	data-gpio = <&gpio 1>;
+	enable-gpio = <&gpio 2>;
+	trans-gpio = <&gpio 3>;
+	mux-gpio = <&gpio 4>;
+}
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
index 21619fd..1875313 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
@@ -167,6 +167,36 @@
 		output-low;
 		line-name = "func_mode2";
 	};
+
+	pin_fsi_clk {
+		gpios = <ASPEED_GPIO(A, 4)  GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "fsi_clk";
+	};
+
+	pin_fsi_data {
+		gpios = <ASPEED_GPIO(A, 5)  GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "fsi_data";
+	};
+
+	pin_fsi_trans {
+		gpios = <ASPEED_GPIO(H, 6)  GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "fsi_trans";
+	};
+
+	pin_fsi_enable {
+		gpios = <ASPEED_GPIO(D, 0)  GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "fsi_enable";
+	};
+
+	pin_fsi_mux {
+		gpios = <ASPEED_GPIO(A, 6)  GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "fsi_mux";
+	};
 };
 
 &vuart {
diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
index f065dbe..69e7ee8 100644
--- a/drivers/fsi/Kconfig
+++ b/drivers/fsi/Kconfig
@@ -17,6 +17,13 @@ config FSI_MASTER_FAKE
 	depends on FSI
 	---help---
 	This option enables a fake FSI master driver for debugging.
+
+config FSI_MASTER_GPIO
+	tristate "GPIO-based FSI master"
+	depends on FSI
+	select GPIO_DEVRES
+	---help---
+	This option enables a FSI master driver, using GPIO lines directly.
 endif
 
 endmenu
diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
index 847c00c..2021ce5 100644
--- a/drivers/fsi/Makefile
+++ b/drivers/fsi/Makefile
@@ -1,3 +1,4 @@
 
 obj-$(CONFIG_FSI) += fsi-core.o
 obj-$(CONFIG_FSI_MASTER_FAKE) += fsi-master-fake.o
+obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
new file mode 100644
index 0000000..a9ee36c
--- /dev/null
+++ b/drivers/fsi/fsi-master-gpio.c
@@ -0,0 +1,464 @@
+/*
+ * A FSI master controller, using a simple GPIO bit-banging interface
+ */
+
+#include <linux/platform_device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/module.h>
+#include <linux/delay.h>
+
+#include "fsi-master.h"
+
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
+struct fsi_master_gpio {
+	struct fsi_master	master;
+	struct gpio_desc	*gpio_clk;
+	struct gpio_desc	*gpio_data;
+	struct gpio_desc	*gpio_trans;	/* Voltage translator */
+	struct gpio_desc	*gpio_enable;	/* FSI enable */
+	struct gpio_desc	*gpio_mux;	/* Mux control */
+};
+
+#define to_fsi_master_gpio(m) container_of(m, struct fsi_master_gpio, master)
+
+struct fsi_gpio_msg {
+	uint64_t	msg;
+	uint8_t		bits;
+};
+
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
+		msg |= ~in_bit & 0x1;	/* Data is negative active */
+	}
+	cmd->msg = msg;
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
+		for (i = 0; i < FSI_GPIO_MTOE_COUNT; i++) {
+			serial_in(master, &response, 1);
+			resp = response.msg;
+			if (response.msg)
+				break;
+		}
+		if (i >= FSI_GPIO_MTOE_COUNT) {
+			dev_info(master->master.dev,
+				"Master time out waiting for response\n");
+			drain_response(master);
+			fsi_master_gpio_error(master, FSI_GPIO_MTOE);
+			return FSI_GPIO_MTOE;
+		}
+
+		/* Response received */
+		serial_in(master, &response, FSI_GPIO_MSG_ID_SIZE);
+		dev_info(master->master.dev, "cfam id:%d\n", (int)response.msg);
+		resp <<= FSI_GPIO_MSG_ID_SIZE;
+		resp |= response.msg;
+
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
+			serial_in(master, &response, bits_remaining);
+			resp <<= bits_remaining;
+			resp |= response.msg;
+			bits_received += bits_remaining;
+		}
+
+		/* Read in the crc and check it */
+		serial_in(master, &response, FSI_GPIO_CRC_SIZE);
+
+		crc_in = fsi_crc4(0, 1, 1);
+		crc_in = fsi_crc4(crc_in, resp, bits_received);
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
+	return FSI_GPIO_MAX_BUSY;
+}
+
+static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
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
+	crc = fsi_crc4(0, 1, 1);
+	crc = fsi_crc4(crc, msg_with_start, cmd->bits);
+	cmd->msg |= crc >> cmd->bits;
+	cmd->bits += FSI_GPIO_CRC_SIZE;
+}
+
+static int fsi_master_gpio_read(struct fsi_master *_master, int link,
+		uint8_t slave, uint32_t addr, void *val, size_t size)
+{
+	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+	struct fsi_gpio_msg cmd;
+
+	if (link != 0)
+		return -ENODEV;
+
+	build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
+	serial_out(master, &cmd);
+	echo_delay(master);
+
+	return poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
+}
+
+static int fsi_master_gpio_write(struct fsi_master *_master, int link,
+		uint8_t slave, uint32_t addr, const void *val, size_t size)
+{
+	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+	struct fsi_gpio_msg cmd;
+
+	if (link != 0)
+		return -ENODEV;
+
+	build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
+	serial_out(master, &cmd);
+	echo_delay(master);
+
+	return poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
+}
+
+/*
+ * Issue a break command on link
+ */
+static int fsi_master_gpio_break(struct fsi_master *_master, int link)
+{
+	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+
+	if (link != 0)
+		return -ENODEV;
+
+	set_sda_output(master, 0);
+	clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
+	sda_out(master, 1);
+	clock_toggle(master, FSI_BREAK_CLOCKS);
+	echo_delay(master);
+	sda_out(master, 0);
+	clock_toggle(master, FSI_POST_BREAK_CLOCKS);
+
+	/* Wait for logic reset to take effect */
+	udelay(200);
+
+	return 0;
+}
+
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
+static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
+{
+	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
+
+	if (link != 0)
+		return -ENODEV;
+
+	if (master->gpio_enable)
+		gpiod_set_value(master->gpio_enable, 1);
+
+	return 0;
+}
+
+static int fsi_master_gpio_probe(struct platform_device *pdev)
+{
+	struct fsi_master_gpio *master;
+	struct gpio_desc *gpio;
+
+	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
+	if (!master)
+		return -ENOMEM;
+
+	gpio = devm_gpiod_get(&pdev->dev, "fsi_clk", 0);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+	master->gpio_clk = gpio;
+
+	gpio = devm_gpiod_get(&pdev->dev, "fsi_data", 0);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+	master->gpio_data = gpio;
+
+	/* Optional pins */
+
+	gpio = devm_gpiod_get(&pdev->dev, "fsi_trans", 0);
+	if (!IS_ERR(gpio))
+		master->gpio_trans = gpio;
+
+	gpio = devm_gpiod_get(&pdev->dev, "fsi_enable", 0);
+	if (!IS_ERR(gpio))
+		master->gpio_enable = gpio;
+
+	gpio = devm_gpiod_get(&pdev->dev, "fsi_mux", 0);
+	if (!IS_ERR(gpio))
+		master->gpio_mux = gpio;
+
+	master->master.read = fsi_master_gpio_read;
+	master->master.write = fsi_master_gpio_write;
+	master->master.send_break = fsi_master_gpio_break;
+	master->master.link_enable = fsi_master_gpio_link_enable;
+
+	fsi_master_gpio_init(master);
+
+	return fsi_master_register(&master->master);
+}
+
+static const struct of_device_id fsi_master_gpio_match[] = {
+	{ .compatible = "ibm,fsi-master-gpio" },
+	{ },
+};
+
+static struct platform_driver fsi_master_gpio_driver = {
+	.driver = {
+		.name		= "fsi-master-gpio",
+		.of_match_table	= fsi_master_gpio_match,
+	},
+	.probe	= fsi_master_gpio_probe,
+};
+
+module_platform_driver(fsi_master_gpio_driver);
-- 
1.8.2.2
