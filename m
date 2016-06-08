Return-Path: <clg@kaod.org>
X-Greylist: delayed 2266 seconds by postgrey-1.35 at bilbo;
 Wed, 08 Jun 2016 22:46:49 AEST
Received: from 3.mo178.mail-out.ovh.net (unknown [46.105.44.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPp950K8kzDqXn
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 22:46:35 +1000 (AEST)
Received: from player799.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 09754100099A
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 14:46:20 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id A250552009E;
 Wed,  8 Jun 2016 14:46:17 +0200 (CEST)
Subject: Re: [PATCH qemu 03/12] ast2400: create SPI flash slaves
To: andrew@aj.id.au, openbmc@lists.ozlabs.org
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <1464556805-4340-4-git-send-email-clg@kaod.org>
 <1465278963.16048.62.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <57581399.4080004@kaod.org>
Date: Wed, 8 Jun 2016 14:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465278963.16048.62.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1413004386110114771
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrjeefgdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Jun 2016 12:46:50 -0000

On 06/07/2016 07:56 AM, Andrew Jeffery wrote:
> On Sun, 2016-05-29 at 23:19 +0200, Cédric Le Goater wrote:
>> This patch creates a number of SPI flash slaves of the same type under
>> the SMC/FMC and under the SMC/SPI controllers. We use a "n25q256a"
>> flash module type for the BMC and a "mx25l25635e" for the host. These
>> types are common in the OpenPower ecosystem.
>>
>> The segment addresses used for the memory mappings are the defaults
>> provided by the specs. They can be changed with the Segment Address
>> Register but this is not supported in the current implementation.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> 
>> ---
>>  hw/arm/palmetto-bmc.c       |  3 +++
>>  hw/ssi/aspeed_smc.c         | 62 +++++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/ssi/aspeed_smc.h |  3 +++
>>  3 files changed, 68 insertions(+)
>>
>> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
>> index 6367f978bc7b..c4099987d354 100644
>> --- a/hw/arm/palmetto-bmc.c
>> +++ b/hw/arm/palmetto-bmc.c
>> @@ -50,6 +50,9 @@ static void palmetto_bmc_init(MachineState *machine)
>>      object_property_set_bool(OBJECT(&bmc->soc), true, "realized",
>>                               &error_abort);
>>  
>> +    aspeed_smc_init_flashes(&bmc->soc.smc, "n25q256a");
>> +    aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l25635e");
>> +
>>      palmetto_bmc_binfo.kernel_filename = machine->kernel_filename;
>>      palmetto_bmc_binfo.initrd_filename = machine->initrd_filename;
>>      palmetto_bmc_binfo.kernel_cmdline = machine->kernel_cmdline;
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 43743628ba0c..4175356141e7 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -215,6 +215,8 @@ static int aspeed_smc_init(SysBusDevice *sbd)
>>                            name, ASPEED_SMC_R_MAX * 4);
>>      sysbus_init_mmio(sbd, &s->mmio);
>>  
>> +    s->flashes = g_new0(AspeedSMCFlashState *, s->num_cs);
>> +
>>      return 0;
>>  }
>>  
>> @@ -368,3 +370,63 @@ static void aspeed_smc_flash_register_types(void)
>>  }
>>  
>>  type_init(aspeed_smc_flash_register_types)
>> +
>> +/*
>> + * Default segments mappings and size for each slave
>> + */
>> +typedef struct AspeedSegments {
>> +    hwaddr addr;
>> +    uint32_t size;
>> +} AspeedSegments;
>> +
>> +/* unused */
>> +static const AspeedSegments aspeed_segment_legacy[] = {
>> +    { 0x14000000, 32 * 1024 * 1024 },
>> +};
>> +
>> +static const AspeedSegments aspeed_segment_fmc[] = {
>> +    { 0x20000000, 64 * 1024 * 1024 },
>> +    { 0x24000000, 32 * 1024 * 1024 },
>> +    { 0x26000000, 32 * 1024 * 1024 },
>> +    { 0x28000000, 32 * 1024 * 1024 },
>> +    { 0x2A000000, 32 * 1024 * 1024 }
>> +};
>> +
>> +static const AspeedSegments aspeed_segment_spi[] = {
>> +    { 0x30000000, 64 * 1024 * 1024 },
>> +};
>> +
>> +static const AspeedSegments *aspeed_segments[] = {
>> +    aspeed_segment_legacy, aspeed_segment_fmc, aspeed_segment_spi
>> +};
>> +
>> +void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype)
>> +{
>> +    int i ;
>> +    char name[32];
>> +
>> +    for (i = 0; i < s->num_cs; ++i) {
>> +        Object *new = object_new(TYPE_ASPEED_SMC_FLASH);
>> +        AspeedSMCFlashState *fl = ASPEED_SMC_FLASH(new);
>> +        qemu_irq cs_line;
>> +
>> +        s->flashes[i] = fl;
>> +
>> +        snprintf(name, sizeof(name), "aspeed.%s.%d",
>> +                 aspeed_smc_types[s->smc_type], i);
>> +
>> +        fl->id = i;
>> +        fl->controller = s;
>> +        fl->flash = ssi_create_slave(s->spi, flashtype);
>> +
>> +        cs_line = qdev_get_gpio_in_named(fl->flash, SSI_GPIO_CS, 0);
>> +        sysbus_connect_irq(SYS_BUS_DEVICE(s), i + 1, cs_line);
>> +
>> +        memory_region_init_io(&fl->mmio, new, &aspeed_smc_flash_ops, fl, name,
>> +                              aspeed_segments[s->smc_type][i].size);
>> +        sysbus_init_mmio(SYS_BUS_DEVICE(new), &fl->mmio);
>> +
>> +        sysbus_mmio_map(SYS_BUS_DEVICE(new), 0,
>> +                        aspeed_segments[s->smc_type][i].addr);
>> +    }
>> +}
>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>> index 6cea1313eabd..1625dfb76a63 100644
>> --- a/include/hw/ssi/aspeed_smc.h
>> +++ b/include/hw/ssi/aspeed_smc.h
>> @@ -74,10 +74,13 @@ typedef struct AspeedSMCState {
>>      uint8_t r_conf;
>>      uint8_t r_ctrl0;
>>      uint8_t conf_enable_w0;
>> +
>> +    AspeedSMCFlashState **flashes;
>>  } AspeedSMCState;
>>  
>>  #define TYPE_ASPEED_SPI "aspeed.spi"
>>  #define ASPEED_SPI(obj) OBJECT_CHECK(AspeedSPIState, (obj), TYPE_ASPEED_SPI)
>>  
>> +extern void aspeed_smc_init_flashes(AspeedSMCState *s, const char *flashtype);
> 
> extern seems superfluous here? Doesn't really matter though.

script/checkpatch.pl did not complain but that might not be a reason. I will check
the coding styles.

Thanks,

C. 

> Cheers,
> 
> Andrew
> 
>>  
>>  #endif /* ASPEED_SMC_H */
