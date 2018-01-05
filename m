Return-Path: <bjwyman@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::244; helo=mail-qt0-x244.google.com;
 envelope-from=bjwyman@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QArUeAcd"; 
 dkim-atps=neutral
Received: from mail-qt0-x244.google.com (mail-qt0-x244.google.com
 [IPv6:2607:f8b0:400d:c0d::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zD12l5HP5zF0QL
 for <openbmc@lists.ozlabs.org>; Sat,  6 Jan 2018 10:24:15 +1100 (AEDT)
Received: by mail-qt0-x244.google.com with SMTP id 33so7624562qtv.1
 for <openbmc@lists.ozlabs.org>; Fri, 05 Jan 2018 15:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=HYedzz0fj6aJJipOFqRWpP65UJfJXady4ZixIP8psvg=;
 b=QArUeAcdiNrecrjeIv9a7VYoA89YnO9oFM6tw3y5jZq9H4UjEc4oSswLXUcGQ7lj9d
 sYn+AzFyUmOGJpv0h/sp2bxxkhF9VOXfEuBkDIcyCRLDVD200jg1+3ah4DBX/IRiSxX3
 r3nY7cTGBTvghZadMA77/F1LfL/yM3GPOBpIwboESECa4SnEn+lwra0MnfbLXdZ+/FUx
 +tPg850aVjUvuhJ3qPJfypPQGUjWe+ByqEGWQa3OioVy2zriZvyjLVKsIrMqAIunrOFZ
 Duvafz7Ob+cEdEtJRcYMMLfQafRJ866zLtJA7JhQhNXSJPMv+c7HbksdgMrQbTb0JxA2
 EV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=HYedzz0fj6aJJipOFqRWpP65UJfJXady4ZixIP8psvg=;
 b=XyVaPTFOGOQPABpDyCHUe6oWGaFjN0BaDKpWz+Dx6EfGmNH+hGNiJqLwa8hgfsN+QX
 e8kJ8vr/TGKq18H79pzpxi/QqLOVTi/w2D7mlIZ2yCElTlQ8W1HXZndEKlN0sXMqLl88
 GDSsGlZLYXVF7kODen1+loXw4YxBCxhDOymBWjLK9DH41WMpyfDTLrAw6ArxadFrzbyZ
 xGS5e8+HIagmuvJfFl+9/18LzHT0jrgUzWP6+Zq6A4ofBTuv8TligtIPU8o+CCrRA25q
 jF8F4RJWL5M4GRu3Dm++qL2jERts9RqbmgOHv1TKv40K2P+1nBPXaEwgX2J0pk/gEBY/
 HKGA==
X-Gm-Message-State: AKwxytecyPocj/RAxzyp2stsNHU590yyU2qtv2sJO1M34jYUCLwCLwMk
 2exaWkzAOgR6yk+77/BsFHmmGs5+zSiYSzNwfqrBgA==
X-Google-Smtp-Source: ACJfBoudrXdRNfTOkNaUEweJ4IuBN/7YYc8RZFnobfatvPdw48dolOvbVKiGiyNgsJY72RtfU25csr3lDGzcSeQ5Ebo=
X-Received: by 10.200.53.6 with SMTP id y6mr6763465qtb.66.1515194652860; Fri,
 05 Jan 2018 15:24:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.35 with HTTP; Fri, 5 Jan 2018 15:24:12 -0800 (PST)
In-Reply-To: <1514382619-14336-2-git-send-email-tmaimon77@gmail.com>
References: <1514382619-14336-1-git-send-email-tmaimon77@gmail.com>
 <1514382619-14336-2-git-send-email-tmaimon77@gmail.com>
From: Brandon Wyman <bjwyman@gmail.com>
Date: Fri, 5 Jan 2018 17:24:12 -0600
Message-ID: <CAK_vbW2rZGWasqHDLZV4a2t=x9w6T6MFMHV=-G2JLGGC8iq+Fw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 v1 1/2] dt-binding: hwmon: document NPCM7xx
 sensors DT bindings
To: Tomer Maimon <tmaimon77@gmail.com>
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
X-List-Received-Date: Fri, 05 Jan 2018 23:24:16 -0000

On Wed, Dec 27, 2017 at 7:50 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Added device tree binding documentation for Nuvoton
> NPCM7xx Pulse Width Modulation (PWM) and Fan
> Tachometer devices.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/npcm7xx-fan.txt          | 18 ++++++++++++++++++
>  .../devicetree/bindings/hwmon/npcm7xx-pwm.txt          | 16 ++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/npcm7xx-fan.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
>
> diff --git a/Documentation/devicetree/bindings/hwmon/npcm7xx-fan.txt b/Documentation/devicetree/bindings/hwmon/npcm7xx-fan.txt
> new file mode 100644
> index 000000000000..cb456632a99f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/npcm7xx-fan.txt
> @@ -0,0 +1,18 @@
> +Nuvoton NPCM7xx fan tachometer (Fan) controller device driver
> +
> +The NPCM7xx fan tachometer controller supports upto 16 Fan inputs.
... up to ....

> +
> +Required properties:
> +- compatible      : "nuvoton,npcm750-fan" for Poleg NPCM750.
> +- reg             : Offset and length of the register set for the device.
> +- clocks          : phandle of fan reference clock.
> +- interrupts      : Contain the fan interrupts with flags for
> +                    falling edge.
> +
> +fan: fan@0 {
> +       compatible = "nuvoton,npcm750-fan";
> +       reg = <0xf0180000 0x8000>;
> +       interrupts = <0 96 4>, <0 97 4>, <0 98 4>, <0 99 4>,
> +               <0 100 4>, <0 101 4>, <0 102 4>, <0 103 4>;
> +       clocks = <&clk NPCM7XX_CLK_APB4>;
> +};
> diff --git a/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt b/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
> new file mode 100644
> index 000000000000..8b54a59c272a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/npcm7xx-pwm.txt
> @@ -0,0 +1,16 @@
> +Nuvoton NPCM7xx Pulse-width modulation (PWM) controller device driver
> +
> +The NPCM7xx PWM controller supports upto 8 PWM outputs.
> +Each PWM output module have watchdog.
> +
> +Required properties:
> +- compatible      : "nuvoton,npcm750-pwm" for Poleg NPCM750.
> +- reg             : Offset and length of the registers set for the device.
> +- clocks          : phandle of pwm reference clock.
> +
> +pwm:pwm@f0103000 {
> +       compatible = "nuvoton,npcm750-pwm";
> +       reg = <0xf0103000 0x1000
> +                               0xf0104000 0x1000>;
> +       clocks = <&clk NPCM7XX_CLK_APB3>;
> +};
> --
> 2.14.1
>
