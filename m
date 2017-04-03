Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vxZ9V1RGDzDqGv
 for <openbmc@lists.ozlabs.org>; Tue,  4 Apr 2017 00:24:14 +1000 (AEST)
Received: by mail-oi0-f66.google.com with SMTP id f193so19868794oib.0
 for <openbmc@lists.ozlabs.org>; Mon, 03 Apr 2017 07:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4AJbxzVvMl5yjKXr18Zx1I1ungK2jg3/Lk/GavO3yZc=;
 b=kdllA6NkS3J2HDcp95wrTuyIrLKQbXZvg5+mc6mEHxEE/Zi13egXv6OhvuaUaFPvSJ
 o1+FZ1CHG6jk2FMj3NwQYjfTJgAF5de6UimDAiH5C/abI1Qe1ANA+qozX8CJKAuHl8Ay
 fR2qHXB5ia1luK4oSUbSTaSnrW6qIcjkKe2aP77rBS96YyQhWQcombOQa9v9qqsgkK3T
 +wUglg0quQQhbGp1QLrWnPrpH4yooWp+v87gOfgYzjC5KmKE5vwpCwLzcSmpAR2maCx+
 StqGEdZ5mLJ6JM34BGYrw3jReZYdc8jx+9Hh3U4h5c2EK8Gf80aOtKkPElkMjWnwqkGF
 2Rdg==
X-Gm-Message-State: AFeK/H0pzkmSlUK9Gcoo0aEtSiqMZmRC7eMjePZVy/91wmU7SwnLsvb6JMvKuDMK6sw/Tw==
X-Received: by 10.157.55.228 with SMTP id x91mr8859698otb.195.1491229452288;
 Mon, 03 Apr 2017 07:24:12 -0700 (PDT)
Received: from localhost (66-90-148-125.dyn.grandenetworks.net.
 [66.90.148.125])
 by smtp.gmail.com with ESMTPSA id y198sm6816185oie.8.2017.04.03.07.24.11
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Apr 2017 07:24:11 -0700 (PDT)
Date: Mon, 3 Apr 2017 09:24:10 -0500
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: wsa@the-dreams.de, mark.rutland@arm.com, tglx@linutronix.de,
 jason@lakedaemon.net, marc.zyngier@arm.com, joel@jms.id.au,
 vz@mleia.com, mouse@mayc.ru, clg@kaod.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 benh@kernel.crashing.org
Subject: Re: [PATCH v6 3/5] i2c: aspeed: added documentation for Aspeed I2C
 driver
Message-ID: <20170403142410.57qqtuvawu3qon2m@rob-hp-laptop>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-4-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170328051226.21677-4-brendanhiggins@google.com>
User-Agent: Mutt/1.6.2-neo (2016-08-21)
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
X-List-Received-Date: Mon, 03 Apr 2017 14:24:14 -0000

On Mon, Mar 27, 2017 at 10:12:24PM -0700, Brendan Higgins wrote:
> Added device tree binding documentation for Aspeed I2C busses.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Changes for v2:
>   - None
> Changes for v3:
>   - Removed reference to "bus" device tree param
> Changes for v4:
>   - None
> Changes for v5:
>   - None
> Changes for v6:
>   - Replaced the controller property with and interrupt controller, leaving only
>     the busses in the I2C documentation.
> ---
>  .../devicetree/bindings/i2c/i2c-aspeed.txt         | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> new file mode 100644
> index 000000000000..fbcc501706b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> @@ -0,0 +1,49 @@
> +Device tree configuration for the I2C busses on the AST24XX and AST25XX SoCs.
> +
> +Required Properties:
> +- #address-cells	: should be 1
> +- #size-cells		: should be 0
> +- reg			: address offset and range of bus
> +- compatible		: should be "aspeed,ast2400-i2c-bus"
> +			  or "aspeed,ast2500-i2c-bus"
> +- clocks		: root clock of bus, should reference the APB
> +			  clock
> +- interrupts		: interrupt number
> +- interrupt-parent	: interrupt controller for bus, should reference a
> +			  aspeed,ast2400-i2c-ic or aspeed,ast2500-i2c-ic
> +			  interrupt controller
> +
> +Optional Properties:
> +- clock-frequency	: frequency of the bus clock in Hz
> +			  defaults to 100 kHz when not specified
> +
> +Example:
> +
> +i2c {
> +	compatible = "simple-bus";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges = <0 0x1e78a000 0x1000>;
> +
> +	i2c_ic: interrupt-controller@0 {
> +		#interrupt-cells = <1>;
> +		compatible = "aspeed,ast2400-i2c-ic";
> +		reg = <0x0 0x40>;
> +		interrupts = <12>;
> +		interrupt-controller;
> +	};
> +
> +	i2c0: i2c-bus@40 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#interrupt-cells = <1>;
> +		reg = <0x40 0x40>;
> +		compatible = "aspeed,ast2400-i2c-bus";
> +		bus = <0>;

Not documented and what's it for?

> +		clocks = <&clk_apb>;
> +		clock-frequency = <100000>;
> +		status = "disabled";

Drop status from examples.

> +		interrupts = <0>;
> +		interrupt-parent = <&i2c_ic>;
> +	};
> +};
> -- 
> 2.12.2.564.g063fe858b8-goog
> 
