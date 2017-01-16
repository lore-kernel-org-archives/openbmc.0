Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v21Mt1d8hzDqRT
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 16:03:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="A1qXQ60J"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id 75so4375711pgf.3
 for <openbmc@lists.ozlabs.org>; Sun, 15 Jan 2017 21:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lkMkCKVFvGwfwwvW2b5uBMZgKamE5yTc+QdC032vtxI=;
 b=A1qXQ60JUwKkCENpxewN9bSfrdlS3eZEOwe8ePnJke6Aj2j2a1GS9YVy/G+W4Cn1w8
 Eoytk34pxQEnPP6jnKoLshNYlM1p7HCBT2ii2wj1hxJelLbVXltloPh/kODzIye1YJyj
 zq9oTeBEi4z36DjWyRyegaqZ5wseSSy/hX038VXZQLmuI4O+zoj4Jg8XWaQddAW/uJ9z
 92qWpqJbYLHnfqNEz5xJXYOcCrKIVhq/gTgiEqgrcxs4igs3Q6yccTWMTt0OBrjEPQ+c
 BtRT21qxiwSv9JxocVM/qjpEqi/c+Iw302fiVV32XkgGWJaZ6Dlr9R3PkXqkjDCp5+NU
 EjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lkMkCKVFvGwfwwvW2b5uBMZgKamE5yTc+QdC032vtxI=;
 b=RZqgv6jlxDYGUmwK/R8vd0CI12yc8/pTJov9nbwsbV0Wibb17Za/oK8I0O8JSgY84C
 etKWPtGe4lpHdVSCJSzv1gKDlKHPi3VM1vQDXM/BVxNhI0J4qUfdpBzIGgMu9pCzvLUN
 rlFSbD69oXQUQWiMJ4w/w9nSOdJP2Fir5Si9CJ1YJU4ZW7r7kxcMVA+mLfjCflmPOkZJ
 f3hFR1nvqhw7L/6ZfwqFLPyisVbcBv3cPbwjnW3MqPX++NTXD7WmMgw410pKAkqDaDQr
 YUVcoiYKXHH+MrYgy/cB2QIQXgdpw5jA5my/XJ+WK3FlFq/3ad2hp7+R36aQ2JLNvN78
 OVIQ==
X-Gm-Message-State: AIkVDXLDUBLJB6r/pbAH6elMP5YXvJBVOBTcj/wiEX24P7PPyPQyeqsDcHAmcdNLdgHTaQ==
X-Received: by 10.98.223.195 with SMTP id d64mr35442988pfl.80.1484543000414;
 Sun, 15 Jan 2017 21:03:20 -0800 (PST)
Received: from [138.44.241.182] ([138.44.241.182])
 by smtp.googlemail.com with ESMTPSA id d68sm11779808pfj.92.2017.01.15.21.03.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Jan 2017 21:03:19 -0800 (PST)
Message-ID: <1484542942.5646.4.camel@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed-g5: Add mailbox and LPC Control nodes
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Andrew Jeffery
 <andrew@aj.id.au>
Date: Mon, 16 Jan 2017 16:02:22 +1100
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
X-List-Received-Date: Mon, 16 Jan 2017 05:03:22 -0000

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
> > +                       no-map;
> > +                       reg = <0x94000000 0x04000000>; /* 64M */
> 
> We don't want this in the dtsi, as there are platforms that don't use
> LPC buses that lose 64 MB of ram. Put this node in the dts. We might
> decide to have an aspeed-bmc-opp.dtsi with common snippets, but for
> now cut and paste.
> 
> Have you investigated reserving this memory when the driver probes
> instead of hardcoding it?
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

Oops missed this, do we want to make this disabled - it should exist on
every ast2500 and it doesn't depend on anything else...

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
