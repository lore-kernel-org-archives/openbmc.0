Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.68; helo=mail-oi0-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41KqsS2rpNzF1MY;
 Wed,  4 Jul 2018 02:51:55 +1000 (AEST)
Received: by mail-oi0-f68.google.com with SMTP id k12-v6so5149418oiw.8;
 Tue, 03 Jul 2018 09:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sBs1maIYDMZO+36cSG4e8VCZSRVYH39XH2ie5QV3ivs=;
 b=sYEcxVRPWaKx4iXc9L6gHzbqUbTCFY6QbDpN3FCzTsuhAF7V8gIDonKsrIEchFELjF
 PzZ8N0ZaOCbKTG+qiMsw/g6Pzh4cn4TMeUIr5F9i/ekCB+bh4IT20ZzxIGOHkZ1QjVY3
 6qyIRxXFH6d5HldxFCWSZMO61G83nxUhAck/CTFJO523TUqvJgkc9yCpzqUwC17IEOIn
 0gVmwoKM6WAihOX3fXTVCxm25mBK6iL+Zjp16WM7u22Pjo6HTe1VaIAKQc4bAXhnaU7C
 Bnh3jUnqQPQJFf4UdW15GquX/9AlBC3J1eT0K1kGgxYXpYVxvv4uM5FdLq5zG06KQDuR
 M/eQ==
X-Gm-Message-State: APt69E2D0n5yoIeKxVInOAmNRFv0q1M9hWtQKz+zcoTLQ5E5Cqrm7Iqa
 RltOFduxsQQTS7CXzhN3kQ==
X-Google-Smtp-Source: AAOMgpcyZtJO9E1h67U7/suHDOisQ77cnLmVMUdn8xqaj5+MMRcL+O9C87BSgSs+HArlBq3aryuObg==
X-Received: by 2002:aca:f5d1:: with SMTP id
 t200-v6mr14876493oih.12.1530636713668; 
 Tue, 03 Jul 2018 09:51:53 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id r3-v6sm667535oig.49.2018.07.03.09.51.52
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 03 Jul 2018 09:51:52 -0700 (PDT)
Date: Tue, 3 Jul 2018 10:51:48 -0600
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Jason M Biils <jason.m.bills@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 Milton Miller II <miltonm@us.ibm.com>, Pavel Machek <pavel@ucw.cz>,
 Robin Murphy <robin.murphy@arm.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH linux-next v6 04/13] dt-bindings: Add a document of PECI
 adapter driver for ASPEED AST24xx/25xx SoCs
Message-ID: <20180703165148.GA11628@rob-hp-laptop>
References: <20180621193721.20588-1-jae.hyun.yoo@linux.intel.com>
 <20180621194024.20771-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180621194024.20771-1-jae.hyun.yoo@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2018 16:51:56 -0000

On Thu, Jun 21, 2018 at 12:40:24PM -0700, Jae Hyun Yoo wrote:
> This commit adds a dt-bindings document of PECI adapter driver for ASPEED
> AST24xx/25xx SoCs.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Reviewed-by: James Feist <james.feist@linux.intel.com>
> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Milton Miller II <miltonm@us.ibm.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../devicetree/bindings/peci/peci-aspeed.txt  | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.txt b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> new file mode 100644
> index 000000000000..8c35f905589d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> @@ -0,0 +1,57 @@
> +Device tree configuration for PECI buses on the AST24XX and AST25XX SoCs.
> +
> +Required properties:
> +- compatible        : Should be "aspeed,ast2400-peci" or "aspeed,ast2500-peci"
> +		      - aspeed,ast2400-peci: ASPEED AST2400 family PECI
> +					     controller
> +		      - aspeed,ast2500-peci: ASPEED AST2500 family PECI
> +					     controller

Just this is sufficient:

Should be one of: 
	"aspeed,ast2400-peci"
	"aspeed,ast2500-peci"

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

> +- reg               : Should contain PECI controller registers location and
> +		      length.
> +- #address-cells    : Should be <1> required to define a client address.
> +- #size-cells       : Should be <0> required to define a client address.
> +- interrupts        : Should contain PECI controller interrupt.
> +- clocks            : Should contain clock source for PECI controller. Should
> +		      reference the external oscillator clock in the second
> +		      cell.
> +- resets            : Should contain phandle to reset controller with the reset
> +		      number in the second cell.
> +- clock-frequency   : Should contain the operation frequency of PECI controller
> +		      in units of Hz.
> +		      187500 ~ 24000000
> +
> +Optional properties:
> +- msg-timing        : Message timing negotiation period. This value will
> +		      determine the period of message timing negotiation to be
> +		      issued by PECI controller. The unit of the programmed
> +		      value is four times of PECI clock period.
> +		      0 ~ 255 (default: 1)
> +- addr-timing       : Address timing negotiation period. This value will
> +		      determine the period of address timing negotiation to be
> +		      issued by PECI controller. The unit of the programmed
> +		      value is four times of PECI clock period.
> +		      0 ~ 255 (default: 1)
> +- rd-sampling-point : Read sampling point selection. The whole period of a bit
> +		      time will be divided into 16 time frames. This value will
> +		      determine the time frame in which the controller will
> +		      sample PECI signal for data read back. Usually in the
> +		      middle of a bit time is the best.
> +		      0 ~ 15 (default: 8)
> +- cmd-timeout-ms    : Command timeout in units of ms.
> +		      1 ~ 60000 (default: 1000)
> +
> +Example:
> +	peci0: peci-bus@0 {
> +		compatible = "aspeed,ast2500-peci";
> +		reg = <0x0 0x60>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		interrupts = <15>;
> +		clocks = <&syscon ASPEED_CLK_GATE_REFCLK>;
> +		resets = <&syscon ASPEED_RESET_PECI>;
> +		clock-frequency = <24000000>;
> +		msg-timing = <1>;
> +		addr-timing = <1>;
> +		rd-sampling-point = <8>;
> +		cmd-timeout-ms = <1000>;
> +	};
> -- 
> 2.17.1
> 
