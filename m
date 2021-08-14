Return-Path: <SRS0=9FhG=NF=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE6BC4338F
	for <openbmc@archiver.kernel.org>; Sat, 14 Aug 2021 05:23:26 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDD5E60F51
	for <openbmc@archiver.kernel.org>; Sat, 14 Aug 2021 05:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDD5E60F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gmpjm2LjPz3cMW
	for <openbmc@archiver.kernel.org>; Sat, 14 Aug 2021 15:23:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=OQqyGWEn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OQqyGWEn; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gmphv3dh9z2ymS;
 Sat, 14 Aug 2021 15:22:38 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id
 hv22-20020a17090ae416b0290178c579e424so19057054pjb.3; 
 Fri, 13 Aug 2021 22:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=qUlgCGK8+0KVcRwvfAdukdAi2gP9bLhzHb2DkcgfzQY=;
 b=OQqyGWEnIPLyf3mXTtyAaEWzqjlcyCUdbsTZsFKYqa8gAZOSlHOHrA++SGAjDCM22p
 anVJ+uBmvz9kl/eeKRiNY53lZBTvP4HgO021aS2HzrnH0XB3vWa/khh3xHM367OVTYRE
 8CpdEsiV5Duh5fXigEio/fXfI1uyps2jzP4LWgQQU3ckEhDYLd6enyJJUkooyVLbdsAa
 69I0VwvlzYUdSkA9d/D5fqBq4F9eCUXJ6GlF8wWTLjY31rZseLDIaNp+yh+hbwzbdTGK
 Sh40dkDnJUbxJaTx6hsdpIhjI9TlMVFj2aWH0qJ5ZO+A9bWGoaT0ufqA25AHNn39HLpW
 SpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=qUlgCGK8+0KVcRwvfAdukdAi2gP9bLhzHb2DkcgfzQY=;
 b=jhsBL88NSXbqqzV2aEEaHHfE63kR39O0ogQCZT8EH50f1KpT7xVNex1btFTOPMQz8Z
 hlb+41HKmlJRqOHNDAlRYa4sQhoXXtR6zhQFMcnP3swR61ip35d1gA1cp30yp6M+h0/j
 VRt799hzDrir3XaU2pGfLR5PdnD7YGvv0r/yi0sZi3O/QkEnHQrJFPsY8N+vgLirgt96
 NYTBwnhrrIr+GROcUuGG1QjPBYRUb7jZEcSwkIIhTLvcX9AR5B/r7TXMBMurZHu8mLUi
 9RvKyMalB8GHW1jxDwFE480ks6xwP1ufMciyG/HM1Lbz0o6zKW3qHKb8uayqh57LPNQ4
 9qfA==
X-Gm-Message-State: AOAM532/MdmghEhLhQIFYLo7ZY977hbxPCkacSPsXWUmw0K9B8qg5qqp
 iMm4kLKJ0PZQadfknUNff1Q=
X-Google-Smtp-Source: ABdhPJwD5gIcmIVuMlWVrreOkxKSMiaVBIuW/nBKpzkRSs0ejSmabXcCcl3mKEjdXsaLElfILCT8Bg==
X-Received: by 2002:a65:608f:: with SMTP id t15mr5420277pgu.452.1628918556102; 
 Fri, 13 Aug 2021 22:22:36 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91 (c-73-92-48-112.hsd1.ca.comcast.net.
 [73.92.48.112])
 by smtp.gmail.com with ESMTPSA id b3sm4102861pfi.179.2021.08.13.22.22.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 13 Aug 2021 22:22:35 -0700 (PDT)
Date: Fri, 13 Aug 2021 22:22:29 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 4/6] ARM: dts: aspeed: Add Facebook Cloudripper
 (AST2600) BMC
Message-ID: <20210814052228.GA1298@taoren-ubuntu-R90MNF91>
References: <20210805222818.8391-1-rentao.bupt@gmail.com>
 <20210805222818.8391-5-rentao.bupt@gmail.com>
 <CACPK8XcV5On2D4D+SXnfw1M0owwfCL4Su19jOEA7yWpq+T3jLw@mail.gmail.com>
 <20210813034016.GA21895@taoren-ubuntu-R90MNF91>
 <YRaFpq1LvRzMYr/A@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YRaFpq1LvRzMYr/A@lunn.ch>
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

Hi Andrew,

On Fri, Aug 13, 2021 at 04:45:58PM +0200, Andrew Lunn wrote:
> On Thu, Aug 12, 2021 at 08:40:17PM -0700, Tao Ren wrote:
> > On Fri, Aug 13, 2021 at 01:29:17AM +0000, Joel Stanley wrote:
> > > On Thu, 5 Aug 2021 at 22:28, <rentao.bupt@gmail.com> wrote:
> > > > +&mdio1 {
> > > > +       status = "okay";
> > > 
> > > You're enabling this but it looks like it's unused?
> > 
> > Thanks Joel for the careful review. The MDIO controller is not paired
> > with BMC MAC; instead, it's connected to the MDC/MDIO interface of the
> > on-board switch (whose ports are connected to BMC, Host and front panel
> > management port).
> 
> What switch is it? Is there a DSA driver for it? drivers/net/dsa/*
> Ideally you want Linux to be controlling the switch, in the standard
> linux way.
> 
>      Andrew

Thanks for jumping in. We are using BCM5389 and the MDIO bus is used to
access BCM5389 MDC/MDIO interface in Pseudo-PHY mode.

I didn't know drivers/net/dsa, but let me check out the drivers and see
if it works in the Cloudripper environment.


Thanks,

Tao
