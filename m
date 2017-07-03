Return-Path: <clg@kaod.org>
Received: from 12.mo6.mail-out.ovh.net (12.mo6.mail-out.ovh.net
 [178.32.125.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1J8K19WmzDr44
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2017 17:06:25 +1000 (AEST)
Received: from player696.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 0774CF94FE
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2017 08:57:50 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-1-10652-153.w90-89.abo.wanadoo.fr
 [90.89.238.153]) (Authenticated sender: postmaster@kaod.org)
 by player696.ha.ovh.net (Postfix) with ESMTPSA id EDD463C0093;
 Mon,  3 Jul 2017 08:57:48 +0200 (CEST)
Subject: Re: [PATCH linux dev-4.10] mtd: spi-nor: aspeed: limit the maximum
 SPI frequency
To: Joel Stanley <joel@jms.id.au>
References: <1499032165-23145-1-git-send-email-clg@kaod.org>
 <CACPK8XdCeGO2q8p5TYzObYar3iEouS4ytAuaxU-eY7E5iE9ZZQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <aff97f2b-2f6d-bc11-c9f9-f4475d89aa13@kaod.org>
Date: Mon, 3 Jul 2017 08:57:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XdCeGO2q8p5TYzObYar3iEouS4ytAuaxU-eY7E5iE9ZZQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 16928468052176440066
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedruddugdehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
X-List-Received-Date: Mon, 03 Jul 2017 07:06:25 -0000

On 07/03/2017 05:00 AM, Joel Stanley wrote:
> On Mon, Jul 3, 2017 at 7:19 AM, Cédric Le Goater <clg@kaod.org> wrote:
>> The optimize read algo can choose a 100MHz SPI frequency which might
>> be a bit too high for dual output IO on some chips, for the W25Q256 on
>> palmetto for instance. The MX66L1G45G on witherspoon should be fine
>> though.
>>
>> To do some fine tuning, we use the "spi-max-frequency" property in the
>> device tree. By default, the frequency is 50MHz, as U-boot does for
>> most of the supported chips.
> 
> Looks good to me. I had some questions below to clear up my understanding.
> 
> I will boot this on a few machines today for you.

ok. I tried it on a palmetto, a ast2500 evb and a witherspoon.

> Is this a suspect for the first-byte corruption issue?

yes. This is still a mystery for me. I have hammered pretty 
badly the PNOR on a palmetto and on a witherspoon and could 
not reproduce ...

50MHz seems to be the safe limit used by most of the tool I 
have looked at. I will ask a couple of questions to Aspeed.


> Cheers,
> 
> Joel
> 
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  drivers/mtd/spi-nor/aspeed-smc.c | 69 +++++++++++++++++++++++++---------------
>>  1 file changed, 44 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>> index 23622bf62b6b..7d9f570f11ff 100644
>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>> @@ -121,6 +121,7 @@ struct aspeed_smc_chip {
>>         u32 ctl_val[smc_max];                   /* control settings */
>>         enum aspeed_smc_flash_type type;        /* what type of flash */
>>         struct spi_nor nor;
>> +       u32 clk_rate;
>>  };
>>
>>  struct aspeed_smc_controller {
>> @@ -148,6 +149,8 @@ struct aspeed_smc_controller {
>>         struct aspeed_smc_chip *chips[0];       /* pointers to attached chips */
>>  };
>>
>> +#define ASPEED_SPI_DEFAULT_FREQ                50000000
>> +
>>  /*
>>   * SPI Flash Configuration Register (AST2500 SPI)
>>   *     or
>> @@ -215,7 +218,7 @@ struct aspeed_smc_controller {
>>
>>  #define CONTROL_KEEP_MASK                                              \
>>         (CONTROL_AAF_MODE | CONTROL_CE_INACTIVE_MASK | CONTROL_CLK_DIV4 | \
>> -        CONTROL_CLOCK_FREQ_SEL_MASK | CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3)
>> +        CONTROL_LSB_FIRST | CONTROL_CLOCK_MODE_3)
> 
> We're dropping CONTROL_CLOCK_FREQ_SEL_MASK because the driver now sets
> it own value?

Exactly.

The BMC freq is tuned by U-Boot at HCLK/4 (~50MHz) and the 
PNOR is set with a default HCLK/2 (~100MHz) which is done 
by HW strapping I suppose. 

It is better to enforce some settings I think.

>>  /* Interrupt Control and Status Register */
>>  #define INTERRUPT_STATUS_REG           0x08
>> @@ -820,6 +823,34 @@ static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip)
>>         chip->ctl_val[smc_read] |= CONTROL_IO_ADDRESS_4B;
>>  }
>>
>> +static const u32 aspeed_smc_hclk_divs[] = {
> 
> Could be a u8.

Indeed. I will change that.
 
>> +       0xf, /* HCLK */
>> +       0x7, /* HCLK/2 */
>> +       0xe, /* HCLK/3 */
>> +       0x6, /* HCLK/4 */
>> +       0xd, /* HCLK/5 */
>> +};
> 
> You stop at HCLK/5 as there's no point going any slower?


