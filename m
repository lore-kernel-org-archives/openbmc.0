Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqNf44kMpzDrPb
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 17:53:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3sqNf41Qp4z9s2G;
 Thu,  6 Oct 2016 17:53:32 +1100 (AEDT)
Subject: Re: [PATCH linux 15/15] drivers/fsi: Initialize CFAMs for read/write
 access
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1475700868-75737-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1475700868-75737-16-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <428264fa-63bf-23a3-0a54-7acf0f3585ad@ozlabs.org>
Date: Thu, 6 Oct 2016 14:53:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1475700868-75737-16-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Thu, 06 Oct 2016 06:53:32 -0000

Hi Chris,

> Send break command to CFAMs to reset their logic.  If break
> fails this serves as an indication there is no CFAM present.
> Set various slave engine mode register defaults.
> 
> Add new fields to struct fsi_master to manage hardware
> workarounds for break ids, target addresses and cfam IDs.
> 
> Limit each link scan to one CFAM.  Due to limitations in
> hardware break commands only one can be recognized per link.

I'm not sure what the restriction is there. We can only send a break
over one link? Or something else?

> +/*
> + * Issue a break command to this link
> + */
> +static int fsi_master_break(struct fsi_master *master, int link)
> +{
> +	int rc;
> +	uint32_t cmd = FSI_CMD_BREAK;
> +
> +	rc = master->write(master, link, master->break_id, master->break_offset,
> +			   &cmd, sizeof(cmd));
> +	if (rc) {
> +		dev_warn(master->dev, "break to %02x:%02x failed\n",
> +			 link, master->break_id);
> +		return -ENODEV;
> +	}
> +	udelay(200);		/* wait for logic reset to take effect */
> +
> +	rc = master->read(master, link, master->break_id,
> +			  FSI_SLAVE_BASE + FSI_SMODE, &cmd, sizeof(cmd));
> +	dev_info(master->dev, "smode after break:%08x rc:%d\n", cmd, rc);
> +	if (rc) {
> +		dev_warn(master->dev, "read smode after break failed\n");
> +		return -ENODEV;
> +	}
> +
> +	return rc;
> +}

This seems very specific to one particular master implementation. What
is a GPIO-based FSI master supposed to do here? Decode the write to
specific master addresses and then perform the GPIO sequences for a
proper break?

Instead, the break should be added as an operation on a struct
fsi_master:

  struct fsi_master {
  	struct device	*dev;
  	int		idx;
  	int		n_links;
  	int		(*read)(struct fsi_master *, int link,
  				uint8_t slave, uint32_t addr,
  				void *val, size_t size);
  	int		(*write)(struct fsi_master *, int link,
  				uint8_t slave, uint32_t addr,
  				const void *val, size_t size);
+ 	int		(*break)(struct fsi_master *, int link);
  };

- then the FSI master implementations can do what's required for
sending a break. Then, the core's defintion of fsi_master_break()
becomes:

static int fsi_master_break(struct fsi_master *master, int link)
{
	int rc = 0;

	if (master->break)
		master->break(master, link)

	return rc;
}

Cheers,


Jeremy
