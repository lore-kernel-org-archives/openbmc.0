Return-Path: <robherring2@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.218.66; helo=mail-oi0-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
 [209.85.218.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41TnVc0bStzDr55;
 Tue, 17 Jul 2018 01:33:11 +1000 (AEST)
Received: by mail-oi0-f66.google.com with SMTP id b15-v6so75517165oib.10;
 Mon, 16 Jul 2018 08:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Wl/hkASMuDEBUuX098udBNXtuOBN46mXEXqJr6BW3bQ=;
 b=GSJ+z3Ysa6PNhJCcHkKtF39d8IDfYt9x7op3coE9/LEMK1IhJAH2FGoceSheOvoc9l
 56EY+emmM+CyJqAHlBO79bS4DE0MS4i5+9gvxPNNpCCenNuCGNHoQAcX2GhSUqGer10t
 ofO2EDxjd1a5Jl5vJowF6Mk4zoAmRgVGBXtUUsQyZSIA7vnOo4S+/OF6yybw7OS6ONMw
 g5UCMbLTzJ5nbyb0Ai8KWT01colg860G5GInn86F74yqjJgwQBIawkAvRFRpC9ua0kDb
 1ckBRLp2Rzz1JvE2KrVezhN8tI8eu6cVr6soNjl3hZnsV1d1d2vo1ydFNxcMBXt6pPUR
 zHJg==
X-Gm-Message-State: AOUpUlFUM3ZbvGtO6TYT5GUw0lmb08AFL8VWUcPlowwxEZsa3Ui73d2q
 oIkwSKFxuEbQm1Nx97V/aw==
X-Google-Smtp-Source: AAOMgpeX9nxGgWhAiSjZbtvfUwVfJsYh4py/l/8EBFQBqB74MgZP6AnBG9Xz1L9ftu9UBlgn3y4UiQ==
X-Received: by 2002:aca:5583:: with SMTP id
 j125-v6mr19786056oib.2.1531755189761; 
 Mon, 16 Jul 2018 08:33:09 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id i204-v6sm24189743oia.41.2018.07.16.08.33.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 16 Jul 2018 08:33:09 -0700 (PDT)
Date: Mon, 16 Jul 2018 09:33:08 -0600
From: Rob Herring <robh@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: fsi: Document binding for the
 fsi-master-ast-cf "device"
Message-ID: <20180716153308.GA13044@rob-hp-laptop>
References: <20180712034847.12878-1-benh@kernel.crashing.org>
 <20180712034847.12878-2-benh@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180712034847.12878-2-benh@kernel.crashing.org>
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
X-List-Received-Date: Mon, 16 Jul 2018 15:33:12 -0000

On Thu, Jul 12, 2018 at 01:48:43PM +1000, Benjamin Herrenschmidt wrote:
> This isn't per-se a real device, it's a pseudo-device that
> represents the use of the Aspeed built-in ColdFire to
> implement the FSI protocol by bitbanging the GPIOs instead
> of doing it from the ARM core.
> 
> Thus it's a drop-in replacement for the existing
> fsi-master-gpio pseudo-device for use on systems based
> on the Aspeed chips. It has most of the same properties,
> plus some more needed to operate the coprocessor.
> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>  .../bindings/fsi/fsi-master-ast-cf.txt        | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fsi/fsi-master-ast-cf.txt
> 
> diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-ast-cf.txt b/Documentation/devicetree/bindings/fsi/fsi-master-ast-cf.txt
> new file mode 100644
> index 000000000000..431bf8a423ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/fsi-master-ast-cf.txt
> @@ -0,0 +1,36 @@
> +Device-tree bindings for ColdFire offloaded gpio-based FSI master driver
> +------------------------------------------------------------------------
> +
> +Required properties:
> + - compatible =
> +	"aspeed,ast2400-cf-fsi-master" for an AST2400 based system
> +   or
> +	"aspeed,ast2500-cf-fsi-master" for an AST2500 based system
> +
> + - clock-gpios = <gpio-descriptor>;	: GPIO for FSI clock
> + - data-gpios = <gpio-descriptor>;	: GPIO for FSI data signal
> + - enable-gpios = <gpio-descriptor>;	: GPIO for enable signal
> + - trans-gpios = <gpio-descriptor>;	: GPIO for voltage translator enable
> + - mux-gpios = <gpio-descriptor>;	: GPIO for pin multiplexing with other
> +                                          functions (eg, external FSI masters)
> + - memory-region = <phandle>;		: Reference to the reserved memory for
> +                                          the ColdFire. Must be 2M aligned on
> +					  AST2400 and 1M aligned on AST2500
> + - aspeed,sram = <phandle>;		: Reference to the SRAM node.
> + - aspeed,cvic = <phandle>;		: Reference to the CVIC node.
> +
> +Examples:
> +
> +    fsi-master {
> +        compatible = "aspeed,ast2500-cf-fsi-master", "fsi-master";
> +
> +	clock-gpios = <&gpio 0>;
> +        data-gpios = <&gpio 1>;
> +        enable-gpios = <&gpio 2>;
> +        trans-gpios = <&gpio 3>;
> +        mux-gpios = <&gpio 4>;
> +
> +	memory-region = <&coldfire_memory>;
> +	sram = <&sram>;
> +	cvic = <&cvic>;

Need to update the example. With that,

Reviewed-by: Rob Herring <robh@kernel.org>
