Return-Path: <clg@kaod.org>
X-Greylist: delayed 895 seconds by postgrey-1.36 at bilbo;
 Wed, 16 Aug 2017 17:23:55 AEST
Received: from 16.mo3.mail-out.ovh.net (16.mo3.mail-out.ovh.net
 [188.165.56.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xXLSC0hHVzDqh0
 for <openbmc@lists.ozlabs.org>; Wed, 16 Aug 2017 17:23:54 +1000 (AEST)
Received: from player758.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo3.mail-out.ovh.net (Postfix) with ESMTP id 48B3A12B826
 for <openbmc@lists.ozlabs.org>; Wed, 16 Aug 2017 09:15:50 +0200 (CEST)
Received: from zorba.kaod.org (i15-les03-th2-31-37-69-229.sfr.lns.abo.bbox.fr
 [31.37.69.229]) (Authenticated sender: postmaster@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id C0B622C007F;
 Wed, 16 Aug 2017 09:15:39 +0200 (CEST)
Subject: Re: [PATCH] i2c: aspeed: Retain delay/setup/hold values when
 configuring bus frequency
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 Wolfram Sang <wsa@the-dreams.de>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org
References: <20170815072102.23067-1-andrew@aj.id.au>
 <CACPK8XeNDxo14KRsAqo3a0Rs26h-1vRsLyqSX+bt2jfZHq=5yA@mail.gmail.com>
 <247768a3-074f-70ad-6132-39d1443ce210@kaod.org>
 <1502866778.4493.84.camel@kernel.crashing.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7d2aa1d5-f3c7-4581-f7e8-36b1f9d4d80d@kaod.org>
Date: Wed, 16 Aug 2017 09:15:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502866778.4493.84.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17376576213290879988
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelkedrleekgdduvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
X-List-Received-Date: Wed, 16 Aug 2017 07:23:55 -0000

On 08/16/2017 08:59 AM, Benjamin Herrenschmidt wrote:
> On Wed, 2017-08-16 at 08:53 +0200, Cédric Le Goater wrote:
>>>>          divisor = DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);
>>>> -       clk_reg_val = bus->get_clk_reg_val(divisor);
>>>> +       clk_reg_val = readl(bus->base + ASPEED_I2C_AC_TIMING_REG1);
>>>> +       clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
>>>> +                       ASPEED_I2CD_TIME_THDSTA_MASK |
>>>> +                       ASPEED_I2CD_TIME_TACST_MASK);
>>>
>>> Instead of keeping the u-boot values (which appear to be hard-coded),
>>> should we instead put the known working values in the register?
>>
>> Yes. I was wondering where the initial setting was from on the AST400.
> 
> Well, the AST2500 hard codes them in HW, so it makes some amount of
> sense to use whatever aspeed platform.S hard codes in u-boot for the
> 2400. The values look reasonably sane.
> 
> If we ever see a need to change them, we can add DT props etc... but
> for now I'd just not bother.
> 
> The way it is now, at least, if I have problems, I can tweak the values
> with devmem and try again without the driver overwriting them :-)

ah yes. that is useful I agree. 

C.
