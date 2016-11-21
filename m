Return-Path: <clg@kaod.org>
Received: from 9.mo3.mail-out.ovh.net (9.mo3.mail-out.ovh.net [87.98.184.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMpw1499yzDrBs
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 00:14:09 +1100 (AEDT)
Received: from player734.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 7DA146019D
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 14:14:06 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 9A2292800A3;
 Mon, 21 Nov 2016 14:14:01 +0100 (CET)
Subject: Re: [PATCH qemu 03/38] aspeed: attach the second SPI controller
 object to the SoC
To: Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-4-git-send-email-clg@kaod.org>
 <1479726239.5215.25.camel@aj.id.au>
 <CACPK8XeHeUW3-8ewULup=19umJLkavos5_VMWqL=VPnKJTNSEw@mail.gmail.com>
 <1479729439.5215.30.camel@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <742d0aed-de1e-06b7-49ad-ab08ce9542f3@kaod.org>
Date: Mon, 21 Nov 2016 14:14:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479729439.5215.30.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17518158128178498306
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdefgdegkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 21 Nov 2016 13:14:09 -0000

On 11/21/2016 12:57 PM, Andrew Jeffery wrote:
> On Mon, 2016-11-21 at 22:12 +1030, Joel Stanley wrote:
>>> On Mon, Nov 21, 2016 at 9:33 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>>> On Fri, 2016-11-18 at 15:21 +0100, Cédric Le Goater wrote:
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>
>>>>> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>>>
>>>> ---
>>>>  hw/arm/aspeed_soc.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>>>> index db145e201451..bbbbfd13862c 100644
>>>> --- a/hw/arm/aspeed_soc.c
>>>> +++ b/hw/arm/aspeed_soc.c
>>>> @@ -124,7 +124,7 @@ static void aspeed_soc_init(Object *obj)
>>>>      for (i = 0; i < sc->info->spis_num; i++) {
>>>>          object_initialize(&s->spi[i], sizeof(s->spi[i]),
>>>>                            sc->info->spi_typename[i]);
>>>> -        object_property_add_child(obj, "spi", OBJECT(&s->spi[i]), NULL);
>>>> +        object_property_add_child(obj, "spi[*]", OBJECT(&s->spi[i]), NULL);
>>>
>>> Such a curious API. I guess it's effective.
>>
>> I didn't review this one because wtf is with that *?
> 
> According the code it means "keep incrementing a counter until you
> generate a unique object name and successfully register the object".
> AKA the 'i' we already use here, just the API doesn't provide an
> argument to pass it.

yes. see : 

	https://github.com/openbmc/qemu/blob/master/qom/object.c#L910

C.
