Return-Path: <robherring2@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
 [74.125.82.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3ft90BdyzDqHj
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 08:16:49 +1100 (AEDT)
Received: by mail-ot0-f196.google.com with SMTP id 36so2382849otx.3
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 13:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vUfgNLJIwIDJhyYGxPTAfPa0gjEHgiYtV+lR8PoAinE=;
 b=s3PYYjOpOwKs+7LRIIew6Ti+8s4Bl6Dv8Uixy9ZuZO+em+HwG3zXDoEB2JQJI9Nhz5
 zp9GBPbnb5igB5IVq5te4FigByK1OOcUSFYoHFUU0kjk3TBVBfBNobO13oEP58TlVEWG
 m1a9ctHjuUxX5JiOcGgcgMHU0qFpDBJTZ//803ENUoXj4FZjXcA3YixiN/0TSHjY7O3S
 6tZCddIzh0rQPdSY9n+UC1pkGXDysS4Qd4wG1xqJc4M3y5IxlHGRfNuohzwotJLI/G+I
 570XRdfd2XajbwNGYvlkfhQ2AirZuFz31qZh6mJ9FTnGnPu09ogCHoGBsUB431AVgxcM
 NJ2g==
X-Gm-Message-State: AIkVDXI3vx48J3w0ruRfHH9YrpiAHl92knv4n6d0vX6dIU8tSuDRqfH7DkG/m9Ss9j+Pcg==
X-Received: by 10.157.17.141 with SMTP id v13mr2450134otf.251.1484774207159;
 Wed, 18 Jan 2017 13:16:47 -0800 (PST)
Received: from localhost (72-48-98-129.dyn.grandenetworks.net. [72.48.98.129])
 by smtp.gmail.com with ESMTPSA id
 e69sm765917ote.7.2017.01.18.13.16.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Jan 2017 13:16:46 -0800 (PST)
Date: Wed, 18 Jan 2017 15:16:45 -0600
From: Rob Herring <robh@kernel.org>
To: Cyril Bur <cyrilbur@gmail.com>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de,
 gregkh@linuxfoundation.org, joel@jms.id.au, mark.rutland@arm.com,
 openbmc@lists.ozlabs.org, andrew@aj.id.au, benh@kernel.crashing.org,
 xow@google.com, jk@ozlabs.org
Subject: Re: [PATCH 2/4] Documentation: dt: misc: Add Aspeed ast2400/2500 LPC
 Control bindings
Message-ID: <20170118211645.v54xvmxcsfzxior2@rob-hp-laptop>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-3-cyrilbur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170112002910.3650-3-cyrilbur@gmail.com>
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
X-List-Received-Date: Wed, 18 Jan 2017 21:16:49 -0000

On Thu, Jan 12, 2017 at 11:29:08AM +1100, Cyril Bur wrote:
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
>  .../devicetree/bindings/misc/aspeed-lpc-ctrl.txt   | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt b/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
> new file mode 100644
> index 000000000000..f84ac83211ec
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
> @@ -0,0 +1,78 @@
> +ASpeed LPC Control
> +==================
> +This binding defines the LPC control for ASpeed SoCs. Partitions of
> +the LPC bus can be access by other processors on the system, address
> +ranges on the bus can map accesses from another processor to regions
> +of the ASpeed SoC memory space.
> +
> +Reserved Memory:
> +================
> +The driver provides functionality to map the LPC bus to a region of
> +ASpeed ram. A phandle to a reserved memory node must be provided so
> +that the driver can safely use this region.
> +
> +Flash:
> +======
> +The driver provides functionality to unmap the LPC bus from ASpeed
> +RAM, historically the default mapping has been to the SPI flash
> +controller on the ASpeed SoC, a phandle to this node should be
> +supplied.
> +
> +Device Node:
> +============
> +
> +As LPC bus configuration registers are at the start of the LPC bus
> +memory space, it makes most sense for the device to be within the LPC
> +host node. See Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +for more information. This does not have to be the case, provided the
> +reg property can give the full address of the LPC bus.

Same comment here.

> +
> +Required properties:
> +--------------------
> +
> +- compatible:		"aspeed,ast2400-lpc-ctrl" for ASpeed ast2400 SoCs
> +					"aspeed,ast2500-lpc-ctrl" for ASpeed ast2500 SoCs
> +
> +- reg:				Location and size of the configuration registers
> +					for the LPC bus. Note that if the device node is
> +					within the LPC host node then base is relative to
> +					that.
> +
> +- memory-region:	phandle of the reserved memory region
> +- flash:			phandle of the SPI flash controller
> +
> +Example:
> +--------
> +
> +reserved-memory {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges;
> +
> +	...
> +
> +	flash_memory: region@54000000 {
> +		compatible = "aspeed,ast2400-lpc-ctrl";

This doesn't look right?

> +		no-map;
> +		reg = <0x54000000 0x04000000>; /* 64M */

Is this system RAM? reserved-memory is generally for carveouts in system 
RAM (e.g. the memory node).

> +	};
> +};
> +
> +host_pnor: spi@1e630000 {
> +	reg = < 0x1e630000 0x18
> +			0x30000000 0x02000000 >;
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	compatible = "aspeed,ast2400-smc";
> +
> +	...
> +
> +};
> +
> +lpc-ctrl@0 {
> +	compatible = "aspeed,ast2400-lpc-ctrl";
> +	memory-region = <&flash_memory>;
> +	flash = <&host_pnor>;
> +	reg = <0x0 0x80>;
> +};
> +
> -- 
> 2.11.0
> 
