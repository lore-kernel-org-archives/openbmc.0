Return-Path: <linus.walleij@linaro.org>
Received: from mail-qk0-x22b.google.com (mail-qk0-x22b.google.com
 [IPv6:2607:f8b0:400d:c09::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t2DQQ1lzMzDvXy
 for <openbmc@lists.ozlabs.org>; Mon, 24 Oct 2016 09:21:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=GRchYt/Q; 
 dkim-atps=neutral
Received: by mail-qk0-x22b.google.com with SMTP id x11so5990927qka.1
 for <openbmc@lists.ozlabs.org>; Sun, 23 Oct 2016 15:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ZMlpn3Ck8d854Ae/hauQFIfBUNwbMzgVm9Zs5kFOgZE=;
 b=GRchYt/QxwWteXJFEDXvaVuoWFzSe92Yvgcl9cB+xi+FnH6kludH5776PaVW7koGY/
 R3q60h9n3qngjesi1hm2aWzLDz7fft6SekW0nEkKqyBNjHxA0IJWNLgt4Ubwx62ZopXt
 Efj7/wddG6FgT5WhwY2mA1qBluU8Y6gG6c0uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ZMlpn3Ck8d854Ae/hauQFIfBUNwbMzgVm9Zs5kFOgZE=;
 b=MZo6UCZrlsv7HhINwnoTwlwe6nruCzfrogkjv0A+EO52cZP1xqSDlUXTnF4qJhLDvR
 ajcnHMWdMgetDPmHGBy40nLuHX33bZoDHHtQzwheQAnqsyx2toy5odm/aeXDB+/wa86J
 49o3vECeYuHqGV/kf/KfcJZ9Fm6uCK0qPvAiYbEpqm/+WTTnzbe9x2b1/NvzLBQn8JV0
 d4Jyfxp4yD1juI4X+8LKqBjQPkgz0o7xSKGG0Xwby7vIegY3UVhQEpLInwM1ciWlKrwj
 xWAmyGymLlxFZHkkFa5T7RIFD8G0DHPm5tkEp7OKq1BXBTKkac6QcOloH61QX9IAJme0
 m6PQ==
X-Gm-Message-State: ABUngvfeZiayS4xnX/ll3MqnGUtjtJgC1xHU4fNDBPwgwNlL9Ei0VbdzcHJQU78iQHK6l/hhdNCM5TFH+bTsi2bp
X-Received: by 10.55.195.141 with SMTP id r13mr8065312qkl.131.1477261259607;
 Sun, 23 Oct 2016 15:20:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.140.13 with HTTP; Sun, 23 Oct 2016 15:20:59 -0700 (PDT)
In-Reply-To: <CACPK8Xc7y3GtcJCVYYs-JKTqBZvqVeZaz5MUk=UX151SX1xEFw@mail.gmail.com>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <a266046d34009e6e92c4c76699c550c2ba44bd5c.1474986045.git-series.andrew@aj.id.au>
 <CACPK8Xc7y3GtcJCVYYs-JKTqBZvqVeZaz5MUk=UX151SX1xEFw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Oct 2016 00:20:59 +0200
Message-ID: <CACRpkdazJzE=Oa-0-FEYTvUk=-kPLojHY3afZKX5cpmzrUZHGQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] pinctrl: aspeed: Enable capture of off-SCU pinmux
 state
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
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
X-List-Received-Date: Sun, 23 Oct 2016 22:21:02 -0000

On Thu, Sep 29, 2016 at 8:45 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Wed, Sep 28, 2016 at 12:20 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

>> On the AST2400 and AST2500 a number of pins depend on state in one of
>> the SIO, LPC or GFX IP blocks, so add support to at least capture what
>> that state is. The pinctrl engine for the Aspeed SoCs doesn't try to
>> inspect or modify the state of the off-SCU IP blocks. Instead, it logs
>> the state requirement with the expectation that the platform
>> designer/maintainer arranges for the appropriate configuration to be
>> applied through the associated drivers.
(...)
>
> This is unfortunate.
>
> This patch kicks the can down the road, but doesn't solve the problem
> for a user who wants to configure some functionality that depends on
> the non-SCU bits. Because of this I'm not sure if we want to put it in
> the tree.
>
> However, I'm not sure what a proper solution would look like. Perhaps
> Linus can point out another SoC that has a similar problem?

If I could only understand it.

Don't you actually want to go and read a few registers on another
IO range?

What we generally do when pin control is spread out in a system is try
to consolidate it, meaning expose the necessary registers on the remote
end using syscon (drivers/mfd/syscon) so that we can easily get a handle
on these registers withe regmap MMIO.

Since regmap handles atomic access to the registers, that way we
protect from disasters and keep the state in the hardware.

I don't know if this is helpful. For a normal peripheral you may not want
to put a regmap over all its registers but you prefer to ioremap it, and then
we get the spaghetti of accessor functions to peek and poke into another
peripherals I/O space, and that is undesireable.

Maybe this is completely not understanding what you want to do, so
sorry, please elaborate. I am afraid the two of you are the only people on
the planet who actually understand what is going on here.

Also the hardware engineer who wrote the Aspeed pin controller, I would
like to read this persons design specification, I am pretty sure it is very
interesting.

>> -  * @reg: The register offset from base in bytes
>> +  * @reg: Split into three fields:
>> +  *       31:24: IP selector
>> +  *       23:12: Reserved
>> +  *       11:0: Register offset

That seems like unnecessary shoehorning. Is it reflecting the register layout
of the hardware or are you trying to save bits? For the latter, let it
go and instead
have one member for offset and one member for selector.

Yours,
Linus Walleij
