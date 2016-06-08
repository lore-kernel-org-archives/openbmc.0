Return-Path: <clg@kaod.org>
Received: from mo178.mail-out.ovh.net (mo178.mail-out.ovh.net [178.32.228.178])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rPp3j714LzDqPv
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 22:42:09 +1000 (AEST)
Received: from player799.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 3518E100C958
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2016 14:42:07 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id 94862520095;
 Wed,  8 Jun 2016 14:42:04 +0200 (CEST)
Subject: Re: [PATCH qemu 02/12] ast2400: add SPI flash slave object
To: andrew@aj.id.au, openbmc@lists.ozlabs.org
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <1464556805-4340-3-git-send-email-clg@kaod.org>
 <1465277665.16048.59.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5758129C.9010801@kaod.org>
Date: Wed, 8 Jun 2016 14:42:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465277665.16048.59.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1341791216892283859
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
X-List-Received-Date: Wed, 08 Jun 2016 12:42:10 -0000

On 06/07/2016 07:34 AM, Andrew Jeffery wrote:
> On Sun, 2016-05-29 at 23:19 +0200, Cédric Le Goater wrote:
>> Each SPI flash slave can operate in two modes: Command and User. When
>> in User mode, accesses to the memory segment of the slaves are
>> translated in SPI transfers. When in Command mode, the HW generates
>> the SPI commands automatically and the memory segment is accessed as
>> if doing a MMIO. Other SPI controllers call that mode linear
>> addressing mode.
>>
>> The patch below provides an initial model for a SPI flash module,
>> gathering SPI slave properties and a MemoryRegion to handle the memory
>> accesses. Only the User mode is supported for now but the patch
>> prepares ground for the Command mode.
>>
>> Using a sysbus object for this abstraction might be a bit complex for
>> the need. We could probably survive with a simple struct under
>> AspeedSMCState or we could extend the m25p80 object providing a model
>> for the SPI flash modules. To be discussed.
> 
> The patch seems reasonable to me, though if we took the struct-under-
> AspeedSMCState approach we would register the same MemoryRegions, but
> via the AspeedSMCState's SysBusDevice? 

yes. That might be better for the model to use the controller SysBusDevice. 
I am not sure on that option. 

> Can you expand on extending the m25p80? 

well, we would extend the m25p80 object with a Memory region and do the 
mmio handling there.  

> Is that just doing the same we do here in aspeed_smc in m25p80? 
> Or something else?

looking at it closer, the mmio handling depends on the controller. So 
that won't work.

I think we can advance in steps. This is the first one, which adds some 
API to expose the flash storage backend to handle reads in the SMC model. 
The second would be to modify a bit more m25p80 to handle writes, and that 
might be just externalizing flash_write8().

We will see what mainline wants but I will rephrase the last paragraph of 
the changelog

Thanks,

C.


