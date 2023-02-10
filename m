Return-Path: <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D07DC05027
	for <openbmc@archiver.kernel.org>; Fri, 10 Feb 2023 10:34:00 +0000 (UTC)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCqpb0ly5z3f5P
	for <openbmc@archiver.kernel.org>; Fri, 10 Feb 2023 21:33:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.174; helo=mail-qt1-f174.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCqnt0bznz3bY1
	for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2023 21:33:21 +1100 (AEDT)
Received: by mail-qt1-f174.google.com with SMTP id h24so5164403qta.12
        for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2023 02:33:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fZS+c56KQpRDCKl5uf42ZhDkTWWR4DPlYQhT2r1VZ60=;
        b=5uIFAxPfXNMMpat4wZlPDHkmq2DJzPRY2iTlopaKOx17Wo3kzEaJBu0+2Iv2kdvsm6
         3hNvrhodbPvWJUYLzgbqDGR80UhcqPZ78JVbQEWBK7wKJpao8YTjMh6zf5n1mtfxB/E0
         nbYsAU1Emo1JQkxXlHzShN/l/SU3b0A2Fj+JNtqtMarQ1NmLz/UhamnraKgb3mEvI5lL
         oNQFZu8ikoTLRaLzRfpGSKRIdShTkDL1KmDWA6T9fLVyK/GdpI3Y05+FzVzHk5KywJB8
         f+1+PpREMNv4KzHVaInsaSw6SMJ4YTbwaPzBHMRAxY0IDP47MibUERDhn4Jy7nz/W5c8
         w+Vw==
X-Gm-Message-State: AO0yUKUh8B4vJ0SFmp/5oKV7d3osBpuuuraKS3zwuLjmAFmc+caCBAn2
	R3hY/RZ9JJ5R/v0ZaChDUfxfi+NzIzt5xGjr
X-Google-Smtp-Source: AK7set/j/FFfU11kRvMIcyix88OYEzsmHi78MlrlTQa3c8sLjvLoCEWTkD6N8DS6Ni+lL3HbmtV8Ww==
X-Received: by 2002:a05:622a:1a0c:b0:3b8:6d92:bf62 with SMTP id f12-20020a05622a1a0c00b003b86d92bf62mr24924513qtb.46.1676025197741;
        Fri, 10 Feb 2023 02:33:17 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 69-20020a370a48000000b0071b158849e5sm3283803qkk.46.2023.02.10.02.33.17
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 02:33:17 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-52bf58b417fso61989187b3.6
        for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2023 02:33:17 -0800 (PST)
X-Received: by 2002:a0d:f444:0:b0:526:78ad:bb15 with SMTP id
 d65-20020a0df444000000b0052678adbb15mr1562294ywf.47.1676024801737; Fri, 10
 Feb 2023 02:26:41 -0800 (PST)
MIME-Version: 1.0
References: <20221103213420.1395507-1-j.neuschaefer@gmx.net>
In-Reply-To: <20221103213420.1395507-1-j.neuschaefer@gmx.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Feb 2023 11:26:28 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-VbQmQ5u+4Q8c7-wYQ@mail.gmail.com>
Message-ID: <CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-VbQmQ5u+4Q8c7-wYQ@mail.gmail.com>
Subject: Re: [PATCH v6] soc: nuvoton: Add SoC info driver for WPCM450
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, Paul Menzel <pmenzel@molgen.mpg.de>, Brian Norris <briannorris@chromium.org>, Tomer Maimon <tmaimon77@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Sven Peter <sven@svenpeter.dev>, openbmc@lists.ozlabs.org, Hector Martin <marcan@marcan.st>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Joel Stanley <joel@jms.id.au>, Robert Jarzmik <robert.jarzmik@free.fr>, Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+openbmc=archiver.kernel.org@lists.ozlabs.org>

Hi Jonathan,

On Thu, Nov 3, 2022 at 10:37 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
> Add a SoC information driver for Nuvoton WPCM450 SoCs. It provides
> information such as the SoC revision.
>
> Usage example:
>
>   # grep . /sys/devices/soc0/*
>   /sys/devices/soc0/family:Nuvoton NPCM
>   /sys/devices/soc0/revision:A3
>   /sys/devices/soc0/soc_id:WPCM450
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
> ---
> v6:
> - Select REGMAP
> - Rearrange Kconfig structure a bit

Thanks for your patch!

Unfortunately Joel seems to have sent v5 to Arnd instead of v6?
https://lore.kernel.org/all/20230201051717.1005938-1-joel@jms.id.au

Which is now commit 7dbb4a38bff34493 ("soc:
nuvoton: Add SoC info driver for WPCM450") in soc/for-next...

> --- /dev/null
> +++ b/drivers/soc/nuvoton/Kconfig
> @@ -0,0 +1,17 @@
> +# SPDX-License-Identifier: GPL-2.0
> +menu "Nuvoton SoC drivers"
> +       depends on ARCH_NPCM || COMPILE_TEST

... and lacks the above dependency, hence appearing on my radar.

> +
> +config WPCM450_SOC
> +       tristate "Nuvoton WPCM450 SoC driver"
> +       default y if ARCH_WPCM450
> +       select SOC_BUS
> +       select REGMAP
> +       help
> +         Say Y here to compile the SoC information driver for Nuvoton
> +         WPCM450 SoCs.
> +
> +         This driver provides information such as the SoC model and
> +         revision.
> +
> +endmenu

Do you plan to send a follow-up patch?
Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
