Return-Path: <benh@kernel.crashing.org>
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vsl8q2BzwzDqZS
 for <openbmc@lists.ozlabs.org>; Tue, 28 Mar 2017 19:55:23 +1100 (AEDT)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.13.8) with ESMTP id v2S8si0j015524;
 Tue, 28 Mar 2017 03:54:46 -0500
Message-ID: <1490691283.3177.112.camel@kernel.crashing.org>
Subject: Re: [PATCH v6 3/5] i2c: aspeed: added documentation for Aspeed I2C
 driver
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Brendan Higgins <brendanhiggins@google.com>, wsa@the-dreams.de,
 robh+dt@kernel.org, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Date: Tue, 28 Mar 2017 19:54:43 +1100
In-Reply-To: <20170328051226.21677-4-brendanhiggins@google.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-4-brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-1.fc25) 
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
X-List-Received-Date: Tue, 28 Mar 2017 08:55:23 -0000

On Mon, 2017-03-27 at 22:12 -0700, Brendan Higgins wrote:
> Added device tree binding documentation for Aspeed I2C busses.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>

> +	i2c0: i2c-bus@40 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#interrupt-cells = <1>;
> +		reg = <0x40 0x40>;
> +		compatible = "aspeed,ast2400-i2c-bus";
> +		bus = <0>;
> +		clocks = <&clk_apb>;
> +		clock-frequency = <100000>;

For busses it's more traditional to make this "bus-frequency" but
that's a nit and Linux/fdt has not respected that tradition terribly
well. If you respin, it might be work changing.

The clock-frequency tends to be the frequency of the controller itself.

> +		status = "disabled";
> +		interrupts = <0>;
> +		interrupt-parent = <&i2c_ic>;
> +	};
> +};
