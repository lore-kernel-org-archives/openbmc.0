Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v21Jq1ZJSzDqRT
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:00:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vdfykfoN"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id 19so2584651pfo.3
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jan 2017 21:00:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b558PKPd4N4mA+Wyq4FA6zUsvt3SSIP++NRNYav0qdA=;
 b=vdfykfoNs/SmlctvfJ2Pz3gFK+iif+GKxWhYmKfRv/7rcHlqsoYA1yRCuT5upPtCZu
 qCeFaji6q/pWPpA5dPrwzcWzeJsCXzE+DSCdE+V8AioEpiXtbn7v8bpmLnDXZsA1qQTx
 9I4gxVQUgLLOomkhef7AxfcSHYG5WBpHZoWCvu8UbASzGiGNelq6qBqhA5d02OATnXtv
 R+XNm5DLm55YtKD0RNj7JhR+Abh+R5x0DtTudqZOiNfxNXPRON489wd5sxiLUxZnRctD
 2X0/779J/PS85Uw5o5MbtNBTBjBW1v+oyy8BIpBQw5EyTY+ilI/i1smo4BlFTee2pSh3
 H+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b558PKPd4N4mA+Wyq4FA6zUsvt3SSIP++NRNYav0qdA=;
 b=cuTZrMeyALQZT9+YpxbmBOMSXd4Te4Pey15DbwDHRJQwP3Xt7HTAcPJrmpSmbZclHS
 PY3A9jO7qgfHuI+0wflwQbYmxx0R1ueGnkaF39JeKTjEbC+5/xlWV0Jg9xm4HhWp1I9G
 Cnb3eqTInhe6s5q9ZxyJY1d8gn8AOTVXfZ+2G7SESENNGtV7tEQoijUMho3q3fSLI9L+
 NGSd3cNdI+qfOBSTsGh4XjU3ZMsldJX1ejkAMv8ghYPu2VBi2bPze2YQNhVtfUTGI2ES
 ihoqvBpS1d1sDZhoWILx7mbaxXJM2gNwz0DL2Ni8u/iEX1zXxCo7lnyakhvSzlU5IkjU
 FD/A==
X-Gm-Message-State: AIkVDXL5BPjvMfMBx4DyUq9kAElvGoPakrhkU9B11+Uy85jkhLxs19tRnmkORyyIaCIdwg==
X-Received: by 10.84.217.133 with SMTP id p5mr47879540pli.164.1484542841100;
 Sun, 15 Jan 2017 21:00:41 -0800 (PST)
Received: from [138.44.241.182] ([138.44.241.182])
 by smtp.googlemail.com with ESMTPSA id y201sm1245366pfb.16.2017.01.15.21.00.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Jan 2017 21:00:40 -0800 (PST)
Message-ID: <1484542781.5646.2.camel@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed-g5: Add mailbox and LPC Control nodes
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery
 <andrew@aj.id.au>
Date: Mon, 16 Jan 2017 15:59:41 +1100
In-Reply-To: <CACPK8XfDVKQtO6d6sN8e=dUmE=F-MDMpWrsxDoEkeVU3h+WzSA@mail.gmail.com>
References: <20170116010646.8057-1-cyrilbur@gmail.com>
 <CACPK8XfDVKQtO6d6sN8e=dUmE=F-MDMpWrsxDoEkeVU3h+WzSA@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Jan 2017 05:00:44 -0000

On Mon, 2017-01-16 at 14:56 +1100, Joel Stanley wrote:
> On Mon, Jan 16, 2017 at 12:06 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > This reserves BMC ram for host to BMC communication required by the
> > LPC control driver.
> > 
> > As both these devices exist on the LPC bus these nodes are children
> > of a new LPC node.
> > 
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed-g5.dtsi | 50 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
> 
> 
> > index d6ff41ee6c58..51c339b46740 100644
> > --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> > @@ -18,6 +18,18 @@
> >                 };
> >         };
> > 
> > +       reserved-memory {
> > +               #address-cells = <1>;
> > +               #size-cells = <1>;
> > +               ranges;
> > +
> > +               flash_memory: region@94000000 {
> > +                       compatible = "aspeed,ast2500-lpc-ctrl";
> 
> That doesn't make sense, the RAM isn't a LPC Host Controller.
> 

Agreed, I have a feeling that the lpc-ctrl driver didn't probe wihtout
that. I don't have either machine that this would work on handy to
test. I'm hopeful I'm wrong here because I agree that it doesn't make
sense that this should have that compatible property.

> > +                       no-map;
> > +                       reg = <0x94000000 0x04000000>; /* 64M */
> 
> We don't want this in the dtsi, as there are platforms that don't use
> LPC buses that lose 64 MB of ram. Put this node in the dts. We might
> decide to have an aspeed-bmc-opp.dtsi with common snippets, but for
> now cut and paste.
> 

I agree we don't want it here but I have a very strong aversion to
large chunks of ctrl+c and ctrl+v.

> Have you investigated reserving this memory when the driver probes
> instead of hardcoding it?

Yes, this is by far the cleanest way of getting such a large chunk. If
we do want to drop our usage to 4k or 64k then there are methods at
runtime but for this amount the DT is really the way to go.

This is somthing we can probably add to driver one day. If it doens't
find a reserved-memory node then it should allocate at runtime but that
 allocation will likely need to be smaller orders of megs

> 
> > +               };
> > +       };
> > +
> >         ahb {
> >                 compatible = "simple-bus";
> >                 #address-cells = <1>;
> > @@ -89,6 +101,44 @@
> >                         };
> >                 };
> > 
> > +               lpc: lpc@1e789000 {
> > +                       compatible = "aspeed,ast2500-lpc", "simple-mfd";
> > +                       reg = <0x1e789000 0x1000>;
> > +
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +                       ranges = <0x0 0x1e789000 0x1000>;
> > +
> > +                       lpc_bmc: lpc-bmc@0 {
> > +                               compatible = "aspeed,ast2500-lpc-bmc";
> > +                               reg = <0x0 0x80>;
> > +                       };
> > +
> > +                       lpc_host: lpc-host@80 {
> > +                               compatible = "aspeed,ast2500-lpc-host", "simple-mfd", "syscon";
> > +                               reg = <0x80 0x1e0>;
> > +                               reg-io-width = <4>;
> > +
> > +                               #address-cells = <1>;
> > +                               #size-cells = <1>;
> > +                               ranges = <0x0 0x80 0x1e0>;
> > +
> > +                               lpc-ctrl@0 {
> 
> This needs to have a label.
> 
> > +                                       compatible = "aspeed,ast2500-lpc-ctrl";
> > +                                       memory-region = <&flash_memory>;
> > +                                       flash = <&spi1>;
> 
> Make this node status = "disabled" in the dtsi, and omit the flash phandle.
> 
> I also suggest we have your phandle links for memory and flash in the dts too.
> 
> > +                                       reg = <0x0 0x80>;
> > +                               };
> > +
> > +                               mbox: mbox@180 {
> > +                                       compatible = "aspeed,ast2500-mbox";
> > +                                       reg = <0x180 0x5c>;
> > +                                       interrupts = <46>;
> > +                                       #mbox-cells = <1>;
> 
> Make this node status = "disabled" in the dtsi.
> 

Re all those comments above, I think I see what you're getting at.

Thanks,

Cyril

> Cheers,
> 
> Joel
> 
> > +                               };
> > +                       };
> > +               };
> > +
> >                 vic: interrupt-controller@1e6c0080 {
> >                         compatible = "aspeed,ast2400-vic";
> >                         interrupt-controller;
> > --
> > 2.11.0
> > 
