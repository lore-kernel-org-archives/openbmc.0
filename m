Return-Path: <linus.walleij@linaro.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c06::241; helo=mail-io0-x241.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="ISKRer0D"; 
 dkim-atps=neutral
Received: from mail-io0-x241.google.com (mail-io0-x241.google.com
 [IPv6:2607:f8b0:4001:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yR6KF1gz4zDrF7
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 20:59:59 +1100 (AEDT)
Received: by mail-io0-x241.google.com with SMTP id n137so33773237iod.6
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 02:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=OtiGAJ3DVbah2V10Vy5U2C4OebgL5TbZsxAiqOD3e6I=;
 b=ISKRer0DM4QNvEwKNYRHqhHFYXKPCQKManfEtBdUODd49Nqn37QvZAiakT/oX9iFsi
 wI66GgLNEoMi91Yyj28ajFqA7TjI8O8ahpY3qPj+TINLLAaKMuL7gisxV9altCd1Jied
 ZfLA0CKpBWAxsd8vyP2vSyxkTcEIrSF95zmwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=OtiGAJ3DVbah2V10Vy5U2C4OebgL5TbZsxAiqOD3e6I=;
 b=mhdNCKXi5RO7nxb+bPQmt9c44a2WIyWAyGayFAuRnLkV9YeE+BIDkcPU0KMIY0JDVk
 pC2L9MwXvEhQqgmPAbxx6PtsB65P1kZOQa/Ek7ts4+ByZZwROR6xkm8yYMDDMe6F6m3i
 yBVlavXZcwwHges2vZ6PqeEeY9CjxjBus9zwPe1r+kdkxzMoO17LlaVVhu2HlAnuD44b
 0ZTSOzSg0IrciprCN6kTKyV5dLcHoEOfbXlZUaqm3J8Q6v4a5sVgozA+K6KxlwwnD94K
 TIH3Rs/dSfdf30iSRlq510VjNDrnbJwg70A0YeNuqUQeWRfVZqQW3Cr1VrccN6hKMo8o
 Mz1Q==
X-Gm-Message-State: AMCzsaX4BUVr2a/0LoX2k+JfKQQCbN9T/O0teg5X5I4Q++ZPQYbThN9f
 6voU2dgn+a2v7AeBmbet1jYjmGPTHkN7+xsaMbVsPg==
X-Google-Smtp-Source: ABhQp+Sn3fGnSPso1CyR4V3UsZNaEAsGtPX/zQpx35xJIvMms6iMa4s3TfGO0OZlzOu4l73p2I8MIMK1WQauuhSt5PI=
X-Received: by 10.107.150.67 with SMTP id y64mr1679400iod.74.1509443995921;
 Tue, 31 Oct 2017 02:59:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.14.140 with HTTP; Tue, 31 Oct 2017 02:59:55 -0700 (PDT)
In-Reply-To: <1508976339.13477.5.camel@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-4-andrew@aj.id.au>
 <CACRpkdY4F-ocFxomLEsVyGA0odGooWysQq5MHi9qwUt6E_VDzA@mail.gmail.com>
 <1508490173.24322.53.camel@aj.id.au>
 <20171025081454.4avrf57mf33khu7c@localhost.localdomain>
 <1508976339.13477.5.camel@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 31 Oct 2017 10:59:55 +0100
Message-ID: <CACRpkdZzr3JHo=AEZejXn0nw0mZo02OWFmmTiUBjgr+bH+NOAw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] gpio: gpiolib: Add chardev support for
 maintaining GPIO values on reset
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Michael Welling <mwelling@emacinc.com>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Joel Stanley <joel@jms.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
 Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 patches@opensource.cirrus.com, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
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
X-List-Received-Date: Tue, 31 Oct 2017 10:00:02 -0000

On Thu, Oct 26, 2017 at 2:05 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> I feel that taking this argument to its logical conclusion leads to
> never exporting any GPIOs to userspace and doing everything in the
> kernel.

That is very much how I feel about things anyways.
In a recent presentation:
https://dflund.se/~triad/papers/GPIO-for-Engineers-and-Makers.pdf

I had the following text:

The Rules of Linux Userspace GPIO
1. You do not access GPIOs from userspace
2. YOU DO NOT ACCESS GPIOS FROM USERSPACE
3. Read Documentation/gpio/drivers-on-gpio.txt
4. Use the character device

> If userspace has exported the GPIO and is managing its state,
> then it can *already* cause very weird hardware behaviour if set wrong.
> The fact that userspace is controlling the GPIO state and not the
> kernel already says that the kernel doesn't know how to manage it, so
> why not expose the option for userspace to set the persistence, given
> that it should know what it's doing?

People do need to access GPIOs from userspace for things
like one-off makerspace projects, relays on factory lines,
fire alarms, door openers etc etc.

One-off projects is fine, the user likely has an idea about the
whole system that is comprehensive. They use the random
raspberry Pi (etc) development board for this. OK.

When we are talking about adding GPIO in mass-market goods
such as phones and tablets and laptops userspace GPIO
access become more and more dubious.

Yours,
Linus Walleij
