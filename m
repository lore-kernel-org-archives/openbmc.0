Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wylcl2JMSzDr4V
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 13:33:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="wba4lU40";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6APHqC/PgmCr1kbM0dK6DdUyFTUGndVO8ai957/N7ps=; b=wba4lU40ho+CQczGki0iBLoXQ2
 szciLjN808VZCZXLlu/xl4KuqSSOvOSf9cFLLJvVOm6u80X2B2FJ6gFj4Yy5gA2zfRqnnLON9+Iav
 oKyZ0Vt1sik1QJez+khHFQoeFLfuBMrYhuz68RcyXqG8AB93CAQXE6/gWTsIRje3GGx3wukoXaB+5
 ePWymGSGK/N7RQqcsyKRT8K/dL0daSBt2zzh0OIde/FvM3ZnlxkNGWvRm+yg2I3pHsopv/srvdK8f
 RxXlQscR6kdRYOxzhxwAgMljusXtPKd7UO6UTiagcuEtDqmSZ3Sq/wICWBS0cZBl1vUNMPFa15pwL
 1GhSg/eA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:42460 helo=server.roeck-us.net)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dQQD5-003KYP-4s; Thu, 29 Jun 2017 03:33:39 +0000
Subject: Re: [PATCH v3 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>, wim@iguana.be,
 robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
References: <20170629002811.87199-1-cbostic@linux.vnet.ibm.com>
 <20170629002811.87199-2-cbostic@linux.vnet.ibm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b51fedbb-837f-49ea-d050-4c3be82724c5@roeck-us.net>
Date: Wed, 28 Jun 2017 20:33:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170629002811.87199-2-cbostic@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Authenticated_sender: linux@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
 linux@roeck-us.net
X-Authenticated-Sender: bh-25.webhostbox.net: linux@roeck-us.net
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
X-List-Received-Date: Thu, 29 Jun 2017 03:33:44 -0000

On 06/28/2017 05:28 PM, Christopher Bostic wrote:
> Describe device tree optional properties:
> 
>    * aspeed,arm-reet - ARM CPU reset on signal
>    * aspeed,no-soc-reset - SOC reset on signal
>    * aspeed,no-sys-reset - System reset on signal
>    * aspeed,interrupt - Interrupt CPU on signal
>    * aspeed,external-signal - Generate external signal (WDT1 and WDT2 only)
>    * aspeed,alt-boot - Boot from alternate block on signal
> 
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> v3 - Invert soc and sys reset to 'no' to preserve backwards
>       compatibility.  SOC and SYS reset will be set by default
>       without any optional parameters set
> v2 - Add 'aspeed,' prefix to all optional properties
>     - Add arm-reset, soc-reset, interrupt, alt-boot properties
> ---
>   .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> index c5e74d7..6f18005 100644
> --- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> @@ -8,9 +8,33 @@ Required properties:
>    - reg: physical base address of the controller and length of memory mapped
>      region
>   
> +Optional properties:
> +   Signal behavior - Whenever a timeout occurs the watchdog can be programmed
> +   to generate/not generate 6 types of signals:
> +
> + - aspeed,arm-reset:	If property is present then reset ARM CPU only.
> +			If not specified no ARM CPU reset is done.
> +
> + - aspeed,no-soc-reset: If property is present then do not reset SOC.
> +			If not specified then SOC reset is done.
> +
> + - aspeed,no-sys-reset: If property is present then do not reset system.
> +			Typcally used in tandem with 'aspeed-external-signal'

Is this correct ? As I understand the datasheet, it could also used in tandem with
aspeed,interrupt.

> +			If not specified then system reset is done.
> +

I'll leave it up to Rob to decide, but for my part I don't understand no-soc-reset.
I would instead use four properties.

	aspeed,arm-reset
	aspeed,soc-reset
	aspeed,sys-reset (which is the default)
	aspeed,no-reset

There should also be a note explaining that the above are mutually exclusive.

> + - aspeed,interrupt:	If property is present then interrupt CPU.
> +			If not specified then don't interrupt CPU.
> +
> + - aspeed,external-signal: If property is present then signal is sent to
> +			external reset counter (only WDT1 and WDT2). If not
> +			specified no external signal is sent.

For consistency, either add an empty line here or remove the empty lines above

> + - aspeed,alt-boot:    If property is present then boot from alternate block.
> +
>   Example:
>   
>   	wdt1: watchdog@1e785000 {
>   		compatible = "aspeed,ast2400-wdt";
>   		reg = <0x1e785000 0x1c>;
> +		aspeed,no-sys-reset;
> +		aspeed,external-signal;
>   	};
> 
