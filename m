Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stvy10cMRzDsrM
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 11:34:33 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3stvy04QW7z9svs;
 Wed, 12 Oct 2016 11:34:32 +1100 (AEDT)
Subject: Re: [PATCH linux v3 17/18] drivers/fsi: Add GPIO master functionality
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476222003-99697-18-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <337bc0ed-9f0c-afb3-d35d-3962ab7a17b7@ozlabs.org>
Date: Wed, 12 Oct 2016 08:34:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476222003-99697-18-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 00:34:33 -0000

Hi Chris,

> +static void add_crc(struct fsi_gpio_msg *cmd)
> +{
> +
> +}

I'll send you some code to help with implementing this...

> +
> +static void set_clock(struct fsi_master_gpio *master)
> +{
> +	/* This delay is required - do not remove */

We probably don't need these comments, as 'do not remove' applies to
most of the code here :)

> +static void set_sda_input(struct fsi_master_gpio *master)
> +{
> +	gpiod_direction_input(master->gpio_data);
> +	gpiod_direction_output(master->gpio_trans, 0);
> +}
> +
> +static void set_sda_output(struct fsi_master_gpio *master,
> +			   int value)
> +{
> +	gpiod_direction_output(master->gpio_data, value);
> +	gpiod_direction_output(master->gpio_trans, 1);
> +}

These should be conditional on gpio_trans != NULL.

> +static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *cmd)

Can we have the number of bits to receive a separate parameter? This
means we don't need a dual-use *cmd argument, and won't have subtle bugs
arise where a caller has not initialised it.

> +{
> +	uint8_t bit;
> +	uint64_t msg = 0;
> +	uint8_t in_bit = 0;
> +
> +	set_sda_input(master);
> +
> +	for (bit = 0; bit < cmd->bits; bit++) {
> +		clock_toggle(master, 1);
> +		in_bit = sda_in(master);
> +		msg |= in_bit;
> +		msg <<= 1;
> +	}

I think you want the shift before the |=, otherwise your last bit won't
be at the end of msg. More on that below though...

> +	cmd->msg = ~msg;		/*  Data is negative active */
> +}
> +
> +static void serial_out(struct fsi_master_gpio *master, struct fsi_gpio_msg *cmd)

Really minor: make *cmd a `const struct fsi_gpio_msg *`.

> +{
> +	uint8_t bit;
> +	uint64_t msg = ~cmd->msg;	/* Data is negative active */
> +	uint64_t sda_mask = 1;
> +	uint64_t last_bit = ~0;
> +
> +	set_sda_output(master, 0);
> +
> +	/* Send the start bit */
> +	sda_out(master, 1);
> +	clock_toggle(master, 1);
> +
> +	/* Send the message */
> +	for (bit = 0; bit < cmd->bits; bit++) {
> +		if (last_bit ^ (msg & sda_mask)) {
> +			sda_out(master, msg & sda_mask);
> +			last_bit = msg & sda_mask;
> +		}
> +		clock_toggle(master, 1);
> +		msg >>= 1;
> +	}
> +}

These functions seem incompatible.

serial_in clocks the least-significant-bit last, while serial_out clocks
the least-significant-bit first.

The comment on struct fsi_message is:

  /* Our structure for bit-wise message sending. We left-align this, so the
   * last bit sent is at the 0x1 mask position.
   */
  struct fsi_gpio_msg {
  	uint64_t	msg;
  	uint8_t		bits;
  };

- which (I think) matches the message layout described by the docs. If
we use that format, we'll need to clock the LSb *last*. We'll also need
to start sending from the appropriate bit in the uint64_t, as the bits
in msg are left-aligned (ie, messages shorter than 64 bits do not use
the least-significant-bits).

I'm happy if you'd prefer to change that to right-aligned if that makes
message construction easier, but we need to be consistent (and update
the comment to suit).

Also, you do `msg & sda_mask` three times in three lines there.

