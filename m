Return-Path: <alistair@popple.id.au>
Received: from ipmail04.adl6.internode.on.net (ipmail04.adl6.internode.on.net
 [150.101.137.141])
 by lists.ozlabs.org (Postfix) with ESMTP id 3t7vRW6j4hzDvNL
 for <openbmc@lists.ozlabs.org>; Wed,  2 Nov 2016 14:56:39 +1100 (AEDT)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqMDAD1jGVh6Y1IKfWdsb2JhbABdHAEBBAEBCgEBgyoBAQEBAYFzhSafEodfileEFoYiAoJhAQIBAQEBAQITAQEWLzCEYQEBAQQaDRM/EAsVAwkVEA8BETYZiDoDFrRWDYNzAQsBJIoNgQWCR4FILQuFYAWISYYIhW6FKTWJPINLhBiBB4gphXCIeYQehASBJgYIgyUcgWcqNAGGL4IsAQEB
Received: from static-82-10.transact.net.au (HELO new-mexico.localnet)
 ([122.99.82.10])
 by ipmail04.adl6.internode.on.net with ESMTP; 02 Nov 2016 14:26:38 +1030
From: Alistair Popple <alistair@popple.id.au>
To: openbmc@lists.ozlabs.org
Cc: christopher.lee.bostic@gmail.com, xxpetri@de.ibm.com, zahrens@us.ibm.com
Subject: Re: [PATCH linux v6 16/18] drivers/fsi: Add GPIO FSI master
Date: Wed, 02 Nov 2016 14:56:36 +1100
Message-ID: <18026870.5nYqgMY5eM@new-mexico>
User-Agent: KMail/4.14.1 (Linux/4.2.0-0.bpo.1-amd64; KDE/4.14.2; x86_64; ; )
In-Reply-To: <1477865379-11566-17-git-send-email-christopher.lee.bostic@gmail.com>
References: <1477865379-11566-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1477865379-11566-17-git-send-email-christopher.lee.bostic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
X-List-Received-Date: Wed, 02 Nov 2016 03:56:40 -0000

Comments below.

