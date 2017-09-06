Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::244; helo=mail-lf0-x244.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RLrzbEQg"; 
 dkim-atps=neutral
Received: from mail-lf0-x244.google.com (mail-lf0-x244.google.com
 [IPv6:2a00:1450:4010:c07::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xnBnz0B5nzDrJL
 for <openbmc@lists.ozlabs.org>; Wed,  6 Sep 2017 15:23:50 +1000 (AEST)
Received: by mail-lf0-x244.google.com with SMTP id m199so2579641lfe.5
 for <openbmc@lists.ozlabs.org>; Tue, 05 Sep 2017 22:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=qnyK7jqYxuHaTUGmbHxO4anZv+T/B2U4mlNeI9IfRKg=;
 b=RLrzbEQg/X9mqvOjU0qxa/tGylBFNSh37CCPbWRAD2gL3lTsqjp//NTkbNOTSW1xO4
 /zNx80/FoaVrZoHjUIdJxIU/6YBDtfKLlVc7VD2fSSCoZrVUsz0isysVGQqGddeidOm0
 97558Sb5TiqW5AwAbHrME+bUhPcpGYdVVjVtrBPKQWe/IzVOb63+WRGAGBzgYgUHdhyR
 kte2LbQeAxAIX4sR4/REZsUW/GvMBpNU/RryXgNyH4nDEtgDlpnd0PWhb84vrtcjObQW
 ti8BsHJbLdoyvUtyO6OITjxZGF5ikAsYH4HFBBaO1NB7d743CCirz2uqsoYEEE27VjwY
 ajQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=qnyK7jqYxuHaTUGmbHxO4anZv+T/B2U4mlNeI9IfRKg=;
 b=HHUvZnkE7WTmNBNZQp1E0nLRbRoWm1e5HwsbC5S3HqLB4RGufYY2KcsNm3dSn5b75s
 Hj3n1v0bBOXn8+5Gtqz62SFJymsz53TestxR6e66dgomU0G4BzqjadTEw1Q38zTCWT7C
 oR1z1ndzNrDoW609UyBBhj8KpX71VkJu2xDD0LQKInetOrK/De4tAOk7JH1kqs9EnlBd
 lg5oZ8lv5qZaM0iRfdt37QV70C4pnbLtjkRiRZ/0A3H4dWUsH+3E0nyR8RY+Z0dxaUom
 JISogUACIAIrY1oAZLB4FYd670XTLGz80dm+AQ5ynV3nhYHElBw/Qwj2/c418TPfJ4kw
 miFg==
X-Gm-Message-State: AHPjjUgS28h7u1LZ7JB+rf6WMz7aPOI8hAIV7GNieL1dvft3aGIUhvIc
 i3yzutshIES8U81uBqtJKHv3BGDzQg==
X-Google-Smtp-Source: ADKCNb4HgNlwVOhCTPIUQv1wkJO1fb3uUj4fJaDQrzRJO7b15Ld4cuo2ccQmOdzcYxXlXv97Uih5rUGObbvMFhqa4CI=
X-Received: by 10.46.71.72 with SMTP id u69mr418470lja.182.1504675427347; Tue,
 05 Sep 2017 22:23:47 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.79.70 with HTTP; Tue, 5 Sep 2017 22:23:26 -0700 (PDT)
In-Reply-To: <20170906003016.2159-3-brendanhiggins@google.com>
References: <20170906003016.2159-1-brendanhiggins@google.com>
 <20170906003016.2159-3-brendanhiggins@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 6 Sep 2017 14:53:26 +0930
X-Google-Sender-Auth: 2F2ulwkpDLVJdT1FJs9aESVTvp8
Message-ID: <CACPK8Xc0jrnx96=BoGMwQgoT2brgc0UTNU5HMHXDeFfeToVgxA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, avifishman70@gmail.com,
 tmaimon77@gmail.com, 
 Rick Altherr <raltherr@google.com>, Florian Fainelli <f.fainelli@gmail.com>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Wed, 06 Sep 2017 05:23:52 -0000

On Wed, Sep 6, 2017 at 10:00 AM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> +++ b/Documentation/devicetree/bindings/arm/npcm/npcm.txt
> @@ -0,0 +1,6 @@
> +NPCM Platforms Device Tree Bindings
> +-----------------------------------
> +NPCM750 SoC
> +Required root node properties:
> +       - compatible = "nuvoton,npcm750";
> +

This is minimal. I assume there will be more content added as more
support is added?

Does it need it's own directory?


> diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
> new file mode 100644
> index 000000000000..54df32cff21b
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts

> +
> +/dts-v1/;
> +#include "nuvoton-npcm750.dtsi"
> +
> +/ {
> +       model = "Nuvoton npcm750 Development Board (Device Tree)";
> +       compatible = "nuvoton,npcm750";
> +
> +       chosen {
> +               stdout-path = &serial3;
> +               bootargs = "earlyprintk=serial,serial3,115200";
> +       };
> +
> +       memory {
> +               reg = <0 0x40000000>;
> +       };
> +
> +       cpus {
> +               enable-method = "nuvoton,npcm7xx-smp";
> +       };
> +
> +       clk: clock-controller@f0801000 {
> +               status = "okay";
> +       };
> +
> +       apb {
> +               watchdog1: watchdog@f0009000 {
> +                       status = "okay";
> +               };

You've already got the label for the node, is there are reason you
don't use a phandle to set the status?

&watchdog1 {
   status = "okay";
};

Same with the serial nodes below.

> +
> +               serial0: serial0@f0001000 {
> +                       status = "okay";
> +               };
> +
> +               serial1: serial1@f0002000 {
> +                       status = "okay";
> +               };
> +
> +               serial2: serial2@f0003000 {
> +                       status = "okay";
> +               };
> +
> +               serial3: serial3@f0004000 {
> +                       status = "okay";
> +               };
> +       };
