Return-Path: <clg@kaod.org>
Received: from mo5.mail-out.ovh.net (mo5.mail-out.ovh.net [178.32.228.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQMlV4pHQzDq5g
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 21:00:06 +1000 (AEST)
Received: from player774.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id ADB6AFF9C27
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jun 2016 12:42:36 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player774.ha.ovh.net (Postfix) with ESMTPSA id 9929D40080;
 Thu,  9 Jun 2016 12:42:32 +0200 (CEST)
Subject: Re: [PATCH qemu 06/12] ast2400: use contents of first SPI flash as a
 rom
To: andrew@aj.id.au, openbmc@lists.ozlabs.org
References: <1464556805-4340-1-git-send-email-clg@kaod.org>
 <1464556805-4340-7-git-send-email-clg@kaod.org>
 <1465280684.16048.68.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <57594816.4000201@kaod.org>
Date: Thu, 9 Jun 2016 12:42:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465280684.16048.68.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 5196028070113807315
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -65
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrjeehgddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
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
X-List-Received-Date: Thu, 09 Jun 2016 11:00:07 -0000

On 06/07/2016 08:24 AM, Andrew Jeffery wrote:
> On Sun, 2016-05-29 at 23:19 +0200, Cédric Le Goater wrote:
>> This provides support for U-Boot images which are loaded at 0x0.
>>
>> A Palmetto BMC guest can now be simply booted with :
>>
>>   $ qemu-system-arm -m 256 -M palmetto-bmc -nographic -nodefaults  \
>> 	-mtdblock ./flash-palmetto-20160512040959  \
>> 	-mtdblock ./palmetto.pnor
>>
>> The first block device uses the file "./flash-palmetto-20160512040959"
>> which will act as a SPI flash module for the BMC, handled by the
>> SMC/FMC controller. The second block device uses the file
>> "./palmetto.pnor" which is an OpenPower firmware image for a palmetto
>> OpenPower system. This one will be handled by the SMC/SPI controller.
>>
>> The flash images can be grabbed here :
>>
>>     https://openpower.xyz/job/openbmc-build/distro=ubuntu,target=palmetto/lastSuccessfulBuild/artifact/images/palmetto/flash-palmetto
>>     https://openpower.xyz/job/openpower-op-build/distro=ubuntu,target=palmetto/lastSuccessfulBuild/artifact/images/palmetto.pnor
>>
>> We could add a second BMC SPI flash by changing the 'num-cs' property
>> of the controller and emulate a golden image flash module.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>
>>  That might seem a little too hacky ? 
>>
>>  hw/arm/palmetto-bmc.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/hw/arm/palmetto-bmc.c b/hw/arm/palmetto-bmc.c
>> index c4099987d354..50369c0331a6 100644
>> --- a/hw/arm/palmetto-bmc.c
>> +++ b/hw/arm/palmetto-bmc.c
>> @@ -17,6 +17,7 @@
>>  #include "hw/arm/arm.h"
>>  #include "hw/arm/ast2400.h"
>>  #include "hw/boards.h"
>> +#include "hw/loader.h"
>>  
>>  static struct arm_boot_info palmetto_bmc_binfo = {
>>      .loader_start = AST2400_SDRAM_BASE,
>> @@ -53,6 +54,14 @@ static void palmetto_bmc_init(MachineState *machine)
>>      aspeed_smc_init_flashes(&bmc->soc.smc, "n25q256a");
>>      aspeed_smc_init_flashes(&bmc->soc.spi, "mx25l25635e");
>>  
>> +    /*
>> +     * Install first SMC/FMC flash content as a rom.
>> +     */
>> +    if (bmc->soc.smc.flashes[0]) {
>> +        rom_add_blob_fixed("aspeed.smc.0", bmc->soc.smc.flashes[0]->storage,
>> +                           bmc->soc.smc.flashes[0]->size, 0);
>> +    }
>> +
> 
> As mentioned on IRC it's probably best we investigate alternative
> approaches and use this as a last resort.

I agree. Ideally, we should add a memory region alias of bmc->soc.smc.flashes[0] 
at address 0x0.

To get it right, we would need a memory region of type rom backing 
the SPI flash object. The m25p80 object we use is initialized all 
at once today: it gets a disk and allocates storage. The init 
sequence needs a change to allow a late-init method (there are a 
couple of FIXMEs on that topic) and to set a preferred storage, 
like a rom memory region. Hopefully, there are no impacts on the 
SSI framework.

I quickly validated the idea with some hacks. The SMC model seems 
fine, we only have to make sure the rom mode is deactivated when 
not in user mode :

    memory_region_rom_device_set_romd(&s->flashes[i]->mmio, !usermode);

I need to study the m25p80 init question deeper now. 

Thanks,

C.
