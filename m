Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x244.google.com (mail-yb0-x244.google.com
 [IPv6:2607:f8b0:4002:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1Gxd1YxYzDr3s
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jul 2017 16:12:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="EM/PeIAW"; 
 dkim-atps=neutral
Received: by mail-yb0-x244.google.com with SMTP id 84so7426643ybe.0
 for <openbmc@lists.ozlabs.org>; Sun, 02 Jul 2017 23:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=gWEhbo5lwujdBPIqNI/Ul7iSSKgMmUk0+NuvXkHpAYo=;
 b=EM/PeIAWNryaO34XhXwaAJuV8GwkoGR1xAw7IunmPZVfI+3EVM+e6kGzGBgvfvxiCi
 oQzRBb8VW5aSyM9j2WeMvowrfqT2RfYfG8wRLyV5u8SjSbhUXnwsSBaq1cSyyn2LFf2k
 Pmogvbl+BkKTnhOgn+Ed135oCXi1Rd++aEQn42rlQ1Ng9ltmbLkNOWVpa+kcNoWTHNA0
 6E1sMIMhqN918pP33jQCRx39l2eM0AlMm9zAY6B66sfipz37vxUhL1VyyexwZS6hiWvc
 ltDAvv3zyXG6p6+e4sOnOHHg86/C2nGfLAtcihLhreWbhPoSv4meuVQh5vyFpETc1y7L
 FfGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=gWEhbo5lwujdBPIqNI/Ul7iSSKgMmUk0+NuvXkHpAYo=;
 b=XhYI+XPuUEE8f/Tu280eMCagGUmtN0/nAE0avhLvpf8vOgWGi+1+BOU9Qnu2EZBJMa
 Hfb/Aqi3vnDXdSjNOEEkgYKgvLcMgPJ5GJZi3654aEzk+3zKVy4ZD1wlLwwniIgwj7Eo
 vBuygjtfI9AJCqqMzzjSPE6A/s7L4Go513FGuVQdhTDUQxNgBPc769mTHp3BmC50uHoE
 nCpltpTjQs8gnSxpcgiQ4HOC2wMV/pPdR0frYEsvUN+tRfsr41KFHTzVqkv2LXoxGzNj
 d7IOEXu7fmGBDE7myT8q/VVUt3HeQyXoTfvwETxFU77qLohCwOuNSQOHuBBHXmLfQn/E
 bzqg==
X-Gm-Message-State: AKS2vOyW81SJv0/OxxkZ4EGM0Dm3rXWlpyG/1OjAqIYRBgMfgb6Mibs3
 l5Mt7AqL8ET1Mve/12RBYHaANGy9+u0a
X-Received: by 10.37.15.67 with SMTP id 64mr20532975ybp.94.1499062323276; Sun,
 02 Jul 2017 23:12:03 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.170.239 with HTTP; Sun, 2 Jul 2017 23:11:42 -0700 (PDT)
In-Reply-To: <20170630123316.4479-1-c_mykolak@mellanox.com>
References: <20170630123316.4479-1-c_mykolak@mellanox.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 3 Jul 2017 15:41:42 +0930
X-Google-Sender-Auth: beTJL3Zmv0cZLwbTrIuJC0AHOK8
Message-ID: <CACPK8Xf2z+8hL2KWCtVVP8tkD8Pedz9nJPXnBW2cpD6-LiO5hA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] aspeed-g5: extend defconfig with thermal.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 03 Jul 2017 06:12:05 -0000

On Fri, Jun 30, 2017 at 10:03 PM, Mykola Kostenok
<c_mykolak@mellanox.com> wrote:
> Extend aspeed g5 defconfig with TMP102 sensor
> and several thermal configs.
>
> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>

Applied to dev-4.10.

Cheers,

Joel
> ---
>  arch/arm/configs/aspeed_g5_defconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
> index 29206d1..ad121ed 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -149,6 +149,12 @@ CONFIG_SENSORS_LM25066=y
>  CONFIG_SENSORS_UCD9000=y
>  CONFIG_SENSORS_UCD9200=y
>  CONFIG_SENSORS_TMP421=y
> +CONFIG_SENSORS_TMP102=y
> +CONFIG_THERMAL=y
> +CONFIG_THERMAL_HWMON=y
> +CONFIG_THERMAL_OF=y
> +CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
> +CONFIG_THERMAL_GOV_STEP_WISE=y
>  CONFIG_USB=y
>  CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>  CONFIG_USB_DYNAMIC_MINORS=y
> --
> 2.8.4
>
