Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xWbn90bqJzDqln
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 12:21:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="schrCnu2";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=couZmDdgBrlE9Uoa+V6tc9q53b10A2BSMeYp7Op3/zk=; b=schrCnu2KAqXG9zw1Qx2ToPGfP
 LazwVcNEcuxxpxZvlRewbt34c5YjEK5AkCHZ1MRQ7sfDrkpujaH2c+eGFYPSzq8EzCXc97uOwqs6L
 xzapW+CUmaDSSU3ZEffYpf93cynCXN8/FdIP5tpm3W1WvL3kPkiDqIdFPb8Hmu9/4m2dZZVDqQiwn
 JPYa54HXTI71twtZOEfgRuwGV7FMbiZ0l4Ad0yX5jneEG08Tp4/Ai4xpMwCovCSYqGwhspPjbQ0Ih
 rsFFjvefC6AxR7OJktR5MYBmli9lOYZWJWb554JiCPv6HwlOIo0Z1j3D8XXFS54gzEsWnfVKKqyC0
 wUdCdgIQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:58382 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dhRTW-000EC2-6L; Tue, 15 Aug 2017 02:20:58 +0000
Date: Mon, 14 Aug 2017 19:20:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-watchdog@vger.kernel.org, wim@iguana.be, robh+dt@kernel.org,
 mark.rutland@arm.com, joel@jms.id.au, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org
Subject: Re: [1/2] dt-bindings: watchdog: aspeed: External reset signal
 properties
Message-ID: <20170815022057.GA2172@roeck-us.net>
References: <20170802044529.30032-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170802044529.30032-2-andrew@aj.id.au>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 guenter@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
X-List-Received-Date: Tue, 15 Aug 2017 02:21:01 -0000

On Wed, Aug 02, 2017 at 02:15:28PM +0930, Andrew Jeffery wrote:
> For the AST2500 and compatible watchdog controllers the external reset
> signal can be configured for push-pull or open-drain drive types, and in
> the case of push-pull driving, active low or high.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index 2b34ce9b60b9..c5077a1f5cb3 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -33,10 +33,18 @@ Optional properties:
>          - none: No reset is performed on timeout. Assumes another watchdog
>                  engine is responsible for this.
>  
> + - aspeed,alt-boot:    If property is present then boot from alternate block.
>   - aspeed,external-signal: If property is present then signal is sent to
>  			external reset counter (only WDT1 and WDT2). If not
>  			specified no external signal is sent.
> - - aspeed,alt-boot:    If property is present then boot from alternate block.
> + - aspeed,ext-pulse-duration: External signal pulse duration in microseconds
> +
> +Optional properties for AST2500-compatible watchdogs:
> + - aspeed,ext-push-pull: If aspeed,external-signal is present, set the pin's
> +			 drive type to push-pull. The default is open-drain.
> + - aspeed,ext-active-high: If aspeed,external-signal is present and and the pin
> +			   is configured as push-pull, then set the pulse
> +			   polarity to active-high. The default is active-low.
>  
>  Example:
>  
