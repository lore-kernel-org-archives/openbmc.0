Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="jB+uiIZI"; 
 dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43f8CF6gf2zDqfM
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 23:04:25 +1100 (AEDT)
Received: by mail-lj1-x22d.google.com with SMTP id s5-v6so2043218ljd.12
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 04:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=i5MVcR7jsV1c4w9nkon1FtdR8mMOQqF9jY/2IT3JOU0=;
 b=jB+uiIZIxUX62+/Vr1UlI1n3owOMCRSf5iYhwzfFmjgcr3KKnUCSjpbYo3hISkWnKB
 DqH8FD/4qcjujfSDCiVq7HyxrgjvN+e9gOOHmQCs1yjYb3Yt75gYb4NzAqrirk5OiFbg
 vYeObvRtcZqcFyYriEMQ27vVdg7jI0NCOFnBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=i5MVcR7jsV1c4w9nkon1FtdR8mMOQqF9jY/2IT3JOU0=;
 b=AM9APMLuxHF/4kXxwkcmrX8E57XiRZic91Dvhhb88oQd/z9ybyiP6xpSnE+y+E71uN
 4kvi3l62cdTXcYzI0fl9JluA59i9l/fYlMcqBDTKYNyU0+8fWQ1WsB2DgQFtccY7clct
 qaJr/1g0+T9RKNopd0ZZ+8dezUNJIBuVB1NFgjGCXQ+vvB1zbnAL1FZekcSYmXF02Pd2
 FcyTfJaKCK70VzZMCIl2we0TEfqK3vJgvh6l+yk+Iaq5jWdy5PaAT0afPiz00R+9a0w6
 sEdBYeWwgjuLge6PGKsmL/dsHx+f23G30a/d9vcHFEqQrVHWmhry58dQpzOWGQH9rwVC
 BYTQ==
X-Gm-Message-State: AJcUukcXB9NHztgQKJhL1wT9cO7oc2tHf9zRcU9J4zL4VRVwcIntMJOz
 LXXH03hUN3H0VJY48Ndub9KakTMJsLKYRgCbgmQOiw==
X-Google-Smtp-Source: ALg8bN4Hs9Bzkc7HeqayTCFZSyIlQQB7KB0ugx70bDtGsR9jEBbovBPztMp16hlmiplGKTmGwrdk7r6BpKpa2jVK3jI=
X-Received: by 2002:a2e:710a:: with SMTP id
 m10-v6mr2530430ljc.66.1547553861094; 
 Tue, 15 Jan 2019 04:04:21 -0800 (PST)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
 <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
 <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
 <CACRpkdYPfyyQJ=RZGj+7Uv5g9_Bg_rS2OCWXLVpUWYYD2zG+4A@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43CEF9@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E7724E43CEF9@shsmsx102.ccr.corp.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Jan 2019 13:04:09 +0100
Message-ID: <CACRpkdZsrGMa9xtnAE29qHwqCzN7RgetxuDG=9o_kqdO8yGjJg@mail.gmail.com>
Subject: Re: Enable buttons GPIO passthrough
To: "Wang, Kuiying" <kuiying.wang@intel.com>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Joel Stanley <joel@jms.id.au>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Andrew Geissler <geissonator@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Mauery, Vernon" <vernon.mauery@intel.com>, "Feist,
 James" <james.feist@intel.com>, "Yoo, Jae Hyun" <jae.hyun.yoo@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 15 Jan 2019 12:04:27 -0000

Hi Kwin!

On Tue, Jan 15, 2019 at 8:21 AM Wang, Kuiying <kuiying.wang@intel.com> wrot=
e:

> My proposal to enable buttons GPIO pass-through based on pinmux driver as=
 following:
> 1. remove codes about SCU7C clearance (from line 194 to line 236) in
> aspeed_sig_expr_set function in pinctrl-aspeed.c file.
> 2. create 2 new functions in pinctrl-aspeed.c file: =E2=80=9Caspeed_gpio_=
passthrough_enable=E2=80=9D
> and =E2=80=9Caspeed_gpio_passthrough_disable=E2=80=9D

These are coding implementation issues that you need to discuss with
the maintainer of pinctrl-aspeed.c, Andrew.

> 3. bind button gpio to pinctrl

This will just be a pin control state like "default" or any other stare.

What you need to do first is establish a standard for this, so augment the
pin control bindings and the generic parser code to handle this and
provide a new enumerator back to .set_config in the pin config
portion of the pin control driver.

So:

Step 1: standardize pin pass through for everyone
Step 2: implement support for this in the Aspeed driver

I think using a name like "gpio-passthrough" is misleading, something
describing what is actually happening, like "latch" or just "passthrough"
is better.

Yours,
Linus Walleij