> Cheers,
> 
> Andrew
> 
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/ssi/aspeed_smc.c         | 110 ++++++++++++++++++++++++++++++++++++++++++++
>>  include/hw/ssi/aspeed_smc.h |  15 ++++++
>>  2 files changed, 125 insertions(+)
>>
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 780fcbbc9e55..43743628ba0c 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -258,3 +258,113 @@ static void aspeed_smc_register_types(void)
>>  }
>>  
>>  type_init(aspeed_smc_register_types)
>> +
>> +static inline bool aspeed_smc_is_usermode(AspeedSMCState *s, int cs)
>> +{
>> +    return (((s->regs[s->r_ctrl0 + cs] & CTRL_USERMODE) == CTRL_USERMODE) &&
>> +            !aspeed_smc_is_ce_stop_active(s, cs));
>> +}
>> +
>> +static inline bool aspeed_smc_is_writable(AspeedSMCState *s, int cs)
>> +{
>> +    return s->regs[s->r_conf] & (1 << (s->conf_enable_w0 + cs));
>> +}
>> +
>> +static uint64_t aspeed_smc_flash_read(void *opaque, hwaddr addr, unsigned size)
>> +{
>> +    AspeedSMCFlashState *fl = ASPEED_SMC_FLASH(opaque);
>> +    AspeedSMCState *s = fl->controller;
>> +    uint64_t ret = 0;
>> +    int i;
>> +
>> +    if (aspeed_smc_is_usermode(s, fl->id)) {
>> +        for (i = 0; i < size; i++) {
>> +            ret = (ret << 8) | ssi_transfer(s->spi, 0x0);
>> +        }
>> +    } else {
>> +        error_report("%s: flash not in usermode", __func__);
>> +        ret = -1;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +static void aspeed_smc_flash_write(void *opaque, hwaddr addr, uint64_t data,
>> +                           unsigned size)
>> +{
>> +    AspeedSMCFlashState *fl = ASPEED_SMC_FLASH(opaque);
>> +    AspeedSMCState *s = fl->controller;
>> +    int i;
>> +
>> +    if (!aspeed_smc_is_writable(s, fl->id)) {
>> +        error_report("%s: flash not in writable", __func__);
>> +        return;
>> +    }
>> +
>> +    if (!aspeed_smc_is_usermode(s, fl->id)) {
>> +        error_report("%s: flash not in usermode", __func__);
>> +        return;
>> +    }
>> +
>> +    for (i = 0; i < size; i++) {
>> +        ssi_transfer(s->spi, (data >> 8 * (size - 1 - i)) & 0xff);
>> +    }
>> +}
>> +
>> +static const MemoryRegionOps aspeed_smc_flash_ops = {
>> +    .read = aspeed_smc_flash_read,
>> +    .write = aspeed_smc_flash_write,
>> +    .endianness = DEVICE_BIG_ENDIAN,
>> +    .valid = {
>> +        .min_access_size = 1,
>> +        .max_access_size = 4,
>> +    },
>> +};
>> +
>> +static void aspeed_smc_flash_reset(DeviceState *d)
>> +{
>> +    ;
>> +}
>> +
>> +static int aspeed_smc_flash_init(SysBusDevice *sbd)
>> +{
>> +    return 0;
>> +}
>> +
>> +static const VMStateDescription vmstate_aspeed_smc_flash = {
>> +    .name = "aspeed.smc_flash",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_END_OF_LIST()
>> +    }
>> +};
>> +
>> +static Property aspeed_smc_flash_properties[] = {
>> +    DEFINE_PROP_END_OF_LIST(),
>> +};
>> +
>> +static void aspeed_smc_flash_class_init(ObjectClass *klass, void *data)
>> +{
>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>> +    SysBusDeviceClass *k = SYS_BUS_DEVICE_CLASS(klass);
>> +
>> +    k->init = aspeed_smc_flash_init;
>> +    dc->reset = aspeed_smc_flash_reset;
>> +    dc->props = aspeed_smc_flash_properties;
>> +    dc->vmsd = &vmstate_aspeed_smc_flash;
>> +}
>> +
>> +static const TypeInfo aspeed_smc_flash_info = {
>> +    .name           = TYPE_ASPEED_SMC_FLASH,
>> +    .parent         = TYPE_SYS_BUS_DEVICE,
>> +    .instance_size  = sizeof(AspeedSMCState),
>> +    .class_init     = aspeed_smc_flash_class_init,
>> +};
>> +
>> +static void aspeed_smc_flash_register_types(void)
>> +{
>> +    type_register_static(&aspeed_smc_flash_info);
>> +}
>> +
>> +type_init(aspeed_smc_flash_register_types)
>> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
>> index 9b95fcee5da7..6cea1313eabd 100644
>> --- a/include/hw/ssi/aspeed_smc.h
>> +++ b/include/hw/ssi/aspeed_smc.h
>> @@ -27,6 +27,21 @@
>>  
>>  #include "hw/ssi/ssi.h"
>>  
>> +#define TYPE_ASPEED_SMC_FLASH "aspeed.smc_flash"
>> +#define ASPEED_SMC_FLASH(obj) \
>> +    OBJECT_CHECK(AspeedSMCFlashState, (obj), TYPE_ASPEED_SMC_FLASH)
>> +
>> +struct AspeedSMCState;
>> +
>> +typedef struct AspeedSMCFlashState {
>> +    SysBusDevice parent_obj;
>> +
>> +    MemoryRegion mmio;
>> +    int id;
>> +    struct AspeedSMCState *controller;
>> +    DeviceState *flash;
>> +} AspeedSMCFlashState;
>> +
>>  enum AspeedSMCType {
>>      AspeedSMCLegacy,
>>      AspeedSMCFMC,
