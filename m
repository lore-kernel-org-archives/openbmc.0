Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vSfHS4lbjzDq5g
 for <openbmc@lists.ozlabs.org>; Wed, 22 Feb 2017 12:03:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vSfHS29rfz9s7C;
 Wed, 22 Feb 2017 12:03:00 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 v2 1/7] drivers/fsi: Add hub master scan
 detect
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
 <20170221215032.79282-2-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <cfc0ea35-fe2f-b733-ecfc-4a1d405e2a84@ozlabs.org>
Date: Wed, 22 Feb 2017 09:02:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170221215032.79282-2-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 22 Feb 2017 01:03:00 -0000

Hi Chris,

> @@ -252,7 +271,31 @@ static int fsi_slave_scan(struct fsi_slave *slave)
>  		 * Unused address areas are marked by a zero type value; this
>  		 * skips the defined address areas
>  		 */
> -		if (type != 0 && slots != 0) {
> +		if (type != 0) {
> +
> +			if (type == FSI_ENGID_HUB_MASTER) {

I'd split this into a separate part of the above 'if' statement. Or,
convert it to a switch.

> +				hub = kzalloc(sizeof(*hub), GFP_KERNEL);
> +				if (!hub)
> +					return -ENOMEM;
> +
> +				hub->base = FSI_HUB_LINK_OFFSET;
> +				hub->control_regs = engine_addr;
> +				hub->slave = slave;
> +				rc = hub_master_init(hub);
> +
> +				continue;
> +			}
> +			if (type == FSI_ENGID_HUB_LINK) {
> +				if (!hub)
> +					continue;
> +
> +				hub->master.n_links++;
> +				if (hub->master.n_links ==
> +						(FSI_HUB_MASTER_MAX_LINKS * 2))
> +					rc = fsi_master_register(&hub->master);
> +
> +				continue;
> +			}

This logic doesn't make a lot of sense. You're counting the number of
link slots, but then registering the master when that count hits a
predefined number. I'd suggest either:

 - just setting n_links to the predefined number; or

 - keeping a separate variable for n_links, and then once we've finished
   scanning the configuration table (after the for loop)

    if (hub) {
	    hub->n_links = conf_link_count / 2;
	    fsi_master_register(&hub->master);
    }

I'd much prefer the second option, as that actually uses the link count
from the config table.

>  int fsi_master_register(struct fsi_master *master)
>  {
> -	if (!master || !master->dev)
> +	if (!master)
>  		return -EINVAL;

I'm worried if this is needed - we should be creating a device for all
masters.

Cheers,


Jeremy