> +/*
> + * Store information on master errors so handler can detect and clean
> + * up the bus
> + */
> +static void fsi_master_gpio_error(struct fsi_master_gpio *master, int error)
> +{
> +
> +}

I know this is a todo, but where are you planning to 'store' this
information? Shouldn't errors just be returned immediately?

> +
> +static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
> +			uint8_t size, void *data)
> +{
> +	int busy_count = 0, i;
> +	struct fsi_gpio_msg response, cmd;
> +	int bits_remaining = 0;
> +
> +	do {
> +		response.msg = 0;
> +		response.bits = 1;
> +		for (i = 0; i < FSI_GPIO_MTOE_COUNT; i++) {
> +			serial_in(master, &response);
> +			if (response.msg)
> +				break;
> +		}
> +		if (unlikely(i >= FSI_GPIO_MTOE_COUNT)) {
> +			dev_info(master->master.dev,
> +				"Master time out waiting for response\n");
> +			drain_response(master);
> +			fsi_master_gpio_error(master, FSI_GPIO_MTOE);
> +			return FSI_GPIO_MTOE;
> +		}
> +
> +		/* Response received */
> +		response.msg = 0;
> +		response.bits = 2;
> +		serial_in(master, &response);
> +		dev_info(master->master.dev, "cfam id:%d\n", (int)response.msg);
> +
> +		response.msg = 0;
> +		response.bits = 2;
> +		serial_in(master, &response);
> +		dev_info(master->master.dev, "response id:%d\n",
> +							(int)response.msg);
> +
> +		switch (response.msg) {
> +		case FSI_GPIO_RESP_ACK:
> +			if (expected == FSI_GPIO_RESP_ACKD)
> +				bits_remaining = 8 * sizeof(size);
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
> +			response.msg = 0;
> +			response.bits = bits_remaining;
> +			serial_in(master, &response);
> +		}
> +
> +		/* Read in the crc and check it */
> +		response.msg = 0;
> +		response.bits = FSI_GPIO_CRC_SIZE;
> +		serial_in(master, &response);
> +
> +		/* todo: verify crc is correct, flag error if not */
> +
> +		return 0;
> +
> +	} while (busy_count++ < FSI_GPIO_MAX_BUSY);
> +
> +	return busy_count;
> +}
> +
> +static void build_command(struct fsi_gpio_msg *cmd, uint64_t mode,
> +			uint8_t slave, uint32_t addr, size_t size,
> +			const void *data)
> +{
> +	cmd->bits = FSI_GPIO_CMD_DFLT_LEN;
> +	cmd->msg = FSI_GPIO_CMD_DEFAULT;
> +	cmd->msg |= mode;
> +
> +	/* todo: handle more than just slave id 0 */
> +	cmd->msg &= ~FSI_GPIO_CMD_SLAVE_MASK;
> +
> +	cmd->msg |= (addr << FSI_GPIO_CMD_ADDR_SHIFT);
> +	if (size == sizeof(uint8_t)) {
> +		if (data)
> +			cmd->msg |=
> +				*((uint8_t *)data) >> FSI_GPIO_CMD_DATA_SHIFT;
> +	} else if (size == sizeof(uint16_t)) {
> +		cmd->msg |= FSI_GPIO_CMD_SIZE_16;
> +		if (data)
> +			cmd->msg |=
> +				*((uint16_t *)data) >> FSI_GPIO_CMD_DATA_SHIFT;
> +	} else {
> +		cmd->msg |= FSI_GPIO_CMD_SIZE_32;
> +		if (data)
> +			cmd->msg |=
> +				*((uint32_t *)data) >> FSI_GPIO_CMD_DATA_SHIFT;
> +	}
> +	if (mode == FSI_GPIO_CMD_WRITE)
> +		cmd->bits += (8 * size);
> +
> +	add_crc(cmd);
> +}
> +

The message construction will be dependent on the format of struct
fsi_msg, so this may need to be updated if that changes from the above
comments.

