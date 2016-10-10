Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sshXV3Z1RzDrPL
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 11:56:42 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sshXV11F8z9s2Q;
 Mon, 10 Oct 2016 11:56:42 +1100 (AEDT)
Subject: Re: [PATCH linux v2 16/17] drivers/fsi: Set up CFAMs for communication
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1475948333-55960-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475948333-55960-17-git-send-email-christopher.lee.bostic@gmail.com>
From: Jeremy Kerr <jk@ozlabs.org>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
Message-ID: <bf2fa509-3c91-4969-f598-96806594e117@ozlabs.org>
Date: Mon, 10 Oct 2016 08:56:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1475948333-55960-17-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Mon, 10 Oct 2016 00:56:42 -0000

Hi Chris,

> +/*
> + * Issue a break commad on this link
> + */
> +static int fsi_master_break(struct fsi_master *master, int link)
> +{
> +	int rc = 0;
> +
> +	if (master->send_break)
> +		rc = master->send_break(master, link);
> +
> +	return rc;
> +}

OK, looks good.

> +static int fsi_master_fake_break(struct fsi_master *master, int link)
> +{
> +	if (link != 0)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int fsi_master_fake_set_smode(struct fsi_master *master, int link,
> +					uint32_t smode)
> +{
> +	if (link != 0)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +

Since these are no-ops...

>  static int fsi_master_fake_probe(struct platform_device *pdev)
>  {
>  	struct fsi_master *master;
> @@ -63,6 +80,8 @@ static int fsi_master_fake_probe(struct platform_device *pdev)
>  	master->n_links = 1;
>  	master->read = fsi_master_fake_read;
>  	master->write = fsi_master_fake_write;
> +	master->send_break = fsi_master_fake_break;
> +	master->set_smode = fsi_master_fake_set_smode;

... we can just leave the callbacks NULL (the wrapper functions check
this).

However:

> +static int fsi_master_gpio_set_smode(struct fsi_master *_master, int link,
> +						uint32_t smode)
> +{
> +	int rc;
> +
> +	rc = _master->write(_master, link, 0, FSI_SLAVE_BASE + FSI_SMODE,
> +			&smode, sizeof(smode));
> +
> +	return rc;
> +}
> +

Won't this always be implemented the same way on all masters (ie, a
write to a particular slave register)? Why the need for a
master-specific callback here?

> +#define FSI_CMD_BREAK		0xc0de0000	/* Break command */
> +

This isn't used anywhere; what's it for? It doesn't look like something
that all masters will use, so shouldn't be in the global master header.

> @@ -29,6 +31,9 @@ struct fsi_master {
>  	int		(*write)(struct fsi_master *, int link,
>  				uint8_t slave, uint32_t addr,
>  				const void *val, size_t size);
> +	int		(*send_break)(struct fsi_master *, int link);
> +	int		(*set_smode)(struct fsi_master *, int link,
> +				uint32_t smode);

See above comments - do we really need a set_smode callback?

Cheers,


Jeremy
