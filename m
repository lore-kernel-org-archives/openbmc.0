Return-Path: <linux@roeck-us.net>
Received: from bh-25.webhostbox.net (bh-25.webhostbox.net [208.91.199.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wz2xf0NgczDr4k
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 01:04:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.b="Nbxjlz0C";
 dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c7P8bYscZOUMteFK+Vv353N03ip9tehpbpF71i9u3Aw=; b=Nbxjlz0CN1NREO/LhylACz+wN8
 NcVTeTQ11QN7MGDbEvHLB2vq4+PGEiYYOXLB9VhjB4SqhtgwYsRMZxBnJhp3x7CFjXN7Ap5uOd6dt
 moXJ5Q64ZthiqeES85tWKR0sZ5seerJvf4r18X+eh/lcCusFThGcWvy8V34kdFkPlXGq3wf1PSKSE
 EvlhbLvM85JM5aaF2BI0A+JgMJBRHpOD1lRIINMET25zE+Ql7mfmICCB/Ed5iF22wdV/Bsc/wGbDP
 bCNyJbvZAc9UvGjfYPpqNgUAZX3+iVqESCPuhtHlyoCUKbMFYMFkRcZKdFHPBgWBYtiDTXOpnTvOT
 GkCwVVVA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
 ([108.223.40.66]:42744 helo=localhost)
 by bh-25.webhostbox.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.89) (envelope-from <linux@roeck-us.net>)
 id 1dQazR-002HWT-WE; Thu, 29 Jun 2017 15:04:18 +0000
Date: Thu, 29 Jun 2017 08:04:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Cc: wim@iguana.be, robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
Message-ID: <20170629150417.GA10226@roeck-us.net>
References: <20170629002811.87199-1-cbostic@linux.vnet.ibm.com>
 <20170629002811.87199-2-cbostic@linux.vnet.ibm.com>
 <b51fedbb-837f-49ea-d050-4c3be82724c5@roeck-us.net>
 <21f28ed9-b73a-5c21-5557-bec1fef0d874@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21f28ed9-b73a-5c21-5557-bec1fef0d874@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 29 Jun 2017 15:04:23 -0000

On Thu, Jun 29, 2017 at 08:39:59AM -0500, Christopher Bostic wrote:
> 
> 
> On 6/28/17 10:33 PM, Guenter Roeck wrote:
> >On 06/28/2017 05:28 PM, Christopher Bostic wrote:
> >>Describe device tree optional properties:
> >>
> >>   * aspeed,arm-reet - ARM CPU reset on signal
> >>   * aspeed,no-soc-reset - SOC reset on signal
> >>   * aspeed,no-sys-reset - System reset on signal
> >>   * aspeed,interrupt - Interrupt CPU on signal
> >>   * aspeed,external-signal - Generate external signal (WDT1 and WDT2
> >>only)
> >>   * aspeed,alt-boot - Boot from alternate block on signal
> >>
> >>Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> >>---
> >>v3 - Invert soc and sys reset to 'no' to preserve backwards
> >>      compatibility.  SOC and SYS reset will be set by default
> >>      without any optional parameters set
> >>v2 - Add 'aspeed,' prefix to all optional properties
> >>    - Add arm-reset, soc-reset, interrupt, alt-boot properties
> >>---
> >>  .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 24
> >>++++++++++++++++++++++
> >>  1 file changed, 24 insertions(+)
> >>
> >>diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >>b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >>index c5e74d7..6f18005 100644
> >>--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >>+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> >>@@ -8,9 +8,33 @@ Required properties:
> >>   - reg: physical base address of the controller and length of memory
> >>mapped
> >>     region
> >>  +Optional properties:
> >>+   Signal behavior - Whenever a timeout occurs the watchdog can be
> >>programmed
> >>+   to generate/not generate 6 types of signals:
> >>+
> >>+ - aspeed,arm-reset:    If property is present then reset ARM CPU only.
> >>+            If not specified no ARM CPU reset is done.
> >>+
> >>+ - aspeed,no-soc-reset: If property is present then do not reset SOC.
> >>+            If not specified then SOC reset is done.
> >>+
> >>+ - aspeed,no-sys-reset: If property is present then do not reset
> >>system.
> >>+            Typcally used in tandem with 'aspeed-external-signal'
> >
> >Is this correct ? As I understand the datasheet, it could also used in
> >tandem with
> >aspeed,interrupt.
> True, that should be documented.  Will add that.
> >
> >>+            If not specified then system reset is done.
> >>+
> >
> >I'll leave it up to Rob to decide, but for my part I don't understand
> >no-soc-reset.
> As the aspeed watchdog driver exists prior to this change an SOC reset is
> done by
> default.   In order to preserve backwards compatibility a missing optional
> property
> should result in default behavior.  I however need to be able to specify
> that SOC
> reset be disabled in some way.  This goes back to our discussion about why
> we'd
> ever want to disable SYSTEM reset in the first place.  Same reasoning
> applies for
> SOC reset.
> 
> >I would instead use four properties.
> >
> >    aspeed,arm-reset
> >    aspeed,soc-reset
> Per my response above I think it should remain as aspeed,no-soc-reset due to
> backwards compatibility requirements.

The same can be accomplished with "aspeed,no-reset", which would avoid the, in
my opinion, awkward "no-{sys,soc}-reset" poperties.

> >    aspeed,sys-reset (which is the default)
> Again as per our discussion yesterday I need some way to specify how system
> reset is to  be done.  For backwards compatibility, a lack of parameter here
> would
> result in a system reset being configured.  Only way to indicate to the
> driver
> that no system reset is to be done is to indicate 'no' system reset in the
> optional
> parameter.

Or "aspeed,no-reset".

> >    aspeed,no-reset
> This parameter seems ambiguous as we could be doing a 'no system reset'
> or a 'no SOC reset' in theory.

{arm,soc,sys}-reset are mutually exclusive per datasheet, and there is a
separate configuration bit which enables the reset in the first place.
I don't see how that is ambiguous.

Anyway, I don't think we are making any progress here. Let's wait for
guidance from Rob.

Guenter

> >
> >There should also be a note explaining that the above are mutually
> >exclusive.
> >
> OK, will add that.
> 
> >>+ - aspeed,interrupt:    If property is present then interrupt CPU.
> >>+            If not specified then don't interrupt CPU.
> >>+
> >>+ - aspeed,external-signal: If property is present then signal is sent
> >>to
> >>+            external reset counter (only WDT1 and WDT2). If not
> >>+            specified no external signal is sent.
> >
> >For consistency, either add an empty line here or remove the empty lines
> >above
> 
> Will fix.
> 
> Thanks,
> Chris
> >
> >>+ - aspeed,alt-boot:    If property is present then boot from alternate
> >>block.
> >>+
> >>  Example:
> >>        wdt1: watchdog@1e785000 {
> >>          compatible = "aspeed,ast2400-wdt";
> >>          reg = <0x1e785000 0x1c>;
> >>+        aspeed,no-sys-reset;
> >>+        aspeed,external-signal;
> >>      };
> >>
> >
> 
