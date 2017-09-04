Return-Path: <tmaimon77@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400c:c08::244; helo=mail-ua0-x244.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qQEHdKTz"; 
 dkim-atps=neutral
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xmBvZ0FZczDqXp
 for <openbmc@lists.ozlabs.org>; Tue,  5 Sep 2017 00:25:13 +1000 (AEST)
Received: by mail-ua0-x244.google.com with SMTP id c27so212221uah.1
 for <openbmc@lists.ozlabs.org>; Mon, 04 Sep 2017 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=+wYJjulXrRGzgL+GyZGluGxunu6FvsF0EOQX9MRGjMo=;
 b=qQEHdKTzQUoA1NTC55irYsQeq5kLvv9bXwpYQ5uijUqfTjdiAKTQV76k/QuzwdPGcQ
 264ihPPblZpHGEnjOS3eveaqdFDPqHWjSNqyQqCUPbHKxjQQ4xbWFNddkEPZUUbCJYQJ
 UZDk8PPUO42s+c2j5ocyRph7FZa+d1yvOLTrwTo+noVJD7RILMecWjmLaFriuwJvdKOc
 Zmw3yTbZmHoWoArDbIoJBrfvjsqeuJYnOz8bFw5JutdyNmMA8EctRm/d6kGlOTDtmusx
 QY62rkZKnTAl2kZLX0xajQ5N4af0SeG/E/KKAE7N8nFeZ6G64RPa/1sGohxKgTAUiCzC
 0TAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=+wYJjulXrRGzgL+GyZGluGxunu6FvsF0EOQX9MRGjMo=;
 b=RLgLzE3Yitcb6uuXZ2cwiBukDPeANSio5lhntIvNozGyaGQhByke1UmJoSjXxqJHnB
 BE7mT4/HvUtb9cgMLpTE/dQ8Dz6a4kJiHKhFmzKcFKonYiYxEXZMbmP2lVprKezXUyvm
 2hh5Ydeq4PiEd4LxHyZmEzFSegbTvgQUBDXCZHq4PgnL3xTM7hU1T22TI/qmdnWT8zcO
 mMw+ZXo1y3Uo5gePE6cZI/SWdj0tMedGj9JS2SBVVTYIgJOHZEQG6kNNu5Q8csCYVD0k
 kOWxvrprClk0DtcQ3eGN4nI3KDrWKBnP6uBMHL2n/egUZyJT/HJFCcYXmfdbHQ7ZEUav
 URsw==
X-Gm-Message-State: AHPjjUhN4Zqx7nCoNtKXvpHuDYDc/zFCr78FpvE5oNFxPp5WZBM0D4mm
 79uz9ORpMHbE2nI2WJWtCoeShM1i9g==
X-Google-Smtp-Source: ADKCNb6YgMNnF47lw8Yq7UQo2rY7P92+Yei7m2iVA8USnL7U3B//jrrEkAVnoq9+KnfMeqlX9jlF/k68RLs7DGU4+cE=
X-Received: by 10.176.80.42 with SMTP id b39mr475427uaa.34.1504535111594; Mon,
 04 Sep 2017 07:25:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.90.193 with HTTP; Mon, 4 Sep 2017 07:25:11 -0700 (PDT)
In-Reply-To: <20170831225400.19756-4-brendanhiggins@google.com>
References: <20170831225400.19756-1-brendanhiggins@google.com>
 <20170831225400.19756-4-brendanhiggins@google.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 4 Sep 2017 17:25:11 +0300
Message-ID: <CAP6Zq1husO0G+Prjn4Fge8icDhfO-kw0TdHDZ=wxFcpagD-6VA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] MAINTAINERS: Add entry for the Nuvoton NPCM
 architecture
To: Brendan Higgins <brendanhiggins@google.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, 
 avifishman70@gmail.com, raltherr@google.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 05 Sep 2017 09:10:20 +1000
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
X-List-Received-Date: Mon, 04 Sep 2017 14:25:14 -0000

On 1 September 2017 at 01:54, Brendan Higgins <brendanhiggins@google.com> wrote:
> Add maintainers and reviewers for the Nuvoton NPCM architecture.
>
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
>  MAINTAINERS | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 44cb004c765d..67064bf11904 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1598,6 +1598,19 @@ F:       drivers/pinctrl/nomadik/
>  F:     drivers/i2c/busses/i2c-nomadik.c
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
>
> +ARM/NUVOTON NPCM ARCHITECTURE
> +M:     Avi Fishman <avifishman70@gmail.com>
> +M:     Tomer Maimon <tmaimon77@gmail.com>
> +R:     Brendan Higgins <brendanhiggins@google.com>
> +R:     Rick Altherr <raltherr@google.com>
> +L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
> +S:     Maintained
> +F:     arch/arm/mach-npcm/
> +F:     arch/arm/boot/dts/nuvoton-npcm*
> +F:     include/dt-bindings/clock/nuvoton,npcm7xx-clks.h
> +F:     drivers/*/*npcm*
> +F:     Documentation/*/*npcm*
> +
>  ARM/NUVOTON W90X900 ARM ARCHITECTURE
>  M:     Wan ZongShun <mcuos.com@gmail.com>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> --
> 2.14.1.581.gf28d330327-goog
>

Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
Tested-by: Tomer Maimon <tmaimon77@gmail.com>

Reviewed-by: Avi Fishman <avifishman70@gmail.com>
Tested-by: Avi Fishman <avifishman70@gmail.com>
