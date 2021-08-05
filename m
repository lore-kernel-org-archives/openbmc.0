Return-Path: <SRS0=rp11=M4=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BBDC4338F
	for <openbmc@archiver.kernel.org>; Thu,  5 Aug 2021 00:28:48 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9553610FF
	for <openbmc@archiver.kernel.org>; Thu,  5 Aug 2021 00:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9553610FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gg8bx6rhFz3cRd
	for <openbmc@archiver.kernel.org>; Thu,  5 Aug 2021 10:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Rqj/92pI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f33;
 helo=mail-qv1-xf33.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Rqj/92pI; dkim-atps=neutral
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gg8bQ6FGMz307n;
 Thu,  5 Aug 2021 10:28:17 +1000 (AEST)
Received: by mail-qv1-xf33.google.com with SMTP id s11so2065596qvz.7;
 Wed, 04 Aug 2021 17:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=85EvoyF8sgX3fo5G/7KMRYWhF+AF9WMLCT8s7y5Motg=;
 b=Rqj/92pIppN0j21zFFv/ZRJElRbvEQvHxNgvayCgArb08CLlDUYohH3nAwEmGwolR8
 a1/i+Tg16I495RwEUvJ6+Fh4QVEPAWvLll26dioN98QTeVIMU5KL5jf7nByc27WOK1Pa
 /MsgAj8PWR5tqe0WZAL+zZqdK/TO7VPtkMhpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=85EvoyF8sgX3fo5G/7KMRYWhF+AF9WMLCT8s7y5Motg=;
 b=MyuwZ2tjZHbRWH9db49uW1NJOcjJQcQl+53mU+9iCwLNasKiIgXuZKk3dMNxBL44VV
 NGkt/k5NBZFZfbk8LNxxvQ/PIKR1CchbSKWvbPPIGFtJDWZVssOqG7GR1w6wdPbVVFgQ
 RT3f/rsKfWNSacoIp14igY3aqYgX0Drkeht9zGeQTADUZY0rqIz/WvpplKRI0EL9zv+y
 u7rwQz52ydSEwRPnWk37VtO8o0RstgOu9zqP0l86y2qcmUbuyePYev7ht0Kox5sKakrk
 wx020O87OUIwjhSkHVyCiyhIvi5uqSe2VN5MJBTedvyNi8BD3jlfSd0mJ0seMu7k/+fg
 lXGA==
X-Gm-Message-State: AOAM530+HEaCE3sIGupLP6G0iX72ht7iuu/KN3zcdwH6RWgt6I7xO4J1
 Y67XePtqxJ69Zhwu68R5swYvT0++xImqXF/87vk=
X-Google-Smtp-Source: ABdhPJww7LJdzb06f2Udu9LJKPCc1Py0jjXliEKq33sYs6ve+28Ynzwdc+kNW6i2SKb7dXjGxX4MuK8sqhnyMW6PiLY=
X-Received: by 2002:a05:6214:501d:: with SMTP id
 jo29mr2305844qvb.43.1628123294137; 
 Wed, 04 Aug 2021 17:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210728233755.17963-1-rentao.bupt@gmail.com>
 <20210728233755.17963-7-rentao.bupt@gmail.com>
In-Reply-To: <20210728233755.17963-7-rentao.bupt@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 5 Aug 2021 00:28:02 +0000
Message-ID: <CACPK8XemZkV7nK_b4883DN+dJKhL=tXfqK6=DpHQe=fZRu_ETQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: aspeed: Add Facebook Fuji (AST2600) BMC
To: Tao Ren <rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 28 Jul 2021 at 23:38, <rentao.bupt@gmail.com> wrote:
>
> From: Tao Ren <rentao.bupt@gmail.com>
>
> Add initial version of device tree for Facebook Fuji (AST2600) BMC.

I like to read what kind of platform the BMC is going into if you can
add that detail, but it's not essential.

> +&spi1 {
> +       status = "okay";
> +
> +       /*
> +        * Customize spi1 flash memory size to 32MB (maximum flash size on
> +        * the bus) to save vmalloc space.
> +        */
> +       reg = < 0x1e630000 0xc4
> +               0x30000000 0x2000000 >;

Which driver supports this?

It would be great to see Facebook work to get the SPI NOR driver for
the ast2600 merged to mainline.

I doubt the IBM team will get to this, as we are using eMMC instead.

> +
> +       flash@0 {
> +               status = "okay";
> +               m25p,fast-read;
> +               label = "spi1.0";
> +               spi-max-frequency = <5000000>;
> +
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       flash1@0 {
> +                               reg = <0x0 0x2000000>;
> +                               label = "system-flash";
> +                       };
> +               };
> +       };
> +};

> +&ehci1 {
> +       status = "okay";
> +};

Have you verified that USB works with mainline? I've had reports of it
working on 5.8 but it seems to have regressed as of v5.10.


> +&mdio1 {
> +       status = "okay";
> +
> +       ethphy3: ethernet-phy@13 {
> +               compatible = "ethernet-phy-ieee802.3-c22";
> +               reg = <0x0d>;
> +       };
> +};
> +
> +&mac3 {
> +       phy-handle = <&ethphy3>;

status = okay?

You should specify the pinmux too I think, even if the default happens
to work, so that other devices cannot claim the pins.

Cheers,

Joel
