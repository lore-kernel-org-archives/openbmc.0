Return-Path: <clg@kaod.org>
Received: from 8.mo4.mail-out.ovh.net (8.mo4.mail-out.ovh.net [188.165.33.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tS2C01ftvzDvWt
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 20:56:44 +1100 (AEDT)
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id 4F8B01FACC
 for <openbmc@lists.ozlabs.org>; Mon, 28 Nov 2016 10:51:28 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player750.ha.ovh.net (Postfix) with ESMTPSA id 48F71180073;
 Mon, 28 Nov 2016 10:51:24 +0100 (CET)
Subject: Re: [PATCH qemu 28/38] aspeed: add a temp sensor device on I2C bus 3
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 Alastair D'Silva <alastair@d-silva.org>
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-29-git-send-email-clg@kaod.org>
 <10d7a71f-d37a-705d-300c-7630f74f35ae@kaod.org>
 <1480298688.2503.71.camel@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1ff1a785-bf59-b76c-36d0-011c67c8678b@kaod.org>
Date: Mon, 28 Nov 2016 10:51:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1480298688.2503.71.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18311636087763077911
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeeigddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 28 Nov 2016 09:56:44 -0000

On 11/28/2016 03:04 AM, Andrew Jeffery wrote:
> On Tue, 2016-11-22 at 17:57 +0100, Cédric Le Goater wrote:
>> On 11/18/2016 03:22 PM, Cédric Le Goater wrote:
>>> Temperatures can be changed from the monitor with :
>>>
>>> 	(qemu) qom-set /machine/unattached/device[2] temperature0 12000
>>
>>
>> These devices should be defined at the machine level, in palmetto_bmc_init(), 
>> and not at the SoC level. 
> 
> Agreed. Did you see my comments on Alistair's RTC patch along these
> lines?

Regarding aspeed_i2c_bus_init() ? Yes but this patch was sent 
before. 

I was thinking putting these patches on hold and wait for 
Alastair's  proposal to add I2C devices to the board.


C.

> Andrew
> 
>>
>> C.
>>
>>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>  hw/arm/aspeed_soc.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
>>> index 24354f700115..2aa15d90cc31 100644
>>> --- a/hw/arm/aspeed_soc.c
>>> +++ b/hw/arm/aspeed_soc.c
>>> @@ -268,6 +268,14 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>>>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
>>>                         qdev_get_gpio_in(DEVICE(&s->vic), 12));
>>>  
>>> +    /* add a TMP423 temperature sensor */
>>> +    dev = i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s->i2c), 2),
>>> +                           "tmp423", 0x4c);
>>> +    object_property_set_int(OBJECT(dev), 31000, "temperature0", &err);
>>> +    object_property_set_int(OBJECT(dev), 28000, "temperature1", &err);
>>> +    object_property_set_int(OBJECT(dev), 20000, "temperature2", &err);
>>> +    object_property_set_int(OBJECT(dev), 110000, "temperature3", &err);
>>> +
>>>      /* FMC */
>>>      fmc_num_cs = aspeed_fmc_get_cs(s, &err);
>>>      if (err) {
>>>
>>
