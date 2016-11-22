Return-Path: <clg@kaod.org>
Received: from 5.mo69.mail-out.ovh.net (5.mo69.mail-out.ovh.net
 [46.105.43.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNX3Z3c6fzDvyS
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 04:08:10 +1100 (AEDT)
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id BAD1DB4C7
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 18:00:05 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 91A5E540087;
 Tue, 22 Nov 2016 18:00:03 +0100 (CET)
Subject: Re: [PATCH qemu 29/38] aspeed: add a rtc device on I2C bus 0
To: openbmc@lists.ozlabs.org
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-30-git-send-email-clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Alastair D'Silva <alastair@d-silva.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7ca7b298-a332-06bf-3984-92cb45706806@kaod.org>
Date: Tue, 22 Nov 2016 18:00:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479478938-13267-30-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8760908650722200343
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrvdehgdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Tue, 22 Nov 2016 17:08:11 -0000

On 11/18/2016 03:22 PM, Cédric Le Goater wrote:
> The palmetto platform has a ds3231 RTC device but not qemu. Let's use
> a ds1338 instead which provides enough basic RTC features. Only alarms
> will be missing

This belongs to the machine level also and it is conflicting with 
Alastair's patchset. We will have to synchronize our work.

C.


> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed_soc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 2aa15d90cc31..d2bc0ba2070d 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -276,6 +276,10 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>      object_property_set_int(OBJECT(dev), 20000, "temperature2", &err);
>      object_property_set_int(OBJECT(dev), 110000, "temperature3", &err);
>  
> +    /* The palmetto platform expects a ds3231 RTC but a ds1338 is
> +     * enough to provide basic RTC features. Alarms will be missing */
> +    i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s->i2c), 0), "ds1338", 0x68);
> +
>      /* FMC */
>      fmc_num_cs = aspeed_fmc_get_cs(s, &err);
>      if (err) {
> 
