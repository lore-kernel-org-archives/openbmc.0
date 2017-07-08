Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x4ZPW6FwKzDr9C
 for <openbmc@lists.ozlabs.org>; Sun,  9 Jul 2017 00:59:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="FjdHJt6O";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RfyV82oO+3rS7oWOJGgbTr/11GqpRFND4HkggR8y+9g=; b=FjdHJt6ORL/0/KiL57dF5SUTxw
 ffu4nhUOg4Re/qIWxJz8bAmM/FCiCWl4NUxASCxviB1J8MupyzA4hgNtqxlSpulma/WizVa0z5BRR
 W8dOMIxf9wsM/DF5yrGCftChFgzaWFeb/tvOCOJQoCDVzG9/L4pauJXvIzj61z/M8lqoXI3p11jQC
 n1lURiO5j59iuu1MUsJ6uAwH+13KLaZ6j+Yi5p/XruVWJimyZbj0LFzyjMkmdJHvJSSWREc/nA4Si
 PvtY+RhpipxmZK4JXifGgKxlqisLyygQQ8OQ7NXw801mcaT9QxGiAX9npZ+c2RGmwqVgugp/CQXLD
 Ln7EPYFQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:33352 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dTrCO-004D6e-Lw; Sat, 08 Jul 2017 14:59:09 +0000
Date: Sat, 8 Jul 2017 07:59:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: wim@iguana.be, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [v4, 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
Message-ID: <20170708145907.GA19078@roeck-us.net>
References: <20170707004901.26780-2-cbostic@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170707004901.26780-2-cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Sat, 08 Jul 2017 14:59:12 -0000

On Thu, Jul 06, 2017 at 07:48:59PM -0500, Christopher Bostic wrote:
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
>   * aspeed,interrupt - Interrupt CPU on signal

After thinking about that, I wonder if this is necessary. It could be
implied by providing an interrupt to the driver. The driver could then
set the interrupt configuration bit automatically.

[ And the bit by itself doesn't really make sense if the driver doesn't
  also register an interrupt handler ]

>   * aspeed,external-signal - Generate external signal (WDT1 and WDT2 only)
>   * aspeed,alt-boot - Boot from alternate block on signal
> 
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v4 - Add aspeed-reset-type and assign one of four values,
>      cpu, soc, system, none.
> v3 - Invert soc and sys reset to 'no' to preserve backwards
>      compatibility.  SOC and SYS reset will be set by default
>      without any optional parameters set
> v2 - Add 'aspeed,' prefix to all optional properties
>    - Add arm-reset, soc-reset, interrupt, alt-boot properties
> ---
>  .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index c5e74d7..f526b00 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -8,9 +8,44 @@ Required properties:
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
> + - aspeed,interrupt:	If property is present then interrupt CPU.
> +			If not specified then don't interrupt CPU.
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
