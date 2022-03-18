Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B538C433F5
	for <openbmc@archiver.kernel.org>; Fri, 18 Mar 2022 03:42:57 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKVG76TpGz30Ph
	for <openbmc@archiver.kernel.org>; Fri, 18 Mar 2022 14:42:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ZvPY1oDj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732;
 helo=mail-qk1-x732.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ZvPY1oDj; dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKVFR6rGzz2yyn
 for <openbmc@lists.ozlabs.org>; Fri, 18 Mar 2022 14:42:17 +1100 (AEDT)
Received: by mail-qk1-x732.google.com with SMTP id g8so5968829qke.2
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 20:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gUrjcT2f1YXrEI4CTaXibY9VnRDorvjOrUm4nR82x1U=;
 b=ZvPY1oDjn/eJjktdGh9+oENlgsaxINf+FXF3mjowxPk8/uJlk2oXTsi7kP/9T+5LkP
 25Y6317O7f+GZALaSpbJ/DrcuaWNqEyHwvOqVsiiB83y3tsz2vOZbuXA4kI3Ps/vd7zW
 B2lT48K2xL8muyH5KxzHVSChq++GA0iHIRVeQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gUrjcT2f1YXrEI4CTaXibY9VnRDorvjOrUm4nR82x1U=;
 b=7WLqoiPDyz+NJz6s3pBpZS6otMCZuQabQMP4H8NQNUFIZ5VDrJ6ZZFhipYUopbf1UN
 dbIhjwf5HzDtqpFwnXUuRJt9zzzA9willcpIdB5/4nE75l/yi4ZTdhMMRNSMuuUTqW/C
 W+pjgwO0JXwdZEC5fI+faWOIHPfkbpmzp8ZRGSK3HXzFpXFmTcgI1/AKwqSTurWc+FuC
 mTERkdaQ4FWdpMdUGtMmZYj4QLD6muYx0YeBtJA5OF9i5wl6HVhQnPkRsSiUMvyqHqRC
 nL2q1RZ/Tp6tZ/90ZgeVaF4N5Oem1QttiGuraeThQm/akYkSccIjnZzgNIQX1rz9FA9F
 POtA==
X-Gm-Message-State: AOAM532M6e4fzb7i+QxtrCSBZ90NG+NKR/gq5ODXEKzAwlDOpozF8G9g
 EwxK+uRM2vQYFxwmPeerUV70TtU+PkACfwpibL7gjk6TuTM=
X-Google-Smtp-Source: ABdhPJx6MMUdl2wG6gVJlFnRm4ug3ZV5aQ7whJ/vTFfOJ7WWVw2smGFtFy1rzU06kRvyjSP/VnkTiTGVAGiY4B5llrI=
X-Received: by 2002:a37:f903:0:b0:648:ca74:b7dc with SMTP id
 l3-20020a37f903000000b00648ca74b7dcmr4607329qkj.666.1647574933786; Thu, 17
 Mar 2022 20:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR06MB23152A66322ADC7B9CDFF895E6129@SG2PR06MB2315.apcprd06.prod.outlook.com>
 <CACPK8XdAZdURVBdmnZ-+ch+xmbCv_N38EbQD93neENmh3-9Lqw@mail.gmail.com>
 <HK0PR06MB21453F0015E428FC63721E238A139@HK0PR06MB2145.apcprd06.prod.outlook.com>
In-Reply-To: <HK0PR06MB21453F0015E428FC63721E238A139@HK0PR06MB2145.apcprd06.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 Mar 2022 03:42:01 +0000
Message-ID: <CACPK8Xc0sa2=uNXVNJ26to=Z4PhvXnWsH1G9m2_7jygNrAd9QA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15] ARM: dts: aspeed: ast2600-evb: Enable RX
 delay on MAC0/MAC1
To: Troy Lee <troy_lee@aspeedtech.com>
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
Cc: Howard Chiu <howard_chiu@aspeedtech.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Fri, 18 Mar 2022 at 03:13, Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> Hi Joel,
> > -----Original Message-----
> > From: Joel Stanley <joel@jms.id.au>
> > Sent: Friday, March 18, 2022 10:22 AM
> > To: Howard Chiu <howard_chiu@aspeedtech.com>; Jeremy Kerr
> > <jk@ozlabs.org>
> > Cc: openbmc@lists.ozlabs.org; Troy Lee <troy_lee@aspeedtech.com>
> > Subject: Re: [PATCH linux dev-5.15] ARM: dts: aspeed: ast2600-evb: Enable
> > RX delay on MAC0/MAC1
> >
> > On Thu, 17 Mar 2022 at 06:30, Howard Chiu
> > <howard_chiu@aspeedtech.com> wrote:
> > >
> > > The property 'phy-mode' on ast2600 mac0 and mac1 is recommended to
> > set to 'rgmii-rxid'
> > > which enables the RX interface delay from the PHY chip.
> > > Refer page 45 of SDK User Guide v08.00
> > >
> > > Signed-off-by: Howard Chiu <howard_chiu@aspeedtech.com>
> >
> > Thanks Howard. This makes MAC0 on my AST2600A3 evb work again!
> >
> > mac1 was working fine without the patch. Do you know why?
> > Why do we do this for mac0 and mac1, but not mac2 and mac3?
> Mac0/1 and mac2/3 are physically located on different die, so they have different properties by nature.
> Mac0/1 has smaller delay step.

Make sense. This information should go in the commit message.

> > Because the user guide is not public, can you please quote the relevant
> > information in the commit message.
> The SDK User Guide can be download from Aspeed github.
> https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.00/SDK_User_Guide_v08.00.pdf

Be sure to include this link in the commit mesasge.

>
> Thanks for testing, do you think this patch should send upstream mainline as well?

Yes, please do that.

>
> Troy Lee
>
> > Tested-by: Joel Stanley <joel@jms.id.au>
> >
> > > ---
> > >  arch/arm/boot/dts/aspeed-ast2600-evb.dts | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > > b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > > index a6382082d38c..9a1979541d2d 100644
> > > --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > > +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> > > @@ -116,7 +116,7 @@ ethphy3: ethernet-phy@0 {
> > >  &mac0 {
> > >         status = "okay";
> > >
> > > -       phy-mode = "rgmii";
> > > +       phy-mode = "rgmii-rxid";
> > >         phy-handle = <&ethphy0>;
> > >
> > >         pinctrl-names = "default";
> > > @@ -127,7 +127,7 @@ &mac0 {
> > >  &mac1 {
> > >         status = "okay";
> > >
> > > -       phy-mode = "rgmii";
> > > +       phy-mode = "rgmii-rxid";
> > >         phy-handle = <&ethphy1>;
> > >
> > >         pinctrl-names = "default";
> > > --
> > > 2.25.1
> > >
