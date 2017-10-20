Return-Path: <linus.walleij@linaro.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c06::232; helo=mail-io0-x232.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="g0SV01M/"; 
 dkim-atps=neutral
Received: from mail-io0-x232.google.com (mail-io0-x232.google.com
 [IPv6:2607:f8b0:4001:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yJHFx3yqhzDqJ7
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 18:18:29 +1100 (AEDT)
Received: by mail-io0-x232.google.com with SMTP id p186so12313641ioe.12
 for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2017 00:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=PnQ7E2lYd/+Ikv+j/cdWEDVYWzSCHWCb03bwvXoEvPk=;
 b=g0SV01M/8RVDOI6KPsLSwVbceeFFeOeS4e9uWuq90/giwgvMmUemUQcDzPLtLAIkx6
 FPz6KEycTS0o6eUtohKgU8O8ym+F2PMuWFH7wlGQrKK4H/AOaTIS/J6xMK22XGL+DqDx
 RpbyJSiKPPHcukSpN9XnsMPnk2tFVtPMTVigg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=PnQ7E2lYd/+Ikv+j/cdWEDVYWzSCHWCb03bwvXoEvPk=;
 b=Hq9GhKwHRBpZXUP7qqDxihxaEc7G9jSBjWUbcD48n8d8mQE/79LvU8bYGwUdmU2ETa
 HNMlP6nojS3eJ01spILmp0hVUx6TWl+/BWAFKLo614uywgmfaBcDgqXZxmERVhiuO2ps
 yx1FWdueSGLnVL2w3axHYMuIHyDV0Qgd9YOdLxJhRZ3wCpv+qM6C08YKJtApaz6yZQ4q
 v4kNl14QlTTUmMsZNfkVnBF8tnXPtU47h2j9kOvE/NXrAFzwBxLS2RJsfN20Jx9lxixO
 nud/P9r/W87FmaZa7mDo/WnTZDK5upbWy6XRYucTcS1rATsDlCJjMKbK60pKyFZNl/yM
 epvg==
X-Gm-Message-State: AMCzsaW9qAa/m5DeWFCsZ39YrtNwvEw8xW0g7Cjx7irvSGRYNB8CfaGV
 BKqaK/JpC8NP83uIKhFCsc0iFnZzQjQMzfeCqSIpPw==
X-Google-Smtp-Source: ABhQp+S8VygWH8+ft/yr5Me2BdR6pWmKDpn9/XzPRwcFjPVC/wsUbK5by62emi3Wa0piNbJLowSyyOMNDnCVMbm8qV4=
X-Received: by 10.107.185.6 with SMTP id j6mr5336101iof.221.1508483907258;
 Fri, 20 Oct 2017 00:18:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.14.140 with HTTP; Fri, 20 Oct 2017 00:18:26 -0700 (PDT)
In-Reply-To: <20171020033727.21557-3-andrew@aj.id.au>
References: <20171020033727.21557-1-andrew@aj.id.au>
 <20171020033727.21557-3-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Oct 2017 09:18:26 +0200
Message-ID: <CACRpkdbxOen3ohwmDc8ZNWkirn3mNHaGiZq1O-6VnOjhvFcw+w@mail.gmail.com>
Subject: Re: [RFC PATCH 2/5] gpio: gpiolib: Add OF support for maintaining
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
X-List-Received-Date: Fri, 20 Oct 2017 07:18:29 -0000

On Fri, Oct 20, 2017 at 5:37 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> @@ -32,6 +32,7 @@ enum of_gpio_flags {
>         OF_GPIO_SINGLE_ENDED = 0x2,
>         OF_GPIO_OPEN_DRAIN = 0x4,
>         OF_GPIO_SLEEP_MAY_LOSE_VALUE = 0x8,
> +       OF_GPIO_RESET_TOLERANT = 0x16,

Now you're mixing up decimal and hex.

Anyways, I do not think this is necessary.

Yours,
Linus Walleij
