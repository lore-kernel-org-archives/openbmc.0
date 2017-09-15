Return-Path: <clg@kaod.org>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=188.165.38.232; helo=15.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
X-Greylist: delayed 8400 seconds by postgrey-1.36 at bilbo;
 Fri, 15 Sep 2017 19:51:30 AEST
Received: from 15.mo1.mail-out.ovh.net (15.mo1.mail-out.ovh.net
 [188.165.38.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xtrJf251YzDrYB
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 19:51:28 +1000 (AEST)
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 04FE394A09
 for <openbmc@lists.ozlabs.org>; Fri, 15 Sep 2017 09:25:40 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-2231-173.w90-76.abo.wanadoo.fr
 [90.76.52.173]) (Authenticated sender: postmaster@kaod.org)
 by player795.ha.ovh.net (Postfix) with ESMTPSA id C19F2120087;
 Fri, 15 Sep 2017 09:25:37 +0200 (CEST)
Subject: Re: [PATCH qemu] arm: aspeed: Add palmetto and evb EEPROM I2C devices
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org
References: <20170915061830.1527-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <9659eb97-6d10-d204-02a5-9359e2a09b8f@kaod.org>
Date: Fri, 15 Sep 2017 09:25:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170915061830.1527-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 9256023138316421890
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrgeejgdejkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Sep 2017 09:51:30 -0000

On 09/15/2017 08:18 AM, Joel Stanley wrote:
> Signed-off-by: Joel Stanley <joel@jms.id.au>

We could fill the eeprom_buf with some valid data if needed.

Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  hw/arm/aspeed.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 9ef5fb3b6ddc..2f596959649a 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -253,6 +253,7 @@ static void aspeed_board_init(MachineState *machine,
>  
>  static void palmetto_bmc_i2c_init(AspeedBoardState *bmc)
>  {
> +    uint8_t *eeprom_buf = g_malloc0(256 * 1024);
>      AspeedSoCState *soc = &bmc->soc;
>      DeviceState *dev;
>  
> @@ -260,6 +261,13 @@ static void palmetto_bmc_i2c_init(AspeedBoardState *bmc)
>       * enough to provide basic RTC features. Alarms will be missing */
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0), "ds1338", 0x68);
>  
> +    /* 256KB EEPROM */
> +    dev = qdev_create((BusState *) aspeed_i2c_get_bus(DEVICE(&soc->i2c), 0),
> +                      "smbus-eeprom");
> +    qdev_prop_set_uint8(dev, "address", 0x50);
> +    qdev_prop_set_ptr(dev, "data", eeprom_buf);
> +    qdev_init_nofail(dev);
> +
>      /* add a TMP423 temperature sensor */
>      dev = i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 2),
>                             "tmp423", 0x4c);
> @@ -295,7 +303,15 @@ static const TypeInfo palmetto_bmc_type = {
>  
>  static void ast2500_evb_i2c_init(AspeedBoardState *bmc)
>  {
> +    uint8_t *eeprom_buf = g_malloc0(8 * 1024);
>      AspeedSoCState *soc = &bmc->soc;
> +    DeviceState *dev;
> +
> +    dev = qdev_create((BusState *) aspeed_i2c_get_bus(DEVICE(&soc->i2c), 3),
> +                      "smbus-eeprom");
> +    qdev_prop_set_uint8(dev, "address", 0x50);
> +    qdev_prop_set_ptr(dev, "data", eeprom_buf);
> +    qdev_init_nofail(dev);
>  
>      /* The AST2500 EVB expects a LM75 but a TMP105 is compatible */
>      i2c_create_slave(aspeed_i2c_get_bus(DEVICE(&soc->i2c), 7), "tmp105", 0x4d);
> 
