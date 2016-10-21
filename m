Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0Z2r3LMyzDvZV
 for <openbmc@lists.ozlabs.org>; Fri, 21 Oct 2016 16:28:20 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3t0Z2r0lk1z9s9Y;
 Fri, 21 Oct 2016 16:28:20 +1100 (AEDT)
Subject: Re: [PATCH linux v5 13/18] drivers/fsi: Set up links for slave
 communication
To: christopher.lee.bostic@gmail.com, openbmc@lists.ozlabs.org
References: <1476918586-13475-1-git-send-email-christopher.lee.bostic@gmail.com>
 <1476918586-13475-14-git-send-email-christopher.lee.bostic@gmail.com>
Cc: xxpetri@de.ibm.com, zahrens@us.ibm.com
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <fd5171bb-6325-66db-1ec5-7363c73db70e@ozlabs.org>
Date: Fri, 21 Oct 2016 13:28:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1476918586-13475-14-git-send-email-christopher.lee.bostic@gmail.com>
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
X-List-Received-Date: Fri, 21 Oct 2016 05:28:20 -0000

Hi Chris,

> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 565c7e3..81ed444 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -287,13 +287,51 @@ static int fsi_slave_init(struct fsi_master *master,
>  
>  /* FSI master support */
>  
> +static int fsi_master_link_enable(struct fsi_master *master, int link)
> +{
> +	if (master->link_enable)
> +		return master->link_enable(master, link);
> +
> +	return -EINVAL;
> +}

We don't want to error on no ->link_enable callback; this breaks for any
masters that don't require this (eg, the fake master)

> +/*
> + * Issue a break command on this link
> + */
> +static int fsi_master_break(struct fsi_master *master, int link)
> +{
> +	int rc;
> +
> +	if (!master->send_break)
> +		return -EINVAL;

And do we want to error here? If so, we'll need to implement send_break
for the fake master.

Cheers,


Jeremy
