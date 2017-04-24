Return-Path: <linus.walleij@linaro.org>
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBRBK5lGBzDq5W
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 22:54:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="DnRWytb4"; 
 dkim-atps=neutral
Received: by mail-it0-x22d.google.com with SMTP id g66so58385772ite.1
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=DSuWo+UZYQ1gk3skVNApZhUolyLubC2qsbEJhpqjwrc=;
 b=DnRWytb4CoVk/qDlDnvi8TK65/1c2vQqOuGB9a6WPiVAEESvHsMdu0AzFuPTHe2uZd
 09r6R3i3HUJSzXuIqQNGM0zUbnbAFDPQBgrfjO7Vrx4QYWXlDggNS+OtSTdvnVuMRxvj
 7p5fEUIFMFbhBKUAmYnzm+Vi45dxqNboYEP+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=DSuWo+UZYQ1gk3skVNApZhUolyLubC2qsbEJhpqjwrc=;
 b=Tf94CNYqSZrAAGJVmxaDzHGvydO3TBnEW4zGzadNybdTP+dc1gGv+pAO+3vhfmPkv/
 EK9f+j/SYo5qZZOw2In9LFMWLcQegLcudw1TWNvafJz5Z+qUtIHsYKCnl51DDl5w6P0/
 kwrrXO3+LWcP/XyhU3u72Hkr96cRw3v7AW2ei0b2IsoKD7KzfLmiQJZw+WaczXLtjVMw
 A+yh3sIWGlA6TH7hSqmgUw4D/OunCaG8JKKLSI8e1yzbrdeq0SXbAod9hhKz9N/2wDPE
 7TNjs8cLS0hmxrHEiOWxQ8blHRwZwcr2PmChQ4SymAcJOuO1poDDhINsVhlClnzbNHfx
 gVJg==
X-Gm-Message-State: AN3rC/56mgXn2x9CwUpphHgDO5hzqmtKSU2xDzGditBvf8XpWI6+n1Kp
 cekAaWsSkwU9iRAp36ZrjL8WSpiDW61m
X-Received: by 10.36.48.149 with SMTP id q143mr13460145itq.25.1493038471989;
 Mon, 24 Apr 2017 05:54:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.76.210 with HTTP; Mon, 24 Apr 2017 05:54:31 -0700 (PDT)
In-Reply-To: <20170407125713.15678-3-andrew@aj.id.au>
References: <20170407125713.15678-1-andrew@aj.id.au>
 <20170407125713.15678-3-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Apr 2017 14:54:31 +0200
Message-ID: <CACRpkdYDhBhfMc80oAmSr5NKB1eKYgjqM0Gn5jb5QJVufmEAjw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: aspeed: Add core pinconf support
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
X-List-Received-Date: Mon, 24 Apr 2017 12:54:34 -0000

On Fri, Apr 7, 2017 at 2:57 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Several pinconf parameters have a fairly straight-forward mapping onto
> the Aspeed pin controller. These include management of pull-down bias,
> drive-strength, and some debounce configuration.
>
> Pin biasing largely is managed on a per-GPIO-bank basis, aside from the
> ADC and RMII/RGMII pins. As the bias configuration for each pin in a
> bank maps onto a single per-bank bit, configuration tables will be
> introduced to describe the ranges of pins and the supported pinconf
> parameter. The use of tables also helps with the sparse support of
> pinconf properties, and the fact that not all GPIO banks support
> biasing or drive-strength configuration.
>
> Further, as the pin controller uses a consistent approach for bias and
> drive strength configuration at the register level, a second table is
> defined for looking up the the bit-state required to enable or query the
> provided configuration.
>
> Testing for pinctrl-aspeed-g4 was performed on an OpenPOWER Palmetto
> system, and pinctrl-aspeed-g5 on an AST2500EVB as well as under QEMU.
> The test method was to set the appropriate bits via devmem and verify
> the result through the controller's pinconf-pins debugfs file. This
> simultaneously validates the get() path and half of the set() path. The
> remainder of the set() path was validated by configuring a handful of
> pins via the devicetree with the supported pinconf properties and
> verifying the appropriate registers were touched.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Waleij
