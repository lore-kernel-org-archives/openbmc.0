Return-Path: <clg@kaod.org>
X-Greylist: delayed 15178 seconds by postgrey-1.36 at bilbo;
 Tue, 22 Nov 2016 00:57:26 AEDT
Received: from 16.mo3.mail-out.ovh.net (16.mo3.mail-out.ovh.net
 [188.165.56.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMqsy2xktzDvjG
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 00:57:26 +1100 (AEDT)
Received: from player734.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 660DB5DBA8
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 14:47:45 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id BA0CF280075;
 Mon, 21 Nov 2016 14:47:43 +0100 (CET)
Subject: Re: [PATCH qemu 11/38] aspeed/smc: get the number of flash modules
 from hw strapping
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-12-git-send-email-clg@kaod.org>
 <1479734036.2503.5.camel@aj.id.au>
 <45ccee63-6edd-9e1a-4214-cb93cb1c0395@kaod.org>
 <1479735302.2503.10.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <85a1b91c-3efe-5b93-bdbf-91a0741fd853@kaod.org>
Date: Mon, 21 Nov 2016 14:47:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479735302.2503.10.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18086456103526632194
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdefgdehgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 21 Nov 2016 13:57:26 -0000

On 11/21/2016 02:35 PM, Andrew Jeffery wrote:
> On Mon, 2016-11-21 at 14:29 +0100, Cédric Le Goater wrote:
>> On 11/21/2016 02:13 PM, Andrew Jeffery wrote:
>>> On Fri, 2016-11-18 at 15:21 +0100, Cédric Le Goater wrote:
>>>> If the second watchdog is activated, a second flash module is
>>>> available. It should be of the same model.
>>>>
>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>>
>>>> ---
>>>>  hw/arm/aspeed_soc.c | 26 +++++++++++++++++++++++++-
>>>>  1 file changed, 25 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>>>> index 503efe0f5f77..fcf029f8c1c2 100644
>>>> --- a/hw/arm/aspeed_soc.c
>>>> +++ b/hw/arm/aspeed_soc.c
>>>> @@ -170,12 +170,30 @@ static void aspeed_soc_init(Object *obj)
>>>>                                "ram-size", &error_abort);
>>>>  }
>>>>  
>>>> +static int aspeed_fmc_get_cs(AspeedSoCState *s, Error **errp)
>>>> +{
>>>> +    Error *err = NULL;
>>>> +    uint32_t hw_strap1;
>>>> +
>>>> +    hw_strap1 = object_property_get_int(OBJECT(&s->scu), "hw-strap1", errp);
>>>> +    if (err) {
>>>> +        error_propagate(errp, err);
>>>> +        return -1;
>>>> +    }
>>>> +
>>>> +    /*
>>>> +     * If the second watchdog is activated, then we have two chips.
>>>> +     */
>>>> +    return hw_strap1 & SCU_HW_STRAP_2ND_BOOT_WDT ? 2 : 1;
>>>
>>> Should we instead count the muxed chip selects? We also have FWSPICS2#.
>>>   We would be looking at:
>>>
>>> FWSPICS0#: Dedicated pin, no configuration
>>> FWSPICS1#: SCU88[24]=1 & COND2
>>> FWSPICS2#: SCU88[25]=1 & COND2
>>>
>>> Where COND2 is: SCU94[1:0] = 0
>>
>> Yes I agree. that would be much better for the AST2500 but I don't see 
>> a solution for the AST2400 ? 
>>
> 
> Looks like we count ROMCS[1-4]:
> 
> ROMCS1#: SCU88[24]=1
> ROMCS2#: SCU88[25]=1
> ROMCS3#: SCU88[26]=1
> ROMCS4#: SCU88[27]=1
> 
> Page 113/114.

yes ! 

So we should set or unset these SCU regs when the SoC is created and 
derive the wdt2 enablement from them. I suppose that the helper routine 
to check for the conditions would be under SCU. 

or do we start a simple pinctrl model and slowly add the enablement
of the pins we need ? 

Thanks,

C. 
