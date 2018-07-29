Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c0b::242; helo=mail-it0-x242.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="R89q5oPF"; 
 dkim-atps=neutral
Received: from mail-it0-x242.google.com (mail-it0-x242.google.com
 [IPv6:2607:f8b0:4001:c0b::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41dxT06SkDzF132
 for <openbmc@lists.ozlabs.org>; Mon, 30 Jul 2018 08:00:01 +1000 (AEST)
Received: by mail-it0-x242.google.com with SMTP id g141-v6so14280288ita.4
 for <openbmc@lists.ozlabs.org>; Sun, 29 Jul 2018 15:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X7bZhcyTpE+i4skso6b+guWe1n4YDRE/3xREZIjVyiA=;
 b=R89q5oPFQU0WYedUgAws16ttipG+p4zgfD9c1uHZ+lhtcNHDOZ7hi+FsuCNqJLq+fN
 N0U/8Rj7/Fah/gUaYcDKum1WSOflRQlPsomNVfcfnZm12QL0+3rYj8bAYh35o5qpY/Bj
 XY3UiGW3Z1Niu+CIPOjbxUwGm1pJg8qdkLR4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X7bZhcyTpE+i4skso6b+guWe1n4YDRE/3xREZIjVyiA=;
 b=JEoiPNKfHJW5ceSl/e93HUWyn4icuu8CEF/rPYY7njJOc8vW/4xlz8vsjrEu+95YyO
 aZXKJOTNc2ZzXfF5m1eSyfyYwRUycLjWZ/BljVVwtmbyzE/a8qVAuw/zMs1V/z4it2Pz
 j0b13QQWxV/4g2NjRhSjTSwU+3p0gYhNF+JkK+pA3eMEUlxo/G547n1k5/FbUjbkCmSP
 1xEJQumN6wvYR/+JXzOAomTBjGLIp/NIo/Amr0ex/ZAQQowH81Ydmv4BxFE1Fgvax8Un
 DZMBztVpnHVhz8/+/wa3mtCdccwYCYOJ7JXktiYNgFNQ1hvTg9oKH6Gx3iCTi+dEU/Gw
 F12A==
X-Gm-Message-State: AOUpUlEu3jpMWSgTBpg24j4ew8CJKPseDMp4qXpwA0hDROzis5Lq9RwA
 V9pt0ChfzQABpfLMf8z2+F78wNueVP35TnF+VpHjiQ==
X-Google-Smtp-Source: AAOMgpcXJjDlWCveC8+vtZ4s9b+bB2/b1V6q6PHef6zUUqEDNBVEgESLYW6Z4udN4prI4HPyKrAsP2gDDao2EGxtnhE=
X-Received: by 2002:a02:2505:: with SMTP id
 g5-v6mr14110254jag.112.1532901599201; 
 Sun, 29 Jul 2018 14:59:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180712214203.114844-1-tmaimon77@gmail.com>
 <20180712214203.114844-3-tmaimon77@gmail.com>
 <CACRpkdYOQMkA6BHtY3-NSXhyhoG7KzDg8SkqL2B6M8GQrvXgMA@mail.gmail.com>
 <CAP6Zq1h5TXBcfvxDA5Ae9XuW65s_zQd_JrM3vRWR6KBRYCHRrg@mail.gmail.com>
In-Reply-To: <CAP6Zq1h5TXBcfvxDA5Ae9XuW65s_zQd_JrM3vRWR6KBRYCHRrg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 29 Jul 2018 23:59:45 +0200
Message-ID: <CACRpkdbcqA4gBv7W2SNSFJRQ26GGCE315UsDDG9zr458GK709g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: nuvoton: add NPCM7xx pinctrl and GPIO
 driver
To: tmaimon77@gmail.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 avifishman70@gmail.com, 
 Nancy Yuen <yuenn@google.com>, Brendan Higgins <brendanhiggins@google.com>, 
 Patrick Venture <venture@google.com>, Joel Stanley <joel@jms.id.au>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Sun, 29 Jul 2018 22:00:05 -0000

On Thu, Jul 26, 2018 at 2:01 AM Tomer Maimon <tmaimon77@gmail.com> wrote:

> I initialize bgpio as follow:
>
>                         ret = bgpio_init(&pctrl->gpio_bank[id].gc,
>                                          pctrl->dev, 4,
>                                          pctrl->gpio_bank[id].base +
>                                          NPCM7XX_GP_N_DIN,
>                                          pctrl->gpio_bank[id].base +
>                                          NPCM7XX_GP_N_DOUT,
>                                          NULL,
>                                          NULL,
>                                          pctrl->gpio_bank[id].base +
>                                          NPCM7XX_GP_N_IEM,
>                                          BGPIOF_READ_OUTPUT_REG_SET);

(...)
> The problem occur when reading the GPIO value from bgpio_get_set function,
> because the directions value are inverse it reading the wrong I/O registers
>
> For direction out it reading dat register (instead of set register)
>
> For direction in it calling set register (instead of dat register)

Hm I don't quite get it... sorry. Maybe if you show your fix and what
you expect to happen I can understand better?

Do you mean that because you write the inverse value to
IEM this happens, and the BGPIO code assumes that
you always write 1 to set a line as input and 0 to set it
as output?

I would say if this causes the problem we should just add
a new BGPIOF_INVERTED_REG_DIR with comment in
include/linux/gpio/driver.h and make the necessary fix to
respect this flag in the gpio-mmio.c core so it works right.

If you do this as a separate patch I would be grateful :)

Yours,
Linus Walleij
