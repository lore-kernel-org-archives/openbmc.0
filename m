Return-Path: <SRS0=GGe/=P6=lists.ozlabs.org=openbmc-bounces+openbmc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7769C433F5
	for <openbmc@archiver.kernel.org>; Thu, 11 Nov 2021 02:14:54 +0000 (UTC)
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0E3161208
	for <openbmc@archiver.kernel.org>; Thu, 11 Nov 2021 02:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0E3161208
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.ozlabs.org
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqQK80sCJz2yK3
	for <openbmc@archiver.kernel.org>; Thu, 11 Nov 2021 13:14:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Sws/mIn0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Sws/mIn0; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqQJM1ykzz2xDv
 for <openbmc@lists.ozlabs.org>; Thu, 11 Nov 2021 13:14:07 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id o4so8841012oia.10
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 18:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MYi5aCjUCD0+yB7qfxUE4373YpQKBy2WyMq5xwnmcA4=;
 b=Sws/mIn0Gk51Xd6SsH32MldeYkxZr5XC8c327sareMM+DOgEeKA4ZNSt1umQZdCWLZ
 +UMPAUD0HKAndn9BWL1nEmXBMY1iSvN4KzAbOdyy+TlcJwaHdwJt3X84Q02Fb0uWjK0x
 z+2WgAK/8//QJgFEnHUoOSm5MMSvZiw6J8gbgMFJqjUM7Vqf6E1KRYPPYqStf/ITPIyI
 IOr5DW1e0HVOdIL8N7lRjcgUUhP3XfGgAfBRRHmO6F9iAchJWHxX/cEE/nq7dLtE6SdI
 uJNE4q+/BCBiujekYRCK0IxVUpgj869Sc6wD8tNqFP/Tu4ADELUa4GKolN7AuBmKrCJ0
 DrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MYi5aCjUCD0+yB7qfxUE4373YpQKBy2WyMq5xwnmcA4=;
 b=tDWj+c/UamyS15wg/VBW5ng2XMZzJMj0xyHxUxlAzEVq3ZALGdg1aQHU/ox2ff7oJT
 +eQk8iZpklGlPRfnqsliBfXPrxL1VMIiikU9f0zGzcoMG/xYIz73Dwo3zoRXglFdhDCZ
 HJDD+noQycyQGY7YjS1iiTSOv9NzqtXzNkIdxxFdIMC06jg5OO42ZGQNZxyoIohm1xDY
 5jkBZa/EfYp2RNbYKx4CrBwxhKeyszjt/R4/sCs1QeLvyQAYLAN04NHNfRgG1yLsF0iV
 IUmBASmqO7jZ6oxJbD51TlcKHBQkBq4zzGh1+ZU50TJfmGg42ZvrcIGpQnxSAixQ0H19
 rV/w==
X-Gm-Message-State: AOAM530qr7cAxqgPLbNHMK3pMkP4Xdu8r9IJowpK0gm4edUbFgW1b1YJ
 8ovUAWrCwiMBrA+Tt+PYx+bPerk+TTpUhuQMhociWoG37+BCKyy6
X-Google-Smtp-Source: ABdhPJy+EG4MlenKY/065waysP/gEnN6ZfNyVa8/y+Ek2fHIYAtEjpemB73dSsWDy8j+Ykvx850NuIlpnPWPGAHMPJ4=
X-Received: by 2002:a05:6808:1384:: with SMTP id
 c4mr16980516oiw.34.1636596844169; 
 Wed, 10 Nov 2021 18:14:04 -0800 (PST)
MIME-Version: 1.0
References: <20211110222803.836-1-a.kartashev@yadro.com>
 <20211110222803.836-3-a.kartashev@yadro.com>
In-Reply-To: <20211110222803.836-3-a.kartashev@yadro.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 11 Nov 2021 10:13:53 +0800
Message-ID: <CAGm54UESNecrEJfiv9vXyLYqM6OSGp1Cxt8hB0UJgG_Bgi=-tg@mail.gmail.com>
Subject: Re: [External] [PATCH 2/2] ARM: dts: aspeed: add device tree for
 YADRO VEGMAN BMC
To: Andrei Kartashev <a.kartashev@yadro.com>
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
Cc: andrew@aj.id.au, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc"
 <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

On Thu, Nov 11, 2021 at 6:29 AM Andrei Kartashev <a.kartashev@yadro.com> wrote:
> +
> +&fmc {
> +       status = "okay";
> +       flash@0 {
> +               status = "okay";
> +               label = "bmc";
> +               m25p,fast-read;
> +               partitions {
> +                       compatible = "fixed-partitions";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +
> +                       u-boot@0 {
> +                               reg = <0x0 0x80000>; // 512KB
> +                               label = "u-boot";
> +                       };
> +
> +                       fit-image-a@80000 {
> +                               reg = <0x80000 0x1b80000>; // 27.5MB
> +                               label = "image-a";
> +                       };
> +
> +                       sofs@1c00000 {
> +                               reg = <0x1c00000 0x200000>; // 2MB
> +                               label = "sofs";
> +                       };
> +
> +                       rwfs@1e00000 {
> +                               reg = <0x1e00000 0x600000>;  // 6MB
> +                               label = "rwfs";
> +                       };
> +
> +                       u-boot-env@2400000 {
> +                               reg = <0x2400000 0x20000>; // 128KB
> +                               label = "u-boot-env";
> +                       };
> +
> +                       fit-image-b@2480000 {
> +                               reg = <0x2480000 0x1b80000>; // 27.5MB
> +                               label = "image-b";
> +                       };
> +               };
> +       };
> +};

The flash layout is not the same as the openbmc static layout, but
like the one used by Intel-BMC.
May I ask if you are going to upstream the bmc-code-update related
changes for this layout?


> +&i2c0 {
> +       /* SMB_IPMB_STBY_LVC3 */
> +       multi-master;
> +       general-call;
> +       aspeed,dma-buf-size = <4095>;
> +       aspeed,hw-timeout-ms = <300>;

These properties are not available in openbmc linux kernel tree, but
used in Intel-BMC/linux, may I ask if you are going to upstream the
related changes?

> +       status = "okay";
> +};
> +

-- 
BRs,
Lei YU
