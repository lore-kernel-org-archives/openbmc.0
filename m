Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c0b::244; helo=mail-it0-x244.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Cw8pJN/B"; 
 dkim-atps=neutral
Received: from mail-it0-x244.google.com (mail-it0-x244.google.com
 [IPv6:2607:f8b0:4001:c0b::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 420f3c0JsrzF2vj
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 18:31:22 +1000 (AEST)
Received: by mail-it0-x244.google.com with SMTP id p79-v6so6501652itp.3
 for <openbmc@lists.ozlabs.org>; Wed, 29 Aug 2018 01:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fqO/CGMPZTQeOOUIuSB2NKwkLlZzEyY+TggBfaeaYhg=;
 b=Cw8pJN/B/v1bnkGcrnLrThKSrRpsIIwxFET5OnL1ZL09kTaHoJJ2ThmRBj0cuFPP1f
 T5eKDDfcrXb73JH/X8hOzMtLX6svH5jC66yGTOIZnhVRzSsKL1oectvrmEIrPvaHJUlo
 PEbi8ljuLiLex0vh8wd7mowPt0nyRQek+3Zuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fqO/CGMPZTQeOOUIuSB2NKwkLlZzEyY+TggBfaeaYhg=;
 b=ZPYBkFlgXyvNZtJeBARKBuWBmIae8QPzGKf+nbW6wvnyLyOXqaGlsW/JTu083zYKbf
 Py7qq63OBHL2SQklaBDbCCS/qqjv9VpeRRDzYjCOwmkTueAvTtyli8Syu+pg+CE9vIp3
 0KZLqsSxG1RV9M3DG5KjMnYEF4A0Irj4BoXcn2+A8gYLTxxCaUSfR3HFMh+rhACZtHkI
 RZNnzzLq/xjdXf+NFLIeq7nTY7RICAJP97ohoYkB0E8mmZvk6hUV9L6RPc2i1W2mw/f7
 w9qST0mvrmA7/m4P+1iN33HHOYVPYtyrXQ9XbUVSLtNPaqCBEInHoDdknbhT6RpkYiRx
 NNFg==
X-Gm-Message-State: APzg51AfAzJksr4Iv0eclUWmEChzM7gZmUum9gA9eg+MHeVFBXMp8akz
 MRJFifPUiEmkauzgdYreqa8BL3b0zjaSMJgi46XNGg==
X-Google-Smtp-Source: ANB0Vda7jRKrZneo+P9cwI6Jgp+40xFOrsuPp3iQkwCVR22tEdOZ1eoPDNIxeUARBigOgDJS2YVpoAUaBsH0qQWThSc=
X-Received: by 2002:a02:6c45:: with SMTP id
 w66-v6mr4526803jab.87.1535531480157; 
 Wed, 29 Aug 2018 01:31:20 -0700 (PDT)
MIME-Version: 1.0
References: <20180808092526.87405-1-tmaimon77@gmail.com>
 <20180808092526.87405-3-tmaimon77@gmail.com>
In-Reply-To: <20180808092526.87405-3-tmaimon77@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 29 Aug 2018 10:31:08 +0200
Message-ID: <CACRpkdb5PSx52xqeqiCO-dcQXT0uuUZGstvKP2YKUFnCnoWOpw@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO
 driver
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>, avifishman70@gmail.com, 
 Joel Stanley <joel@jms.id.au>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2018 08:31:25 -0000

On Wed, Aug 8, 2018 at 11:26 AM Tomer Maimon <tmaimon77@gmail.com> wrote:

> Add Nuvoton BMC NPCM750/730/715/705 Pinmux and
> GPIO controller driver.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Patch applied! It's a very nice driver.

I had to add back select GPIO_GENERIC as the driver
uses bgpio_init() exactly as I wanted.

Yours,
Linus Walleij
