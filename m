Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sy8v20LdDzDvHy
 for <openbmc@lists.ozlabs.org>; Mon, 17 Oct 2016 18:28:14 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sy8v14CXxz9s8x;
 Mon, 17 Oct 2016 18:28:13 +1100 (AEDT)
Subject: Re: [PATCH linux v4 18/20] drivers/fsi: Add GPIO FSI master
 functionality
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476483282-85971-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476483282-85971-19-git-send-email-christopher.lee.bostic@gmail.com>
From: Jeremy Kerr <jk@ozlabs.org>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
Message-ID: <9b23c5de-57bb-d7ed-172b-2b647fb23429@ozlabs.org>
Date: Mon, 17 Oct 2016 15:28:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476483282-85971-19-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 07:28:14 -0000

Hi Chris,

> +
> +	pin_clk {
> +		gpios = <ASPEED_GPIO(A, 4)  GPIO_ACTIVE_HIGH>;
> +		output-low;
> +		line-name = "clk";

The names "clk", "data", "trans", "enable" and "mux" are super generic,
and could apply to any of the other bajillion functions on an AST chip.
Should we use fsi-clk, fsi-data, etc?

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
> +		msg |= in_bit;
> +	}
> +	cmd->msg = ~msg;		/*  Data is negative active */

Really minor: I'd do that logic inversion when you or-in the bit:

		msg |= ~in_bit & 0x1;

(or even alter sda_in to suit).

This means that that the unused bits (for messages less than 64 bits
long) are left at zero, which will be slightly more readable when
debugging.

> +static int poll_for_response(struct fsi_master_gpio *master, uint8_t expected,
> +			uint8_t size, void *data)
> +{

I haven't reviewed this for protocol correctness, as you're the FSI
expert. I assume all is good :)

> +	int busy_count = 0, i;
> +	struct fsi_gpio_msg response, cmd;
> +	int bits_remaining = 0;
> +	uint64_t resp = 0;
> +	uint8_t bits_received = 1 + FSI_GPIO_MSG_ID_SIZE +
> +				FSI_GPIO_MSG_RESPID_SIZE;
> +	uint8_t crc_in;
> +
> +	do {
> +		response.msg = 0;
> +		for (i = 0; i < FSI_GPIO_MTOE_COUNT; i++) {
> +			serial_in(master, &response, 1);
> +			resp = response.msg;
> +			if (response.msg)
> +				break;
> +		}
> +		if (unlikely(i >= FSI_GPIO_MTOE_COUNT)) {

No need for unlikely() here.

> +			dev_info(master->master.dev,
> +			"Master time out waiting for response\n");

If you can (ie., without breaking the string), can you indent this
continuation line?

> +			drain_response(master);
> +			fsi_master_gpio_error(master, FSI_GPIO_MTOE);
> +			return FSI_GPIO_MTOE;

What does the return value for this function represent? What's a 'busy
count' and how does it relate to MTOE?

> +		}
> +
> +		/* Response received */
> +		response.msg = 0;
> +		serial_in(master, &response, FSI_GPIO_MSG_ID_SIZE);
> +		dev_info(master->master.dev, "cfam id:%d\n", (int)response.msg);
> +		resp <<= FSI_GPIO_MSG_ID_SIZE;
> +		resp |= response.msg;
> +
> +		response.msg = 0;
> +		serial_in(master, &response, FSI_GPIO_MSG_RESPID_SIZE);
> +		dev_info(master->master.dev, "response id:%d\n",
> +				(int)response.msg);
> +		resp <<= FSI_GPIO_MSG_RESPID_SIZE;
> +		resp |= response.msg;
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

Now I'm really confused about the return value :/

> +		}
> +
> +		/* Read in the data field if applicable */
> +		if (bits_remaining) {
> +			response.msg = 0;
> +			serial_in(master, &response, bits_remaining);
> +			resp <<= bits_remaining;
> +			resp |= response.msg;
> +			bits_received += bits_remaining;
> +		}
> +
> +		/* Read in the crc and check it */
> +		response.msg = 0;
> +		serial_in(master, &response, FSI_GPIO_CRC_SIZE);

serial_in() should always set response.msg, right? Do we need to set this
before every call?

> +
> +		crc_in = fsi_crc4(0, resp, bits_received);
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
> +	return busy_count;
> +}
> +
> +static void build_command(struct fsi_gpio_msg *cmd, uint64_t mode,
> +		uint8_t slave, uint32_t addr, size_t size,
> +		const void *data)

Can we indicate that we're building an ABS_AR command here?

[A future optimisation for this driver would be to cache the last address
used, and perform relative reads & writes if suitable...]

> +{
> +	uint8_t crc;
> +	uint64_t msg_with_start;
> +
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
> +
> +	if (mode == FSI_GPIO_CMD_WRITE)
> +		cmd->bits += (8 * size);
> +
> +	/* Start bit isn't considered part of command but we need to */
> +	/* account for it in crc calcs */
> +	msg_with_start = 0x1 << cmd->bits;
> +	msg_with_start |= cmd->msg;
> +	crc = fsi_crc4(0, msg_with_start, cmd->bits);
> +	cmd->msg |= crc >> cmd->bits;
> +	cmd->bits += FSI_GPIO_CRC_SIZE;
> +}
> +
>  static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>  		uint8_t slave, uint32_t addr, void *val, size_t size)
>  {
>  	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
> +	struct fsi_gpio_msg cmd;
>  
>  	if (link != 0)
>  		return -ENODEV;
>  
> -	/* todo: format read into a message, send, poll for response */
> -	(void)master;
> +	build_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
> +	serial_out(master, &cmd);
> +	echo_delay(master);
>  
> -
> -	return 0;
> +	return poll_for_response(master, FSI_GPIO_RESP_ACKD, size, val);
>  }
>  
>  static int fsi_master_gpio_write(struct fsi_master *_master, int link,
>  		uint8_t slave, uint32_t addr, const void *val, size_t size)
>  {
>  	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
> +	struct fsi_gpio_msg cmd;
>  
>  	if (link != 0)
>  		return -ENODEV;
>  
> -	/* todo: format write into a message, send, poll for response */
> -	(void)master;
> +	build_command(&cmd, FSI_GPIO_CMD_WRITE, slave, addr, size, val);
> +	serial_out(master, &cmd);
> +	echo_delay(master);
>  
> -	return 0;
> +	return poll_for_response(master, FSI_GPIO_RESP_ACK, size, NULL);
>  }
>  
>  /*
> @@ -60,12 +368,31 @@ static int fsi_master_gpio_break(struct fsi_master *_master, int link)
>  	if (link != 0)
>  		return -ENODEV;
>  
> -	/* todo: send the break pattern over gpio */
> -	(void)master;
> +	set_sda_output(master, 0);
> +	clock_toggle(master, FSI_PRE_BREAK_CLOCKS);
> +	sda_out(master, 1);
> +	clock_toggle(master, FSI_BREAK_CLOCKS);
> +	echo_delay(master);
> +	sda_out(master, 0);
> +	clock_toggle(master, FSI_POST_BREAK_CLOCKS);
> +	udelay(200);		/* Wait for logic reset to take effect */

Minor: Better to put comments like this above their code:

	/* Wait for logic reset to take effect */
	udelay(200);

Cheers,


Jeremy
