Return-Path: <linus.walleij@linaro.org>
Received: from mail-oi0-x234.google.com (mail-oi0-x234.google.com
 [IPv6:2607:f8b0:4003:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sssrg1JkjzDrbq
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 18:56:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b=PpioATCP; 
 dkim-atps=neutral
Received: by mail-oi0-x234.google.com with SMTP id y2so40338163oie.0
 for <openbmc@lists.ozlabs.org>; Mon, 10 Oct 2016 00:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=eh3jpZjuGQDHjXN96EYsPtC1Ji4550aJHT5+9jsOblU=;
 b=PpioATCPy4LIRYG6mU5GSZtjbTGCZWwlukk+kRxz8R2oD04cU9ZfR9AFEvdlnArs6F
 FH51ARmqLKehBpotCigLqNEDIgoatR0UfWje8X9yoUxgu8q/zkFDaLCNMyatAHsQ70mu
 gEqD8yVLxQtGbFJFllyJdgFkx0OuN8bYe6cNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=eh3jpZjuGQDHjXN96EYsPtC1Ji4550aJHT5+9jsOblU=;
 b=hnvAluWn0ytUJ9HUMK9MYPWiVP2dNOM+YQGh6pw+LHcZOgFGmdbwXPHcNyIIr25o+v
 EHR0WDnqz1hy1+xnt7B+OTwtuc4WKRlMBxIDTwiVOCpYzUvoeE8K4JONQapYkoNeNaTh
 q7YV04JL/nPjFcHBPkBd2S4wBHsYiHo8M05Kb+mVSJ0HITN98hsNFUxgUC06jC30c1n5
 WZy1uk1eWgs7TkhTqRgxQq7+/kUJQDeG9FYJls+JGHoNqctq6OsFutVR2to9mjhQHKNc
 rtaXjdy+j/DWzFM7wCWtCkDity7tUk8Hwa65XSq0K4k0a8Dr0afewnGgU8hD7y7wfjPy
 9OWQ==
X-Gm-Message-State: AA6/9RnIwxvHohaPoyRZaBQB8tj3rRyGdv70nu9zzAm4FsZ2T0Pb7YFCICaNuTAzJrprzGHyZzwhm4ccmgGBLzsr
X-Received: by 10.202.84.69 with SMTP id i66mr23749848oib.93.1476086177206;
 Mon, 10 Oct 2016 00:56:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.146.12 with HTTP; Mon, 10 Oct 2016 00:56:16 -0700 (PDT)
In-Reply-To: <69eda17c16684f4212a9f3e64d9587abfcc7ae74.1474986045.git-series.andrew@aj.id.au>
References: <cover.115463f791b69859c5ce9dafd61a5755ea039f4b.1474986045.git-series.andrew@aj.id.au>
 <69eda17c16684f4212a9f3e64d9587abfcc7ae74.1474986045.git-series.andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 10 Oct 2016 09:56:16 +0200
Message-ID: <CACRpkdadqMmooefJ8v0nADQ_zgifF8M2ULeiihvhK2Hqur6LEA@mail.gmail.com>
Subject: Re: [PATCH 2/8] pinctrl: aspeed-g5: Fix names of GPID2 pins
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 openbmc@lists.ozlabs.org
Content-Type: text/plain; charset=UTF-8
X-Mailman-Approved-At: Mon, 10 Oct 2016 19:54:26 +1100
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
X-List-Received-Date: Mon, 10 Oct 2016 07:56:19 -0000

On Tue, Sep 27, 2016 at 4:50 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Fixes simple typos in the initial commit. There is no behavioural
> change.
>
> Fixes: 56e57cb6c07f (pinctrl: Add pinctrl-aspeed-g5 driver)
> Reported-by: Xo Wang <xow@google.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied for fixes.

Yours,
Linus Walleij
