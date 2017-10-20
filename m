Return-Path: <linus.walleij@linaro.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c06::22a; helo=mail-io0-x22a.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="A8hFg6wP"; 
 dkim-atps=neutral
Received: from mail-io0-x22a.google.com (mail-io0-x22a.google.com
 [IPv6:2607:f8b0:4001:c06::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJHDc3ynZzDqBc
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 18:17:19 +1100 (AEDT)
Received: by mail-io0-x22a.google.com with SMTP id e89so12330424ioi.11
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 00:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=l4EWp1gJvv9/i5Wt4AgxbBXoDCDHYzi3ga/zPflKUbs=;
 b=A8hFg6wPDjm0XpJjvH/gAnmknWda03qDl4sVcHtQ4H0g36J0PJXBsocTcXoQ/6oraT
 mft3LjcFbzrFU71fFE1nvVPduzjhJcqmZ7SFdsDrQfjR/TkaGqtH3WvQCMtPZc/9rfrE
 H8kFqLsze1rh96dbLanFSByt61ZA13945uLMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=l4EWp1gJvv9/i5Wt4AgxbBXoDCDHYzi3ga/zPflKUbs=;
 b=tmikbVpG8I2K6FRPlAaqva9vtYU6aXmASkMXJkAggs3zGsA0xzZkNSojfYUA2V5D0l
 AXaOvWHyFJ2bBDrAZW+oAKO6yMyn7B2DzWkxBDtG+ko1FuCQWdP8oiRFEZhHr/qkH2GY
 enFDtXYlPhV3/Cgu2OG14cbzcTM5+JYT9sVOoeQwFv449ZqTbAPQeKg+Lyk30hjUA9gW
 jZWq5B4ZT2t45QmW4KM97f2hvJtS603Gbo5y/wrEBlbo39DLmtXPH1XgQQ3lC452z2kf
 oEIdckHijV6foJZ1+T2p2f33KOENWTcagvalumcd/NP1dSwmSy3tG0jyxfbB7mtNAsAa
 9qag==
X-Gm-Message-State: AMCzsaVPc/vQNz1DGpXBOT+wDvexvZ9Gz2kB8w3UELaKdOkbzCmEo+Nd
 vngbqdfMNOgnLQDjYVf+dxjcGwgNq/lxXLY3FD9wFw==
X-Google-Smtp-Source: ABhQp+TUiGR1qjF1QXm+NRs42n9KzEOzY+EKRolb97qlNm8LqG6TWJZxf8BXr0mvULNjO8RvKluSTXjAQ9wIZZnRj3Q=
X-Received: by 10.107.46.199 with SMTP id u68mr5307379iou.174.1508483836152;
 Fri, 20 Oct 2017 00:17:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.14.140 with HTTP; Fri, 20 Oct 2017 00:17:15 -0700 (PDT)
In-Reply-To: <20171020033727.21557-2-andrew@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-2-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Oct 2017 09:17:15 +0200
Message-ID: <CACRpkda-7-uM5x4kbNXkx3F7F4VTZtTvXfys5VPFb1YiVDo1+g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] gpio: gpiolib: Add core support for maintaining
 GPIO values on reset
To: Andrew Jeffery <andrew@aj.id.au>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
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
X-List-Received-Date: Fri, 20 Oct 2017 07:17:21 -0000

On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> GPIO state reset tolerance is implemented in gpiolib through the
> addition of a new pinconf parameter. With that, some renaming of helpers
> is done to clarify the scope of the already existing
> gpiochip_line_is_persistent(), as it's now ambiguous as to whether that
> means on suspend, reset or both.

Isn't it most reasonable to say persistance covers both cases, reset
and/or sleep? This seems a bit like overdefined.

So can we say that is this flag is set, the hardware and driver should
do its best to preserve the value across any system disruptions.

We can change the wording of course, patches welcome for that.

But do we really need to distinguish the cases of disruption and
whether we cover up for them or not?

I would say we can deal with that the day we have a system with
two register bits (or similar) where you can select to preserve across
sleep, reset, one or the other, AND there is also a usecase such that
a user wants to preserve the value across reset but not suspend or
vice versa.

I suspect that will not happen.

Yours,
Linus Walleij
