Return-Path: <clg@kaod.org>
X-Greylist: delayed 8399 seconds by postgrey-1.36 at bilbo;
 Wed, 16 Aug 2017 23:58:57 AEST
Received: from 13.mo3.mail-out.ovh.net (13.mo3.mail-out.ovh.net
 [188.165.33.202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xXWD15GQjzDrK6
 for <openbmc@lists.ozlabs.org>; Wed, 16 Aug 2017 23:58:57 +1000 (AEST)
Received: from player758.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id B347F12B788
 for <openbmc@lists.ozlabs.org>; Wed, 16 Aug 2017 08:53:43 +0200 (CEST)
Received: from zorba.kaod.org (i15-les03-th2-31-37-69-229.sfr.lns.abo.bbox.fr
 [31.37.69.229]) (Authenticated sender: postmaster@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 025802C008E;
 Wed, 16 Aug 2017 08:53:30 +0200 (CEST)
Subject: Re: [PATCH] i2c: aspeed: Retain delay/setup/hold values when
 configuring bus frequency
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org
References: <20170815072102.23067-1-andrew@aj.id.au>
 <CACPK8XeNDxo14KRsAqo3a0Rs26h-1vRsLyqSX+bt2jfZHq=5yA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <247768a3-074f-70ad-6132-39d1443ce210@kaod.org>
Date: Wed, 16 Aug 2017 08:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XeNDxo14KRsAqo3a0Rs26h-1vRsLyqSX+bt2jfZHq=5yA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 17003058922318826484
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrleekgdduvdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 16 Aug 2017 13:58:58 -0000

On 08/16/2017 08:49 AM, Joel Stanley wrote:
> On Tue, Aug 15, 2017 at 4:51 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
>> In addition to the base, low and high clock configuration, the AC timing
>> register #1 on the AST2400 houses fields controlling:
>>
>> 1. tBUF: Minimum delay between Stop and Start conditions
>> 2. tHDSTA: Hold time for the Start condition
>> 3. tACST: Setup time for Start and Stop conditions, and hold time for the
>>    Repeated Start condition
>>
>> These values are defined in hardware on the AST2500 and therefore don't
>> need to be set.
>>
>> aspeed_i2c_init_clk() was performing a direct write of the generated
>> clock values rather than a read/mask/modify/update sequence to retain
>> tBUF, tHDSTA and tACST, and therefore cleared the tBUF, tHDSTA and tACST
>> fields on the AST2400. This resulted in a delay/setup/hold time of 1
>> base clock, which in some configurations is not enough for some devices
>> (e.g. the MAX31785 fan controller, with an APB of 48MHz and a desired
>> bus speed of 100kHz).
>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>  drivers/i2c/busses/i2c-aspeed.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>> index ee76e6dddc4b..284f8670dbeb 100644
>> --- a/drivers/i2c/busses/i2c-aspeed.c
>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>> @@ -53,6 +53,9 @@
>>  #define ASPEED_I2CD_MASTER_EN                          BIT(0)
>>
>>  /* 0x04 : I2CD Clock and AC Timing Control Register #1 */
>> +#define ASPEED_I2CD_TIME_TBUF_MASK                     GENMASK(31, 28)
>> +#define ASPEED_I2CD_TIME_THDSTA_MASK                   GENMASK(27, 24)
>> +#define ASPEED_I2CD_TIME_TACST_MASK                    GENMASK(23, 20)
>>  #define ASPEED_I2CD_TIME_SCL_HIGH_SHIFT                        16
>>  #define ASPEED_I2CD_TIME_SCL_HIGH_MASK                 GENMASK(19, 16)
>>  #define ASPEED_I2CD_TIME_SCL_LOW_SHIFT                 12
>> @@ -744,7 +747,11 @@ static int aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus)
>>         u32 divisor, clk_reg_val;
>>
>>         divisor = DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);
>> -       clk_reg_val = bus->get_clk_reg_val(divisor);
>> +       clk_reg_val = readl(bus->base + ASPEED_I2C_AC_TIMING_REG1);
>> +       clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
>> +                       ASPEED_I2CD_TIME_THDSTA_MASK |
>> +                       ASPEED_I2CD_TIME_TACST_MASK);
> 
> Instead of keeping the u-boot values (which appear to be hard-coded),
> should we instead put the known working values in the register?

Yes. I was wondering where the initial setting was from on the AST400.

C.
