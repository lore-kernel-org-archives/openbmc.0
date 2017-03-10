Return-Path: <clg@kaod.org>
Received: from 7.mo68.mail-out.ovh.net (7.mo68.mail-out.ovh.net
 [46.105.63.230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vfpJ23NJSzDqY0
 for <openbmc@lists.ozlabs.org>; Sat, 11 Mar 2017 00:38:41 +1100 (AEDT)
Received: from player789.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id BEF8A43CB2
 for <openbmc@lists.ozlabs.org>; Fri, 10 Mar 2017 14:38:37 +0100 (CET)
Received: from zorba.kaod.org (LFbn-1-10647-27.w90-89.abo.wanadoo.fr
 [90.89.233.27]) (Authenticated sender: postmaster@kaod.org)
 by player789.ha.ovh.net (Postfix) with ESMTPSA id 3A9AD2600A5;
 Fri, 10 Mar 2017 14:38:30 +0100 (CET)
Subject: Re: [PATCH] i2c-core: Expand buffers used in i2c_smbus_xfer_emulated()
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170310122135.29827-1-andrew@aj.id.au>
Cc: miltonm@us.ibm.com, wghoffa@us.ibm.com, patrick@stwcx.xyz,
 xow@google.com, openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1e540c49-0053-087b-0021-3ca259d2ca32@kaod.org>
Date: Fri, 10 Mar 2017 14:38:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170310122135.29827-1-andrew@aj.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12419801874479876866
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelhedrgeekgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 10 Mar 2017 13:38:42 -0000

On 03/10/2017 01:21 PM, Andrew Jeffery wrote:
> Protect against suspect hardware causing the bus to read off more data
> than defined in the SMBus specification.
> 
> Some investigation that suggests that the DEVICE_ID command (0xfd) to
> a UCD9000 occasionally returns all 0xff, causing the bus driver to
> overrun the 34-byte data buffer provided by the I2C core with a 255-byte
> broken response. This patch should prevent trashing the stack and also
> cause the UCD9000's probe to fail.
> 
> The I2C core doesn't help itself in this case as it does not provide any
> means for the bus driver to sanity check the caller-provided
> response-buffer length against the device-provided payload length. At
> the point where we perform the I2C transfers for the SMBus protocol
> we've lost the information about what type of transaction is being
> performed (i.e. that we're performing an SMBus block transfer), so we
> cannot in general make assumptions about the buffer size based on the
> protocol (i2c, SMBus, PMBus).  Further, struct i2c_msg is defined in the
> uapi headers so no further members (e.g. a length field) can be added
> without breaking userspace.
> 
> Instead, let's expand the buffers such that they will fit any payload
> length reported by the bus.
> 
> The patch has been tested on a Zaius system, consecutively unbinding and
> binding the UCD9000 driver over 1000 times. Whilst errors were reported
> during probe in some cases ("ucd9000: probe of 0-0064 failed with error
> -74"), the BMC remained stable and did not reboot. Triggering the bug
> without the patch typically at most requires in the order of 100
> unbind/bind attempts, often significantly less.

I could not reproduce the issue on a witherspoon after a 1000 unbind/bind
but there were some errors still :

	ucd9000 11-0064: Device ID UCD90160|2.3.4.0000|110603
	ucd9000 11-0064: Failed to read number of active pages
	ucd9000: probe of 11-0064 failed with error -74
	ucd9000 11-0064: Device ID UCD90160|2.3.4.0000|110603
	...
	ucd9000 11-0064: Device ID UCD90160|2.3.4.0000|110603
	ucd9000 11-0064: Device ID UCD90160|2.3.4.0000|110603
	ucd9000 11-0064: Device ID UCD90160|2.3.4.0000|110603
	i2c_aspeed i2c-11: Invalid state (msg   (null), pending 0)?
	i2c_aspeed i2c-11: Invalid state (msg   (null), pending 0)?
	i2c_aspeed i2c-11: Invalid state (msg   (null), pending 0)?
	i2c i2c-11: i2c_ast: timeout waiting for bus free
	i2c_aspeed i2c-11: Invalid state (msg   (null), pending 0)?
	i2c_aspeed i2c-11: Invalid state (msg   (null), pending 0)?
	i2c i2c-11: i2c_ast: timeout waiting for bus free

The last ones suggest that there is an issue with bus recovery. 

Do All the systems have a UCD90160 ? 

Thanks,

C.


> Finally, the host was successfully powered up immediately after the 1000
> unbind/bind attempts.
>
> Suggested-by: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/i2c/i2c-core.c | 61 ++++++++++++++++++++++++++++++++++++--------------
>  1 file changed, 44 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core.c b/drivers/i2c/i2c-core.c
> index af11b658984d..072fd82920a2 100644
> --- a/drivers/i2c/i2c-core.c
> +++ b/drivers/i2c/i2c-core.c
> @@ -2894,16 +2894,26 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>  				   char read_write, u8 command, int size,
>  				   union i2c_smbus_data *data)
>  {
> -	/* So we need to generate a series of msgs. In the case of writing, we
> -	  need to use only one message; when reading, we need two. We initialize
> -	  most things with sane defaults, to keep the code below somewhat
> -	  simpler. */
> -	unsigned char msgbuf0[I2C_SMBUS_BLOCK_MAX+3];
> -	unsigned char msgbuf1[I2C_SMBUS_BLOCK_MAX+2];
> +	/*
> +	 * So we need to generate a series of msgs. In the case of writing, we
> +	 * need to use only one message; when reading, we need two. We initialize
> +	 * most things with sane defaults, to keep the code below somewhat
> +	 * simpler.
> +	 *
> +	 * Also, allocate 256 byte buffers as protection against suspect
> +	 * hardware like the UCD90xx, where on occasion the returned block
> +	 * length is 0xff[1].
> +	 *
> +	 * [1] https://github.com/openbmc/openbmc/issues/998
> +	 */
> +	unsigned char *msgbuf0 = kmalloc(0x100, GFP_KERNEL);
> +	unsigned char *msgbuf1 = kmalloc(0x100, GFP_KERNEL);
>  	int num = read_write == I2C_SMBUS_READ ? 2 : 1;
> -	int i;
>  	u8 partial_pec = 0;
>  	int status;
> +	s32 ret;
> +	int i;
> +
>  	struct i2c_msg msg[2] = {
>  		{
>  			.addr = addr,
> @@ -2918,6 +2928,9 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>  		},
>  	};
>  
> +	if (!(msgbuf0 && msgbuf1))
> +		return -ENOMEM;
> +
>  	msgbuf0[0] = command;
>  	switch (size) {
>  	case I2C_SMBUS_QUICK:
> @@ -2970,7 +2983,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>  				dev_err(&adapter->dev,
>  					"Invalid block write size %d\n",
>  					data->block[0]);
> -				return -EINVAL;
> +				ret = -EINVAL;
> +				goto out;
>  			}
>  			for (i = 1; i < msg[0].len; i++)
>  				msgbuf0[i] = data->block[i-1];
> @@ -2983,7 +2997,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>  			dev_err(&adapter->dev,
>  				"Invalid block write size %d\n",
>  				data->block[0]);
> -			return -EINVAL;
> +			ret = -EINVAL;
> +			goto out;
>  		}
>  		msg[0].len = data->block[0] + 2;
>  		for (i = 1; i < msg[0].len; i++)
> @@ -3001,7 +3016,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>  				dev_err(&adapter->dev,
>  					"Invalid block write size %d\n",
>  					data->block[0]);
> -				return -EINVAL;
> +				ret = -EINVAL;
> +				goto out;
>  			}
>  			for (i = 1; i <= data->block[0]; i++)
>  				msgbuf0[i] = data->block[i];
> @@ -3009,7 +3025,8 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>  		break;
>  	default:
>  		dev_err(&adapter->dev, "Unsupported transaction %d\n", size);
> -		return -EOPNOTSUPP;
> +		ret = -EOPNOTSUPP;
> +		goto out;
>  	}
>  
>  	i = ((flags & I2C_CLIENT_PEC) && size != I2C_SMBUS_QUICK
> @@ -3028,14 +3045,18 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>  	}
>  
>  	status = i2c_transfer(adapter, msg, num);
> -	if (status < 0)
> -		return status;
> +	if (status < 0) {
> +		ret = status;
> +		goto out;
> +	}
>  
>  	/* Check PEC if last message is a read */
>  	if (i && (msg[num-1].flags & I2C_M_RD)) {
>  		status = i2c_smbus_check_pec(partial_pec, &msg[num-1]);
> -		if (status < 0)
> -			return status;
> +		if (status < 0) {
> +			ret = status;
> +			goto out;
> +		}
>  	}
>  
>  	if (read_write == I2C_SMBUS_READ)
> @@ -3056,11 +3077,17 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>  			break;
>  		case I2C_SMBUS_BLOCK_DATA:
>  		case I2C_SMBUS_BLOCK_PROC_CALL:
> -			for (i = 0; i < msgbuf1[0] + 1; i++)
> +			for (i = 0;
> +			     i < min((size_t)(msgbuf1[0] + 1), sizeof(*data));
> +			     i++)
>  				data->block[i] = msgbuf1[i];
>  			break;
>  		}
> -	return 0;
> +out:
> +	kfree(msgbuf0);
> +	kfree(msgbuf1);
> +
> +	return ret;
>  }
>  
>  /**
> 
