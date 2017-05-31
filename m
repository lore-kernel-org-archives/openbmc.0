Return-Path: <mine260309@gmail.com>
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wd1Vt6QW7zDqJh
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 16:57:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GIuqFzv/"; 
 dkim-atps=neutral
Received: by mail-it0-x244.google.com with SMTP id d68so1055555ita.1
 for <openbmc@lists.ozlabs.org>; Tue, 30 May 2017 23:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=qwLNzASwhvVOqEG+8+l0qN0TbbEPwki+36kszWLq604=;
 b=GIuqFzv/ONrIAdGelN1IwlVgPH6DZJjuX334/fNKaSJr0wJ2mqX1K5ORs4oyfrWQhG
 FM3LcwvFgFGyzYpxVjLyNC8x/ofQAuYcM4q6pWnZMS0CRFRakB2E9Tg5RT3qkbiX7eeu
 VeGSLcUhbLYvcu0+MjvOLYb6NkAf77tiL/FK7ktjCvfeIaY1mq5iwuUc9i5dflhGZext
 dMc2i/SML2ZcYbcq7D69g7GdV0PQWcHxRyr2CAjItLnCIdAFu1lzZ1u8v0UZN58M+sjS
 zfDWEfQ4uX1bUN8H1Pxs4qPOoRAGCDHgaz0exEQ0upQFeIDaSqjIWAcEVBxmJVdi2E79
 vZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=qwLNzASwhvVOqEG+8+l0qN0TbbEPwki+36kszWLq604=;
 b=tQb3/iUFop88F8FMx/hPWiT6PqSK4rHGVsqFS78/PofCmsTvjZe4VhTIayAyYnueO8
 Bd33Ti6JpXsF5KyGCbqU40OgxXbC7mH0WPbxLPChYWp9EwooZINANev3bMgjbTk2y4O0
 y8W2nv0z2dIFnjrcTqPBj7MBRFbOn4h5QEBx6jNhfeqexIpMnT9QDf3bArbcRcQmPkkD
 +abtu5eITZoY/FyRvr2exTz82g1Sw0Eq+2jmzqHheKEYrwO5FCvwNka6c+UpMFlkzShI
 jyhMQO7VvO04V87lvxIyawlR+yu9uzCVENithi72YFOTdrvRi20GE59U2r+E6CEH8ykK
 siPA==
X-Gm-Message-State: AODbwcBM70QVnRQoOdESCekCGKQ8BuGG6NX51NrwhzXlNP3L0hA2c8lT
 pC7fucKYtNjfv0//ZcqcMfmULp0MAA==
X-Received: by 10.36.57.137 with SMTP id l131mr6154365ita.61.1496213827953;
 Tue, 30 May 2017 23:57:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.150.10 with HTTP; Tue, 30 May 2017 23:57:07 -0700 (PDT)
In-Reply-To: <20170525074818.7284-1-joel@jms.id.au>
References: <20170525074818.7284-1-joel@jms.id.au>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 31 May 2017 14:57:07 +0800
Message-ID: <CAARXrt=4kSrO-G7bAK47mO=x23GYyN2wN35PaC9zW6Z2A2wjgA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/2] ARM: dts: aspeed: romulus: Add
 checkstop gpio-keys
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Nickolaus Gruendler <ngruend@us.ibm.com>
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
X-List-Received-Date: Wed, 31 May 2017 06:57:11 -0000

Reviewed-by: Lei YU <mine260309@gmail.com>

On Thu, May 25, 2017 at 3:48 PM, Joel Stanley <joel@jms.id.au> wrote:
> From: Nickolaus Gruendler <ngruend@us.ibm.com>
>
> Signed-off-by: Nickolaus Gruendler <ngruend@us.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index ac728695e447..5ca0f6e6a6a4 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -42,6 +42,16 @@
>                 enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>                 trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
>         };
> +
> +       gpio-keys {
> +               compatible = "gpio-keys";
> +
> +               checkstop {
> +                       label = "checkstop";
> +                       gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
> +                       linux,code = <ASPEED_GPIO(J, 2)>;
> +               };
> +       };
>  };
>
>  &fmc {
> --
> 2.11.0
>
