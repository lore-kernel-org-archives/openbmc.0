Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3td4Vv5C6XzDvjw
 for <openbmc@lists.ozlabs.org>; Tue, 13 Dec 2016 14:11:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="i4aYW916"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id i88so1324016pfk.2
 for <openbmc@lists.ozlabs.org>; Mon, 12 Dec 2016 19:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ymStK1D7/FLaQNlcSPG30GELEdB1LWXIEia78lpD08Q=;
 b=i4aYW916fejgriMrqQBo9JB2qgvj07jmqh7vZblpEr9x7BYOu+9XzaJsEX+W6j4aAt
 ZzdsFtN+q72WLtPaff3OmTuYhBU8NlNogjBog6o7UkDPq1Q1Kkz8OUljzkRIJxy0K51l
 XYIPQvmwh9VLPQ032GGRD8GeMhr9HcEF2GjOcWt7w2QW1mcnRKQLnKSwPH65UbLN5B6X
 oV6eEzm22Qic897KGYs7DLxtUt/xDlln9OGV1VhL2ZBYLGtCtWjZgaoEaW/r2JYLCCLO
 F2MfTavDhGKQGnS0OHpiHi+2paAFD8QCChIZoNa3MGzdp2r7cdZIerMUuBh+oo62FCbS
 mg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ymStK1D7/FLaQNlcSPG30GELEdB1LWXIEia78lpD08Q=;
 b=Kh0T+daGejrSbynsCaxgUoYwhE4YybRZWdEGv6NwNWmK75mIFme1cS3Owj3LOxNNVe
 WsgOuk3f4u4EfRhu9JtBzxGzZCnHdtCqRlG1MAXjKp/dlSgp0UM6KpvZUK0Ng+cX5GPK
 g+3qZQVywwQMz1EUwUGrAVuOZBBO/ZwdPM62o2wgcLeqs71jlYCAI3Kg/yRZvNp/U8AN
 bxTqAX81GZy/6UYzOUhptDQynR31HX1J+/4pgZj+zb52mpbNSB8KZECmEgh2RQLtiU1C
 IQkCaInscwpfqCIzgIh8gFz9k4OU2jG4+umQVgDixHSsME1l1o78AMwfhQDW2RIQScI8
 WrEg==
X-Gm-Message-State: AKaTC02x9q33AG8p5210trmPptjWqyOn4nJYmLEmHYeEl63ojR8SZwYBuWzjymq48He94Q==
X-Received: by 10.99.67.7 with SMTP id q7mr171271539pga.45.1481598709959;
 Mon, 12 Dec 2016 19:11:49 -0800 (PST)
Received: from cyril.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id
 j190sm78532982pgd.23.2016.12.12.19.11.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Dec 2016 19:11:49 -0800 (PST)
Message-ID: <1481598705.10426.3.camel@gmail.com>
Subject: Re: [PATCH linux 1/3] ARM: dts: aspeed: Update palmetto device tree
From: Cyril Bur <cyrilbur@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Tue, 13 Dec 2016 14:11:45 +1100
In-Reply-To: <CACPK8Xc11u=ym0LrRGdN5YrzAiN0Knz68b4q9SdXPVn7+vOBtA@mail.gmail.com>
References: <20161209054323.7320-1-cyrilbur@gmail.com>
 <20161209054323.7320-2-cyrilbur@gmail.com>
 <CACPK8Xc11u=ym0LrRGdN5YrzAiN0Knz68b4q9SdXPVn7+vOBtA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Tue, 13 Dec 2016 03:11:52 -0000

On Tue, 2016-12-13 at 11:44 +1100, Joel Stanley wrote:
> Hi Cyril,
> 
> On Fri, Dec 9, 2016 at 4:43 PM, Cyril Bur <cyrilbur@gmail.com> wrote:
> > Palmettos have 512mb of ram. There is always framebuffer memory at
> > the
> > top of ram.
> > 
> > This patch also reserves BMC ram for host to BMC communication.
> > 
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> >  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 25
> > ++++++++++++++++++++++++-
> >  arch/arm/boot/dts/aspeed-g4.dtsi              |  6 ++++++
> >  2 files changed, 30 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > index acaceda2..e810ae7 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
> > @@ -17,7 +17,30 @@
> >         };
> > 
> >         memory {
> > -               reg = <0x40000000 0x10000000>;
> > +               reg = <0x40000000 0x20000000>;
> > +       };
> 
> Can you send this in a separate patch? It should go into the tree
> now.
> 

Yep, should I send just for palmetto? 

Do you have a list of other platforms? I figure all the ast2400 based
aspeed-bmc-opp-* should get this change, should I include them all in
one patch or all individually?

> > +
> > +       reserved-memory {
> > +               #address-cells = <1>;
> > +               #size-cells= <1>;
> > +               ranges;
> > +
> > +               flash_mem: region@52000000 {
> > +                       compatible = "aspeed,lpc-ctrl";
> > +                       no-map;
> > +                       reg = <0x54000000 0x04000000>; /* 64m */
> > +               };
> > +
> > +               fb_mem: framebuffer@5f000000 {
> > +                       no-map;
> > +                       reg = <0x5f000000 0x01000000>; /* 16m */
> > +               };
> 
> This should be a separate patch too, which we can take straight away.
> 

I'll resend.

> > +       };
> > +
> > +       flash_buffer {
> 
> It's convention to put the reg value after @ in the node name:
> 
>   flash_buffer@1e789000
> 
> > +               compatible = "aspeed,lpc-ctrl";
> 
> Upstream demands we put the SoC in the compatible string
> 
>  aspeed,ast2400-lpc-ctrl.
> 
> > +               memory-region = <&flash_mem>;
> > +               reg = <0x1e789000 8>;
> 
> Make the second cell be 0x8 for consistency.
> 
> >         };
> > --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> > +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> > @@ -870,6 +870,12 @@
> >                                 interrupts = <8>;
> >                         };
> > 
> > +                       mbox: mbox@1e789200 {
> > +                               compatible = "aspeed,mbox-host";
> 
> aspeed,ast2400-mbox-host
> 
> Not sure on the name here.
> 

Yeah I'm not sold on the name either...


Thanks for review.

Cyril

> > +                               reg = <0x1e789200 0x5c>;
> > +                               interrupts = <46>;
> > +                       };
> > +
> >                         wdt1: wdt@1e785000 {
> >                                 compatible = "aspeed,ast2400-wdt";
> >                                 reg = <0x1e785000 0x1c>;
> > --
> > 2.10.2
> > 
> > _______________________________________________
> > openbmc mailing list
> > openbmc@lists.ozlabs.org
> > https://lists.ozlabs.org/listinfo/openbmc
