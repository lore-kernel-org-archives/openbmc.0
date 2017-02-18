Return-Path: <mine260309@gmail.com>
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vQWBy1RV5zDqBW
 for <openbmc@lists.ozlabs.org>; Sun, 19 Feb 2017 00:36:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gPz7fX4S"; 
 dkim-atps=neutral
Received: by mail-qk0-x243.google.com with SMTP id s186so2948972qkb.1
 for <openbmc@lists.ozlabs.org>; Sat, 18 Feb 2017 05:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=0XZ2fG46Ap2vqTKsRdhfUqj9lNCnOUNaPgS5y/cE+MU=;
 b=gPz7fX4SwUaezk6+4fDfZ13zhs+x28ffcDLnEPe1uceoZEk/TkEDJ2sKBwBDHQZ83H
 jr2Y1zFegHxfPDSSimEY0iG3U419wmCBM6KeXGB/vmmeYB7dYq9IlffX/L6WU4yi4g19
 i+FOkc95y/pmX7CtQen4KTfaM7pohkyuXjkD98y3GU5TQGfIJd76CpVG2eegMPTgpbuc
 ZWd3v4l4M7EjuF+Kp0/D+ErvV//ZW6cQXYJbXFUl9sleAmMoZ/moyceEyHvDvtGVY2RR
 1RisboBKyOzYNINYA2tX82HKU0kNHRMAsSOV9hTbBNE07mDNpBguad6HzIo6v2CR6WC9
 dPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=0XZ2fG46Ap2vqTKsRdhfUqj9lNCnOUNaPgS5y/cE+MU=;
 b=rHRIguzAvvTA6aQ+u6BYZZUt051CqL3auxnsyoTQMHuFgz3XZnkq/pOH4odTL2rtG5
 gPXayFWj8/IS3g/W487JBalHQemfo9kCm5PPdCiHSiT7ewdSre7m1ACqNjxz6ZDtTnsj
 vuZ238e1xVAiflvnt9rvkt0Ftvov+eRxofBykF068rYT834/DSU56iLV13PWdGwZ/UNN
 NH89osikM2f1W2uyb3hi5a0NtmS2ywnps4pSryB2eOUiI51ImGikKCcezkM40MqrAhcG
 dfO4XzRKTWaAyx4AevdICiEK4aXK5WWUgJ5zFz5UFUuC2LP0sTwvoNrm2M6ZPIkExQRC
 8bmw==
X-Gm-Message-State: AMke39nZfn5YtijkVu0r4J3YkOvRQXokq1Jw2LyxFb4TAqn+Lr/JZIXTAMK2QJjTKBwlimbxZQqpK1K1z9EYfA==
X-Received: by 10.55.127.2 with SMTP id a2mr12409781qkd.319.1487424998907;
 Sat, 18 Feb 2017 05:36:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.122 with HTTP; Sat, 18 Feb 2017 05:36:38 -0800 (PST)
In-Reply-To: <1487424810-1469-1-git-send-email-mine260309@gmail.com>
References: <1487424810-1469-1-git-send-email-mine260309@gmail.com>
From: Mine <mine260309@gmail.com>
Date: Sat, 18 Feb 2017 21:36:38 +0800
Message-ID: <CAARXrtmp_dhz_7jTTDh2+tKK_dOniWzz=KB0Lt9-pAOc-Wt80Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] arm: aspeed: romulus: Do common setup
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sat, 18 Feb 2017 13:36:42 -0000

I thought do_common_setup() is called by default, but actually it's not.
So Romulus needs to call do_common_setup() as well.

--
BRs,
Lei YU

On Sat, Feb 18, 2017 at 9:33 PM, Lei YU <mine260309@gmail.com> wrote:
> Call do_common_setup for romulus.
> No other romulus specific setup is needed.
> Consider moving do_common_setup() to a common place.
>
> Signed-off-by: Lei YU <mine260309@gmail.com>
> ---
>  arch/arm/mach-aspeed/aspeed.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm/mach-aspeed/aspeed.c b/arch/arm/mach-aspeed/aspeed.c
> index 2a11c2e..726b8fa 100644
> --- a/arch/arm/mach-aspeed/aspeed.c
> +++ b/arch/arm/mach-aspeed/aspeed.c
> @@ -218,6 +218,11 @@ static void __init do_witherspoon_setup(void)
>         writel(0x68600000, AST_IO(AST_BASE_SPI | 0x30));
>  }
>
> +static void __init do_romulus_setup(void)
> +{
> +       do_common_setup();
> +}
> +
>  #define SCU_PASSWORD   0x1688A8A8
>
>  static void __init aspeed_init_early(void)
> @@ -253,6 +258,8 @@ static void __init aspeed_init_early(void)
>                 do_zaius_setup();
>         if (of_machine_is_compatible("ibm,witherspoon-bmc"))
>                 do_witherspoon_setup();
> +       if (of_machine_is_compatible("ibm,romulus-bmc"))
> +               do_romulus_setup();
>  }
>
>  static void __init aspeed_map_io(void)
> --
> 1.9.1
>
