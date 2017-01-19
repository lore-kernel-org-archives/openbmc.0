Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x244.google.com (mail-pg0-x244.google.com
 [IPv6:2607:f8b0:400e:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3ky06lRzzDqHR
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 11:20:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QWsPxLSD"; 
 dkim-atps=neutral
Received: by mail-pg0-x244.google.com with SMTP id 194so2559083pgd.0
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2017 16:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5PH9cXW5moI//dAyXUMXqCPIT3vxgLZEHsoTvT1qBcM=;
 b=QWsPxLSDMIgSmZVNlzcp6R4c9XErq1eYFxCeswb6qzUZBR6i02aTIJLS8/qmq0yUC0
 Bhnjtz79XPf14EHlclGhSeHiMSfsfn8ea1APa6LVgPGzeRJEn1wgc+IPs2jmQGkLeLKq
 S5xrjk3FX0GBo00r+he296nLZPh7Cm3Zm1gTjNIihc5DaQgJUuvZMqMyWZRYKywfWqH7
 KYjaq0FUfz7oSFhVGbe2XFNacqXxxdRtQgrN0S9++VreUn5nc31y+X1RUB95xmTQ1W+w
 ygsLDJTECT5IO65WgIeXsOZt4JF2nDB0uJv3PeJRjXbU/6qGP5mGetHsDhldMhIKuvU3
 zfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5PH9cXW5moI//dAyXUMXqCPIT3vxgLZEHsoTvT1qBcM=;
 b=LbvogibRzK/d0H4Z8KN85LYRUqS/z6tLBJVggoB4MyWI0Q7AvmEUp3Y9gMfUtvbCtS
 lbkRzILWj5GHD+h2ZgwocvBnfkFuFpnBCyIZ/FWo8PJHkRR/5eJVOQ2eiLA8LW/inMs9
 2Qnvi/EXlwtY4D9skBwNdQMO/jZY9WFpwJlLTlTgiK4azjYYhHm7SA2dyZTCMB/mJa7B
 F/35fEozBvhNEfajsjKueWNU28d44Ci/SbzlEt+N6bdgYgtiiDZts7XXwh8oREC82ymm
 xqzRo/FYqBSrOeXl2QstQV2T67im/gbr7GSwdVn2MmRh+ZqmuWxfzUoKCytgTWL2d+cP
 KXjQ==
X-Gm-Message-State: AIkVDXIJP0FLb4shOaP4/Uc2nBbHk/1R4qVgIXZ1j3SIRRgkHuOZEfKiuaFXFGtnFSTxDw==
X-Received: by 10.99.226.83 with SMTP id y19mr7043432pgj.147.1484785223122;
 Wed, 18 Jan 2017 16:20:23 -0800 (PST)
Received: from [138.44.241.182] ([138.44.241.182])
 by smtp.googlemail.com with ESMTPSA id x81sm3279451pff.69.2017.01.18.16.20.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Jan 2017 16:20:22 -0800 (PST)
Message-ID: <1484785163.4097.5.camel@gmail.com>
Subject: Re: [PATCH 2/4] Documentation: dt: misc: Add Aspeed ast2400/2500
 LPC Control bindings
From: Cyril Bur <cyrilbur@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, jassisinghbrar@gmail.com, arnd@arndb.de, 
 gregkh@linuxfoundation.org, joel@jms.id.au, mark.rutland@arm.com, 
 openbmc@lists.ozlabs.org, andrew@aj.id.au, benh@kernel.crashing.org, 
 xow@google.com, jk@ozlabs.org
Date: Thu, 19 Jan 2017 11:19:23 +1100
In-Reply-To: <20170118211645.v54xvmxcsfzxior2@rob-hp-laptop>
References: <20170112002910.3650-1-cyrilbur@gmail.com>
 <20170112002910.3650-3-cyrilbur@gmail.com>
 <20170118211645.v54xvmxcsfzxior2@rob-hp-laptop>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 19 Jan 2017 00:20:25 -0000

On Wed, 2017-01-18 at 15:16 -0600, Rob Herring wrote:
> On Thu, Jan 12, 2017 at 11:29:08AM +1100, Cyril Bur wrote:
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> >  .../devicetree/bindings/misc/aspeed-lpc-ctrl.txt   | 78 ++++++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt b/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
> > new file mode 100644
> > index 000000000000..f84ac83211ec
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/aspeed-lpc-ctrl.txt
> > @@ -0,0 +1,78 @@
> > +ASpeed LPC Control
> > +==================
> > +This binding defines the LPC control for ASpeed SoCs. Partitions of
> > +the LPC bus can be access by other processors on the system, address
> > +ranges on the bus can map accesses from another processor to regions
> > +of the ASpeed SoC memory space.
> > +
> > +Reserved Memory:
> > +================
> > +The driver provides functionality to map the LPC bus to a region of
> > +ASpeed ram. A phandle to a reserved memory node must be provided so
> > +that the driver can safely use this region.
> > +
> > +Flash:
> > +======
> > +The driver provides functionality to unmap the LPC bus from ASpeed
> > +RAM, historically the default mapping has been to the SPI flash
> > +controller on the ASpeed SoC, a phandle to this node should be
> > +supplied.
> > +
> > +Device Node:
> > +============
> > +
> > +As LPC bus configuration registers are at the start of the LPC bus
> > +memory space, it makes most sense for the device to be within the LPC
> > +host node. See Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> > +for more information. This does not have to be the case, provided the
> > +reg property can give the full address of the LPC bus.
> 
> Same comment here.
> 

Hi Rob,

Yes, thanks.

> > +
> > +Required properties:
> > +--------------------
> > +
> > +- compatible:		"aspeed,ast2400-lpc-ctrl" for ASpeed ast2400 SoCs
> > +					"aspeed,ast2500-lpc-ctrl" for ASpeed ast2500 SoCs
> > +
> > +- reg:				Location and size of the configuration registers
> > +					for the LPC bus. Note that if the device node is
> > +					within the LPC host node then base is relative to
> > +					that.
> > +
> > +- memory-region:	phandle of the reserved memory region
> > +- flash:			phandle of the SPI flash controller
> > +
> > +Example:
> > +--------
> > +
> > +reserved-memory {
> > +	#address-cells = <1>;
> > +	#size-cells = <1>;
> > +	ranges;
> > +
> > +	...
> > +
> > +	flash_memory: region@54000000 {
> > +		compatible = "aspeed,ast2400-lpc-ctrl";
> 
> This doesn't look right?
> 

Correct, my mistake, I'll remove.

> > +		no-map;
> > +		reg = <0x54000000 0x04000000>; /* 64M */
> 
> Is this system RAM? reserved-memory is generally for carveouts in system 
> RAM (e.g. the memory node).
> 

Yes it will be a chunk of system RAM. Our intended use case is to use
system ram to buffer host accesses to system flash (on the bmc). This
provides control over concurrent access to the flash and place to add
security measures to prevent the host from backdooring through the
flash. With the use of a protocol through the platform mailbox.

Having said that I don't want to limit myself to just that - there has
been other ideas for a host<->bmc ram buffer which may or may not see
the light of day.

I hope that makes sense,

Thanks for the review,

Cyril

> > +	};
> > +};
> > +
> > +host_pnor: spi@1e630000 {
> > +	reg = < 0x1e630000 0x18
> > +			0x30000000 0x02000000 >;
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	compatible = "aspeed,ast2400-smc";
> > +
> > +	...
> > +
> > +};
> > +
> > +lpc-ctrl@0 {
> > +	compatible = "aspeed,ast2400-lpc-ctrl";
> > +	memory-region = <&flash_memory>;
> > +	flash = <&host_pnor>;
> > +	reg = <0x0 0x80>;
> > +};
> > +
> > -- 
> > 2.11.0
> > 
