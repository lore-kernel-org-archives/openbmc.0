Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x5tcq2SCZzDqBr
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jul 2017 04:13:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="yshwWO8/";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OoNKebIxM7qGjEiFfvlJZ6T0D/e8SP3HoWpFuc6CDAo=; b=yshwWO8/yvrn69XEmyPbHFDwbP
 Duww5xxhY8ffSWKGxG9q6byhI4QwdVtNTsVpunxlaaVwSDdK3A9WIpOeUHFBaoYqfmlGqKwO5+siD
 RdeJb4Xm+BvCcuJ5AEUoCCElU87+ABWK0QKg5RITvvHZXz4KVs0iv48diWRA7pj87L0S33Po9wjzA
 mnjr2cjOA2LZyL/4YKTggrBweXJTrOFx1y/qqw+DZjBEBWfsc0e4AovO75brwY0wb4FiO6z3d3Lxr
 BIk6r8VmJeTEgptqiMjopYb7BQAAdH+Rh1yHzSaDDprdqBnrJMIMsy9ttoAl7sL/TUUPlIFmaWLd7
 wRPRvRBA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:35916 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dUdBW-000y2w-2M; Mon, 10 Jul 2017 18:13:26 +0000
Date: Mon, 10 Jul 2017 11:13:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-watchdog@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, wim@iguana.be, robh+dt@kernel.org
Subject: Re: [v4, 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
Message-ID: <20170710181325.GA31335@roeck-us.net>
References: <20170707004901.26780-2-cbostic@linux.vnet.ibm.com>
 <20170708145907.GA19078@roeck-us.net>
 <61225254-6b6c-672f-23f8-b7c9f24aa46e@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61225254-6b6c-672f-23f8-b7c9f24aa46e@linux.vnet.ibm.com>
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
X-List-Received-Date: Mon, 10 Jul 2017 18:13:32 -0000

On Mon, Jul 10, 2017 at 10:07:40AM -0500, Christopher Bostic wrote:
> 
> 
> On 7/8/17 9:59 AM, Guenter Roeck wrote:
> >On Thu, Jul 06, 2017 at 07:48:59PM -0500, Christopher Bostic wrote:
> >>Describe device tree optional properties:
> >>
> >>   * aspeed,reset-type = "cpu|soc|system|none"
> >>      One of three different, mutually exclusive, values
> >>
> >>	"cpu" : ARM CPU reset on signal
> >>	"soc" : 'System on chip' reset
> >>	"system" : Full system reset
> >>
> >>      The value can also be set to "none" which indicates that no
> >>      reset of any kind is to be done via this watchdog.  This assumes
> >>      another watchdog on the chip is to take care of resets.
> >>
> >>   * aspeed,interrupt - Interrupt CPU on signal
> >After thinking about that, I wonder if this is necessary. It could be
> >implied by providing an interrupt to the driver. The driver could then
> >set the interrupt configuration bit automatically.
> >
> >[ And the bit by itself doesn't really make sense if the driver doesn't
> >   also register an interrupt handler ]
> 
> The 'aspeed,interrupt' property was added for the sake of documenting all
> potential hardware configurations.  There is no plan as of now to enable
> this so I'm inclined to just remove this part from the documentation.  When
> and if this function is ever used the optional property can be documented at
> that time.
> 
Ok.

Thanks,
Guenter

> Thanks,
> Chris
> 
> >>   * aspeed,external-signal - Generate external signal (WDT1 and WDT2 only)
> >>   * aspeed,alt-boot - Boot from alternate block on signal
> >>
> >>Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> >>---
> >>v4 - Add aspeed-reset-type and assign one of four values,
> >>      cpu, soc, system, none.
> >>v3 - Invert soc and sys reset to 'no' to preserve backwards
> >>      compatibility.  SOC and SYS reset will be set by default
> >>      without any optional parameters set
> >>v2 - Add 'aspeed,' prefix to all optional properties
> >>    - Add arm-reset, soc-reset, interrupt, alt-boot properties
> >>---
> >>  .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 35 ++++++++++++++++++++++
> >>  1 file changed, 35 insertions(+)
> >>
> >>diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >>index c5e74d7..f526b00 100644
> >>--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >>+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >>@@ -8,9 +8,44 @@ Required properties:
> >>   - reg: physical base address of the controller and length of memory mapped
> >>     region
> >>+Optional properties:
> >>+
> >>+ - aspeed,reset-type = "cpu|soc|system|none"
> >>+
> >>+   Reset behavior - Whenever a timeout occurs the watchdog can be programmed
> >>+   to generate one of three different, mutually exclusive, types of resets.
> >>+
> >>+   Type "none" can be specified to indicate that no resets are to be done.
> >>+   This is useful in situations where another watchdog engine on chip is
> >>+   to perform the reset.
> >>+
> >>+   If 'aspeed,reset-type=' is not specfied the default is to enable system
> >>+   reset.
> >>+
> >>+   Reset types:
> >>+
> >>+        - cpu: Reset CPU on watchdog timeout
> >>+
> >>+        - soc: Reset 'System on Chip' on watchdog timeout
> >>+
> >>+        - system: Reset system on watchdog timeout
> >>+
> >>+        - none: No reset is performed on timeout. Assumes another watchdog
> >>+                engine is responsible for this.
> >>+
> >>+ - aspeed,interrupt:	If property is present then interrupt CPU.
> >>+			If not specified then don't interrupt CPU.
> >>+
> >>+ - aspeed,external-signal: If property is present then signal is sent to
> >>+			external reset counter (only WDT1 and WDT2). If not
> >>+			specified no external signal is sent.
> >>+ - aspeed,alt-boot:    If property is present then boot from alternate block.
> >>+
> >>  Example:
> >>  	wdt1: watchdog@1e785000 {
> >>  		compatible = "aspeed,ast2400-wdt";
> >>  		reg = <0x1e785000 0x1c>;
> >>+		aspeed,reset-type = "system";
> >>+		aspeed,external-signal;
> >>  	};
> 