>  static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>  		uint8_t slave, uint32_t addr, void *val, size_t size)
>  {
>  	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
> +	struct fsi_gpio_msg cmd;
> +	int rc;
>  
>  	if (link != 0)
>  		return -ENODEV;
>  
> -	/* todo: format read into a message, send, poll for response */
> -	(void)master;
> +	/* Send the command */
> +	build_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
> +	serial_out(master, &cmd);
> +	echo_delay(master);
>  
> +	rc = poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
>  
> -	return 0;
> +	return rc;
>  }
>  
>  static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>  		uint8_t slave, uint32_t addr, const void *val, size_t size)
>  {
> +	int rc;
>  	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
> +	struct fsi_gpio_msg cmd;
>  
>  	if (link != 0)
>  		return -ENODEV;
>  
> -	/* todo: format write into a message, send, poll for response */
> -	(void)master;
> +	/* Send the command */
> +	build_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
> +	serial_out(master, &cmd);
> +	echo_delay(master);
>  
> -	return 0;
> +	rc = poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
> +
> +	return rc;
>  }
>  
>  /*
> @@ -58,14 +349,40 @@ static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>  static int fsi_master_gpio_break(struct fsi_master *_master, int link)
>  {
>  	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
> +	uint32_t smode;
> +	int rc;
>  
>  	if (link != 0)
>  		return -ENODEV;
>  
> -	/* todo: send the break pattern over gpio */
> -	(void)master;
> +	set_sda_output(master, 0);
> +	clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
>  
> -	return 0;
> +	sda_out(master, 1);
> +	clock_toggle(master, FSI_BREAK_CLOCKS);
> +
> +	echo_delay(master);
> +
> +	sda_out(master, 0);
> +	clock_toggle(master, FSI_POST_BREAK_CLOCKS);
> +
> +	udelay(200);		/* wait for logic reset to take effect */
> +	rc = _master->read(_master, link, 3, FSI_SLAVE_BASE + FSI_SMODE,
> +			&smode, sizeof(smode));

No need to use the callback, we know that this is a GPIO master.

> +	dev_info(_master->dev, "smode after break:%08x rc:%d\n", smode, rc);

Use dev_dbg() here. We don't want printk output for normal operations
for non-debug.

> +
> +	return rc;
> +}
> +
> +static void fsi_master_gpio_init(struct fsi_master_gpio *master)
> +{
> +	gpiod_direction_output(master->gpio_mux, 1);
> +	gpiod_direction_output(master->gpio_clk, 1);
> +	set_sda_output(master, 1);
> +	gpiod_direction_output(master->gpio_enable, 0);
> +
> +	/* todo: evaluate if clocks can be reduced */
> +	clock_toggle(master, FSI_INIT_CLOCKS);
>  }
>  
>  static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
> @@ -75,8 +392,7 @@ static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
>  	if (link != 0)
>  		return -ENODEV;
>  
> -	/* todo: set the enable pin */
> -	(void)master;
> +	gpiod_set_value(master->gpio_enable, 1);
>  
>  	return 0;
>  }
> @@ -100,11 +416,28 @@ static int fsi_master_gpio_probe(struct platform_device *pdev)
>  		return PTR_ERR(gpio);
>  	master->gpio_data = gpio;
>  
> +	gpio = devm_gpiod_get(&pdev->dev, "trans", 0);
> +	if (IS_ERR(gpio))
> +		return PTR_ERR(gpio);
> +	master->gpio_trans = gpio;
> +
> +	gpio = devm_gpiod_get(&pdev->dev, "enable", 0);
> +	if (IS_ERR(gpio))
> +		return PTR_ERR(gpio);
> +	master->gpio_enable = gpio;
> +
> +	gpio = devm_gpiod_get(&pdev->dev, "mux", 0);
> +	if (IS_ERR(gpio))
> +		return PTR_ERR(gpio);
> +	master->gpio_mux = gpio;
> +

trans, enable and mux should be optional, right?

Cheers,


Jeremy
