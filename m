Return-Path: <clg@kaod.org>
X-Greylist: delayed 893 seconds by postgrey-1.35 at bilbo;
 Fri, 10 Jun 2016 22:48:32 AEST
Received: from 4.mo2.mail-out.ovh.net (4.mo2.mail-out.ovh.net [87.98.172.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rR2683DSVzDq5j
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 22:48:31 +1000 (AEST)
Received: from player760.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id B5C76FF9CE5
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 14:41:40 +0200 (CEST)
Received: from [9.101.4.42] (deibp9eh1--blueice2n7.emea.ibm.com
 [195.212.29.169]) (Authenticated sender: clg@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 83A6F3C008E;
 Fri, 10 Jun 2016 14:41:36 +0200 (CEST)
Subject: Re: [PATCH qemu 1/2] hw/misc: Add a model for the ASPEED System
 Control Unit
To: andrew@aj.id.au, OpenBMC <openbmc@lists.ozlabs.org>
References: <1465460046-7692-1-git-send-email-andrew@aj.id.au>
 <1465460046-7692-2-git-send-email-andrew@aj.id.au> <57595312.5@kaod.org>
 <1465521962.16048.194.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <575AB57F.2090604@kaod.org>
Date: Fri, 10 Jun 2016 14:41:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1465521962.16048.194.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13079297743778515839
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrjeejgdehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Fri, 10 Jun 2016 12:48:33 -0000

On 06/10/2016 03:26 AM, Andrew Jeffery wrote:
> On Thu, 2016-06-09 at 13:29 +0200, Cédric Le Goater wrote:
>> On 06/09/2016 10:14 AM, Andrew Jeffery wrote:
>>>
>>> The SCU is a collection of chip-level control registers that manage the
>>> various functions supported by the AST2400. Typically the bits control
>>> interactions with clocks, external hardware or reset behaviour, and we
>>> can largly take a hands-off approach to reads and writes.
>>>
>>> Firmware makes heavy use of the state to determine how to boot, but the
>>> reset values vary from SoC to SoC. Object properties are exposed so
>>> that the integrating SoC model can configure the appropriate reset
>>> values.
>>>
>>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>>> ---
>>>  hw/misc/Makefile.objs        |   1 +
>>>  hw/misc/aspeed_scu.c         | 295 +++++++++++++++++++++++++++++++++++++++++++
>>>  include/hw/misc/aspeed_scu.h | 105 +++++++++++++++
>>>  trace-events                 |   3 +
>>>  4 files changed, 404 insertions(+)
>>>  create mode 100644 hw/misc/aspeed_scu.c
>>>  create mode 100644 include/hw/misc/aspeed_scu.h
>>>
>>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>>> index bc0dd2cc7567..4895e950b377 100644
>>> --- a/hw/misc/Makefile.objs
>>> +++ b/hw/misc/Makefile.objs
>>> @@ -51,3 +51,4 @@ obj-$(CONFIG_MIPS_ITU) += mips_itu.o
>>>  obj-$(CONFIG_PVPANIC) += pvpanic.o
>>>  obj-$(CONFIG_EDU) += edu.o
>>>  obj-$(CONFIG_HYPERV_TESTDEV) += hyperv_testdev.o
>>> +obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o
>>> diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
>>> new file mode 100644
>>> index 000000000000..ae5a4c590bb6
>>> --- /dev/null
>>> +++ b/hw/misc/aspeed_scu.c
>>> @@ -0,0 +1,295 @@
>>> +/*
>>> + * ASPEED System Control Unit
>>> + *
>>> + * Andrew Jeffery <andrew@aj.id.au>
>>> + *
>>> + * Copyright 2016 IBM Corp.
>>> + *
>>> + * This code is licensed under the GPL version 2 or later.  See
>>> + * the COPYING file in the top-level directory.
>>> + */
>>> +
>>> +#include "qemu/osdep.h"
>>> +#include 
>>> +#include "hw/misc/aspeed_scu.h"
>>> +#include "hw/qdev-properties.h"
>>> +#include "qapi/error.h"
>>> +#include "qapi/visitor.h"
>>> +#include "qemu/bitops.h"
>>> +#include "trace.h"
>>> +
>>> +#define SCU_KEY 0x1688A8A8
>>> +#define SCU_IO_REGION_SIZE 0x20000
>>> +
>>> +#define TO_REG(o) ((o) >> 2)
>>> +#define TO_REG_ID(o) [TO_REG(o)] = stringify(o)
>>> +
>>> +static const char *aspeed_scu_reg_ids[ASPEED_SCU_NR_REGS] = {
>>> +    TO_REG_ID(ASPEED_SCU_PROT_KEY),
>>> +    TO_REG_ID(ASPEED_SCU_SYS_RST_CTRL),
>>> +    TO_REG_ID(ASPEED_SCU_CLK_SEL),
>>> +    TO_REG_ID(ASPEED_SCU_CLK_STOP_CTRL),
>>> +    TO_REG_ID(ASPEED_SCU_FREQ_CNTR_CTRL),
>>> +    TO_REG_ID(ASPEED_SCU_FREQ_CNTR_EVAL),
>>> +    TO_REG_ID(ASPEED_SCU_IRQ_CTRL),
>>> +    TO_REG_ID(ASPEED_SCU_D2PLL_PARAM),
>>> +    TO_REG_ID(ASPEED_SCU_MPLL_PARAM),
>>> +    TO_REG_ID(ASPEED_SCU_HPLL_PARAM),
>>> +    TO_REG_ID(ASPEED_SCU_FREQ_CNTR_RANGE),
>>> +    TO_REG_ID(ASPEED_SCU_MISC_CTRL1),
>>> +    TO_REG_ID(ASPEED_SCU_PCI_CTRL1),
>>> +    TO_REG_ID(ASPEED_SCU_PCI_CTRL2),
>>> +    TO_REG_ID(ASPEED_SCU_PCI_CTRL3),
>>> +    TO_REG_ID(ASPEED_SCU_SYS_RST_CTRL),
>>> +    TO_REG_ID(ASPEED_SCU_SOC_SCRATCH1),
>>> +    TO_REG_ID(ASPEED_SCU_SOC_SCRATCH2),
>>> +    TO_REG_ID(ASPEED_SCU_MAC_CLK_DELAY),
>>> +    TO_REG_ID(ASPEED_SCU_MISC_CTRL2),
>>> +    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH1),
>>> +    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH2),
>>> +    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH3),
>>> +    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH4),
>>> +    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH5),
>>> +    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH6),
>>> +    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH7),
>>> +    TO_REG_ID(ASPEED_SCU_VGA_SCRATCH8),
>>> +    TO_REG_ID(ASPEED_SCU_HW_STRAP1),
>>> +    TO_REG_ID(ASPEED_SCU_RNG_CTRL),
>>> +    TO_REG_ID(ASPEED_SCU_RNG_DATA),
>>> +    TO_REG_ID(ASPEED_SCU_REV_ID),
>>> +    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL1),
>>> +    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL2),
>>> +    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL3),
>>> +    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL4),
>>> +    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL5),
>>> +    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL6),
>>> +    TO_REG_ID(ASPEED_SCU_WDT_RST_CTRL),
>>> +    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL7),
>>> +    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL8),
>>> +    TO_REG_ID(ASPEED_SCU_PINMUX_CTRL9),
>>> +    TO_REG_ID(ASPEED_SCU_WAKEUP_EN),
>>> +    TO_REG_ID(ASPEED_SCU_WAKEUP_CTRL),
>>> +    TO_REG_ID(ASPEED_SCU_HW_STRAP2),
>>> +    TO_REG_ID(ASPEED_SCU_FREE_CNTR4),
>>> +    TO_REG_ID(ASPEED_SCU_FREE_CNTR4_EXT),
>>> +    TO_REG_ID(ASPEED_SCU_CPU2_CTRL),
>>> +    TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG1),
>>> +    TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG2),
>>> +    TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG3),
>>> +    TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG4),
>>> +    TO_REG_ID(ASPEED_SCU_CPU2_BASE_SEG5),
>>> +    TO_REG_ID(ASPEED_SCU_CPU2_CACHE_CTRL),
>>> +    TO_REG_ID(ASPEED_SCU_UART_HPLL_CLK),
>>> +    TO_REG_ID(ASPEED_SCU_PCIE_CTRL),
>>> +    TO_REG_ID(ASPEED_SCU_BMC_MMIO_CTRL),
>>> +    TO_REG_ID(ASPEED_SCU_RELOC_DECODE_BASE1),
>>> +    TO_REG_ID(ASPEED_SCU_RELOC_DECODE_BASE2),
>>> +    TO_REG_ID(ASPEED_SCU_MAILBOX_DECODE_BASE),
>>> +    TO_REG_ID(ASPEED_SCU_SRAM_DECODE_BASE1),
>>> +    TO_REG_ID(ASPEED_SCU_SRAM_DECODE_BASE2),
>>> +    TO_REG_ID(ASPEED_SCU_BMC_REV_ID),
>>> +    TO_REG_ID(ASPEED_SCU_BMC_DEV_ID),
>>> +};
>> I would start with a smaller set that we know uboot and the kernel use,
>> this is minor.
> 
> Given that I provided all the defines for register offsets, I figured I
> should provide all the property IDs. As it's done now, I don't see any
> benefit to removing it. Other than to change the approach, which is
> discussed below.
> 
>>
>>>
>>> +void aspeed_scu_configure_reset(AspeedSCUState *scu,
>>> +        const AspeedSCUResetCfg vals[], int n, Error **errp)
>>> +{
>>> +    int i;
>>> +
>>> +    for (i = 0; i < n; i++) {
>>> +        const char *name = aspeed_scu_reg_ids[TO_REG(vals[i].offset)];
>>> +
>>> +        if (name) {
>>> +            object_property_set_int(OBJECT(scu), vals[i].val, name, errp);
>>> +            if (*errp) {
>>> +                return;
>>> +            }
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +static void aspeed_scu_get_reset(Object *obj, Visitor *v, const char *name,
>>> +        void *opaque, Error **errp)
>>> +{
>>> +    AspeedSCUState *s = ASPEED_SCU(obj);
>>> +    uint32_t value;
>>> +    int offset, reg;
>>> +
>>> +    if (sscanf(name, "0x%x", &offset) != 1) {
>>> +        error_setg(errp, "Error reading %s", name);
>>> +        return;
>>> +    }
>> I thought the name of the property was "ASPEED_SCU_PROT_KEY" according to the 
>> object_property_add() below ? 
> 
> Right. This was the slightly abusive bit. Partly inspired by your
> tmp421 patch, the register of interest is derived from the property
> name. In fact, here, the property name is simply the string
> representation of the hexadecimal offset (via stringify() in the
> TO_REG_ID() macro). This is mostly hidden by the aspeed_scu_reg_ids
> lookup, which avoids dynamic conversion between integers and strings
> (sprintf, asprintf and such).

That fooled me. I would have expected property names such as : 

	"ASPEED_SCU_PROT_KEY" 

and then a lookup in aspeed_scu_reg_ids[] to get the register id.

> I'm not at all confident this will be swallowed by upstream, which was
> another reason for sending here first :)
> 
> So, is there a better approach? object_property_*()s all seemed to
> require const char *s. We could just not use properties and assign to
> the array member directly, as the AspeedSCUState type isn't opaque in
> ast2400.c, but from a quick survey it seemed object_property_*() was
> the way to go.

I do not think we need to add all the registers in the properties. 
Once they are configured correctly for a qemu aspeed platform with the
array, we should not be using them too much unless for test/debug. We can 
add the properties one by one  when the need arises I think. 

The REV_ID and HW_STRAP1 are the first candidates though.

Thanks,

C. 

 

>>
>>>
>>> +    reg = TO_REG(offset);
>>> +
>>> +    if (reg > ASPEED_SCU_NR_REGS) {
>>> +        error_setg(errp, "Invalid register ID: %s", name);
>>> +        return;
>>> +    }
>>> +
>>> +    value = s->reset[reg];
>>> +
>>> +    visit_type_uint32(v, name, &value, errp);
>>> +}
>>> +
>>> +static void aspeed_scu_set_reset(Object *obj, Visitor *v, const char *name,
>>> +        void *opaque, Error **errp)
>>> +{
>>> +    AspeedSCUState *s = ASPEED_SCU(obj);
>>> +    Error *local_err = NULL;
>>> +    uint32_t value;
>>> +    int offset, reg;
>>> +
>>> +    visit_type_uint32(v, name, &value, &local_err);
>>> +
>>> +    if (local_err) {
>>> +        error_propagate(errp, local_err);
>>> +        return;
>>> +    }
>>> +
>>> +    if (sscanf(name, "0x%x", &offset) != 1) {
>>> +        error_setg(errp, "Error reading %s", name);
>>> +    }
>> same comment.
> 
> Same as above
> 
>>
>> The rest looks fine.
>>
>> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> 
> Cheers,
> 
> Andrew
> 
