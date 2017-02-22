Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTB4g1QWpzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 08:55:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vTB4f5pP1z9s7F;
 Thu, 23 Feb 2017 08:55:30 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 v2 6/7] drivers/fsi: Cleanup bus errors
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170221215032.79282-1-cbostic@linux.vnet.ibm.com>
 <20170221215032.79282-7-cbostic@linux.vnet.ibm.com>
From: Jeremy Kerr <jk@ozlabs.org>
Cc: openbmc@lists.ozlabs.org
Message-ID: <d4241d99-a5ca-0bad-da73-ae1b1328393f@ozlabs.org>
Date: Thu, 23 Feb 2017 05:55:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170221215032.79282-7-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 22 Feb 2017 21:55:31 -0000

Hi Chris,

> @@ -255,6 +263,10 @@ int hub_master_break(struct fsi_master *master, int linkno)
>  	uint32_t break_offset = 0x4; /* hw workaround */
>  	uint32_t addr;
>  
> +	/* config table lists 2 entries per hub link */
> +	if (linkno >= (master->n_links / 2))
> +		return -ENODEV;
> +

master->n_links should represent the actual number of links, rather than
reflect what's in the config table.

[besides, don't we do the / 2 during the config table parse anyway?]

>  	command = FSI_BREAK;
>  	addr = (linkno * FSI_MASTER_HUB_LINK_SIZE) + hub->base;
>  	return fsi_slave_write(hub->slave, addr + break_offset, &command,
> @@ -641,6 +653,28 @@ static int fsi_master_break(struct fsi_master *master, int link)
>  
>  void fsi_master_handle_error(struct fsi_master *master, uint32_t addr)
>  {
> +	uint32_t smode = FSI_SLAVE_SMODE_DFLT;
> +
> +	/* Avoid nested error handling */
> +	if (test_and_set_bit(FSI_IN_ERR_CLEANUP, &fsi_state))
> +		return;

Do we have any other bits of state to represent? If not, just use a
plain atomic_t rather than a set of flags.

Cheers,


Jeremy
