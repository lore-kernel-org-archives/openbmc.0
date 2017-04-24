Return-Path: <linus.walleij@linaro.org>
Received: from mail-it0-x232.google.com (mail-it0-x232.google.com
 [IPv6:2607:f8b0:4001:c0b::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBR2H0hH2zDq5W
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 22:47:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="hh2KBVDi"; 
 dkim-atps=neutral
Received: by mail-it0-x232.google.com with SMTP id x188so53220893itb.0
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 05:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=QX5l9RAu9ZYjKLEmnoqR0aWsIrSgXmkkWCj6TYbnKSU=;
 b=hh2KBVDit33dc9jeN5p42DtMIvAId74Btjiq74zB0mZ1FyUDYGz4zrhttm+700aeLV
 gAs/Wy5uoW8bT6zxtNIV1tE/dTVrgqJIxhDneW/hPl96NBA+/ruSCSzvyKbSaZ0cx3eW
 KjpIGJCCvm0TJ0guv/1UhtCeRuCPoi7Djg5xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=QX5l9RAu9ZYjKLEmnoqR0aWsIrSgXmkkWCj6TYbnKSU=;
 b=BSFThmnO9Q05ybdF2lRKmvOHRKmU9ILfdHN/cj1+lsSur1WOL08rWoviiJs0JfTpAf
 gNR7S38CIlkQXDhVyD/RzuFcz1RKyocRdzq7aH3oIDEPFDdYzxfI/xp+ATekfog3oq3d
 o6KZlAIFsKWdWh4KHQdY/8CYoe2B0Ue+p8ocSze4R8nargumssjchcSYODHf3pnDoS2h
 IlRX1mDsmIekxsbgAMdmSKjNeGydugXP7JmGB6hh0WAjyEa93t7ydVXspEPhtN5SWLn0
 WQ5pxlfNp+G6Kswepu4NjsluyOfSxZknKkYWIv3HjabNg/pRVP3VEXG5lYXwWdQHkntc
 OJow==
X-Gm-Message-State: AN3rC/46ILKl0GU8AZmnzAjeMzhu3EUx2rSgNUufvmGmGMD5C3x5fIpF
 9QwWvc4TSHjRrJM3kJya4EXOO5XvixmJ
X-Received: by 10.36.33.73 with SMTP id e70mr12699096ita.9.1493038053381; Mon,
 24 Apr 2017 05:47:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.76.210 with HTTP; Mon, 24 Apr 2017 05:47:32 -0700 (PDT)
In-Reply-To: <20170407125902.15960-3-andrew@aj.id.au>
References: <20170407125902.15960-1-andrew@aj.id.au>
 <20170407125902.15960-3-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Apr 2017 14:47:32 +0200
Message-ID: <CACRpkdbXiRhLhVqA3TN6KC0ESA=5Zuqw_AHPJZZkLodZ__PxDQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] gpio: aspeed: dt: Add optional clocks property
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 24 Apr 2017 12:47:35 -0000

On Fri, Apr 7, 2017 at 2:59 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> We need a reference to the HPLL to calculate debounce cycles. If the
> clocks property is not supplied in the GPIO node then the consumer
> should deny any debounce requests.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied with Rob's ACK.

Yours,
Linus Walleij
