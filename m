Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vPlNm3CTWzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 17 Feb 2017 18:42:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3vPlNm0YFfz9s80;
 Fri, 17 Feb 2017 18:42:32 +1100 (AEDT)
Subject: Re: [PATCH linux dev-4.7 2/5] drivers/fsi: Initialize hub master
 engine
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, joel@jms.id.au
References: <20170216220434.79474-1-cbostic@linux.vnet.ibm.com>
 <20170216220434.79474-3-cbostic@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
From: Jeremy Kerr <jk@ozlabs.org>
Message-ID: <f0976d5f-bd57-6ec3-9fec-1235429e9d9b@ozlabs.org>
Date: Fri, 17 Feb 2017 15:42:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170216220434.79474-3-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 17 Feb 2017 07:42:32 -0000

Hi Chris,

> Define hub master probe and add definitions for general
> master registers and bitfields.

I think some background on what a hub master is (and how it differs from
a cascaded master) would be useful - either here or in Documentation/.

>  struct fsi_slave {
>  	struct list_head	list_link;	/* Master's list of slaves */
>  	struct list_head	my_engines;
>  	struct device		dev;
> -	struct fsi_master	*master;
> +	struct fsi_master	*master;	/* Upstream master */
> +	struct fsi_master	*next_master;	/* Downstream master */
>  	int			link;
>  	uint8_t			id;
> +	uint32_t		base;		/* Base address */
>  };

[...]

> @@ -26,6 +75,10 @@ struct fsi_master {
>  	int		idx;
>  	int		n_links;
>  	uint32_t	ipoll;
> +	struct fsi_device *engine;
> +	struct fsi_device *link;
> +	uint8_t		type;
> +	uint32_t	link_size;
>  	int		(*read)(struct fsi_master *, int link,
>  				uint8_t slave, uint32_t addr,
>  				void *val, size_t size);

It seems to me that you've added a lot of hub-specific definitions to
multiple parts of the generic FSI core code. I would much rather see
this contained to code that supports just the hub.

However, the hub functionality doesn't seem to fit within the
slave-engine device model - as a slave-engine driver (binding on the
0x1c/0x1d entries in the configuration table), the hub driver violates
the device model in that it performs accesses to addresses *way* outside
of the allocations described in the configuration table.

[that's why you've altered fsi_dev->size in the master driver, and can
potentially lead to conflicts with other drivers in future]

From what I can glean from the docs, the hub master has a couple of
interfaces:

 - the control register set described in the slave configuration table
   as type 0x1d

 - a description of the links, as entries in the slave configuration
   table as type 0x1c

 - the actual FSI master address space, provided underneath a *slave*
   (and not a *slave engine* - that distinction is important).

To me, it sounds like we should not make this a slave engine driver, but
a part of the core *slave* code, because the hub masters are attached
directly to the slaves. This would involve:

  - struct fsi_master_hub {
        struct fsi_master master;
        struct fsi_slave *slave;
	uint32_t          control_regs;  /* slave-relative addr of regs */
	uint32_t          base;          /* slave-relative addr of
					    master address space */
    }

  - in fsi_slave_scan():

     - suppressing the 0x1c and 0x1d devices from creating slave engines

     - if we find an 0x1d type in the configuration table:
        - struct fsi_master_hub *hub = kzalloc(...);
	  hub->base = /* pre-defined */
	  hub->control_regs = /* parsed from config table */
	  hub->slave = slave;

     - if (hub) {
          use a count of the 0x1c types to populate n_links
	  fsi_master_register(&hub->master);
       }

  - the read() and write() callbacks of fsi_master_hub just pass through
    to the slave (at offset ->base), and the enable/break will access the
    control_regs.

This means that we keep the hub code encapsulated, and the hub
implementation doesn't leak out to the core fsi_master or fsi_slave
structs.

For cascaded masters, we can probably keep this model of using a slave
engine driver, but I just don't think it's suitable for the hubs.

Regards,


Jeremy