On Sun, 30 Oct 2016 05:09:18 PM christopher.lee.bostic@gmail.com wrote:
> From: Chris Bostic <cbostic@us.ibm.com>
> 
> Implement a FSI master using GPIO.  Will generate FSI protocol for
> read and write commands to particular addresses.  Sends master command
> and waits for and decodes a slave response.  Includes Jeremy Kerr's
> original GPIO master base commit.
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> 
> ---
> 
> V3 - Added remainder of base I/O ops (excluding dev tree and crc calcs).
> 
>    - Add encoding of all read/write commands and send data over sda
> 
>    - Check for and decode response from slave.
> 
>    - Add set enable pin in master->link_enable() master specific function.
> 
> V4 - Remove unnecessary comments about delays in various locations
> 
>    - Define non clock and data pins as optional and check for gpio
>      descriptors == NULL before accessing.  Don't return error if
>      optional pins cannot be retrieved via devm.
> 
>    - serial_in: rearrange order of msg shift and input bit OR op.
> 
>    - serial_out: Fix mirror image issue on shift data out and set
>      data out as necessary for bit count to be sent.
> 
>    - serial_out: make message parm a const
> 
>    - serial_out: fix 3x 'msg & data' repeat
> 
>    - poll_for_response: bits remaining was calculated with
>      sizeof(size) should be size.
> 
>    - fsi_master_gpio_break: remove smode read
> 
>    - Replace dev_info with dev_dbg in proper places.
> 
>    - Add a bit count parm to serial_in, increment msg->bits
>      on every bit received.
> 
>    - Remove magic numbers in poll_for_response that indicate
>      how many bits to receive
> 
>    - Utilize the crc utilities to check input data and set
>      crc for output data
> 
>    - Remove add_crc stub
> 
> V5 - Rename pins from generic 'clk', 'data', etc in dts file to
>      'fsi_clk', 'fsi_data', etc...
> 
>    - serial_in: invert data bit during message assembly
>      instead of inverting whole message after assembly.
> 
>    - Remove all instances of clearing out message field prior
>      to calling serial_in, redundant.
> 
>    - Change name of build_command() to build_abs_ar_command()
>      to make it more obvious its creating ABS AR type commands.
> 
>    - Remove unlikely( ) checks.
> 
>    - Indent dev_info string "master time out waiting for response"
> 
>    - poll_for_response: return FSI_GPIO_MAX busy instead of
>      busy_count.
> 
>    - fsi_master_gpio_break: move 'logic reset' comment to above
>      the delay call.
> 
>    - Add crc4 calculation initialization since data includes
>      a start bit.
> 
> V6 - Invert polarity of SDA line for start bit, echo delay, pre-
>      D-POLL clocking, break command sequence (pre, during, post).
> 
>    - Add echo delay after sending D-POLL
> 
>    - Fill in user read data with received read data response
> 
>    - Clock the slave after each command completes to prime it
>      for another operation
> 
>    - Increase D-POLL checks on BUSY response before flagging
>      error
> 
>    - Add Alistair's crc calculator from pdbg.  Having issues
>      with the existing one.
> 
>    - Revert V5 changes to rename gpio pin names.
> 
>    - Return -EIO on all bus errors
> 
>    - Condense slave id and response id into one serial-in
>      operation
> 
>    - Change D-POLL command to accommodate right alignment
> 
>    - Remove all dev_info( ) calls to reduce spam
> 
>    - serial_in  remove cmd->bits = 0 / cmd->bits++ in for
>      loop.  Just set value at end.
> 
>    - Change v translator line to direction output once
>      during init and use gpiod_set_value thereafter
> 
>    - Remove set/clear clocks and do it all in clock_toggle
> 
>    - Fill in slave id when encoding commands.  Right align
>      the command prior to serializing out.
> 
>    - gpio master defines number of links to 1, was undefined.
> ---
>  .../devicetree/bindings/fsi-master-gpio.txt        |  21 +
>  .../devicetree/bindings/fsi/fsi-master-gpio.txt    |  21 +
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts      |  36 ++
>  drivers/fsi/Kconfig                                |   6 +
>  drivers/fsi/Makefile                               |   1 +
>  drivers/fsi/fsi-master-gpio.c                      | 522 
+++++++++++++++++++++
>  6 files changed, 607 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi-master-gpio.txt
>  create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-
gpio.txt
>  create mode 100644 drivers/fsi/fsi-master-gpio.c
> 
> diff --git a/Documentation/devicetree/bindings/fsi-master-gpio.txt 
b/Documentation/devicetree/bindings/fsi-master-gpio.txt
> new file mode 100644
> index 0000000..d46be27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi-master-gpio.txt
> @@ -0,0 +1,21 @@
> +Device-tree bindings for gpio-based FSI master driver
> +-----------------------------------------------------
> +
> +Required properties:
> +	- compatible = "ibm,fsi-master-gpio";
> +	- clk-gpio;
> +	- data-gpio;
> +
> +Optional properties:
> +	- enable-gpio;
> +	- trans-gpio;
> +	- mux-gpio;
> +
> +fsi-master {
> +	compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
> +	clk-gpio = <&gpio 0>;
> +	data-gpio = <&gpio 1>;
> +	enable-gpio = <&gpio 2>;	/* Enable FSI data in/out */
> +	trans-gpio = <&gpio 3>;		/* Voltage translator direction */
> +	mux-gpio = <&gpio 4>;		/* Multiplexer for FSI pins */
> +}
> diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt 
b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
> new file mode 100644
> index 0000000..ff3a62e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
> @@ -0,0 +1,21 @@
> +Device-tree bindings for gpio-based FSI master driver
> +-----------------------------------------------------
> +
> +Required properties:
> +	- compatible = "ibm,fsi-master-gpio";
> +	- clk-gpios;
> +	- data-gpios;
> +
> +Optional properties:
> +	- enable-gpios;
> +	- trans-gpios;
> +	- mux-gpios;
> +
> +fsi-master {
> +	compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
> +	clk-gpios = <&gpio 0 &gpio 6>;
> +	data-gpios = <&gpio 1 &gpio 7>;
> +	enable-gpios = <&gpio 2 &gpio 8>;	/* Enable FSI data in/out */
> +	trans-gpios = <&gpio 3 &gpio 9>;	/* Volts translator direction 
*/
> +	mux-gpios = <&gpio 4> &gpio 10>;	/* Multiplexer for FSI pins */
> +}
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts 
b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index 21619fd..9d9c2a9 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -167,6 +167,42 @@
>  		output-low;
>  		line-name = "func_mode2";
>  	};
> +
> +	pin_fsi_clk {
> +		gpios = <ASPEED_GPIO(A, 4)  GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "fsi_clk";
> +	};
> +
> +	pin_fsi_data {
> +		gpios = <ASPEED_GPIO(A, 5)  GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "fsi_data";
> +	};
> +
> +	pin_fsi_trans {
> +		gpios = <ASPEED_GPIO(H, 6)  GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "fsi_trans";
> +	};
> +
> +	pin_fsi_enable {
> +		gpios = <ASPEED_GPIO(D, 0)  GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "fsi_enable";
> +	};
> +
> +	pin_fsi_mux {
> +		gpios = <ASPEED_GPIO(A, 6)  GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "fsi_mux";
> +	};
> +
> +	fsi_master {
> +		compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
> +		clk-gpios = <&gpio 0 &gpio 6>;
> +		data-gpios = <&gpio 1 &gpio 7>;
> +	};
>  };
>  
>  &vuart {
> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
> index f065dbe..b21fe3c 100644
> --- a/drivers/fsi/Kconfig
> +++ b/drivers/fsi/Kconfig
> @@ -17,6 +17,12 @@ config FSI_MASTER_FAKE
>  	depends on FSI
>  	---help---
>  	This option enables a fake FSI master driver for debugging.
> +
> +config FSI_MASTER_GPIO
> +	tristate "GPIO-based FSI master"
> +	depends on FSI
> +	---help---
> +	This option enables a FSI master driver using GPIO lines.
>  endif
>  
>  endmenu
> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
> index 847c00c..2021ce5 100644
> --- a/drivers/fsi/Makefile
> +++ b/drivers/fsi/Makefile
> @@ -1,3 +1,4 @@
>  
>  obj-$(CONFIG_FSI) += fsi-core.o
>  obj-$(CONFIG_FSI_MASTER_FAKE) += fsi-master-fake.o
> +obj-$(CONFIG_FSI_MASTER_GPIO) += fsi-master-gpio.o
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> new file mode 100644
> index 0000000..175281a
> --- /dev/null
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -0,0 +1,522 @@
> +/*
> + * A FSI master controller, using a simple GPIO bit-banging interface
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/fsi.h>
> +
> +#include "fsi-master.h"
> +
> +#define	FSI_GPIO_STD_DLY	1	/* Standard pin delay in nS */
> +#define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for echo 
delay */
> +#define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep for 
break */
> +#define	FSI_BREAK_CLOCKS	256	/* Number of clocks to issue 
break */
> +#define	FSI_POST_BREAK_CLOCKS	16000	/* Number clocks to set up 
cfam */
> +#define	FSI_INIT_CLOCKS		5000	/* Clock out any old data */
> +#define	FSI_GPIO_STD_DELAY	10	/* Standard GPIO delay in nS 
*/
> +					/* todo: adjust down as low as */
> +					/* possible or eliminate */
> +#define	FSI_GPIO_CMD_DPOLL	0x000000000000002AULL
> +#define	FSI_GPIO_CMD_DPOLL_SIZE	9
> +#define	FSI_GPIO_DPOLL_CLOCKS	100      /* < 21 will cause slave to 
hang */
> +#define	FSI_GPIO_CMD_DEFAULT	0x2000000000000000ULL
> +#define	FSI_GPIO_CMD_WRITE	0
> +#define	FSI_GPIO_CMD_READ	0x0400000000000000ULL
> +#define	FSI_GPIO_CMD_SLAVE_MASK	0xC000000000000000ULL
> +#define	FSI_GPIO_CMD_ADDR_SHIFT	37
> +#define	FSI_GPIO_CMD_SLV_SHIFT	62
> +#define	FSI_GPIO_CMD_SIZE_16	0x0000001000000000ULL
> +#define	FSI_GPIO_CMD_SIZE_32	0x0000003000000000ULL
> +#define	FSI_GPIO_CMD_DT32_SHIFT	4
> +#define	FSI_GPIO_CMD_DT16_SHIFT	20
> +#define	FSI_GPIO_CMD_DT8_SHIFT	28
> +#define	FSI_GPIO_CMD_DFLT_LEN	28
> +#define	FSI_GPIO_CMD_CRC_SHIFT	60
> +
> +/* Bus errors */
> +#define	FSI_GPIO_ERR_BUSY	1	/* Slave stuck in busy state 
*/
> +#define	FSI_GPIO_RESP_ERRA	2	/* Any (misc) Error */
> +#define	FSI_GPIO_RESP_ERRC	3	/* Slave reports master CRC 
error */
> +#define	FSI_GPIO_MTOE		4	/* Master time out error */
> +#define	FSI_GPIO_CRC_INVAL	5	/* Master reports slave CRC 
error */
> +
> +/* Normal slave responses */
> +#define	FSI_GPIO_RESP_BUSY	1
> +#define	FSI_GPIO_RESP_ACK	0
> +#define	FSI_GPIO_RESP_ACKD	4
> +
> +#define	FSI_GPIO_MAX_BUSY	100
> +#define	FSI_GPIO_MTOE_COUNT	1000
> +#define	FSI_GPIO_DRAIN_BITS	20
> +#define	FSI_GPIO_CRC_SIZE	4
> +#define	FSI_GPIO_MSG_ID_SIZE		2
> +#define	FSI_GPIO_MSG_RESPID_SIZE	2
> +#define	FSI_GPIO_PRIME_SLAVE_CLOCKS	100
> +
> +struct fsi_master_gpio {
> +	struct fsi_master	master;
> +	struct gpio_desc	*gpio_clk;
> +	struct gpio_desc	*gpio_data;
> +	struct gpio_desc	*gpio_trans;	/* Voltage translator */
> +	struct gpio_desc	*gpio_enable;	/* FSI enable */
> +	struct gpio_desc	*gpio_mux;	/* Mux control */
> +};
> +
> +#define to_fsi_master_gpio(m) container_of(m, struct fsi_master_gpio, 
master)
> +
> +struct fsi_gpio_msg {
> +	uint64_t	msg;
> +	uint8_t		bits;
> +};
> +
> +static void clock_toggle(struct fsi_master_gpio *master, int count)
> +{
> +	int i;
> +
> +	for (i = 0; i < count; i++) {
> +		ndelay(FSI_GPIO_STD_DLY);
> +		gpiod_set_value(master->gpio_clk, 0);
> +		ndelay(FSI_GPIO_STD_DLY);
> +		gpiod_set_value(master->gpio_clk, 1);
> +	}
> +}
> +
> +static int sda_in(struct fsi_master_gpio *master)
> +{
> +	ndelay(FSI_GPIO_STD_DLY);
> +	return gpiod_get_value(master->gpio_data);
> +}
> +
> +static void sda_out(struct fsi_master_gpio *master, int value)
> +{
> +	gpiod_set_value(master->gpio_data, value);
> +}
> +
> +static void set_sda_input(struct fsi_master_gpio *master)
> +{
> +	gpiod_direction_input(master->gpio_data);
> +	if (master->gpio_trans)
> +		gpiod_set_value(master->gpio_trans, 0);
> +}
> +
> +static void set_sda_output(struct fsi_master_gpio *master, int value)
> +{
> +	gpiod_direction_output(master->gpio_data, value);
> +	if (master->gpio_trans)
> +		gpiod_set_value(master->gpio_trans, 1);
> +}
> +
> +static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg 
*cmd,
> +			uint8_t num_bits)
> +{
> +	uint8_t bit;
> +	uint64_t msg = 0;
> +	uint8_t in_bit = 0;
> +
> +	set_sda_input(master);
> +
> +	for (bit = 0; bit < num_bits; bit++) {
> +		clock_toggle(master, 1);
> +		in_bit = sda_in(master);
> +		msg <<= 1;
> +		msg |= ~in_bit & 0x1;	/* Data is negative active */
> +	}
> +	cmd->bits = num_bits;
> +	cmd->msg = msg;
> +}
> +
> +static void serial_out(struct fsi_master_gpio *master,
> +			const struct fsi_gpio_msg *cmd)
> +{
> +	uint8_t bit;
> +	uint64_t msg = ~cmd->msg;	/* Data is negative active */
> +	uint64_t sda_mask = 0x1ULL << (cmd->bits - 1);
> +	uint64_t last_bit = ~0;
> +	int next_bit;
> +
> +	if (!cmd->bits) {
> +		dev_warn(master->master.dev, "trying to output 0 bits\n");
> +		return;
> +	}
> +	set_sda_output(master, 0);
> +
> +	/* Send the start bit */
> +	sda_out(master, 0);
> +	clock_toggle(master, 1);
> +
> +	/* Send the message */
> +	for (bit = 0; bit < cmd->bits; bit++) {
> +		next_bit = (msg & sda_mask) >> (cmd->bits - 1);
> +		if (last_bit ^ next_bit) {
> +			sda_out(master, next_bit);
> +			last_bit = next_bit;
> +		}
> +		clock_toggle(master, 1);
> +		msg <<= 1;
> +	}
> +}
> +
> +/*
> + * Clock out some 0's after every message to ride out line reflections
> + */
> +static void echo_delay(struct fsi_master_gpio *master)
> +{
> +	set_sda_output(master, 1);
> +	clock_toggle(master, FSI_ECHO_DELAY_CLOCKS);
> +}
> +
> +/*
> + * Used in bus error cases only.  Clears out any remaining data the slave
> + * is attempting to send
> + */
> +static void drain_response(struct fsi_master_gpio *master)
> +{
> +	struct fsi_gpio_msg msg;
> +
> +	serial_in(master, &msg, FSI_GPIO_DRAIN_BITS);
> +}
> +
> +/*
> + * Store information on master errors so handler can detect and clean
> + * up the bus
> + */
> +static void fsi_master_gpio_error(struct fsi_master_gpio *master, int 
error)
> +{
> +
> +}
> +
> +/*
> + * Taken from Alistaire's PDBG
> + */
> +static uint8_t crc4(uint8_t c, int b)
> +{
> +	uint8_t m = 0;
> +
> +	c &= 0xf;
> +	m = b ^ ((c >> 3) & 0x1);
> +	m = (m << 2) | (m << 1) | (m);
> +	c <<= 1;
> +	c ^= m;
> +
> +	return c & 0xf;
> +}
> +
> +static int poll_for_response(struct fsi_master_gpio *master, uint8_t 
expected,
> +			uint8_t size, void *data)
> +{
> +	int busy_count = 0, i;
> +	struct fsi_gpio_msg response, cmd;
> +	int bits_remaining = 0, bit_count, response_id, id;
> +	uint64_t resp = 0;
> +	uint8_t bits_received = FSI_GPIO_MSG_ID_SIZE +
> +				FSI_GPIO_MSG_RESPID_SIZE;
> +	uint8_t crc_in;
> +
> +	do {
> +		for (i = 0; i < FSI_GPIO_MTOE_COUNT; i++) {
> +			serial_in(master, &response, 1);
> +			if (response.msg)
> +				break;
> +		}
> +		if (i >= FSI_GPIO_MTOE_COUNT) {
> +			dev_dbg(master->master.dev,
> +				"Master time out waiting for response\n");
> +			drain_response(master);
> +			fsi_master_gpio_error(master, FSI_GPIO_MTOE);
> +			return -EIO;
> +		}
> +
> +		/* Response received */
> +		bit_count = FSI_GPIO_MSG_ID_SIZE + FSI_GPIO_MSG_RESPID_SIZE;
> +		serial_in(master, &response, bit_count);
> +
> +		response_id = response.msg & 0x3;
> +		id = (response.msg >> FSI_GPIO_MSG_RESPID_SIZE) & 0x3;
> +		dev_dbg(master->master.dev, "id:%d resp:%d\n", id, 
response_id);
> +
> +		resp = response.msg;
> +
> +		switch (response_id) {
> +		case FSI_GPIO_RESP_ACK:
> +			if (expected == FSI_GPIO_RESP_ACKD)
> +				bits_remaining = 8 * size;
> +			break;
> +
> +		case FSI_GPIO_RESP_BUSY:
> +			/*
> +			 * Its necessary to clock slave before issuing
> +			 * d-poll, not indicated in the hardware protocol
> +			 * spec. < 20 clocks causes slave to hang, 21 ok.
> +			 */

Interesting. Have HW folk confirmed this? I've encountered similar issues on 
occasion, so it would be good to get confirmation that we need a minimum of 20 
slave clocks prior to sending a d-poll.

> +			set_sda_output(master, 1);
> +			clock_toggle(master, FSI_GPIO_DPOLL_CLOCKS);
> +			cmd.msg = FSI_GPIO_CMD_DPOLL;
> +			cmd.bits = FSI_GPIO_CMD_DPOLL_SIZE;
> +			serial_out(master, &cmd);
> +			echo_delay(master);
> +			continue;
> +
> +		case FSI_GPIO_RESP_ERRA:
> +		case FSI_GPIO_RESP_ERRC:
> +			dev_dbg(master->master.dev, "ERR received: %d\n",
> +				(int)response.msg);
> +			drain_response(master);

Why do we have to call drain_response() for an error code? Isn't ERRA/C a well 
defined bit sequence?

> +			fsi_master_gpio_error(master, response.msg);
> +			return -EIO;
> +		}
> +
> +		/* Read in the data field if applicable */
> +		if (bits_remaining) {
> +			serial_in(master, &response, bits_remaining);
> +			resp <<= bits_remaining;
> +			resp |= response.msg;
> +			bits_received += bits_remaining;
> +			*((uint32_t *)data) = response.msg;
> +		}
> +
> +		/* Include start bit */
> +		crc_in = crc4(0, 1);
> +		for (i = bits_received - 1; i >= 0; i--)
> +			crc_in = crc4(crc_in, !!(resp & (1ULL << i)));
> +
> +		/* Read in the crc and check it */
> +		serial_in(master, &response, FSI_GPIO_CRC_SIZE);
> +		if (crc_in != response.msg) {
> +
> +			/* CRC's don't match - warn for now */
> +			dev_dbg(master->master.dev, "ERR response CRC\n");
> +			fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
> +		}
> +		/* Clock the slave enough to be ready for next operation */
> +		clock_toggle(master, FSI_GPIO_PRIME_SLAVE_CLOCKS);
> +		return 0;
> +
> +	} while (busy_count++ < FSI_GPIO_MAX_BUSY);
> +
> +	dev_dbg(master->master.dev, "ERR slave is stuck in busy state\n");
> +	fsi_master_gpio_error(master, FSI_GPIO_ERR_BUSY);
> +
> +	return -EIO;
> +}
> +
> +static void build_abs_ar_command(struct fsi_gpio_msg *cmd, uint64_t mode,
> +		uint8_t slave, uint32_t addr, size_t size,
> +		const void *data)
> +{
> +	uint8_t crc;
> +	int i;
> +
> +	cmd->bits = FSI_GPIO_CMD_DFLT_LEN;
> +	cmd->msg = FSI_GPIO_CMD_DEFAULT;
> +	cmd->msg |= mode;
> +
> +	/* todo: handle more than just slave id 0 */

This should be easily fixed and is needed to get the full 23-bit FSI address 
space. For P8 at least I think you just use addr bits 22 & 23 as the slave id. 

> +	cmd->msg &= ~FSI_GPIO_CMD_SLAVE_MASK;
> +	cmd->msg |= (((uint64_t)slave) << FSI_GPIO_CMD_SLV_SHIFT);
> +	cmd->msg |= (((uint64_t)addr) << FSI_GPIO_CMD_ADDR_SHIFT);

Wouldn't it be best to apply a mask to addr limiting it to 21-bits? Or a check 
to ensure addr <= (1<<23) - 1. Otherwise wont invalid addresses result in 
invalid commands and/or errors as a result?

> +	if (size == sizeof(uint8_t)) {
> +		if (data) {
> +			uint8_t cmd_data = *((uint8_t *)data);
> +
> +			cmd->msg |=
> +				((uint64_t)cmd_data) << 
FSI_GPIO_CMD_DT8_SHIFT;
> +		}
> +	} else if (size == sizeof(uint16_t)) {
> +		cmd->msg |= FSI_GPIO_CMD_SIZE_16;
> +		if (data) {
> +			uint16_t cmd_data = *((uint16_t *)data);

It might be best to do a memcpy here or make *data a uint64_t *. There is no 
guarantee that *data has the correct alignment which from memory will result 
in a data abort fault/exception to fix-up the alignment on ARMv5 and below 
(ie. AST2400).

> +			cmd->msg |=
> +				((uint64_t)cmd_data) << 
FSI_GPIO_CMD_DT16_SHIFT;
> +		}
> +	} else {
> +		cmd->msg |= FSI_GPIO_CMD_SIZE_32;
> +		if (data) {
> +			uint32_t cmd_data = *((uint32_t *)data);

Ditto.

> +			cmd->msg |=
> +				((uint64_t)cmd_data) << 
FSI_GPIO_CMD_DT32_SHIFT;
> +		}
> +	}
> +
> +	if (mode == FSI_GPIO_CMD_WRITE)
> +		cmd->bits += (8 * size);
> +
> +	/* Include start bit */
> +	crc = crc4(0, 1);
> +	for (i = 63; i >= (64 - cmd->bits); i--)
> +		crc = crc4(crc, !!(cmd->msg & (1ULL << i)));
> +
> +	cmd->msg |= ((uint64_t)crc) << (FSI_GPIO_CMD_CRC_SHIFT - cmd->bits);
> +	cmd->bits += FSI_GPIO_CRC_SIZE;
> +
> +	/* Right align message */
> +	cmd->msg >>= (64 - cmd->bits);
> +}
> +
> +static int fsi_master_gpio_read(struct fsi_master *_master, int link,
> +		uint8_t slave, uint32_t addr, void *val, size_t size)
> +{
> +	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
> +	struct fsi_gpio_msg cmd;
> +
> +	if (link != 0)
> +		return -ENODEV;
> +
> +	build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, 
NULL);
> +	serial_out(master, &cmd);
> +	echo_delay(master);
> +
> +	return poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
> +}
> +
> +static int fsi_master_gpio_write(struct fsi_master *_master, int link,
> +		uint8_t slave, uint32_t addr, const void *val, size_t size)
> +{
> +	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
> +	struct fsi_gpio_msg cmd;
> +
> +	if (link != 0)
> +		return -ENODEV;
> +
> +	build_abs_ar_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, 
val);
> +	serial_out(master, &cmd);
> +	echo_delay(master);
> +
> +	return poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
> +}
> +
> +/*
> + * Issue a break command on link
> + */
> +static int fsi_master_gpio_break(struct fsi_master *_master, int link)
> +{
> +	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
> +
> +	if (link != 0)
> +		return -ENODEV;
> +
> +	set_sda_output(master, 1);
> +	clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
> +	sda_out(master, 0);
> +	clock_toggle(master, FSI_BREAK_CLOCKS);
> +	echo_delay(master);
> +	sda_out(master, 1);
> +	clock_toggle(master, FSI_POST_BREAK_CLOCKS);
> +
> +	/* Wait for logic reset to take effect */
> +	udelay(200);
> +
> +	return 0;
> +}
> +
> +static void fsi_master_gpio_init(struct fsi_master_gpio *master)
> +{
> +	if (master->gpio_mux)
> +		gpiod_direction_output(master->gpio_mux, 1);
> +	if (master->gpio_trans)
> +		gpiod_direction_output(master->gpio_trans, 1);
> +	if (master->gpio_enable)
> +		gpiod_direction_output(master->gpio_enable, 0);
> +	gpiod_direction_output(master->gpio_clk, 1);
> +	gpiod_direction_output(master->gpio_data, 1);
> +
> +	/* todo: evaluate if clocks can be reduced */
> +	clock_toggle(master, FSI_INIT_CLOCKS);
> +}
> +
> +static int fsi_master_gpio_link_enable(struct fsi_master *_master, int 
link)
> +{
> +	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
> +
> +	if (link != 0)
> +		return -ENODEV;
> +
> +	if (master->gpio_enable)
> +		gpiod_set_value(master->gpio_enable, 1);
> +
> +	return 0;
> +}
> +
> +static int fsi_master_gpio_probe(struct platform_device *pdev)
> +{
> +	struct fsi_master_gpio *master;
> +	struct gpio_desc *gpio;
> +
> +	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
> +	if (!master)
> +		return -ENOMEM;
> +
> +	gpio = devm_gpiod_get(&pdev->dev, "clock", 0);
> +	if (IS_ERR(gpio))
> +		return PTR_ERR(gpio);
> +	master->gpio_clk = gpio;
> +
> +	gpio = devm_gpiod_get(&pdev->dev, "data", 0);
> +	if (IS_ERR(gpio))
> +		return PTR_ERR(gpio);
> +	master->gpio_data = gpio;
> +
> +	/* Optional pins */
> +
> +	gpio = devm_gpiod_get(&pdev->dev, "trans", 0);
> +	if (!IS_ERR(gpio))
> +		master->gpio_trans = gpio;
> +
> +	gpio = devm_gpiod_get(&pdev->dev, "enable", 0);
> +	if (!IS_ERR(gpio))
> +		master->gpio_enable = gpio;
> +
> +	gpio = devm_gpiod_get(&pdev->dev, "mux", 0);
> +	if (!IS_ERR(gpio))
> +		master->gpio_mux = gpio;
> +
> +	master->master.n_links = 1;
> +	master->master.read = fsi_master_gpio_read;
> +	master->master.write = fsi_master_gpio_write;
> +	master->master.send_break = fsi_master_gpio_break;
> +	master->master.link_enable = fsi_master_gpio_link_enable;
> +
> +	fsi_master_gpio_init(master);
> +
> +	platform_set_drvdata(pdev, master);
> +	return fsi_master_register(&master->master);
> +}
> +
> +static int fsi_master_gpio_remove(struct platform_device *pdev)
> +{
> +	struct fsi_master_gpio *master = platform_get_drvdata(pdev);
> +
> +	devm_gpiod_put(&pdev->dev, master->gpio_clk);
> +	devm_gpiod_put(&pdev->dev, master->gpio_data);
> +	if (master->gpio_trans)
> +		devm_gpiod_put(&pdev->dev, master->gpio_trans);
> +	if (master->gpio_enable)
> +		devm_gpiod_put(&pdev->dev, master->gpio_enable);
> +	if (master->gpio_mux)
> +		devm_gpiod_put(&pdev->dev, master->gpio_mux);
> +
> +	fsi_master_unregister(&master->master);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id fsi_master_gpio_match[] = {
> +	{ .compatible = "ibm,fsi-master-gpio" },
> +	{ },
> +};
> +
> +static struct platform_driver fsi_master_gpio_driver = {
> +	.driver = {
> +		.name		= "fsi-master-gpio",
> +		.of_match_table	= fsi_master_gpio_match,
> +	},
> +	.probe	= fsi_master_gpio_probe,
> +	.remove = fsi_master_gpio_remove,
> +};
> +
> +module_platform_driver(fsi_master_gpio_driver);
> +MODULE_LICENSE("GPL");
> 
