Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xWbjn3GgczDr9H
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 12:18:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="wlcX4c5+";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wrwp2/xhN4yQRaPtglERDqkQxvRil+hzKLEafKSQ2tg=; b=wlcX4c5+4ooreVA59ax7o/Jc7q
 1Bepr/+FLT0m9uJTxgKTgXffp5059nZ5c62hrtrJDM8PTVkgJcPTxUUbfZfgZ5R1hd7mXlrVCTkkE
 n46IUn/OeWIu1Ef+2vChhDifyWa50JyKupTYyJrk+xOcEuSJmT7ewahgNz3QzQ3CSKNs4EvLkxr4g
 tgoOz867R3gicip2gP9CQf1bfowJWePcSD7RXiSqvWT1RafRkF+/xg7iCOUS9FyUgMXQBrTUNZJdE
 YEGnOWtJf9j0JP5MLRVHWOk7dg11cloA9Q5hJW0lVkSIcpT8M/lRelsoa1Rg7Mrtp3tTSeJGpn/P8
 +QXZN8OA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:58328 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dhRQg-00087r-OQ; Tue, 15 Aug 2017 02:18:03 +0000
Date: Mon, 14 Aug 2017 19:18:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: wim@iguana.be, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [v5, 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
Message-ID: <20170815021801.GA1819@roeck-us.net>
References: <20170717192539.7950-2-cbostic@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170717192539.7950-2-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 15 Aug 2017 02:18:05 -0000

On Mon, Jul 17, 2017 at 02:25:38PM -0500, Christopher Bostic wrote:
> Describe device tree optional properties:
> 
>   * aspeed,reset-type = "cpu|soc|system|none"
>      One of three different, mutually exclusive, values
> 
> 	"cpu" : ARM CPU reset on signal
> 	"soc" : 'System on chip' reset
> 	"system" : Full system reset
> 
>      The value can also be set to "none" which indicates that no
>      reset of any kind is to be done via this watchdog.  This assumes
>      another watchdog on the chip is to take care of resets.
> 
>   * aspeed,external-signal - Generate external signal (WDT1 and WDT2 only)
>   * aspeed,alt-boot - Boot from alternate block on signal
> 
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v5 - Removed aspeed,interrupt property - no plans at this point to
>      need this functionality in the driver.
> v4 - Add aspeed-reset-type and assign one of four values,
>      cpu, soc, system, none.
> v3 - Invert soc and sys reset to 'no' to preserve backwards
>      compatibility.  SOC and SYS reset will be set by default
>      without any optional parameters set
> v2 - Add 'aspeed,' prefix to all optional properties
>    - Add arm-reset, soc-reset, interrupt, alt-boot properties
> ---
>  .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index c5e74d7..2b34ce9 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -8,9 +8,41 @@ Required properties:
>   - reg: physical base address of the controller and length of memory mapped
>     region
>  
> +Optional properties:
> +
> + - aspeed,reset-type = "cpu|soc|system|none"
> +
> +   Reset behavior - Whenever a timeout occurs the watchdog can be programmed
> +   to generate one of three different, mutually exclusive, types of resets.
> +
> +   Type "none" can be specified to indicate that no resets are to be done.
> +   This is useful in situations where another watchdog engine on chip is
> +   to perform the reset.
> +
> +   If 'aspeed,reset-type=' is not specfied the default is to enable system
> +   reset.
> +
> +   Reset types:
> +
> +        - cpu: Reset CPU on watchdog timeout
> +
> +        - soc: Reset 'System on Chip' on watchdog timeout
> +
> +        - system: Reset system on watchdog timeout
> +
> +        - none: No reset is performed on timeout. Assumes another watchdog
> +                engine is responsible for this.
> +
> + - aspeed,external-signal: If property is present then signal is sent to
> +			external reset counter (only WDT1 and WDT2). If not
> +			specified no external signal is sent.
> + - aspeed,alt-boot:    If property is present then boot from alternate block.
> +
>  Example:
>  
>  	wdt1: watchdog@1e785000 {
>  		compatible = "aspeed,ast2400-wdt";
>  		reg = <0x1e785000 0x1c>;
> +		aspeed,reset-type = "system";
> +		aspeed,external-signal;
>  	};
