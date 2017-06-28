Return-Path: <clg@kaod.org>
X-Greylist: delayed 77725 seconds by postgrey-1.36 at bilbo;
 Wed, 28 Jun 2017 18:37:59 AEST
Received: from 20.mo4.mail-out.ovh.net (20.mo4.mail-out.ovh.net [46.105.33.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyGQH5CcXzDr1Z
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 18:37:58 +1000 (AEST)
Received: from player759.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id A6DE875684
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 10:12:50 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id 9507D6400AE;
 Wed, 28 Jun 2017 10:12:46 +0200 (CEST)
Subject: Re: [PATCH qemu v2] aspeed: Register all watchdogs
To: Joel Stanley <joel@jms.id.au>
References: <20170628045655.10965-1-joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d1910470-c4d0-1620-7932-de3c358881d0@kaod.org>
Date: Wed, 28 Jun 2017 10:12:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170628045655.10965-1-joel@jms.id.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7278379950033701634
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrtddvgddtvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Wed, 28 Jun 2017 08:38:00 -0000

On 06/28/2017 06:56 AM, Joel Stanley wrote:
> The ast2400 contains two and the ast2500 contains three watchdogs.
> Add this information to the AspeedSoCInfo and realise the correct number
> of watchdogs for that each SoC type.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

looks good. one minor problem below, then you can send to mainline
I think.

Thanks,

C. 

 
> ---
> v2:
>  - Add number of watchdogs to AspeedSoCInfo so we can register the
>  correcet number of devices on each platform
>  - Drop debugging printf
>  - Fix long line and remove tabs
>  - Update commit message
> 
>  hw/arm/aspeed_soc.c         | 29 +++++++++++++++++++----------
>  include/hw/arm/aspeed_soc.h |  4 +++-
>  2 files changed, 22 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 77b95e8e8092..d1c57e1fd6a4 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -65,6 +65,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
>          .spi_bases    = aspeed_soc_ast2400_spi_bases,
>          .fmc_typename = "aspeed.smc.fmc",
>          .spi_typename = aspeed_soc_ast2400_typenames,
> +        .wdts_num     = 2,
>      }, {
>          .name         = "ast2400-a1",
>          .cpu_model    = "arm926",
> @@ -75,6 +76,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
>          .spi_bases    = aspeed_soc_ast2400_spi_bases,
>          .fmc_typename = "aspeed.smc.fmc",
>          .spi_typename = aspeed_soc_ast2400_typenames,
> +        .wdts_num     = 2,
>      }, {
>          .name         = "ast2400",
>          .cpu_model    = "arm926",
> @@ -85,6 +87,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
>          .spi_bases    = aspeed_soc_ast2400_spi_bases,
>          .fmc_typename = "aspeed.smc.fmc",
>          .spi_typename = aspeed_soc_ast2400_typenames,
> +        .wdts_num     = 2,
>      }, {
>          .name         = "ast2500-a1",
>          .cpu_model    = "arm1176",
> @@ -95,6 +98,7 @@ static const AspeedSoCInfo aspeed_socs[] = {
>          .spi_bases    = aspeed_soc_ast2500_spi_bases,
>          .fmc_typename = "aspeed.smc.ast2500-fmc",
>          .spi_typename = aspeed_soc_ast2500_typenames,
> +        .wdts_num     = 3,
>      },
>  };
>  
> @@ -178,11 +182,13 @@ static void aspeed_soc_init(Object *obj)
>      object_property_add_alias(obj, "ram-size", OBJECT(&s->sdmc),
>                                "ram-size", &error_abort);
>  
> -    object_initialize(&s->wdt, sizeof(s->wdt), TYPE_ASPEED_WDT);
> -    object_property_add_child(obj, "wdt", OBJECT(&s->wdt), NULL);
> -    qdev_set_parent_bus(DEVICE(&s->wdt), sysbus_get_default());
> -    object_property_add_const_link(OBJECT(&s->wdt), "scu", OBJECT(&s->scu),
> -                                   NULL);
> +    for (i = 0; i < sc->info->wdts_num; i++) {
> +        object_initialize(&s->wdt[i], sizeof(s->wdt[i]), TYPE_ASPEED_WDT);
> +        object_property_add_child(obj, "wdt", OBJECT(&s->wdt[i]), NULL);

may be use "wdt[*]" to have different child names.
 
> +        qdev_set_parent_bus(DEVICE(&s->wdt[i]), sysbus_get_default());
> +        object_property_add_const_link(OBJECT(&s->wdt[i]), "scu",
> +                                       OBJECT(&s->scu), NULL);
> +    }
>  
>      object_initialize(&s->ftgmac100, sizeof(s->ftgmac100), TYPE_FTGMAC100);
>      object_property_add_child(obj, "ftgmac100", OBJECT(&s->ftgmac100), NULL);
> @@ -340,12 +346,15 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>      sysbus_mmio_map(SYS_BUS_DEVICE(&s->sdmc), 0, ASPEED_SOC_SDMC_BASE);
>  
>      /* Watch dog */
> -    object_property_set_bool(OBJECT(&s->wdt), true, "realized", &err);
> -    if (err) {
> -        error_propagate(errp, err);
> -        return;
> +    for (i = 0; i < ARRAY_SIZE(s->wdt); i++) {

we should be using : 

	sc->info->wdts_num

Thanks,

C.

> +        object_property_set_bool(OBJECT(&s->wdt[i]), true, "realized", &err);
> +        if (err) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +        sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt[i]), 0,
> +                        ASPEED_SOC_WDT_BASE + i * 0x20);
>      }
> -    sysbus_mmio_map(SYS_BUS_DEVICE(&s->wdt), 0, ASPEED_SOC_WDT_BASE);
>  
>      /* Net */
>      qdev_set_nic_properties(DEVICE(&s->ftgmac100), &nd_table[0]);
> diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> index d16205c66b5f..fedb7b51a002 100644
> --- a/include/hw/arm/aspeed_soc.h
> +++ b/include/hw/arm/aspeed_soc.h
> @@ -24,6 +24,7 @@
>  #include "hw/misc/aspeed_ibt.h"
>  
>  #define ASPEED_SPIS_NUM  2
> +#define ASPEED_WDTS_NUM  3
>  
>  typedef struct AspeedSoCState {
>      /*< private >*/
> @@ -40,7 +41,7 @@ typedef struct AspeedSoCState {
>      AspeedSMCState fmc;
>      AspeedSMCState spi[ASPEED_SPIS_NUM];
>      AspeedSDMCState sdmc;
> -    AspeedWDTState wdt;
> +    AspeedWDTState wdt[ASPEED_WDTS_NUM];
>      FTGMAC100State ftgmac100;
>      AspeedIBTState ibt;
>  } AspeedSoCState;
> @@ -58,6 +59,7 @@ typedef struct AspeedSoCInfo {
>      const hwaddr *spi_bases;
>      const char *fmc_typename;
>      const char **spi_typename;
> +    int wdts_num;
>  } AspeedSoCInfo;
>  
>  typedef struct AspeedSoCClass {
> 
