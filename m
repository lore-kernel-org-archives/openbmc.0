Return-Path: <bjwyman@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=bjwyman@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="t8qEl5N/"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynBRN4ncKzDrZr
 for <openbmc@lists.ozlabs.org>; Thu, 30 Nov 2017 07:07:59 +1100 (AEDT)
Received: by mail-qt0-x241.google.com with SMTP id i40so5971047qti.8
 for <openbmc@lists.ozlabs.org>; Wed, 29 Nov 2017 12:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=yLD238c0PmQ5w0u69Vx0wYvJwUsCGKor1YMlyieKbpU=;
 b=t8qEl5N/DTLpNMegQ5Dkuhz/D12sV7CMG/ZWXS26f1VRfKWWHbKjyMN8DpmFanC+bd
 9+jVPq6l87aTzIcVJoQ6bRevn4WxAbrjaAD2gLSJnBxUkZJfnQxF1P/fosc2fixGV0FE
 ZpPXwKAfCLahZxhfWoYsr+ySKW87m2xcs+u5DvCabVmt262tdWIVo/hZ0EAyR8bpXFzk
 J+Fkywz7bs/Hgt38q5SiQYDfEiF1/eBArQjfWscLn7JBYXPvPpGNxl1u6xNgxhLxu2GB
 Md9ayH8HBQH3zgXPF7irh7vxRby/TsOypXd2GM6TAEbQW1BPbBhfGthZH3k2FtHwnFMk
 cSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=yLD238c0PmQ5w0u69Vx0wYvJwUsCGKor1YMlyieKbpU=;
 b=mhxmDVdFYwmj+rKXCdP0wghlqaQf1Cxb/odlgaV1Zz+NHu3u8hWm7XIip60PN3kkLw
 61GAlr/67QkwkVrTqwT2n4xkdA842dT1BVYWApEzv81IhiNh02/LXyFlElksu20yh/a/
 Rc3CEPf8GuxQSVGyxRh8iSet+midCFLKidxy+0yAKczz1Qw7edLp0TqnXcMY8VGP2cQa
 jfZNmEbjZg0ubELbQWkWGLkxa3Gk7ZAL9MPj0b+8EfB2q1niRst0UCQoPr+832yTCQSS
 548nrIuKw656OWkg99qwMAvUjlHav8Bg9JnSf6cPeV87Hpc3nTX/PIQ1qHi7F32BHkpb
 9r9A==
X-Gm-Message-State: AKGB3mKrVZ9wHj18DcBkSSp01PVtuSzeXeaBJqmgsUtltPrT2ELvsEzr
 5Lav2EEM5ODs9GKKM22pfDZx7NmJhwriYc6EJkA=
X-Google-Smtp-Source: AGs4zMaKf42g4M1hxEWTNXGR4xdA9EqF1nYO1h+bgjJEy+BHF6DxKnvuAwd/DXfHF5mQq2eok96Rljp4Ya4hxhye5pk=
X-Received: by 10.200.56.16 with SMTP id q16mr66824qtb.223.1511986077368; Wed,
 29 Nov 2017 12:07:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.35 with HTTP; Wed, 29 Nov 2017 12:07:56 -0800 (PST)
In-Reply-To: <1511430637-14131-1-git-send-email-vishwa@linux.vnet.ibm.com>
References: <1511430637-14131-1-git-send-email-vishwa@linux.vnet.ibm.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Wed, 29 Nov 2017 14:07:56 -0600
Message-ID: <CAK_vbW32QHAVtm7AFETN6m7SmrcusdB-7DfsNNCAqKHUe8T6eA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: witherspoon: Add power-button LED
To: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Nov 2017 20:08:01 -0000

On Thu, Nov 23, 2017 at 3:50 AM, Vishwanatha Subbanna
<vishwa@linux.vnet.ibm.com> wrote:
> This LED wired to GPIO R5 is integrated with power button
>
> Change-Id: I899405013fbb6b93783dec59090e86453a5ec383
> Signed-off-by: Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> index 68058ec..d25c7dc 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
> @@ -143,6 +143,10 @@
>                 rear-power {
>                         gpios = <&gpio ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
>                 };
> +
> +               power-button {
> +                       gpios = <&gpio ASPEED_GPIO(R, 5) GPIO_ACTIVE_LOW>;
> +               };
>         };
>
>         fsi: gpio-fsi {
> --
> 1.9.1
>

Reviewed-by: Brandon Wyman <bjwyman@gmail.com>
