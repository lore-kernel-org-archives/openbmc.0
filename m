Return-Path: <pmeerw@pmeerw.net>
X-Greylist: delayed 477 seconds by postgrey-1.36 at bilbo;
 Wed, 22 Mar 2017 08:23:02 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=pmeerw.net header.i=@pmeerw.net header.b="pyf4qJMt"; 
 dkim-atps=neutral
Received: from vps.pmeerw.net (ns.pmeerw.net [84.19.176.117])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnm4k65lSzDq7c
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 08:23:02 +1100 (AEDT)
Received: by vps.pmeerw.net (Postfix, from userid 1000)
 id 2C15CE24EE; Tue, 21 Mar 2017 22:16:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=pmeerw.net; s=mail;
 t=1490130970; bh=eJ4u2hfjcV7LYxnQkf2flLEQ0t+mYYJPt6sXvOdR3qo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pyf4qJMtV4uf5fYNLwQxSisAH4NGaoqAvgoaC9QUpkQFHlrzn97lmjzbDW+4j5fhC
 rD4XKola2VxPBCuN5Exmz0tSd4a5o7anPs6cY1woLQ3xFlR6jPUKlm86DQgZfVUYT0
 vJWuH9ffzOZS7XY7JsyQsG1O+p4kqH3m0qd8fbUc=
Received: from localhost (localhost [127.0.0.1])
 by vps.pmeerw.net (Postfix) with ESMTP id 1634DE026C;
 Tue, 21 Mar 2017 22:16:10 +0100 (CET)
Date: Tue, 21 Mar 2017 22:16:10 +0100 (CET)
From: Peter Meerwald-Stadler <pmeerw@pmeerw.net>
To: Rick Altherr <raltherr@google.com>
cc: openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-iio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/2] Documentation: dt-bindings: Document bindings
 for Aspeed AST2400/AST2500 ADC
In-Reply-To: <20170321204828.31303-1-raltherr@google.com>
Message-ID: <alpine.DEB.2.20.1703212215100.26011@vps.pmeerw.net>
References: <20170321204828.31303-1-raltherr@google.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Wed, 22 Mar 2017 16:22:32 +1100
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
X-List-Received-Date: Tue, 21 Mar 2017 21:23:04 -0000


> Signed-off-by: Rick Altherr <raltherr@google.com>

extreme nitpicking below

 ---
> 
> Changes in v2:
> - Rewritten as an IIO ADC device
> 
>  .../devicetree/bindings/iio/adc/aspeed_adc.txt       | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> new file mode 100644
> index 000000000000..7748c2c2ad0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/aspeed_adc.txt
> @@ -0,0 +1,20 @@
> +Aspeed AST2400/2500 ADC
> +
> +This device is a 10-bit converter for 16 voltage channels.  All inputs are
> +single ended.
> +
> +Required properties:
> +- compatible: Should be "aspeed,ast2400-adc" or "aspeed,ast2500-adc"
> +- reg: memory window mapping address and length
> +- clocks: Input clock used to derive the sample clock. Expected to be the
> +          SoC's APB clock.
> +- #io-channel-cells: Must be set to <1> to indicate channels are selected
> +                     by index.
> +
> +Example:
> +	adc@1e6e9000 {
> +		compatible = "aspeed,ast2400-adc";
> +		reg = <0x1e6e9000 0xB0>;

maybe 0xb0 (consistent lowercase hex)?

> +		clocks = <&clk_apb>;
> +		#io-channel-cells = <1>;
> +	};
> 

-- 

Peter Meerwald-Stadler
Mobile: +43 664 24 44 418
