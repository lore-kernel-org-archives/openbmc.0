Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3szrkm1VV5zDt62
 for <openbmc@lists.ozlabs.org>; Thu, 20 Oct 2016 12:26:56 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3szrkl5Nszz9s65;
 Thu, 20 Oct 2016 12:26:55 +1100 (AEDT)
Subject: Re: [PATCH linux v5 15/18] drivers/fsi: Add GPIO FSI master
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-16-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, Jeremy Kerr <jk@0zlabs.org>, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <7393b875-d655-a4ea-afd7-9368ca05d90b@ozlabs.org>
Date: Thu, 20 Oct 2016 09:26:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476918586-13475-16-git-send-email-christopher.lee.bostic@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 20 Oct 2016 01:26:56 -0000

Hi Chris,

> diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
> new file mode 100644
> index 0000000..4cb2c81
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
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
> +	enable-gpio = <&gpio 2>;
> +	trans-gpio = <&gpio 3>;
> +	mux-gpio = <&gpio 4>;
> +}

Looks good. Might be good to include descriptions for the
enable/trans/mux lines here.

We should also think about what we want to do for multiple links. There
are two main options here:

  - list them as separate masters in the DT (ie, two fsi-master nodes,
    completely independent); or

  - enable multiple GPIO descriptors in the gpio properties, eg:

    fsi-master {
	compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
	clk-gpios = <&gpio 0 &gpio 6>;
	data-gpios = <&gpio 1 &gpio 7>;
    }

    which describes a master with two links

If we use the latter case, we'd want the property name to be plural
(*-gpios) to indicate this.

> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> index 21619fd..1875313 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> @@ -167,6 +167,36 @@
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
>  };

Do we want to add a master node too?

> +static void set_clock(struct fsi_master_gpio *master)
> +{
> +	ndelay(FSI_GPIO_STD_DELAY);
> +	gpiod_set_value(master->gpio_clk, 1);
> +}
> +
> +static void clear_clock(struct fsi_master_gpio *master)
> +{
> +	ndelay(FSI_GPIO_STD_DELAY);
> +	gpiod_set_value(master->gpio_clk, 0);
> +}
> +
> +static void clock_toggle(struct fsi_master_gpio *master, int count)
> +{
> +	int i;
> +
> +	for (i = 0; i < count; i++) {
> +		clear_clock(master);
> +		set_clock(master);
> +	}
> +}

To me, this seems a bit awkward, since the set_clock and clear_clock
have their pre-delays, but are only used in one context (clock_toggle).
Perhaps this would be cleaner just doing the gpiod_set_value()s and
delays in clock_toggle would be cleaner?

> +
> +static int sda_in(struct fsi_master_gpio *master)
> +{
> +	return gpiod_get_value(master->gpio_data);
> +}
> +
> +static void sda_out(struct fsi_master_gpio *master, int value)
> +{
> +	gpiod_set_value(master->gpio_data, value);
> +	ndelay(FSI_GPIO_STD_DELAY);
> +}

So an output bit that changes sda will take twice as long? Won't the
delays in clock_toggle handle this?

> +
> +static void set_sda_input(struct fsi_master_gpio *master)
> +{
> +	gpiod_direction_input(master->gpio_data);
> +	if (master->gpio_trans)
> +		gpiod_direction_output(master->gpio_trans, 0);
> +}
> +static void set_sda_output(struct fsi_master_gpio *master,
> +				int value)
> +{
> +	gpiod_direction_output(master->gpio_data, value);
> +	if (master->gpio_trans)
> +		gpiod_direction_output(master->gpio_trans, 1);
> +}

Isn't trans always an output? Shouldn't we set the direction to output
once during init, and do gpiod_set_value() here?

> +
> +static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *cmd,
> +			uint8_t num_bits)
> +{
> +	uint8_t bit;
> +	uint64_t msg = 0;
> +	uint8_t in_bit = 0;
> +
> +	set_sda_input(master);
> +	cmd->bits = 0;
> +
> +	for (bit = 0; bit < num_bits; bit++) {
> +		clock_toggle(master, 1);
> +		in_bit = sda_in(master);
> +		cmd->bits++;
> +		msg <<= 1;
> +		msg |= ~in_bit & 0x1;	/* Data is negative active */
> +	}
> +	cmd->msg = msg;
> +}

You can shortcut all of the increments of ->num_bits (and initialisation
to zero) by just setting it to num_bits (probably after the for-loop,
where you set ->msg);

