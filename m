Return-Path: <mine260309@gmail.com>
Received: from mail-io0-x244.google.com (mail-io0-x244.google.com
 [IPv6:2607:f8b0:4001:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wd1Vg3ZvszDqJ6
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 16:56:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XE8GCtj/"; 
 dkim-atps=neutral
Received: by mail-io0-x244.google.com with SMTP id f102so1548247ioi.3
 for <openbmc@lists.ozlabs.org>; Tue, 30 May 2017 23:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=tRLu39/ClItddJ2piAbBnZqQnVFpgONPfT42YI7Mbzc=;
 b=XE8GCtj/votcHV+IoDnLKo3l55jKkFwk+fCW4pm9WlrAljSBgID0yJ4OrhgAirs5rA
 6GQ6g7d3D0jLdFAKA2ZYBsyX7iDZV7bdspKcobE4TeoQNLvedUfDSMX3cCTuml1tUQJG
 HbqGkVBBea/tZqsljTy6gl7rO6/rpMEM++xgFmF2slDJSgXv3hlH/i8DvKprtcu3k1rG
 pXk+M+nC57m8kTSNsaZvo2yxJF8xdUlcEXnnXLu/BzNOjbhsaKIDtTZaJYZ8RpuvmcYi
 BEVjBEkC8usJuANGrZHB30slL+/atOfWIkpJbr9XIs+7PkqYWsK66lCVxMaNgwT8fgSq
 1Big==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=tRLu39/ClItddJ2piAbBnZqQnVFpgONPfT42YI7Mbzc=;
 b=KVBSbtqcztl/UIH1MpmF93eMoAqNP5ORPmp0XM16hlL/7UqSbYwKXEBUFWqmapQYZj
 gFZmPM9zaPhobTjoZE0Q7Mme1QhzKhiOzlbLYUVI44gjRyhV/1NoIj60LIGVyVBLQrYB
 47A5fwdCsa2yhF2Yk2sZQn61cX6PpvYZ62bKKmsqoG8TTJjxuRZSihAsKug99J3BKUzd
 N4KaZzOKuK+HC5ExfR07e84JUSzARTARDMMyFUr0dfvnOAfa/hJPCLED61vbfoVSbmN7
 m8MbpDdbgehtfHEDW/MIZU+zXlRLA2XdSrozhma9b32Q2H+In2d1HqAwzv4cNizJZhaw
 A0Rw==
X-Gm-Message-State: AODbwcAuYzlkOjgf66oP7LVlyZ1bWAPSTvbUxxH9alNgU5HfAS3WqZLB
 7XZkspINNkZJ66aL2fZOFdiCgQjByQ==
X-Received: by 10.107.169.207 with SMTP id f76mr21199942ioj.71.1496213817191; 
 Tue, 30 May 2017 23:56:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.150.10 with HTTP; Tue, 30 May 2017 23:56:56 -0700 (PDT)
In-Reply-To: <20170525074818.7284-2-joel@jms.id.au>
References: <20170525074818.7284-1-joel@jms.id.au>
 <20170525074818.7284-2-joel@jms.id.au>
From: Lei YU <mine260309@gmail.com>
Date: Wed, 31 May 2017 14:56:56 +0800
Message-ID: <CAARXrtkTzBUoGPmy7hf_sGWzdefm2zVt_8jMHedc0SSXDZroZQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 2/2] ARM: dts: aspeed: romulus: Add Maxim
 MAX31785
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
X-List-Received-Date: Wed, 31 May 2017 06:57:00 -0000

Reviewed-by: Lei YU <mine260309@gmail.com>

On Thu, May 25, 2017 at 3:48 PM, Joel Stanley <joel@jms.id.au> wrote:
> From: Nickolaus Gruendler <ngruend@us.ibm.com>
>
> This fan controller is present at 0x52 on i2c-12.
>
> Signed-off-by: Nickolaus Gruendler <ngruend@us.ibm.com>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> index 5ca0f6e6a6a4..eae406aeb6ce 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
> @@ -206,8 +206,13 @@
>  &i2c12 {
>         status = "okay";
>
> +       /* Fan Controller */
> +       max31785@52 {
> +               compatible = "maxim,max31785";
> +               reg = <0x52>;
> +       };
> +
>         /* CPLD */
> -       /* Fan Controller 0xa4/a5 */
>         /* Power Supply */
>         /* Temp Sensor */
>         /* Temp Sensor */
> --
> 2.11.0
>
