Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vslTk07gRzDqZS
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 20:10:01 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2S99Sc7016846;
 Tue, 28 Mar 2017 04:09:29 -0500
Message-ID: <1490692168.3177.117.camel@kernel.crashing.org>
Subject: Re: [PATCH v6 4/5] i2c: aspeed: added driver for Aspeed I2C
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Brendan Higgins <brendanhiggins@google.com>, wsa@the-dreams.de,
 robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Tue, 28 Mar 2017 20:09:28 +1100
In-Reply-To: <20170328051226.21677-5-brendanhiggins@google.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-5-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
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
X-List-Received-Date: Tue, 28 Mar 2017 09:10:02 -0000

On Mon, 2017-03-27 at 22:12 -0700, Brendan Higgins wrote:
> +       /* Set AC Timing */
> +       if (clk_freq / 1000 > 1000) {
> +               aspeed_i2c_write(bus, aspeed_i2c_read(bus,
> +                                                     ASPEED_I2C_FUN_CTRL_REG) |
> +                               ASPEED_I2CD_M_HIGH_SPEED_EN |
> +                               ASPEED_I2CD_M_SDA_DRIVE_1T_EN |

s/ASPEED_I2CD_M_SDA_DRIVE_1T_EN/ASPEED_I2CD_M_SCL_DRIVE_1T_EN/

(and in the definition too)

> +                               ASPEED_I2CD_SDA_DRIVE_1T_EN,
> +                               ASPEED_I2C_FUN_CTRL_REG);
> +
> +               aspeed_i2c_write(bus, 0x3, ASPEED_I2C_AC_TIMING_REG2);
> +               aspeed_i2c_write(bus, aspeed_i2c_get_clk_reg_val(divisor),
> +                                ASPEED_I2C_AC_TIMING_REG1);
> +       } else {

I don't think that's right. AFAIK ASPEED_I2CD_M_HIGH_SPEED_EN is about
ignoring the timing register completely and going for full speed which
is a few Mhz (I forgot how much). At least from my (possibly incorrect)
reading of the spec and the SDK driver.

Or maybe that's what you intend by the above ? Anything above 1Mhz ?

I think there's a blurb somewhere that says that setting that bit makes
it ignore the timing register completely. The definition is:

<<
Enable High Speed master mode
0 : normal speed mode
1 : high speed mode (3.4Mbps)
High speed mode can only use buffer mode for transfer. And only master
mode supports speed switching capability
>>

The spec of the base clock field of the timing register also says

<<
When switch to High Speed (HS) mode, the divisor will be switch to 0 by
hardware automatically
>>

Note also that we aren't use buffer mode anyway so this can't work as-
is, we're using byte mode.

The other interesting question is what is the frequency threshold for
setting ASPEED_I2CD_M_SCL_DRIVE_1T_EN (and the SDA one) ? 

Those bits are somewhat orthogonal to ASPEED_I2CD_M_HIGH_SPEED_EN. They
make the device drive the signals for a clock when they go up to "speed
up" the rising edge more than a normal pull up would do.

If you have some fast devices, it would be interesting to scope the
signal see from what speed it becomes interesting to set the 1T enable
bits to speed up rising edges.

Cheers,
Ben.
