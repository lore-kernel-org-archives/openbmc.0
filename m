Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x241.google.com (mail-ua0-x241.google.com
 [IPv6:2607:f8b0:400c:c08::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ssrS42JJZzDrL1
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 17:53:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=FZ8bFQgD; 
 dkim-atps=neutral
Received: by mail-ua0-x241.google.com with SMTP id m26so3694673uaa.2
 for <openbmc@lists.ozlabs.org>; Sun, 09 Oct 2016 23:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=ntTbqdVAbkXcB2bytV0iw9WcPnY+fBxwzvrh57GHVBM=;
 b=FZ8bFQgD4vRxr3awHKWdj6bVDPgMl7eLrzC2Ox/DuXCIucKjHWgjiHmVAs6lBPcbhF
 cAbZTmWByHVkdvqqdIidJRSWtoWOSNYTXMeGYwEGRA2HuNjEOmXRj6ZJIDgT9pu6Pl9m
 1/66mfeHo2XLBlJHDqFWm0X2LMEcH6XtTN/AQcJJe1AkdARfpiumTqiiouq73FB02Ldi
 bUCY/QAp3UZzSppsQx2yhwvIO2nmCJRPTHvS5Y7dAL7z0jbtw1DrpmJPnOXpqc80Pixg
 tTokonr8ELTX62+bEJb0XbPV0tjo2zzVkQVbBtbJmIxJtxOSSIJMMIpDvMFeZ3eFL+s9
 TIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=ntTbqdVAbkXcB2bytV0iw9WcPnY+fBxwzvrh57GHVBM=;
 b=VXprDKmhLCwjYVvqGPaiEWv4MAe6kjNVcOD7m2Y7ugQjBrZ2Rrhuj1oeN6YB5ThRDf
 N01aY9oixixrr42ejumwmnZeUmkSkPzt1KO2I4Z7YPlFpxeLh7HdXyllLh2zpg/hYRTJ
 YG+7VLir+3/Klb1MtmTjb3pGoVIfjWcV02rFRUmSJ3PjBMRdWbWL2+SbU4xdVdtz52YK
 WWzz47/UWL6qn51oQhQitxS1ptNAzxLfSh9hZ44/6HyH2qm1e4WNnGtaCo2LALgrKKOq
 cp51q4zS8rnP7hSLefWkkd+EsI+MAn2xzdPpPAUm/Bx95vglyHf6i9LVVOUk51R8A1l6
 cVWw==
X-Gm-Message-State: AA6/9Rk4Ms8++UN2zWhL50BEl0Js1WrvEIskHy/d2s4S1kp1JmuQTztmyZZX3+WGyRkKKQEUmYMzgQ82szCowQ==
X-Received: by 10.176.84.72 with SMTP id o8mr20741828uaa.128.1476082402110;
 Sun, 09 Oct 2016 23:53:22 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.7.8 with HTTP; Sun, 9 Oct 2016 23:53:01 -0700 (PDT)
In-Reply-To: <1474058133-27363-8-git-send-email-tpearson@raptorengineering.com>
References: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
 <1474058133-27363-8-git-send-email-tpearson@raptorengineering.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Oct 2016 17:53:01 +1100
X-Google-Sender-Auth: k8bisztA18t7yOtTS9LZ_nhdwNo
Message-ID: <CACPK8Xeyk1sjbLzcpSJXqMqFVFJ0rvhRd4x5jK2qTgwsPCBbQQ@mail.gmail.com>
Subject: Re: [PATCH 07/17] pinctrl-aspeed-g4: Add definition for GPIO pins J2
 and O2
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 10 Oct 2016 06:53:24 -0000

On Sat, Sep 17, 2016 at 6:35 AM, Timothy Pearson
<tpearson@raptorengineering.com> wrote:
> This is required for Firestone to boot.
>
> Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>

These are now part of the dev-4.7 tree as part of Andrew's work.

Cheers,

Joel


> ---
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c |   15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> index e356619..610ab48 100644
> --- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> +++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c
> @@ -499,6 +499,9 @@ MS_PIN_DECL(E7, GPIOH7, ROMD15, RXD6);
>
>  FUNC_GROUP_DECL(UART6, A8, C7, B7, A7, D7, B6, A6, E7);
>
> +#define K5 74
> +SSSF_PIN_DECL(K5, GPIOJ2, SGPMO, SIG_DESC_SET(SCU84, 10));
> +
>  #define J3 75
>  SSSF_PIN_DECL(J3, GPIOJ3, SGPMI, SIG_DESC_SET(SCU84, 11));
>
> @@ -727,10 +730,14 @@ SS_PIN_DECL(V6, GPIOO0, VPIG8);
>  SIG_EXPR_LIST_DECL_SINGLE(VPIG9, VPI24, VPI24_DESC, SIG_DESC_SET(SCU88, 9));
>  SS_PIN_DECL(Y5, GPIOO1, VPIG9);
>
> +#define AA4 114
> +SIG_EXPR_LIST_DECL_SINGLE(VPIR0, VPI30, VPI30_DESC, SIG_DESC_SET(SCU88, 10));
> +SS_PIN_DECL(AA4, GPIOO2, VPIR0);
> +
>  FUNC_GROUP_DECL(VPI18, T5, U3, V1, U4, V2, AA22, W5, Y4, AA3, AB2);
>  FUNC_GROUP_DECL(VPI24, T5, U3, V1, U4, V2, AA22, W5, Y4, AA3, AB2, V6, Y5);
> -FUNC_GROUP_DECL(VPI30, T5, U3, V1, U4, V2, W1, U5, W4, Y3, AA22, W5, Y4, AA3,
> -               AB2);
> +FUNC_GROUP_DECL(VPI30, T5, U3, V1, U4, V2, W1, U5, W4, Y3, AA4, AA22, W5, Y4,
> +               AA3, AB2);
>
>  #define Y7 125
>  SIG_EXPR_LIST_DECL_SINGLE(GPIOP5, GPIOP5);
> @@ -1154,6 +1161,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
>         ASPEED_PINCTRL_PIN(J20),
>         ASPEED_PINCTRL_PIN(J21),
>         ASPEED_PINCTRL_PIN(J3),
> +       ASPEED_PINCTRL_PIN(K5),
>         ASPEED_PINCTRL_PIN(K18),
>         ASPEED_PINCTRL_PIN(L22),
>         ASPEED_PINCTRL_PIN(N21),
> @@ -1189,6 +1197,7 @@ static struct pinctrl_pin_desc aspeed_g4_pins[ASPEED_G4_NR_PINS] = {
>         ASPEED_PINCTRL_PIN(Y4),
>         ASPEED_PINCTRL_PIN(Y5),
>         ASPEED_PINCTRL_PIN(Y7),
> +       ASPEED_PINCTRL_PIN(AA4),
>  };
>
>  static const struct aspeed_pin_group aspeed_g4_groups[] = {
> @@ -1231,6 +1240,7 @@ static const struct aspeed_pin_group aspeed_g4_groups[] = {
>         ASPEED_PINCTRL_GROUP(FLBUSY),
>         ASPEED_PINCTRL_GROUP(FLWP),
>         ASPEED_PINCTRL_GROUP(UART6),
> +       ASPEED_PINCTRL_GROUP(SGPMO),
>         ASPEED_PINCTRL_GROUP(SGPMI),
>         ASPEED_PINCTRL_GROUP(VGAHS),
>         ASPEED_PINCTRL_GROUP(VGAVS),
> @@ -1341,6 +1351,7 @@ static const struct aspeed_pin_function aspeed_g4_functions[] = {
>         ASPEED_PINCTRL_FUNC(FLBUSY),
>         ASPEED_PINCTRL_FUNC(FLWP),
>         ASPEED_PINCTRL_FUNC(UART6),
> +       ASPEED_PINCTRL_FUNC(SGPMO),
>         ASPEED_PINCTRL_FUNC(SGPMI),
>         ASPEED_PINCTRL_FUNC(VGAHS),
>         ASPEED_PINCTRL_FUNC(VGAVS),
> --
> 1.7.9.5
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
