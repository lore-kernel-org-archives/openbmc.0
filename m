Return-Path: <robherring2@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
 [209.85.161.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xT0503ZzTzDr0G
 for <openbmc@lists.ozlabs.org>; Fri, 11 Aug 2017 06:25:39 +1000 (AEST)
Received: by mail-yw0-f194.google.com with SMTP id s143so1118669ywg.4
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 13:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=a5GeOsKvqAGbl0xd8z0RYXU75AURQRyTZ4LDOzBM23Y=;
 b=lbq4GClX3RYwLFK4kt8YT1tQcfU04cOfxRnXMsbMgtyaurFy8eu8eemJTSSXXZktRL
 QMyUhqjwZ6UuBVexypga0flestrbRga85NKnGnYsEr8qpIrofx5j1A/XU0J38JXPj286
 AAVjP0CEGirMHtXBVzg6OzIRnAQ9fStr/YwuU2rzj2YTAD6aqirTSxTBJziQs+8psRE2
 lGfoUJEaSRQGOMdkKRHX69nHP1SaQdaxeuoj90qsHEXbZP+kAVs6gHTcQyq8LzwH+/sU
 Oej638bIIay+3VHy9oxyp6AmIl64/6CPf11erOFWGcKxgE/ZlSxOv71GDPjBO9/30/lU
 1jGw==
X-Gm-Message-State: AHYfb5iBAyesN/KQ3WGY6N5xO13xAPznDcUbLI8da4RIzd05Ju7SWkgE
 Um76NZKB+HTuFg==
X-Received: by 10.129.77.194 with SMTP id a185mr10553173ywb.331.1502396737353; 
 Thu, 10 Aug 2017 13:25:37 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id p127sm2476979ywf.46.2017.08.10.13.25.36
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Aug 2017 13:25:36 -0700 (PDT)
Date: Thu, 10 Aug 2017 15:25:35 -0500
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: corbet@lwn.net, mark.rutland@arm.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, minyard@acm.org, joel@jms.id.au,
 benh@kernel.crashing.org, benjaminfair@google.com,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] ipmi: bt-i2c: added documentation for bt-i2c
 drivers
Message-ID: <20170810202535.7bctfuhjh63b6jtm@rob-hp-laptop>
References: <20170805011855.1027-1-brendanhiggins@google.com>
 <20170805011855.1027-2-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170805011855.1027-2-brendanhiggins@google.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
X-List-Received-Date: Thu, 10 Aug 2017 20:25:41 -0000

On Fri, Aug 04, 2017 at 06:18:52PM -0700, Brendan Higgins wrote:
> Added device tree binding documentation for ipmi-bt-i2c (host) and
> ipmi-bmc-bt-i2c (BMC) and documentation for the Block Transfer over I2C
> (bt-i2c) protocol.

Please split the bindings to a separate patch.

> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Changes for v2:
>   - Fixed a typo
>   - Reworded a sentence to make it clear that I was talking about IBM's BT-BMC
>   - Deleted an unnecessary discussion of the host side interface (unnecessary
>     since the OpenIPMI stuff already has its own documentation).
> ---
>  Documentation/bt-i2c.txt                           | 109 +++++++++++++++++++++
>  .../devicetree/bindings/ipmi/ipmi-bt-i2c.txt       |  21 ++++
>  .../bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt          |  21 ++++
>  3 files changed, 151 insertions(+)
>  create mode 100644 Documentation/bt-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ipmi-bt-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt


> diff --git a/Documentation/devicetree/bindings/ipmi/ipmi-bt-i2c.txt b/Documentation/devicetree/bindings/ipmi/ipmi-bt-i2c.txt
> new file mode 100644
> index 000000000000..bd956f2805e4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi/ipmi-bt-i2c.txt
> @@ -0,0 +1,21 @@
> +Device tree configuration for the ipmi-bt-i2c driver.
> +
> +Required Properties:
> +- compatible 	: should be "ipmi-bt-i2c"
> +- reg		: the I2C slave address of the ipmi-bmc-bt-i2c
> +
> +i2c0: i2c-bus@40 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0x40 0x40>;
> +	compatible = "aspeed,ast2400-i2c-bus";

This is the host side, right? So this should be something besides an 
ASpeed I2C controller.

> +	clock-frequency = <100000>;
> +	status = "disabled";

Don't should status in examples.

> +	interrupts = <0>;
> +	interrupt-parent = <&i2c>;
> +
> +	bt-i2c-master@41 {

But it's the slave device you are describing here, right? The host is 
the master. Just "ipmi-bt" is probably enough.

> +		compatible = "ipmi-bt-i2c";
> +		reg = <0x41>;
> +	};
> +};
> diff --git a/Documentation/devicetree/bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt b/Documentation/devicetree/bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt
> new file mode 100644
> index 000000000000..6e82693ee50e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/ipmi_bmc/ipmi-bmc-bt-i2c.txt
> @@ -0,0 +1,21 @@
> +Device tree configuration for the ipmi-bmc-bt-i2c driver.
> +
> +Required Properties:
> +- compatible 	: should be "ipmi-bmc-bt-i2c"
> +- reg		: the I2C slave address of this driver.
> +
> +i2c0: i2c-bus@40 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	reg = <0x40 0x40>;
> +	compatible = "aspeed,ast2400-i2c-bus";
> +	clock-frequency = <100000>;
> +	status = "disabled";
> +	interrupts = <0>;
> +	interrupt-parent = <&i2c>;
> +
> +	bt-i2c-slave@41 {
> +		compatible = "ipmi-bmc-bt-i2c";
> +		reg = <0x41>;

This doesn't follow the slave binding which sets bit 30 for slave 
devices.

> +	};
> +};
> -- 
> 2.14.0.rc1.383.gd1ce394fe2-goog
> 
