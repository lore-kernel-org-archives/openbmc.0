Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x241.google.com (mail-yw0-x241.google.com
 [IPv6:2607:f8b0:4002:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vYY6Y2tszzDqJk
 for <openbmc@lists.ozlabs.org>; Thu,  2 Mar 2017 11:27:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="TgAnq5JU"; 
 dkim-atps=neutral
Received: by mail-yw0-x241.google.com with SMTP id s15so2621810ywg.0
 for <openbmc@lists.ozlabs.org>; Wed, 01 Mar 2017 16:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=oWV5IOinDqhGHCrSE3jfI1gEVpXa7cHDftLkUyZ0zO0=;
 b=TgAnq5JUXrEquF25x+sfb59+Vg6/XEMbwp+mspgj0v26iib0RjSYGkHbSIczGv5Br0
 Ux6HC7UesCshZPjdleUGMc7CidllKCrrIDtrx453AnVrSFtacx9VbtJ0dwltLDI/Q+lF
 lqathlR2I05IKtz9KlZkep3g+ZjGSxX7BHTsRIIy0XsFS+H9t9o67SSlAHPLBa/au0g/
 HBmup3aGhpbbtAd7QzzPWPbnFnMqsWmM+Aa6XYv7FmEbAktPwggBRaDhEchO+QRExM3T
 vErXQwZaotVXgmyZ6dUWcyx16V8YpbYyxhrv49e3eUD2zmYq1RbuHieP5PbsuWoYlbLN
 G6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=oWV5IOinDqhGHCrSE3jfI1gEVpXa7cHDftLkUyZ0zO0=;
 b=JgEN7kpjzcyFm7EIv4fQu+oC17bYOxGF+YQgMpTCe0DOy7Ld9YjxQ48moNY6i/Bd3W
 GlJV6KlXvNiPlXZ9xjjY2uQBeczN66WVh4VHuIvdgv9M0LTem76Jp96o7j/kHegsWL9G
 ylPAmsHxB+xT0Qigu6+2S8k17GWOhiRsNlGF3EwEq838eIYA17uvKOIYMgQ5j/pstLJY
 pa+YUFsmOimFLl+QAp0pr9i3fUauCWHHi188HJcuQiAZPxF05cSkO6vKUOXpJwo+MxBb
 FgZFDs3lB6UEgVWO7CsrNhezIuOCO9bvLjNtayP1x7UPYp7cYdg1yUeMTrnslIT/7sjy
 WGEQ==
X-Gm-Message-State: AMke39nrTpiN9mYVBfDnMHMqdIrPZUnseVTQLn8lJCZsiEUeCwy8OejMV8w0tb2RXGIfm5CIxDH/NrtKozxrvg==
X-Received: by 10.37.32.194 with SMTP id g185mr4208477ybg.167.1488414435302;
 Wed, 01 Mar 2017 16:27:15 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Wed, 1 Mar 2017 16:26:54 -0800 (PST)
In-Reply-To: <20170301224312.21540-1-emilyshaffer@google.com>
References: <20170301200526.GB837@heinlein.lan>
 <20170301224312.21540-1-emilyshaffer@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Mar 2017 10:56:54 +1030
X-Google-Sender-Auth: 2l1rzRCVK0wlbIIAE1RmCKgAkTw
Message-ID: <CACPK8Xec0vTCd7sqjGegzfbk5y+ote+MtLe2g=ZZpBR-EemLbA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: zaius add reg field to pca9541a i2c
 mux
To: Emily Shaffer <emilyshaffer@google.com>
Cc: Patrick Williams <patrick@stwcx.xyz>, Xo Wang <xow@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 02 Mar 2017 00:27:17 -0000

Hey Emily,

Welcome to OpenBMC! I maintain the kernel tree for the project.

When you're sending patches for our fork of Linux I encourage
developers to put the project and branch they're targeting in the
patch prefix. This helps me out as we use the list for a few things
other than Linux:

https://github.com/openbmc/linux/wiki/TipsAndTricks#sending-patches

git format-patch --subject-prefix=3D"PATCH linux dev-4.7"

On Thu, Mar 2, 2017 at 9:13 AM, Emily Shaffer <emilyshaffer@google.com> wro=
te:
> I2C mux pca9541a@70 for Zaius was incorrectly configured, preventing
> hotswap@10 LM5066I hotswap controller from being configured at startup.
> Adding the missing field results in the hotswap controller being present
> immediately at boot.

I wasn't sure why this would fix things. I had a chat with Xo and he explai=
ned:

09:28 <@shenki> GHF[m]: but i wasn't sure why adding the reg property
changed things?
09:28 <@shenki> GHF[m]: was it not binding without the reg?
09:28 <@shenki> there's no device tree bindings that match what zaius
is doing, so it's hard to check
10:44 < GHF[m]> shenki: correct, no i2c slave device for the hotswap
controller was instantiated and the lm5066 driver did not bind
10:45 < GHF[m]> shenki: actually Emily noted that it did bind if the
device name were changed to "lm5066" suggesting that the of_*
compatible property match wasn't working
10:46 < GHF[m]> shenki: no idea why the reg property one level up
affects that =C2=AF_(=E3=83=84)_/=C2=AF
10:47 <@shenki> GHF[m]: okay. i will merge it for now

I've applied your patch to dev-4.7 with Xo's review.

Cheers,

Joel

> Signed-off-by: Emily Shaffer <emilyshaffer@google.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/d=
ts/aspeed-bmc-opp-zaius.dts
> index 548ef1e939fe..7015863751e0 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
> @@ -258,6 +258,7 @@
>                 i2c-arb {
>                         #address-cells =3D <1>;
>                         #size-cells =3D <0>;
> +                       reg =3D <0x0>;
>
>                         hotswap@10 {
>                                 compatible =3D "ti,lm5066";
> --
> 2.12.0.rc1.440.g5b76565f74-goog
>
