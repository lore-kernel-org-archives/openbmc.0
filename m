Return-Path: <clg@kaod.org>
Received: from 4.mo69.mail-out.ovh.net (4.mo69.mail-out.ovh.net
 [46.105.42.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNWqH1Ps1zDvtB
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 03:57:29 +1100 (AEDT)
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 80E0FBE10
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 17:57:25 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
 [90.76.55.107]) (Authenticated sender: clg@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 2EB255400A9;
 Tue, 22 Nov 2016 17:57:24 +0100 (CET)
Subject: Re: [PATCH qemu 28/38] aspeed: add a temp sensor device on I2C bus 3
To: openbmc@lists.ozlabs.org
References: <1479478938-13267-1-git-send-email-clg@kaod.org>
 <1479478938-13267-29-git-send-email-clg@kaod.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <10d7a71f-d37a-705d-300c-7630f74f35ae@kaod.org>
Date: Tue, 22 Nov 2016 17:57:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479478938-13267-29-git-send-email-clg@kaod.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8715872656691399595
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
X-List-Received-Date: Tue, 22 Nov 2016 16:57:32 -0000

On 11/18/2016 03:22 PM, Cédric Le Goater wrote:
> Temperatures can be changed from the monitor with :
> 
> 	(qemu) qom-set /machine/unattached/device[2] temperature0 12000


These devices should be defined at the machine level, in palmetto_bmc_init(), 
and not at the SoC level. 

C.

> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  hw/arm/aspeed_soc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/hw/arm/aspeed_soc.c b/hw/arm/aspeed_soc.c
> index 24354f700115..2aa15d90cc31 100644
> --- a/hw/arm/aspeed_soc.c
> +++ b/hw/arm/aspeed_soc.c
> @@ -268,6 +268,14 @@ static void aspeed_soc_realize(DeviceState *dev, Error **errp)
>      sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c), 0,
>                         qdev_get_gpio_in(DEVICE(&s->vic), 12));
>  
> +    /* add a TMP423 temperature sensor */
> +    dev = i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&s->i2c), 2),
> +                           "tmp423", 0x4c);
> +    object_property_set_int(OBJECT(dev), 31000, "temperature0", &err);
> +    object_property_set_int(OBJECT(dev), 28000, "temperature1", &err);
> +    object_property_set_int(OBJECT(dev), 20000, "temperature2", &err);
> +    object_property_set_int(OBJECT(dev), 110000, "temperature3", &err);
> +
>      /* FMC */
>      fmc_num_cs = aspeed_fmc_get_cs(s, &err);
>      if (err) {
> 
