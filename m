Return-Path: <clg@kaod.org>
Received: from 14.mo4.mail-out.ovh.net (14.mo4.mail-out.ovh.net [46.105.40.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxnRh5g6tzDr28
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 23:52:32 +1000 (AEST)
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 17DAA7C741
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 15:44:39 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id D89346400A4;
 Tue, 27 Jun 2017 15:44:35 +0200 (CEST)
Subject: Re: [PATCH qemu] aspeed: Register all three watchdogs
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170627115411.19642-1-joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3f8a2e65-e038-4df3-8544-7522d7e8e72c@kaod.org>
Date: Tue, 27 Jun 2017 15:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170627115411.19642-1-joel@jms.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7009289871161658283
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrtddtgdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 27 Jun 2017 13:52:33 -0000

On 06/27/2017 01:54 PM, Joel Stanley wrote:
> The ast2500 contains three watchdogs. Instatite the model three times to
> the correct address.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> Tested with dev-4.10 with multiple watchdogs enabled in the device tree.
> 
> Note that the ast2400 only has two watchdogs, but I'm not sure how to account for that.

take a look at the spi controllers. briefly speaking :

- add an array of 'AspeedWDTState' under AspeedSoCState.
- modify 'static const AspeedSoCInfo aspeed_socs' to include the 
  number of watchdogs.
- initialize and realize only the number of watchdogs you need
  for a SoC 

Some comments below,

> 
>  hw/arm/aspeed_soc.c         | 25 +++++++++++++++----------
>  include/hw/arm/aspeed_soc.h |  2 +-
>  2 files changed, 16 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 77b95e8e8092..522cdba3bf9d 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -178,11 +178,13 @@ static void aspeed_soc_init(Object *obj)
>      object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
>                                "ram-size", &error_abort);
>  
> -    object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ASPEED_WDT);
> -    object_property_add_child(obj, "wdt", OBJECT(&s->wdt), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
> -    object_property_add_const_link(OBJECT(&s->wdt), "scu", OBJECT(&s->scu),
> -                                   NULL);
> +    for (i = 0; i < ARRAY_SIZE(s->wdt); i++) {

replace ARRAY_SIZE(s->wdt) by 'sc->info->wdt_count'. Pick the name you want.

> +	    object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
> +	    object_property_add_child(obj, "wdt", OBJECT(&s->wdt[i]), NULL);
> +	    qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
> +	    object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
> +			    OBJECT(&s->scu), NULL);
> +    }
>  
>      object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC100);
>      object_property_add_child(obj, "ftgmac100", OBJECT(&s->ftgmac100), NULL);
> @@ -340,12 +342,15 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
>  
>      /* Watch dog */
> -    object_property_set_bool(OBJECT(&s->wdt), true, "realized", &err);
> -    if (err) {
> -        error_propagate(errp, err);
> -        return;
> +    for (i = 0; i < ARRAY_SIZE(s->wdt); i++) {
> +	    fprintf(stderr, "regisering wdt %d at %08x\n", i, ASPEED_SOC_WDT_BASE + i * 0x20); 

drop the fprintf

> +	    object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &err);
> +	    if (err) {
> +		    error_propagate(errp, err);
> +		    return;
> +	    }
> +	    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0, ASPEED_SOC_WDT_BASE + i * 0x20);

This line is too long. 

>      }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0, ASPEED_SOC_WDT_BASE);
>  
>      /* Net */
>      qdev_set_nic_properties(DEVICE(&s->ftgmac100), &nd_table[0]);
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index d16205c66b5f..8a550dafd737 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -40,7 +40,7 @@ typedef struct AspeedSoCState {
>      AspeedSMCState fmc;
>      AspeedSMCState spi[ASPEED_SPIS_NUM];
>      AspeedSDMCState sdmc;
> -    AspeedWDTState wdt;
> +    AspeedWDTState wdt[3];

use a define may be ? no big deal as we won't use it anywhere 
else I think.

Thanks,

C. 

>      FTGMAC100State ftgmac100;
>      AspeedIBTState ibt;
>  } AspeedSoCState;
> 
