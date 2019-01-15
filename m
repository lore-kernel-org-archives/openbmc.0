Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="dYLtW48P"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43f8Kh0SwyzDqbv
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 23:09:59 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id l10so1833704lfh.9
 for <openbmc@lists.ozlabs.org>; Tue, 15 Jan 2019 04:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X0E8G4tDKBYRpJOBNrKhQmtTZlNk7ivAvvsgpLl2wXI=;
 b=dYLtW48PiFV24Rh8HDtb2F9hUknkx/mkC1De5+BzsxubLWEDZuHUw+SvMLZlOz0Xfz
 oSBsWrhmoPeRkhNJhaEAzM4LrvGaa3mxkHRpIiRWmMsmZXOG/4y3jj+Glk0C3COMCL7T
 XpsyyYTb62J2aCsQOL8p4RwUv1aeqWkZ2c1GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X0E8G4tDKBYRpJOBNrKhQmtTZlNk7ivAvvsgpLl2wXI=;
 b=WHUuPjBXklAM/dlibH1108JRQ9C/WAyGdYXHU2gfu7IbiEVv0c+2NI7K7VUxqXgted
 aH0LfR32sMjIRuO7iX8+IJAUbkuYFbNXoahx+YBiu0u1kzYMPGaNoGLf9OtIlIR1OPWf
 rtfs+9sLwLMZCzxh0EeAiWsd2sNxtwFFUsvleDY2NUGYESOylT1rEBfWxipvIy4I4HG3
 INLuWue5qwz32bHKrSwQOc6GRlmTtKrlXcKiHSni8SFPy1QyFqef4AAuF1oKlbzqezNZ
 U+N8PS9fz/rwjD2EEX73vbFD2S8BNpiiAj9ysCUVNuV0viDceJeU+J7md1v6phpr/+lg
 Ytuw==
X-Gm-Message-State: AJcUukdaAM//TUgPTc5eO9+AVb2wICWK2xlQ02Cs6vrEspxHv0ZBWbpi
 fLS9uzYZkr03RpwOtoTcR15d/0meai2ykbHRWjfRrw==
X-Google-Smtp-Source: ALg8bN536HbxvYb2juT7I0gndhN042wDUoTNIb4fqSlAl3jb8yjkZvFyuYxvKqwsjf1K1N4RUnFAah+g+VRvMANACR4=
X-Received: by 2002:a19:8d01:: with SMTP id p1mr2543546lfd.149.1547554196558; 
 Tue, 15 Jan 2019 04:09:56 -0800 (PST)
MIME-Version: 1.0
References: <959CAFA1E282D14FB901BE9A7BF4E7724E41D8EE@shsmsx102.ccr.corp.intel.com>
 <CACPK8Xf_oEuG0=_-bRiaTAWpiw_qNEVVsW9_dtamwGcUM0JtRQ@mail.gmail.com>
 <CACRpkdbz0uqyDH9BJ9T7DvvPPomjh2BY2c=Wcd4zQF-7wSP7bw@mail.gmail.com>
 <1547434784.3014503.1633687936.2F06F402@webmail.messagingengine.com>
 <CACRpkdYPfyyQJ=RZGj+7Uv5g9_Bg_rS2OCWXLVpUWYYD2zG+4A@mail.gmail.com>
 <959CAFA1E282D14FB901BE9A7BF4E7724E43D003@shsmsx102.ccr.corp.intel.com>
In-Reply-To: <959CAFA1E282D14FB901BE9A7BF4E7724E43D003@shsmsx102.ccr.corp.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 15 Jan 2019 13:09:44 +0100
Message-ID: <CACRpkdazF1GkXcMK3_S_=cmpj086LckjskkDuE9R+FzWPPCmeQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 15 Jan 2019 12:10:01 -0000

Hi Kwin,

> Based on pinmux to do passthrough is too complex and no reference,

Don't let that discourage you! We are some of the world's most important
software engineers in the kernel, and we don't just do the simple stuff,
like filling in the blanks guided by previous example, we do the really
complicated stuff of inventing the frameworks.

> I have another 2 simple proposals to do button GPIO passthrough as following:
> 1. extend "passthrough" to the "direction" property of gpio, use "value" to
> control it be disabled/enabled.

This is what I described in my first reply. A .set_config() option.
But it still needs to patch the DT bindings for generic pin config
and add a globally uniquie enumerator for this config to
pinconf-generic.h since GPIO is reusing these generics,
so begin with that in any case.

> 2. extend "value" property of gpio to support the third value "2",
> which means pass-through is enabled, otherwise passthrough is disabled.

No, sorry, this is the wrong idea.

.set_value() sets the GPIO line as high or low, it is essentially
boolean and it is an integer only for historical reasons.

.set_config() is what we use to set up debounce or open drain
and such electronic configurations on GPIO lines, and this
should be done there, unless Andrew prefers that it is gets
done in the pin control driver.

Yours,
Linus Walleij
