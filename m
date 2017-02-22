Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSfX84NDVzDq5g
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 12:14:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vSfX821gQz9s7C;
 Wed, 22 Feb 2017 12:14:00 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 v2 5/7] drivers/fsi: Add retry on bus error
 detect
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
 <20170221215032.79282-6-cbostic@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
Message-ID: <a16b4705-f6d8-67cc-9bd1-a3d10df050bd@ozlabs.org>
Date: Wed, 22 Feb 2017 09:13:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170221215032.79282-6-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
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
X-List-Received-Date: Wed, 22 Feb 2017 01:14:00 -0000

Hi Chris,

> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -381,7 +381,17 @@ static int fsi_master_gpio_read(struct fsi_master *_master, int link,
>  		return -ENODEV;
>  
>  	build_abs_ar_command(&cmd, FSI_GPIO_CMD_READ, slave, addr, size, NULL);
> -	return send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
> +	rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
> +	if (rc) {
> +		fsi_master_handle_error(&master->master, addr);
> +
> +		/* Try again */
> +		rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
> +		if (rc)
> +			fsi_master_handle_error(&master->master, addr);
> +	}
> +
> +	return rc;

Lets avoid the repeated code:

	const static int master_retries = 2;

	[...]

	for (retries = 0; retries < master_retries; retries++) {
		rc = send_command(master, &cmd, FSI_GPIO_RESP_ACKD, size, val);
		if (!rc)
			break;
		fsi_master_handle_error(&master->master, addr);
	}

	return rc;

[or even better, we may want to put this in a helper, for use by both
call sites]

Also, is there any condition where fsi_master_handle_error() knows that
the FSI bus is totally hosed, and there's no point retrying?

Cheers,


Jeremy
