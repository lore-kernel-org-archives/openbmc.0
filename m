Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfNCL1NW5zDqMN
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 22:03:25 +1000 (AEST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v52C2MSI023289;
 Fri, 2 Jun 2017 07:02:24 -0500
Message-ID: <1496404942.2842.2.camel@kernel.crashing.org>
Subject: Re: [PATCH v9 4/5] i2c: aspeed: added driver for Aspeed I2C
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Brendan Higgins <brendanhiggins@google.com>, wsa@the-dreams.de,
 robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org, ryan_chen@aspeedtech.com
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Fri, 02 Jun 2017 22:02:22 +1000
In-Reply-To: <20170602084603.30811-5-brendanhiggins@google.com>
References: <20170602084603.30811-1-brendanhiggins@google.com>
 <20170602084603.30811-5-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-2.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Fri, 02 Jun 2017 12:03:26 -0000

On Fri, 2017-06-02 at 01:46 -0700, Brendan Higgins wrote:
> Added initial master support for Aspeed I2C controller. Supports
> fourteen busses present in AST24XX and AST25XX BMC SoCs by Aspeed.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>

Reviewed-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---

Just spotted a completely minor/tivial nit:

> +static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
> +				  struct i2c_msg *msgs, int num)
> +{
> +	struct aspeed_i2c_bus *bus = adap->algo_data;
> +	unsigned long time_left, flags;
> +	int ret = 0;
> +
> +	spin_lock_irqsave(&bus->lock, flags);
> +	bus->cmd_err = 0;
        ^^^^^^^^^^^^^^^^^

This is probably unnecessary now since it's initialized further down.

> +	/* If bus is busy, attempt recovery. We assume a single master
> +	 * environment.
> +	 */
> +	if (readl(bus->base + ASPEED_I2C_CMD_REG) & ASPEED_I2CD_BUS_BUSY_STS) {
> +		spin_unlock_irqrestore(&bus->lock, flags);
> +		ret = aspeed_i2c_recover_bus(bus);
> +		if (ret)
> +			return ret;
> +		spin_lock_irqsave(&bus->lock, flags);
> +	}
> +
> +	bus->cmd_err = 0;
> +	bus->msgs = msgs;
> +	bus->msgs_index = 0;
> +	bus->msgs_count = num;

Now I'd like Andrew to give it a spin as he's currently
testing/debugging some i2c related stuff to be 100% certain it works
fine on our systems.

Thanks !

Cheers,
Ben.
