Return-Path: <clg@kaod.org>
X-Greylist: delayed 2698 seconds by postgrey-1.36 at bilbo;
 Mon, 21 Nov 2016 21:37:29 AEDT
Received: from 3.mo3.mail-out.ovh.net (3.mo3.mail-out.ovh.net [46.105.44.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMlRF0wXjzDvNT
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 21:37:28 +1100 (AEDT)
Received: from player734.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 60E9860524
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 11:02:07 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id BA0382800AC;
 Mon, 21 Nov 2016 11:02:06 +0100 (CET)
Subject: Re: [PATCH qemu 13/38] aspeed/smc: introduce a
 aspeed_smc_flash_update_cs() helper
To: Joel Stanley <joel@jms.id.au>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-14-git-send-email-clg@kaod.org>
 <CACPK8Xf8WHf37ZJoNeG_p8-H9BAf8KD6nYkt=S9158axxO-rHw@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a790e33e-3513-149a-d875-3d168f09cef9@kaod.org>
Date: Mon, 21 Nov 2016 11:02:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf8WHf37ZJoNeG_p8-H9BAf8KD6nYkt=S9158axxO-rHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14276129346975861506
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdefgddtkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 21 Nov 2016 10:37:29 -0000

On 11/21/2016 08:26 AM, Joel Stanley wrote:
> On Sat, Nov 19, 2016 at 12:51 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> aspeed_smc_update_cs() was uselessly looping on all CS to update their
>> status.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> 
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> 
>> ---
>>  hw/ssi/aspeed_smc.c | 16 ++++++----------
>>  1 file changed, 6 insertions(+), 10 deletions(-)
>>
>> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
>> index 91cdc0bf1ac7..1c6c5089f265 100644
>> --- a/hw/ssi/aspeed_smc.c
>> +++ b/hw/ssi/aspeed_smc.c
>> @@ -408,14 +408,10 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
>>      },
>>  };
>>
>> -static void aspeed_smc_update_cs(const AspeedSMCState *s)
>> +static void aspeed_smc_flash_update_cs(AspeedSMCFlash *fl)
> 
> This hunk should have been in patch 12 I think.

ok. I will add the aspeed_smc_flash_update_cs() in the previous patch
and remove aspeed_smc_update_cs() in this one.

C.


> 
>>  {
>> -    int i;
>> -
>> -    for (i = 0; i < s->num_cs; ++i) {
>> -        qemu_set_irq(s->cs_lines[i],
>> -                     aspeed_smc_is_ce_stop_active(&s->flashes[i]));
>> -    }
>> +    AspeedSMCState *s = fl->controller;
>> +    qemu_set_irq(s->cs_lines[fl->id], aspeed_smc_is_ce_stop_active(fl));
>>  }