> +static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
> +			uint8_t size, void *data)
> +{
> +	int busy_count = 0, i;
> +	struct fsi_gpio_msg response, cmd;
> +	int bits_remaining = 0;
> +	uint64_t resp = 0;
> +	uint8_t bits_received = 1 + FSI_GPIO_MSG_ID_SIZE +
> +				FSI_GPIO_MSG_RESPID_SIZE;
> +	uint8_t crc_in;
> +
> +	do {
> +		for (i = 0; i < FSI_GPIO_MTOE_COUNT; i++) {
> +			serial_in(master, &response, 1);
> +			resp = response.msg;
> +			if (response.msg)
> +				break;
> +		}
> +		if (i >= FSI_GPIO_MTOE_COUNT) {
> +			dev_info(master->master.dev,
> +				"Master time out waiting for response\n");
> +			drain_response(master);
> +			fsi_master_gpio_error(master, FSI_GPIO_MTOE);
> +			return FSI_GPIO_MTOE;
> +		}
> +
> +		/* Response received */
> +		serial_in(master, &response, FSI_GPIO_MSG_ID_SIZE);
> +		dev_info(master->master.dev, "cfam id:%d\n", (int)response.msg);
> +		resp <<= FSI_GPIO_MSG_ID_SIZE;
> +		resp |= response.msg;
> +
> +		serial_in(master, &response, FSI_GPIO_MSG_RESPID_SIZE);
> +		dev_info(master->master.dev, "response id:%d\n",
> +				(int)response.msg);
> +		resp <<= FSI_GPIO_MSG_RESPID_SIZE;
> +		resp |= response.msg;

Those dev_info() calls are going to make things very noisy. For
printouts in non-error paths, use dev_dbg().

However, you have two serial_in() calls in the single path, can you
consolidate these?

> +
> +		switch (response.msg) {
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
> +			set_sda_output(master, 0);
> +			clock_toggle(master, FSI_GPIO_DPOLL_CLOCKS);
> +			cmd.msg = FSI_GPIO_CMD_DPOLL;
> +			cmd.bits = FSI_GPIO_CMD_DPOLL_SIZE;
> +			serial_out(master, &cmd);
> +			continue;
> +
> +		case FSI_GPIO_RESP_ERRA:
> +		case FSI_GPIO_RESP_ERRC:
> +			dev_info(master->master.dev, "ERR received: %d\n",
> +				(int)response.msg);
> +			drain_response(master);
> +			fsi_master_gpio_error(master, response.msg);
> +			return response.msg;
> +		}
> +
> +		/* Read in the data field if applicable */
> +		if (bits_remaining) {
> +			serial_in(master, &response, bits_remaining);
> +			resp <<= bits_remaining;
> +			resp |= response.msg;
> +			bits_received += bits_remaining;
> +		}
> +
> +		/* Read in the crc and check it */
> +		serial_in(master, &response, FSI_GPIO_CRC_SIZE);
> +
> +		crc_in = fsi_crc4(0, 1, 1);
> +		crc_in = fsi_crc4(crc_in, resp, bits_received);
> +		if (crc_in != response.msg) {
> +			/* CRC's don't match */
> +			dev_info(master->master.dev, "ERR response CRC\n");
> +			fsi_master_gpio_error(master, FSI_GPIO_CRC_INVAL);
> +			return FSI_GPIO_CRC_INVAL;
> +		}
> +		return 0;
> +
> +	} while (busy_count++ < FSI_GPIO_MAX_BUSY);
> +
> +	return FSI_GPIO_MAX_BUSY;
> +}

While you've explained the return values to me, it isn't obvious from
the code. From reading the poll_response:

 - we return 0 on success

 - we return 1 if we don't see a start bit (what's MTOE?)

 - we return 100 if we got 100 busy responses (after dpoll)

 - we return 2 or 3 if there was a checksum error on the slave

 - we return 5 if there was a checksum error on the master

Now, this *may* be okay if we were interpreting the return values within
this one file (although we'd want to change busy into something more in
line with the others), but this is returned directly to the fsi core
through the read & write callbacks.

Without any explicit definition of the return values, we'd expect a
standard kernel scheme (0 on success, negative errno (eg -EIO) on
failure), particularly on the master->read/write interface.

I assume you're going to handle the various return values as part
of the future error recovery changes, but we should at least (at this
stage) compress this into -EIO from the read/write callbacks (possibly
in the actual read/write implementations).

In future, when we have conditions that we can potentially recover from,
I'd suggest using an enum to represent the full set of errors, and
define this function to return that type. That allows us to describe the
possible set of errors to future developers, and allows the compiler to
warn us if we're not handling a particular case.

Until the error recovery code is added, we won't know what the best
strategy is - but in the meantime, we should stick to the
zero/negative-errno convention.

> +static int fsi_master_gpio_probe(struct platform_device *pdev)
> +{
> +	struct fsi_master_gpio *master;
> +	struct gpio_desc *gpio;
> +
> +	master = devm_kzalloc(&pdev->dev, sizeof(*master), GFP_KERNEL);
> +	if (!master)
> +		return -ENOMEM;
> +
> +	gpio = devm_gpiod_get(&pdev->dev, "fsi_clk", 0);

You've changed these unnecessarily; this name string is used to look up
the device tree property, not the pinctl descriptor.

Cheers,


Jeremy
