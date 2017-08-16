Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xXKxB1XHLzDqgB;
 Wed, 16 Aug 2017 17:00:29 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v7G6xcBb030592;
 Wed, 16 Aug 2017 01:59:40 -0500
Message-ID: <1502866778.4493.84.camel@kernel.crashing.org>
Subject: Re: [PATCH] i2c: aspeed: Retain delay/setup/hold values when
 configuring bus frequency
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Joel Stanley
 <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 Wolfram Sang <wsa@the-dreams.de>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-i2c@vger.kernel.org
Date: Wed, 16 Aug 2017 16:59:38 +1000
In-Reply-To: <247768a3-074f-70ad-6132-39d1443ce210@kaod.org>
References: <20170815072102.23067-1-andrew@aj.id.au>
 <CACPK8XeNDxo14KRsAqo3a0Rs26h-1vRsLyqSX+bt2jfZHq=5yA@mail.gmail.com>
 <247768a3-074f-70ad-6132-39d1443ce210@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.4 (3.24.4-1.fc26) 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 16 Aug 2017 07:00:32 -0000

On Wed, 2017-08-16 at 08:53 +0200, Cédric Le Goater wrote:
> > >          divisor = DIV_ROUND_UP(bus->parent_clk_frequency, bus->bus_frequency);
> > > -       clk_reg_val = bus->get_clk_reg_val(divisor);
> > > +       clk_reg_val = readl(bus->base + ASPEED_I2C_AC_TIMING_REG1);
> > > +       clk_reg_val &= (ASPEED_I2CD_TIME_TBUF_MASK |
> > > +                       ASPEED_I2CD_TIME_THDSTA_MASK |
> > > +                       ASPEED_I2CD_TIME_TACST_MASK);
> > 
> > Instead of keeping the u-boot values (which appear to be hard-coded),
> > should we instead put the known working values in the register?
> 
> Yes. I was wondering where the initial setting was from on the AST400.

Well, the AST2500 hard codes them in HW, so it makes some amount of
sense to use whatever aspeed platform.S hard codes in u-boot for the
2400. The values look reasonably sane.

If we ever see a need to change them, we can add DT props etc... but
for now I'd just not bother.

The way it is now, at least, if I have problems, I can tweak the values
with devmem and try again without the driver overwriting them :-)

Cheers,
Ben.
