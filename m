Return-Path: <SRS0=rp11=M4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853D6C4338F
	for <openbmc@archiver.kernel.org>; Thu,  5 Aug 2021 01:20:30 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D25560F38
	for <openbmc@archiver.kernel.org>; Thu,  5 Aug 2021 01:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0D25560F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg9lc4JpVz3bZ3
	for <openbmc@archiver.kernel.org>; Thu,  5 Aug 2021 11:20:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=czFhfxgA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=czFhfxgA; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg9l61mZDz3079;
 Thu,  5 Aug 2021 11:20:00 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id e21so5118530pla.5;
 Wed, 04 Aug 2021 18:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=e3XwsW9dcpK2inuw4CP3wWTFfrJpkqjKUp1ALe4OcSw=;
 b=czFhfxgAUEDaFdM3Hcun5CUGzve9qBhEHhdgHBmOX7olliuFKN8DXgEe+rmKmWat+L
 9mJyEreTCcY9wJOpkumioORcnXgQzD2mgUmfb8cHczaZku6gWfEFHyDULFrbZ1Qkc2Fb
 w63Puypnh8M8XBOv2KOl5W9ml8QulLssN8QoK10Wjo+2Y386UtpiMhlLjuhbVj4TdOuB
 pvqKjUhBeZHINJCJM53M/eymo4U+UKhmtE5VcRQ+hQFyt9j6QvVl0xQWmwI7zrDcM1sm
 tFrqNxnw9BmxW3fhzyQMf8dW7uptS6+uWujOdhQ9442difFXq0vS6iTGzqqcdk7ixPDW
 IKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=e3XwsW9dcpK2inuw4CP3wWTFfrJpkqjKUp1ALe4OcSw=;
 b=XfgVdJF7VbOi0v3H9kN9j23vkXhJd8MzBb8dbiZtCRER7Qr8fxYBjK/vxckWcyQ2m8
 PMK6yh2Vcco5ENIbroUTGe3n5ZUdvfpwujj/HhdP2r5ATKDTbfdsp0w2CoAY2GFFz4ap
 Emb9CSGR0vDpm/0ITqCwgaIyyedxwyDYvPVP9lE4MYuwUn4NuzxQAvu0cG67Z17Xgkod
 aNsPBggOVmEhA9HgQo/ee84yXPahegfN94VeZiYEwCUwyDYpHsi1XiXDR0JHUJw6k1R3
 8Mu/MSiaEKt3iOxUvdJvSBGeIjwdKbN4B6vf4eSDpPjC9/Ko2aWEiN08mdTYE8UzQyBf
 zbdg==
X-Gm-Message-State: AOAM531uMbSwR46bs6QLJfJZ7o+Qm5Rd2ugegFXNLqCRfLTJCEd0YwRN
 eKauLcyZ3OEweqg3z/gelDE=
X-Google-Smtp-Source: ABdhPJwslt4nxz+RxhRYj1bs+nrlsiTP9TyPu0faSLQ6tV7d4GwOgf/ab8jE0Nsc/c/E4gjD42jt7w==
X-Received: by 2002:a65:6088:: with SMTP id t8mr1796538pgu.371.1628126397724; 
 Wed, 04 Aug 2021 18:19:57 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-252-146-110.hsd1.ca.comcast.net.
 [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id g11sm3775073pju.13.2021.08.04.18.19.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 04 Aug 2021 18:19:57 -0700 (PDT)
Date: Wed, 4 Aug 2021 18:19:51 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 6/6] ARM: dts: aspeed: Add Facebook Fuji (AST2600) BMC
Message-ID: <20210805011951.GA28444@taoren-ubuntu-R90MNF91>
References: <20210728233755.17963-1-rentao.bupt@gmail.com>
 <20210728233755.17963-7-rentao.bupt@gmail.com>
 <CACPK8XemZkV7nK_b4883DN+dJKhL=tXfqK6=DpHQe=fZRu_ETQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XemZkV7nK_b4883DN+dJKhL=tXfqK6=DpHQe=fZRu_ETQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>,
 Tao Ren <taoren@fb.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, Aug 05, 2021 at 12:28:02AM +0000, Joel Stanley wrote:
> On Wed, 28 Jul 2021 at 23:38, <rentao.bupt@gmail.com> wrote:
> >
> > From: Tao Ren <rentao.bupt@gmail.com>
> >
> > Add initial version of device tree for Facebook Fuji (AST2600) BMC.
> 
> I like to read what kind of platform the BMC is going into if you can
> add that detail, but it's not essential.

Sure. I will add more details in v2.
 
> > +&spi1 {
> > +       status = "okay";
> > +
> > +       /*
> > +        * Customize spi1 flash memory size to 32MB (maximum flash size on
> > +        * the bus) to save vmalloc space.
> > +        */
> > +       reg = < 0x1e630000 0xc4
> > +               0x30000000 0x2000000 >;
> 
> Which driver supports this?
> 
> It would be great to see Facebook work to get the SPI NOR driver for
> the ast2600 merged to mainline.
> 
> I doubt the IBM team will get to this, as we are using eMMC instead.

Ah, I just checked aspeed-g6.dtsi (ast2600-spi) in mainline and I thought
the driver patches were also upstreamed. Let me remove the entry for now,
and will add it back when the driver is ready.

> 
> > +
> > +       flash@0 {
> > +               status = "okay";
> > +               m25p,fast-read;
> > +               label = "spi1.0";
> > +               spi-max-frequency = <5000000>;
> > +
> > +               partitions {
> > +                       compatible = "fixed-partitions";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +
> > +                       flash1@0 {
> > +                               reg = <0x0 0x2000000>;
> > +                               label = "system-flash";
> > +                       };
> > +               };
> > +       };
> > +};
> 
> > +&ehci1 {
> > +       status = "okay";
> > +};
> 
> Have you verified that USB works with mainline? I've had reports of it
> working on 5.8 but it seems to have regressed as of v5.10.

It stopped working on ASPEED since commit 280a9045bb18 ("ehci: fix EHCI
host controller initialization sequence"): ehci_handshake() returns
error because HCHalted bit EHCI24[12] stays at 1.

I have a dirty hack in my tree (ignoring the halt bit) and it "works" on
AST2500 and AST2600. Let me send an email to openbmc and aspeed email
groups to see if anyone has more context.

Meanwhile, should I delete the entry until the fix is ready in driver?
 
> > +&mdio1 {
> > +       status = "okay";
> > +
> > +       ethphy3: ethernet-phy@13 {
> > +               compatible = "ethernet-phy-ieee802.3-c22";
> > +               reg = <0x0d>;
> > +       };
> > +};
> > +
> > +&mac3 {
> > +       phy-handle = <&ethphy3>;
> 
> status = okay?
> 
> You should specify the pinmux too I think, even if the default happens
> to work, so that other devices cannot claim the pins.

status is set in ast2600 common dtsi, but let me set it here to avoid
confusion. Will update pinmux in v2. Thanks.

> 
> Cheers,
> 
> Joel

Cheers,

Tao
