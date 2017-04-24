Return-Path: <linus.walleij@linaro.org>
Received: from mail-io0-x235.google.com (mail-io0-x235.google.com
 [IPv6:2607:f8b0:4001:c06::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBR7t4HvTzDq5W
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 22:52:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qej7rWvh"; 
 dkim-atps=neutral
Received: by mail-io0-x235.google.com with SMTP id a103so190484483ioj.1
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 05:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=hB7PIWOOsMARkmHup3w8bayvbD3bPg3m6a/unN6Wh+0=;
 b=Qej7rWvhYxTiqYVDKExOQjrfxbwdTH0KQk0LDi1iRlIrPUEtt5adNCUkLZbZBGFdvG
 XWKjZ+sjY9k23iGm1qFoPT6HBXkPINQAX5KLE+SR5O+TlDRmHDvyUfi24Kfh7sSWEAmJ
 MF64eQcxdWBaFXtRo+PGzBFpYNVAG47vF0jBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=hB7PIWOOsMARkmHup3w8bayvbD3bPg3m6a/unN6Wh+0=;
 b=HCj66R6kl5yTqf3yTXGqy2YEx3yJbXdTlh6CCMHw4tEXkhNZnmXlcqeLKdlQ1eQnK5
 WSG2HCiMNobd/UnMoWVwqDTFo/Vugde/odCZ35wLhLUMiPnZOX069KAa0wX3AgdS34fk
 aeDcwfXqlcmcC8ou5+abthVycwqtGmaw+DNolSHnPWrZo9yc6Q9WAxenyjaVFJbmnRtT
 mIN9cEWUzonkr1iNnPvlXutNXGmoRWZOpaX8XIcALWvhKoCMifg5LCmA8HyzzMJpOOse
 oeO9HACnYGjkb65zqkffip+rrPkQ1uQlCQchmuZ9bzoIQgPsxve54lz+sZe6nmHI8aVj
 9Udw==
X-Gm-Message-State: AN3rC/4uEk+MIgh1vd7N4qgKU/52wvWI+E+ZgJYlDTREXTA+x6rTqyTU
 /mkJQXaUtjvK6dVJzmaWYtg6XiPizHrd
X-Received: by 10.107.9.222 with SMTP id 91mr7836368ioj.173.1493038342416;
 Mon, 24 Apr 2017 05:52:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.76.210 with HTTP; Mon, 24 Apr 2017 05:52:21 -0700 (PDT)
In-Reply-To: <20170407125902.15960-5-andrew@aj.id.au>
References: <20170407125902.15960-1-andrew@aj.id.au>
 <20170407125902.15960-5-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Apr 2017 14:52:21 +0200
Message-ID: <CACRpkdb2ABf5ZttSA78dRKLB7L3y2g4W5-Ef932AiG__V21uvw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] gpio: aspeed: Add open-source and open-drain
 support
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
X-List-Received-Date: Mon, 24 Apr 2017 12:52:27 -0000

On Fri, Apr 7, 2017 at 2:59 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> As per the datasheet, manage the IO and value states to implement
> open-source/open-drain, but do this by falling back to gpiolib's
> emulation.
>
> This commit simply makes the behaviour explicit for clarity, rather than
> relying on the implicit return of -ENOTSUPP to trigger the emulation.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
