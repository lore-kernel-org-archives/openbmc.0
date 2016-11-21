Return-Path: <clg@kaod.org>
Received: from mo3.mail-out.ovh.net (mo3.mail-out.ovh.net [178.32.228.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMpNc1vzxzDvhr
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 23:50:23 +1100 (AEDT)
Received: from player734.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 6F805603B0
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 13:50:19 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id EAFC52800C3;
 Mon, 21 Nov 2016 13:50:17 +0100 (CET)
Subject: Re: [PATCH qemu 20/38] aspeed/smc: handle dummy bytes when doing fast
 reads
To: Joel Stanley <joel@jms.id.au>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-21-git-send-email-clg@kaod.org>
 <CACPK8XdekrniuFNtNB3PU7H4STOPMPy-u86VAaQ8cPB7D4OPcw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <35fb7897-81f1-0274-e880-5d2d38fbca24@kaod.org>
Date: Mon, 21 Nov 2016 13:50:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdekrniuFNtNB3PU7H4STOPMPy-u86VAaQ8cPB7D4OPcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17116774810008980226
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdefgdegfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 21 Nov 2016 12:50:24 -0000

On 11/21/2016 08:25 AM, Joel Stanley wrote:
> On Sat, Nov 19, 2016 at 12:52 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 9596ea94a3bc..c0ae07ef8c96 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
> 
>> @@ -525,27 +534,49 @@ static void aspeed_smc_flash_setup_read(AspeedSMCFlash *fl, uint32_t addr)
>>      ssi_transfer(s->spi, (addr & 0xff));
>>  }
>>
>> +static int aspeed_smc_flash_dummies(const AspeedSMCFlash *fl)
>> +{
>> +    AspeedSMCState *s = fl->controller;
>> +    uint32_t r_ctrl0 = s->regs[s->r_ctrl0 + fl->id];
>> +
>> +    return ((((r_ctrl0 >> CTRL_DUMMY_HIGH_SHIFT) & 0x1) << 2) |
>> +            ((r_ctrl0 >> CTRL_DUMMY_LOW_SHIFT) & 0x3)) * 8;
> 
> This is crazy :)

Isn't that lovely :) 

Here's another nice one that we have merged already :

	https://github.com/openbmc/qemu/blob/master/include/hw/misc/aspeed_scu.h#L100

> It might be easier to read if we had a few local variables. Might not
> though, so it's up to you.

yeah. This is not a macro. I can add a dummy_low and a dummy_high to ease
reading.

>> +}
>> +
>> +static uint64_t aspeed_smc_flash_do_read(AspeedSMCFlash *fl, unsigned size)
>> +{
>> +    AspeedSMCState *s = fl->controller;
>> +    uint64_t ret = 0;
>> +    int i;
>> +
>> +    if (fl->cmd == SPI_OP_READ_FAST) {
>> +        for (i = 0; i < aspeed_smc_flash_dummies(fl); i++) {
>> +            ssi_transfer(s->spi, 0x0);
> 
> Do you need to check the return value here as well, like you do below?

no we don't. the m25p80 model simulates dummy cycles with dummy writes, so
we can discard the return value which is a zero.

C. 

>> +        }
>> +    }
>> +    fl->cmd = 0;
>> +
>> +    for (i = 0; i < size; i++) {
>> +        ret |= ssi_transfer(s->spi, 0x0) << (8 * i);
>> +    }
>> +    return ret;
>> +}
