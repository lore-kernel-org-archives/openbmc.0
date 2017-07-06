Return-Path: <robherring2@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
 [209.85.161.194])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x3Kyv0RKTzDr4M
 for <openbmc@lists.ozlabs.org>; Fri,  7 Jul 2017 00:35:18 +1000 (AEST)
Received: by mail-yw0-f194.google.com with SMTP id a12so239915ywh.1
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jul 2017 07:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zQEUff21XyqJ6eIMBSnkYL4PJoOOI3MLjCSeNXvcZw8=;
 b=ffoZU47WDr1iBkCbugc799RdmiDOUsMcKsbufqXglmMEL1aifY+trNk5AW8T8R1HlK
 +jpfn2ai7fvKxeb05dGmBTGXyOWtTiA6S3KPVGjkSa0/DlwF6aRV1CWVIeyyDFxoTDd+
 9uJ+nb4Luqt1fJBLG5TifzBl+bHNJEyWR5uYOy22WosvlBe7n6yQb99AcImIaO3G1IzS
 NWY314EWC5lmMR4Jxe9E3Fmr33hRxqxVpiV3FGZOKwVtCF+y5zbZaWNGq8TqtJ2k5z0y
 v0AWYc1DfUd6eTcLFlhqmzER1957KvOWXafeUQCeHSVrv8+XUaFw3VL2kxJo8Dl6jZN2
 WCew==
X-Gm-Message-State: AKS2vOx4gda47+C2qVUfcVRRSAAYEaP9COkMV/gBNVDrllvnmJAQVn95
 r4Udc4WITTBHsg==
X-Received: by 10.129.84.195 with SMTP id i186mr38868465ywb.172.1499351715568; 
 Thu, 06 Jul 2017 07:35:15 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net.
 [24.223.123.72])
 by smtp.gmail.com with ESMTPSA id c124sm142388ywd.31.2017.07.06.07.35.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jul 2017 07:35:15 -0700 (PDT)
Date: Thu, 6 Jul 2017 09:35:12 -0500
From: Rob Herring <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>, wim@iguana.be,
 mark.rutland@arm.com, joel@jms.id.au,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] drivers/watchdog: Add optional ASPEED device tree
 properties
Message-ID: <20170706143512.bmjv2gnoqp5ew4py@rob-hp-laptop>
References: <20170629002811.87199-1-cbostic@linux.vnet.ibm.com>
 <20170629002811.87199-2-cbostic@linux.vnet.ibm.com>
 <b51fedbb-837f-49ea-d050-4c3be82724c5@roeck-us.net>
 <21f28ed9-b73a-5c21-5557-bec1fef0d874@linux.vnet.ibm.com>
 <20170629150417.GA10226@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170629150417.GA10226@roeck-us.net>
User-Agent: NeoMutt/20170113 (1.7.2)
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
X-List-Received-Date: Thu, 06 Jul 2017 14:35:19 -0000

On Thu, Jun 29, 2017 at 08:04:17AM -0700, Guenter Roeck wrote:
> On Thu, Jun 29, 2017 at 08:39:59AM -0500, Christopher Bostic wrote:
> > 
> > 
> > On 6/28/17 10:33 PM, Guenter Roeck wrote:
> > >On 06/28/2017 05:28 PM, Christopher Bostic wrote:
> > >>Describe device tree optional properties:
> > >>
> > >>   * aspeed,arm-reet - ARM CPU reset on signal
> > >>   * aspeed,no-soc-reset - SOC reset on signal
> > >>   * aspeed,no-sys-reset - System reset on signal
> > >>   * aspeed,interrupt - Interrupt CPU on signal
> > >>   * aspeed,external-signal - Generate external signal (WDT1 and WDT2
> > >>only)
> > >>   * aspeed,alt-boot - Boot from alternate block on signal
> > >>
> > >>Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> > >>---
> > >>v3 - Invert soc and sys reset to 'no' to preserve backwards
> > >>      compatibility.  SOC and SYS reset will be set by default
> > >>      without any optional parameters set
> > >>v2 - Add 'aspeed,' prefix to all optional properties
> > >>    - Add arm-reset, soc-reset, interrupt, alt-boot properties
> > >>---
> > >>  .../devicetree/bindings/watchdog/aspeed-wdt.txt    | 24
> > >>++++++++++++++++++++++
> > >>  1 file changed, 24 insertions(+)
> > >>
> > >>diff --git a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > >>b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > >>index c5e74d7..6f18005 100644
> > >>--- a/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > >>+++ b/Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt
> > >>@@ -8,9 +8,33 @@ Required properties:
> > >>   - reg: physical base address of the controller and length of memory
> > >>mapped
> > >>     region
> > >>  +Optional properties:
> > >>+   Signal behavior - Whenever a timeout occurs the watchdog can be
> > >>programmed
> > >>+   to generate/not generate 6 types of signals:
> > >>+
> > >>+ - aspeed,arm-reset:    If property is present then reset ARM CPU only.
> > >>+            If not specified no ARM CPU reset is done.
> > >>+
> > >>+ - aspeed,no-soc-reset: If property is present then do not reset SOC.
> > >>+            If not specified then SOC reset is done.
> > >>+
> > >>+ - aspeed,no-sys-reset: If property is present then do not reset
> > >>system.
> > >>+            Typcally used in tandem with 'aspeed-external-signal'
> > >
> > >Is this correct ? As I understand the datasheet, it could also used in
> > >tandem with
> > >aspeed,interrupt.
> > True, that should be documented.  Will add that.
> > >
> > >>+            If not specified then system reset is done.
> > >>+
> > >
> > >I'll leave it up to Rob to decide, but for my part I don't understand
> > >no-soc-reset.
> > As the aspeed watchdog driver exists prior to this change an SOC reset is
> > done by
> > default.   In order to preserve backwards compatibility a missing optional
> > property
> > should result in default behavior.  I however need to be able to specify
> > that SOC
> > reset be disabled in some way.  This goes back to our discussion about why
> > we'd
> > ever want to disable SYSTEM reset in the first place.  Same reasoning
> > applies for
> > SOC reset.
> > 
> > >I would instead use four properties.
> > >
> > >    aspeed,arm-reset
> > >    aspeed,soc-reset
> > Per my response above I think it should remain as aspeed,no-soc-reset due to
> > backwards compatibility requirements.
> 
> The same can be accomplished with "aspeed,no-reset", which would avoid the, in
> my opinion, awkward "no-{sys,soc}-reset" poperties.
> 
> > >    aspeed,sys-reset (which is the default)
> > Again as per our discussion yesterday I need some way to specify how system
> > reset is to  be done.  For backwards compatibility, a lack of parameter here
> > would
> > result in a system reset being configured.  Only way to indicate to the
> > driver
> > that no system reset is to be done is to indicate 'no' system reset in the
> > optional
> > parameter.
> 
> Or "aspeed,no-reset".
> 
> > >    aspeed,no-reset
> > This parameter seems ambiguous as we could be doing a 'no system reset'
> > or a 'no SOC reset' in theory.
> 
> {arm,soc,sys}-reset are mutually exclusive per datasheet, and there is a
> separate configuration bit which enables the reset in the first place.
> I don't see how that is ambiguous.
> 
> Anyway, I don't think we are making any progress here. Let's wait for
> guidance from Rob.

I tend to agree with Guenter.

Maybe using the form 'aspeed,reset-type = "cpu|soc|system"' would be 
more aligned to the type of reset being mutually exclusive. 

Rob
