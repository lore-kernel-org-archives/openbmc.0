Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::242; helo=mail-lj1-x242.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="YFwJ321E"; 
 dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43dRGM46ytzDq5m
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 19:19:39 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id g11-v6so18193701ljk.3
 for <openbmc@lists.ozlabs.org>; Mon, 14 Jan 2019 00:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WNt8flH6qSj3ioJfFoitqHbGpNAMa0siMMPEkgEeU5I=;
 b=YFwJ321EK3TdA1j60VYLPHxah7rxklV/ld61iEFfUEjeuVCg8rM8gF3vOWYfSctMoV
 RkDbNdDSczVElEsmjXwtGHsC6rNxzUk4iRMXX7VARncsrhc9TYoMAarC1Od4dmv59a1Y
 jToXhhHXZkM9I4ZXJPn1r2oj2ts5psavqxdYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WNt8flH6qSj3ioJfFoitqHbGpNAMa0siMMPEkgEeU5I=;
 b=ZsQqdehNJ9Y3j/5sB/+sIK4ZnKT6Wbh3qxuG3CtooM7YO1IqXjp8orysCX7oR6g7EZ
 aLtWpZjL/MsEXq5gC9xLtUXKfJJWWP+EM+A7lWLhi38CzxstZsS9JeM1lLdUNDot/E6H
 FB5GbrOgvTI1uXSUjbLH6Ugi83G4Ci0sVMwnB/AmiTSkKz/5IV9ccTU5o3h9fubDXyEd
 mmNA/ocPs59TbN+kjsqijac5wykY+Lxb76I4vTUAPc4xczfLv9zFEU+fT85FcsX/ipgv
 wg5MX3GPEtCM5kzwKKx4kGG/OM2elkBnBJwUvR6h9dRXqh7mF/k+GGxwfi3dpOifeE7a
 7+uQ==
X-Gm-Message-State: AJcUukcK0x8EEwM7QKzC+7t5oa/CqQExqCC1QVr5BKFN/xqtpCT0SaU1
 HZ6uKsjP+5fTwrzBrehetrRqZ63uPTr8H4xNRQRrdQ==
X-Google-Smtp-Source: ALg8bN7GRyjA9m+oxj4DHTWFs/5+8w8mtNSnG0zuPEmEJwrawMutkvkXciNoAsqB/4DMI++3Uzbxkfnsogtmew5BAeg=
X-Received: by 2002:a2e:29d7:: with SMTP id
 p84-v6mr13630173ljp.12.1547453975876; 
 Mon, 14 Jan 2019 00:19:35 -0800 (PST)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
 <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
 <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
In-Reply-To: <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 14 Jan 2019 09:19:24 +0100
Message-ID: <CACRpkdYPfyyQJ=RZGj+7Uv5g9_Bg_rS2OCWXLVpUWYYD2zG+4A@mail.gmail.com>
Subject: Re: Enable buttons GPIO passthrough
To: Andrew Jeffery <andrew@aj.id.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Joel Stanley <joel@jms.id.au>, kuiying.wang@intel.com, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andrew Geissler <geissonator@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, vernon.mauery@intel.com,
 james.feist@intel.com, Jae Hyun Yoo <jae.hyun.yoo@intel.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 14 Jan 2019 08:19:40 -0000

On Mon, Jan 14, 2019 at 3:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 11 Jan 2019, at 19:31, Linus Walleij wrote:

> > I am sorry but I'm confused about this. It's a very terse explanation
> > of the problem and a bunch of code.
> >
> > Can you folks please define what exactly you mean with a
> > "GPIO passthrough" and what you are trying to achieve with
> > this on these buttons?
>
> On the Aspeed BMC SoCs, several GPIO banks (D and E) can be
> configured so the pins in the low half of a bank of 8 pins are
> input, and the pins in the high half of the bank are output. The
> line state of pins 0 <= i < 4 is reflected on pin i + 4. This way it
> appears as though the BMC is not present in the circuit.
>
> This is useful when the BMC may not have firmware of its own,
> or if it does, if the BMC firmware is not required on the critical
> path of the host's boot process. If or when the BMC firmware
> boots up, it may choose to break the pass-through behaviour
> in order to provide its own out-of-band management capabilities.
>
> This can be used for things like a box's power button as
> mentioned: If the BMC is not up, poke the host directly,
> otherwise, poke the BMC firmware and have it poke the host.
>
> The pass-through settings are tied to the SoC's pinmux. Intuitively
> it should be integrated into the pinmux driver, but IIRC there was
> some ugly coupling of the function that didn't have a neat solution
> with the currently-separate GPIO and pinmux drivers.
>
> Hope that helps.

Yes I get it now! Thanks a lot!

That's a very neat hardware trick, I like how they think.

Pin config in the pin control driver is indeed the recommended
way to go, if possible.

If not possible, so that this particular trick needs to be handled
on the GPIO side of the world, I would recommend to work
with adding it as generic GPIO line config on the GPIO side.

That means, document passthrough in
include/linux/pinctrl/pinconf-generic.h
Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
so it is a generic config in the pin control world, then
also make it a GPIO-only binding:

Documentation/devicetree/bindings/gpio/gpio.txt
include/dt-bindings/gpio/gpio.h
And parse it as an argument for the second cell in the
GPIO phandle, then manage it in the GPIO driver
.set_config() callback without calling into the pin config
backend.

Thomas Petazzoni is currently looking into using some
of the standard pin config set ups on the pure GPIO
path so keep him in CC. I think it will be necessary to go
down this path for some line configurations rather than
forcibly keep GPIO and pin control electronic settings
separate.

My idea as maintainer is that I want to keep
the available configs together so that it can be seamlessly
switched between the GPIO front-end and a pin control
back-end.

Yours,
Linus Walleij
