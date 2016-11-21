Return-Path: <clg@kaod.org>
Received: from 9.mo3.mail-out.ovh.net (9.mo3.mail-out.ovh.net [87.98.184.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMm5f5c3BzDvPl
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 22:07:18 +1100 (AEDT)
Received: from player734.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 1A15660767
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 12:07:15 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 86E8B280076;
 Mon, 21 Nov 2016 12:07:12 +0100 (CET)
Subject: Re: [PATCH qemu 19/38] aspeed/smc: add support for DMAs
To: Joel Stanley <joel@jms.id.au>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-20-git-send-email-clg@kaod.org>
 <CACPK8XcN4uJ59hNj8ULJ-O9B-jk+W2xLBW5z2J6zFVmCcsuAAQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7060991b-bdd7-cf80-9450-5b658053643b@kaod.org>
Date: Mon, 21 Nov 2016 12:07:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XcN4uJ59hNj8ULJ-O9B-jk+W2xLBW5z2J6zFVmCcsuAAQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15375570603788045058
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdefgddvtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 21 Nov 2016 11:07:19 -0000

On 11/21/2016 08:25 AM, Joel Stanley wrote:
> On Sat, Nov 19, 2016 at 12:51 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> Some of SMC controllers on the Aspeed SoCs support DMA to access the
>> flash modules. It can operate in a normal mode, to copy to or from the
>> flash module mapping window, or in a checksum calculation mode, to
>> evaluate the best clock settings for reads.
>>
>> When DMA is enabled, a DMA request is built and passed on to a bottom
>> half to handle the memory transaction. The CPU is notified of the
>> completion with an IRQ if it was enabled.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  hw/ssi/aspeed_smc.c | 234 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>>  1 file changed, 227 insertions(+), 7 deletions(-)
>>
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 24c78aa57537..9596ea94a3bc 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
> 
>> @@ -685,6 +697,202 @@ static uint64_t aspeed_smc_read(void *opaque, hwaddr addr, unsigned int size)
>>      }
>>  }
>>
>> +typedef struct AspeedDmaCo {
>> +    AspeedSMCState *s;
>> +    int len;
>> +    uint32_t flash_addr;
>> +    uint32_t dram_addr;
>> +    uint32_t checksum;
>> +    bool direction;
>> +} AspeedDmaCo;
> 
> What does the "Co" part mean?

For Coroutine. 

We could do without Coroutines but I think it makes the code a little 
cleaner when we spawn the DMAs to do the flash access or the checksum 
calculation.

I will copy a few experts on the topic as I am not one clearly.

Thanks,

C. 

>> +
>> +static void coroutine_fn aspeed_smc_dma_done(AspeedDmaCo *dmaco)
>> +{
>> +    AspeedSMCState *s = dmaco->s;
>> +
>> +    s->regs[R_INTR_CTRL] |= INTR_CTRL_DMA_STATUS;
>> +    if (s->regs[R_INTR_CTRL] & INTR_CTRL_DMA_EN) {
>> +        qemu_irq_raise(s->irq);
>> +    }
>> +}
