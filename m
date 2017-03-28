Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vslDL3ctnzDqZS
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 19:58:26 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2S8voGS015707;
 Tue, 28 Mar 2017 03:57:52 -0500
Message-ID: <1490691470.3177.114.camel@kernel.crashing.org>
Subject: Re: [PATCH v6 4/5] i2c: aspeed: added driver for Aspeed I2C
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Brendan Higgins <brendanhiggins@google.com>, wsa@the-dreams.de,
 robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Tue, 28 Mar 2017 19:57:50 +1100
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
X-List-Received-Date: Tue, 28 Mar 2017 08:58:27 -0000

On Mon, 2017-03-27 at 22:12 -0700, Brendan Higgins wrote:
> +/* 0x04 : I2CD Clock and AC Timing Control Register #1 */
> +#define ASPEED_I2CD_TIME_SCL_HIGH_SHIFT                        16
> +#define ASPEED_I2CD_TIME_SCL_HIGH_MASK                 GENMASK(19, 16)
> +#define ASPEED_I2CD_TIME_SCL_LOW_SHIFT                 12
> +#define ASPEED_I2CD_TIME_SCL_LOW_MASK                  GENMASK(15, 12)
> +#define ASPEED_I2CD_TIME_BASE_DIVISOR_MASK             GENMASK(3, 0)
> +#define ASPEED_I2CD_TIME_SCL_REG_MAX                   GENMASK(3, 0)
> +/* 0x08 : I2CD Clock and AC Timing Control Register #2 */
> +#define ASPEED_NO_TIMEOUT_CTRL                         0

Those are slightly different between the 2400 and 2500, allowing
slightly more fine grained settings (faster base clock and thus higher
numbers in high/low counts).

I *think* that using the 2400 values as-is might work ok, at least
it does for 100kHz but I would double check.

I'll review the rest tomorrow.

Cheers,
Ben.
