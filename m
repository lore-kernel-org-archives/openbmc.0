Return-Path: <lee.jones@linaro.org>
Received: from mail-wm0-x233.google.com (mail-wm0-x233.google.com
 [IPv6:2a00:1450:400c:c09::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wh6nS1Zm1zDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 18:05:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="GNxPLm3I"; 
 dkim-atps=neutral
Received: by mail-wm0-x233.google.com with SMTP id x70so6163803wme.0
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 01:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ZqP6TxaLMmmtVGCY00BiMtB04cqdG2wiCgYcWHtATWM=;
 b=GNxPLm3IXaDwcUzKr0kzedUuwpXwrKLngpuVdl5kGmgBj/xIWgbTt2xbwGzH3vyEhh
 gQCNO6pTpGtwmPqjJkXJY7QlZ6qUTviBVVdjRfYP2Fiiduoi0dVg4CEAHuF63ZBeJhLg
 nYKRrfjeA+21K3CQ4DMkj4E9K8o/yDPvuAi7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ZqP6TxaLMmmtVGCY00BiMtB04cqdG2wiCgYcWHtATWM=;
 b=ZpxAnKNeGpv5MBO6v/YRNeduCMWeUO7yCDzK/efgjvNzR9vTbZZoapQdxrrGBbKXNw
 baDqVITUiaui4XCefdcf7l0QOqveHinAOajBmsVDHjBl4rayMkj626dMMXP2AwvMMvky
 nlWwNJgxeHxqqzSn/apJbrHlkL747sJDJfBE97aRWT0wBX/QVaJN5e/svBmaPnyVDLF1
 QY3Y096YbeNKHgQJL5H/9CO5z/cKvlV2Y5TJ5F1X1IPQTCpEoO05P9xViIAgHLbfW/hz
 BnQV+ejHYE02znNyEoZXbbWJivM6nwuwH9vs6Z//e3qzOxYJIHEl9/TUwJy0dpqovFLM
 IT2Q==
X-Gm-Message-State: AODbwcB+fgTjMtpUsxkgbbWZcwnqTbn9AesQr9Hc1+pJzVIaLe+KTg/6
 CPztMjKxPCqVR+LF
X-Received: by 10.28.217.136 with SMTP id q130mr4186107wmg.80.1496649926988;
 Mon, 05 Jun 2017 01:05:26 -0700 (PDT)
Received: from dell ([2.31.163.81])
 by smtp.gmail.com with ESMTPSA id s13sm7338457wma.21.2017.06.05.01.05.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Jun 2017 01:05:26 -0700 (PDT)
Date: Mon, 5 Jun 2017 09:05:19 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: joel@jms.id.au, anoo@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: Re: [PATCH linux dev-4.10 1/3] mfd: dt: Add Aspeed Low Pin Count
 Controller bindings
Message-ID: <20170605080519.3yvpsmw2gnjjth4k@dell>
References: <20170602082844.7370-1-andrew@aj.id.au>
 <20170602082844.7370-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170602082844.7370-2-andrew@aj.id.au>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Mon, 05 Jun 2017 18:17:11 +1000
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
X-List-Received-Date: Mon, 05 Jun 2017 08:05:33 -0000

On Fri, 02 Jun 2017, Andrew Jeffery wrote:

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> (cherry picked from commit 3bca0e552f693a7d815d24d8fda1196f2c668074)

What is this patch for?  What's the intention?

> ---
>  .../devicetree/bindings/mfd/aspeed-lpc.txt         | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> new file mode 100644
> index 000000000000..a97131aba446
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -0,0 +1,111 @@
> +======================================================================
> +Device tree bindings for the Aspeed Low Pin Count (LPC) Bus Controller
> +======================================================================
> +
> +The LPC bus is a means to bridge a host CPU to a number of low-bandwidth
> +peripheral devices, replacing the use of the ISA bus in the age of PCI[0]. The
> +primary use case of the Aspeed LPC controller is as a slave on the bus
> +(typically in a Baseboard Management Controller SoC), but under certain
> +conditions it can also take the role of bus master.
> +
> +The LPC controller is represented as a multi-function device to account for the
> +mix of functionality it provides. The principle split is between the register
> +layout at the start of the I/O space which is, to quote the Aspeed datasheet,
> +"basically compatible with the [LPC registers from the] popular BMC controller
> +H8S/2168[1]", and everything else, where everything else is an eclectic
> +collection of functions with a esoteric register layout. "Everything else",
> +here labeled the "host" portion of the controller, includes, but is not limited
> +to:
> +
> +* An IPMI Block Transfer[2] Controller
> +
> +* An LPC Host Controller: Manages LPC functions such as host vs slave mode, the
> +  physical properties of some LPC pins, configuration of serial IRQs, and
> +  APB-to-LPC bridging amonst other functions.
> +
> +* An LPC Host Interface Controller: Manages functions exposed to the host such
> +  as LPC firmware hub cycles, configuration of the LPC-to-AHB mapping, UART
> +  management and bus snoop configuration.
> +
> +* A set of SuperIO[3] scratch registers: Enables implementation of e.g. custom
> +  hardware management protocols for handover between the host and baseboard
> +  management controller.
> +
> +Additionally the state of the LPC controller influences the pinmux
> +configuration, therefore the host portion of the controller is exposed as a
> +syscon as a means to arbitrate access.
> +
> +[0] http://www.intel.com/design/chipsets/industry/25128901.pdf
> +[1] https://www.renesas.com/en-sg/doc/products/mpumcu/001/rej09b0078_h8s2168.pdf?key=7c88837454702128622bee53acbda8f4
> +[2] http://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmi-second-gen-interface-spec-v2-rev1-1.pdf
> +[3] https://en.wikipedia.org/wiki/Super_I/O
> +
> +Required properties
> +===================
> +
> +- compatible:	One of:
> +		"aspeed,ast2400-lpc", "simple-mfd"
> +		"aspeed,ast2500-lpc", "simple-mfd"
> +
> +- reg:		contains the physical address and length values of the Aspeed
> +                LPC memory region.
> +
> +- #address-cells: <1>
> +- #size-cells:	<1>
> +- ranges: 	Maps 0 to the physical address and length of the LPC memory
> +                region
> +
> +Required LPC Child nodes
> +========================
> +
> +BMC Node
> +--------
> +
> +- compatible:	One of:
> +		"aspeed,ast2400-lpc-bmc"
> +		"aspeed,ast2500-lpc-bmc"
> +
> +- reg:		contains the physical address and length values of the
> +                H8S/2168-compatible LPC controller memory region
> +
> +Host Node
> +---------
> +
> +- compatible:   One of:
> +		"aspeed,ast2400-lpc-host", "simple-mfd", "syscon"
> +		"aspeed,ast2500-lpc-host", "simple-mfd", "syscon"
> +
> +- reg:		contains the address and length values of the host-related
> +                register space for the Aspeed LPC controller
> +
> +- #address-cells: <1>
> +- #size-cells:	<1>
> +- ranges: 	Maps 0 to the address and length of the host-related LPC memory
> +                region
> +
> +Example:
> +
> +lpc: lpc@1e789000 {
> +	compatible = "aspeed,ast2500-lpc", "simple-mfd";
> +	reg = <0x1e789000 0x1000>;
> +
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	ranges = <0x0 0x1e789000 0x1000>;
> +
> +	lpc_bmc: lpc-bmc@0 {
> +		compatible = "aspeed,ast2500-lpc-bmc";
> +		reg = <0x0 0x80>;
> +	};
> +
> +	lpc_host: lpc-host@80 {
> +		compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
> +		reg = <0x80 0x1e0>;
> +		reg-io-width = <4>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x80 0x1e0>;
> +	};
> +};
> +

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
