Return-Path: <sjg@google.com>
Received: from mail-ua0-x229.google.com (mail-ua0-x229.google.com
 [IPv6:2607:f8b0:400c:c08::229])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w72Vx2MgPzDq9H
 for <openbmc@lists.ozlabs.org>; Wed, 19 Apr 2017 10:12:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EYf2aWHF"; 
 dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.b="PN90e1jp";
 dkim-atps=neutral
Received: by mail-ua0-x229.google.com with SMTP id f10so5199862uaa.2
 for <openbmc@lists.ozlabs.org>; Tue, 18 Apr 2017 17:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ZiDR7L5L9jlZLGi9rsZyuiHmNL5qrmH7tH1sx96PsKE=;
 b=EYf2aWHFLnNlCK3a+74JYnj7X0zPhV4E/dH08ve7Me3c7+XuoeyWwl8SfWeNO92RMe
 J396JiiaxUbawdgTsYLGrxdK/tmSZ7DoQUJ8ZPA0RedwduHPatz2VQ4zGRoD1OmdyJqM
 Jnjl2+cyWqt5Z/CmOdLJyCxJ8hzq3eZc4m4zg0RTioRrgdRCRQPZfaoAkVgvKoqP5dKw
 QPsQPTKD69dOoxRTzY26nL4sfNKblS5WY1R9BTJBjWUAu6z//u/e189sulM7o3oxaHV0
 SxRM0tvRQjCK+luBZwp1YHtZJ3neW8VDYavNWeuFC4CkyV2LZGyspFFDA+swsS0EpUB3
 juLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ZiDR7L5L9jlZLGi9rsZyuiHmNL5qrmH7tH1sx96PsKE=;
 b=PN90e1jpbPCqrQh/YPyhb7zAlzpC4f0/OfaJpzPgOg+I8vXNryGsK50Tr5p4p3DyoZ
 YadRgkc8SAHv1QrBcgz/aBPk+hzxqDxw9UUirYExuuPXzaiHFbxL5E7yr073YvSrkuxu
 uj2c9pqAhRKt29YlVAkSx67rzl18vcRxxlVjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ZiDR7L5L9jlZLGi9rsZyuiHmNL5qrmH7tH1sx96PsKE=;
 b=XxNeTPCpPqP291fMNhWUhe8v43Hh2D+BbTS6DKSE37aV20L+4v5Gv/j0sZgtP/8ZaQ
 C0uYNCy8CSeV2XSo2N6OQNNCX6u1Lf0S0RRlSZ6WNIHvto38BLExzYvjEFOwcsWARCYZ
 OOeLoEXegrk/5dWMGCd+7Py5NTrhF3kDMlKkfqwZg9622Lp7WyfWN/f9PvtzEN/A1Ggr
 ziK7R4qRXVaMXtcDYreKXjpIlBfW/NXo8eO5MObKJrjjk1MhpvUqjNkiLQAe6d3e86Nb
 1uCytsPR1AZk1gijsBHb+wFCQWQYe36AHhuZa5UWEl65e+3tH4B7kzRtm63NWM6B1Zfh
 Xc2w==
X-Gm-Message-State: AN3rC/7yOikBuCfGBbKgCFcfO2bobdiy4qc7K4dejBF0lEgefFPNFtyH
 yAbo2FyhevXg35dDwG9G6fjBH6sMkG3b
X-Received: by 10.176.74.17 with SMTP id q17mr38898uae.121.1492560727191; Tue,
 18 Apr 2017 17:12:07 -0700 (PDT)
MIME-Version: 1.0
Sender: sjg@google.com
Received: by 10.176.17.106 with HTTP; Tue, 18 Apr 2017 17:11:46 -0700 (PDT)
In-Reply-To: <20170417190034.71945-9-maxims@google.com>
References: <20170417190034.71945-1-maxims@google.com>
 <20170417190034.71945-9-maxims@google.com>
From: Simon Glass <sjg@chromium.org>
Date: Tue, 18 Apr 2017 18:11:46 -0600
X-Google-Sender-Auth: PRMbJ64V1yhx2_a5VJhBWfooJtA
Message-ID: <CAPnjgZ3W-PfsTyyeqA_ONqvfAH5OqxuoanrT1FO9LcSSdn7zJw@mail.gmail.com>
Subject: Re: [PATCH v1 08/15] aspeed: AST2500 Pinctrl Driver
To: Maxim Sloyko <maxims@google.com>
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Konstantin Porotchkin <kostap@marvell.com>,
 Thomas Abraham <thomas.ab@samsung.com>, 
 Wills Wang <wills.wang@live.com>, Kever Yang <kever.yang@rock-chips.com>, 
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Minkyu Kang <mk7.kang@samsung.com>,
 Daniel Schwierzeck <daniel.schwierzeck@gmail.com>, 
 Wenyou Yang <wenyou.yang@atmel.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 19 Apr 2017 00:12:09 -0000

On 17 April 2017 at 13:00, Maxim Sloyko <maxims@google.com> wrote:
> This driver uses Generic Pinctrl framework and is compatible with
> the Linux driver for ast2500: it uses the same device tree
> configuration.
>
> Not all pins are supported by the driver at the moment, so it actually
> compatible with ast2400. In general, however, there are differences that
> in the future would be easier to maintain separately.
>
> Signed-off-by: Maxim Sloyko <maxims@google.com>
> ---
>
> Changes in v1: None
>
>  arch/arm/include/asm/arch-aspeed/pinctrl.h     |  52 ++++++++++
>  arch/arm/include/asm/arch-aspeed/scu_ast2500.h |  19 ++++
>  drivers/pinctrl/Kconfig                        |   9 ++
>  drivers/pinctrl/Makefile                       |   1 +
>  drivers/pinctrl/aspeed/Makefile                |   1 +
>  drivers/pinctrl/aspeed/pinctrl_ast2500.c       | 127 +++++++++++++++++++++++++
>  6 files changed, 209 insertions(+)
>  create mode 100644 arch/arm/include/asm/arch-aspeed/pinctrl.h
>  create mode 100644 drivers/pinctrl/aspeed/Makefile
>  create mode 100644 drivers/pinctrl/aspeed/pinctrl_ast2500.c

Reviewed-by: Simon Glass <sjg@chromium.org>