The first reason is that the "SPI Flash Read Timing Setting" 
register only handles this range, but we could change the 
optimize algo to stop or start at HCLK/5 and have a bigger 
array of dividers.

The second is that all the chips we use support freqs above 
40MHz, which is more or less HCLK/5.

There is some room for improvements. This is not a problem,
I can change that.

Thanks,

C.

>> +
>> +#define ASPEED_SMC_HCLK_DIV(i) (aspeed_smc_hclk_divs[(i) - 1] << 8)
>> +
>> +static u32 aspeed_smc_get_hclk(struct aspeed_smc_chip *chip,
>> +                              u32 max_freq)
>> +{
>> +       int i;
>> +       u32 div;
>> +       u32 ahb_freq = clk_get_rate(chip->controller->ahb_clk);
>> +
>> +       for (i = ARRAY_SIZE(aspeed_smc_hclk_divs); i > 0; i--) {
>> +               u32 freq = ahb_freq / i;
>> +
>> +               if (freq >= max_freq)
>> +                       break;
>> +
>> +               div = ASPEED_SMC_HCLK_DIV(i);
>> +       }
>> +       return div;
>> +}
>> +
>>  static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>>                                       struct resource *res)
>>  {
>> @@ -858,6 +889,7 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>>         dev_dbg(controller->dev, "control register: %08x\n", reg);
>>
>>         base_reg = reg & CONTROL_KEEP_MASK;
>> +       base_reg |= aspeed_smc_get_hclk(chip, chip->clk_rate);
>>         if (base_reg != reg) {
>>                 dev_dbg(controller->dev,
>>                         "control register changed to: %08x\n",
>> @@ -865,17 +897,9 @@ static int aspeed_smc_chip_setup_init(struct aspeed_smc_chip *chip,
>>         }
>>         chip->ctl_val[smc_base] = base_reg;
>>
>> -       /*
>> -        * Retain the prior value of the control register as the
>> -        * default if it was normal access mode. Otherwise start with
>> -        * the sanitized base value set to read mode.
>> -        */
>> -       if ((reg & CONTROL_COMMAND_MODE_MASK) ==
>> -           CONTROL_COMMAND_MODE_NORMAL)
>> -               chip->ctl_val[smc_read] = reg;
>> -       else
>> -               chip->ctl_val[smc_read] = chip->ctl_val[smc_base] |
>> -                       CONTROL_COMMAND_MODE_NORMAL;
>> +       /* start with the sanitized base value set to read mode. */
>> +       chip->ctl_val[smc_read] = chip->ctl_val[smc_base] |
>> +               CONTROL_COMMAND_MODE_NORMAL;
>>
>>         dev_dbg(controller->dev, "default control register: %08x\n",
>>                 chip->ctl_val[smc_read]);
>> @@ -968,15 +992,6 @@ static bool aspeed_smc_check_calib_data(const u8 *test_buf, u32 size)
>>         return cnt >= 64;
>>  }
>>
>> -static const uint32_t aspeed_smc_hclk_divs[] = {
>> -       0xf, /* HCLK */
>> -       0x7, /* HCLK/2 */
>> -       0xe, /* HCLK/3 */
>> -       0x6, /* HCLK/4 */
>> -       0xd, /* HCLK/5 */
>> -};
>> -#define ASPEED_SMC_HCLK_DIV(i) (aspeed_smc_hclk_divs[(i) - 1] << 8)
>> -
>>  static int aspeed_smc_optimize_read(struct aspeed_smc_chip *chip,
>>                                      u32 max_freq)
>>  {
>> @@ -1104,11 +1119,8 @@ static int aspeed_smc_chip_setup_finish(struct aspeed_smc_chip *chip)
>>         dev_dbg(controller->dev, "read control register: %08x\n",
>>                 chip->ctl_val[smc_read]);
>>
>> -       /*
>> -        * TODO: get max freq from chip
>> -        */
>>         if (optimize_read && info->optimize_read)
>> -               info->optimize_read(chip, 104000000);
>> +               info->optimize_read(chip, chip->clk_rate);
>>         return 0;
>>  }
>>
>> @@ -1156,6 +1168,13 @@ static int aspeed_smc_setup_flash(struct aspeed_smc_controller *controller,
>>                         break;
>>                 }
>>
>> +               if (of_property_read_u32(child, "spi-max-frequency",
>> +                                        &chip->clk_rate)) {
>> +                       chip->clk_rate = ASPEED_SPI_DEFAULT_FREQ;
>> +               }
>> +               dev_info(dev, "Using %d MHz SPI frequency\n",
>> +                        chip->clk_rate / 1000000);
>> +
>>                 chip->controller = controller;
>>                 chip->ctl = controller->regs + info->ctl0 + cs * 4;
>>                 chip->cs = cs;
>> --
>> 2.7.5
>>
