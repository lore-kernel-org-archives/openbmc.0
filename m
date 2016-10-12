Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stvy85fFQzDswp
 for <openbmc@lists.ozlabs.org>; Wed, 12 Oct 2016 11:34:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3stvy82tK7z9sfH;
 Wed, 12 Oct 2016 11:34:40 +1100 (AEDT)
Subject: Re: [PATCH linux v3 16/18] drivers/fsi: Set up CFAMs for communication
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476222003-99697-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476222003-99697-17-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <ad154be5-d4e3-a163-4962-167bbea924fa@ozlabs.org>
Date: Wed, 12 Oct 2016 08:34:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476222003-99697-17-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Wed, 12 Oct 2016 00:34:40 -0000

Hi Chris,

> Issue break command to reset CFAM logic and set ID as appropriate
> for a particular master type.  Begin definition of the slave
> engine register set and accessors.
> 
> V3 - Remove definition of BREAK command from fsi-master.h
> 
>    - Remove definitions of fsi_master_fake for set_smode and
>      break
> 
>    - Remove master->set_smode master dependent function and
>      moved to a generic base master set_smode.
> 
>    - Add fsi_master_link_enable with master type dependencies
> 
> Signed-off-by: Chris Bostic <cbostic@us.ibm.com>

Looking better, I still have a few comments though:

The most significant part of this patch is to add the send_break and
link_enable callbacks, but we're also adding the smode setup. Because of
that, I'd suggest splitting this into two:

 - one patch to update the fsi_master API to add the new callbacks, and
   their implementations; and

 - another patch to do the cfam setup

> +/*
> + * Issue a break commad on this link

 *command

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
> +
> +static void set_smode_defaults(struct fsi_master *master, uint32_t *smode)
> +{
> +	*smode = FSI_SMODE_WSC | FSI_SMODE_ECRC
> +		| fsi_smode_echodly(0xf) | fsi_smode_senddly(0xf)
> +		| fsi_smode_lbcrr(1) | fsi_smode_sid(0);
> +}

I assume that the smode value will depend on the master later, hence the
need for a function for this (otherwise we'd just want a const
uint32_t). However, can you just return the smode rather than setting a
pointer and returning void?

> +static int fsi_master_set_smode(struct fsi_master *master, int link)
> +{
> +	uint32_t smode;
> +	int rc;
> +
> +	set_smode_defaults(master, &smode);
> +	rc = master->write(master, link, 0, FSI_SLAVE_BASE + FSI_SMODE,
> +			&smode, sizeof(smode));
> +
> +	return rc;
> +}
> +

On reading this a little further, I'm a little confused about whether
the smode register is part of the master or part of a slave. I've
assumed the latter (as there are no registers on a GPIO master), but
wouldn't that need to know the slave ID or base address?

[Or is the absence of that a factor of only supporting one slave per
link at the moment? If that's the case, can you rename this to
fsi_slave_set_smode, and add the slave ID parameter that we'll need
later?  That will clarify things a bit]

>  static int fsi_slave_init(struct fsi_master *master,
>  		int link, uint8_t slave_id)
>  {
> -	struct fsi_slave *slave;
> +	struct fsi_slave *slave = NULL;
>  	uint32_t chip_id;
>  	int rc;
>  
> +	/*
> +	 * todo: Due to CFAM hardware issues related to BREAK commands we're
> +	 * limited to only one CFAM per link. Once hardware fixes are available
> +	 * this restriction can be removed.
> +	 */
> +	if (slave_id > 0)
> +		return 0;
> +
> +	rc = fsi_master_break(master, link);
> +	if (rc) {
> +		dev_warn(master->dev, "no slave detected at %02x:%02x\n",
> +				link, slave_id);
> +		return -ENODEV;
> +	}

Shoudln't we do the break as part of a master init (and then build
slave IDs)? Seeing as it will reset the slave IDs, this operation can't
be confined to only a single slave (as the name slave_init would imply.

> +
> +	rc = fsi_master_set_smode(master, link);
> +	if (rc) {
> +		dev_warn(master->dev, "failed to set smode id, rc:%d\n", rc);
> +		return -ENODEV;
> +	}
> +

You'll probably be better returning rc for both of these cases, no need
to squash it to ENODEV (and if you do, EIO might be more appropriate).

>  /* FSI master support */
>  
> +static int fsi_master_link_enable(struct fsi_master *master, int link)
> +{
> +	int rc;
> +
> +	if (master->link_enable)
> +		rc = master->link_enable(master, link);
> +
> +	return rc;
> +}
> +

OK, looks good for a link_enable function of the masters. However, can
you add the new callbacks (link_enable & send_break) and their wrappers
in a separate earlier patch?

>  static int fsi_master_scan(struct fsi_master *master)
>  {
> -	int link, slave_id;
> +	int link, slave_id, rc;
> +
> +	for (link = 0; link < master->n_links; link++) {
> +		rc = fsi_master_link_enable(master, link);
> +		if (rc)
> +			continue;

Shouldn't we fail on that?

>  
> -	for (link = 0; link < master->n_links; link++)
>  		for (slave_id = 0; slave_id < FSI_N_SLAVES; slave_id++)
>  			fsi_slave_init(master, link, slave_id);
> +	}
>  
>  	return 0;
>  
> diff --git a/drivers/fsi/fsi-master-fake.c b/drivers/fsi/fsi-master-fake.c
> index ec1ed5e..c7ad631 100644
> --- a/drivers/fsi/fsi-master-fake.c
> +++ b/drivers/fsi/fsi-master-fake.c
> @@ -63,6 +63,8 @@ static int fsi_master_fake_probe(struct platform_device *pdev)
>  	master->n_links = 1;
>  	master->read = fsi_master_fake_read;
>  	master->write = fsi_master_fake_write;
> +	master->send_break = NULL;
> +	master->link_enable = NULL;

master is kzalloc()ed, no need to set to NULL.

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
> +	/* todo: send the break pattern over gpio */
> +	(void)master;
> +
> +	return 0;
> +}
> +
> +static int fsi_master_gpio_link_enable(struct fsi_master *_master, int link)
> +{
> +	struct fsi_master_gpio *master = to_fsi_master_gpio(_master);
> +
> +	if (link != 0)
> +		return -ENODEV;
> +
> +	/* todo: set the enable pin */
> +	(void)master;
> +
> +	return 0;
> +}
> +

Looks good.

> diff --git a/drivers/fsi/fsi-slave.h b/drivers/fsi/fsi-slave.h
> new file mode 100644
> index 0000000..ea7a760
> --- /dev/null
> +++ b/drivers/fsi/fsi-slave.h
> @@ -0,0 +1,62 @@
> +/*
> + * FSI slave engine definitions.
> + *

Why does this need to be in a header file? Isn't it only used by the FSI
core?

Cheers,


Jeremy
