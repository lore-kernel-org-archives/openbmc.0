Return-Path: <robherring2@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
 [209.85.218.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sdK1l4B44zDsfW
 for <openbmc@lists.ozlabs.org>; Tue, 20 Sep 2016 07:35:39 +1000 (AEST)
Received: by mail-oi0-f68.google.com with SMTP id a62so2259047oib.1
 for <openbmc@lists.ozlabs.org>; Mon, 19 Sep 2016 14:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GBQEywmIH0vHldpqNxKfaw8UOVNsWX+4VvVvRk0oE7Y=;
 b=UnTXzQqTXg939MPclAiv0bhojZxEaeMW73/kEHyd4IMg7SWSqJoVuLvvpgIjiIir+j
 oCRRY2JBRpUGOadloW9nzF0NNT9MGYc7HIUHJOW0D6KWP9/c+t99/Qoe2ZI2vU7x6t/m
 g08R3Tf+tDoM133Sv39OGP43lk46qPhERDkyPhDZ5UR8OTcJA6168lNo8Mlf/KBwyXod
 b6G6ju1/eT5kzOocJdd78nzx7YmnZm26NcZAkYkyk/LMgNjAK/RjqvcnDTcvz/15oPKG
 SYoWwSrf3TFzghszevQe0LkNZy87ceIR7KfRJ5LTPTi2CiDYaqWHpjeVsp/QOQ6taJFi
 Mc0g==
X-Gm-Message-State: AE9vXwOSosXCeH7HovvkjTAdZDSPWMY+GaFc3M3jK1MV/FhQ0y9KyWwldFhOEKz2yT+ULQ==
X-Received: by 10.202.182.134 with SMTP id g128mr35152715oif.148.1474320937189; 
 Mon, 19 Sep 2016 14:35:37 -0700 (PDT)
Received: from localhost (72-48-98-129.dyn.grandenetworks.net. [72.48.98.129])
 by smtp.gmail.com with ESMTPSA id
 o185sm17835509oif.26.2016.09.19.14.35.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Sep 2016 14:35:36 -0700 (PDT)
Date: Mon, 19 Sep 2016 16:35:36 -0500
From: Rob Herring <robh@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: wsa@the-dreams.de, mark.rutland@arm.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, joel@jms.id.au, jk@ozlabs.org
Subject: Re: [PATCH v2 2/2] i2c: aspeed: added documentation for Aspeed I2C
 driver
Message-ID: <20160919213536.GA19274@rob-hp-laptop>
References: <201609100847.j1qUadzy%fengguang.wu@intel.com>
 <1473472551-11149-1-git-send-email-brendanhiggins@google.com>
 <1473472551-11149-2-git-send-email-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1473472551-11149-2-git-send-email-brendanhiggins@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Tue, 20 Sep 2016 12:06:31 +1000
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
X-List-Received-Date: Mon, 19 Sep 2016 21:35:40 -0000

On Fri, Sep 09, 2016 at 06:55:51PM -0700, Brendan Higgins wrote:
> Added device tree binding documentation for Aspeed I2C controller and
> busses.
> 
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> Changes for v2:
>   - None
> ---
>  .../devicetree/bindings/i2c/i2c-aspeed.txt         | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> new file mode 100644
> index 0000000..df68f2a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i2c/i2c-aspeed.txt
> @@ -0,0 +1,63 @@
> +Device tree configuration for the I2C controller and busses on the AST24XX
> +and AST25XX SoCs.
> +
> +Controller:
> +
> +	Required Properties:
> +	- #address-cells	: should be 1
> +	- #size-cells 		: should be 1
> +	- #interrupt-cells 	: should be 1
> +	- compatible 		: should be "aspeed,ast2400-i2c-controller"
> +				  or "aspeed,ast2500-i2c-controller"
> +	- reg			: address start and range of controller
> +	- ranges		: defines address offset and range for busses
> +	- interrupts		: interrupt number
> +	- clocks		: root clock of bus, should reference the APB
> +				  clock
> +	- clock-ranges		: specifies that child busses can inherit clocks
> +	- interrupt-controller	: denotes that the controller receives and fires
> +				  new interrupts for child busses
> +
> +Bus:
> +
> +	Required Properties:
> +	- #address-cells	: should be 1
> +	- #size-cells		: should be 0
> +	- reg			: address offset and range of bus
> +	- compatible		: should be "aspeed,ast2400-i2c-bus"
> +				  or "aspeed,ast2500-i2c-bus"
> +	- bus			: the bus's number

Don't use indexes. The reg property is enough to id which bus is which.
