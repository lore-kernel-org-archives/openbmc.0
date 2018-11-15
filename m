Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="e8h9k6X+"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42wch31SqWzF3VT
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 21:15:46 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id x85-v6so16812171ljb.2
 for <openbmc@lists.ozlabs.org>; Thu, 15 Nov 2018 02:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hbKXfHU7twiZ4fvzU2sgu0UvCEZC+VrhtPjd3SJH4BM=;
 b=e8h9k6X+AV1a81FCj8m5Q5fBa28trhund/CK/pACQmv9QdMfMzURIUWOshurUyvAe4
 4Mgos1c3U1y+yJitZMbRp+CLorHZoPo3nh3e6Cm3hLMPxWXzs+PlXAMtr9chaRkDi96I
 /tCx2VIqCzP9/pkR47gi0WG6gl+2IcmSnfoEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hbKXfHU7twiZ4fvzU2sgu0UvCEZC+VrhtPjd3SJH4BM=;
 b=g20V+kKxomxvAsDu3v6klPDe2rXzRWV/EKIdkScmDK+88OGOE49SveOlbsmRPOqjrr
 lwTCTmFe1pCyjgvwAQZYWIfTF2wac7/8Ax5vav4H+eqJOfkpDkcfazjXPgVhVcnRq7uB
 vVXHvXHYgZJGvxtCCVWQiOolF5Ouv2hR16ml2OxuXILHMjLtVKjL99PXzji6xh8C3c+P
 sl2RYTiOI6V2loKOZY8Mm8rqnFGl3RNZBZjh1n0nLJk2zjIaXwrgbsA7BDoBlwehAOwD
 f3UdwSJJepHgS4gwha3raeqNVBCFS8IilCTcYkOAgOxqmEND/Bo2rfLMlZCPGcIkcBhU
 6npQ==
X-Gm-Message-State: AGRZ1gJJAQaWvsjmZkcV8wQkoWhjRIg7J07fJyae0GI5wi40yqRQH4JT
 oHZaAZq6fcFoUXPZxDKpi9NONn+zxK3ugo07mJimgw==
X-Google-Smtp-Source: AJdET5d2WK8dglHrqPo9Decf7dCtdQw5KLrUCLKXl280n3Y4FhNhrrmkV5oDNzFXmcqSiBTWFXj1+juf/bl71GE47zw=
X-Received: by 2002:a2e:710a:: with SMTP id m10-v6mr662734ljc.66.1542276943449; 
 Thu, 15 Nov 2018 02:15:43 -0800 (PST)
MIME-Version: 1.0
References: <20181107134434.354795-1-tmaimon77@gmail.com>
 <20181107134434.354795-2-tmaimon77@gmail.com>
In-Reply-To: <20181107134434.354795-2-tmaimon77@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 Nov 2018 11:15:31 +0100
Message-ID: <CACRpkdYo_4Be=N-ewRBMCP=KAs4DeXW4r-qQerx2UAvsyS=-fQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: nuvoton: modify NPCM7xx pin configuration
 function
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>,
 benjaminfair@google.com, 
 Brendan Higgins <brendanhiggins@google.com>, avifishman70@gmail.com, 
 Joel Stanley <joel@jms.id.au>, Kun Yi <kunyi@google.com>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Thu, 15 Nov 2018 10:15:48 -0000

On Wed, Nov 7, 2018 at 2:44 PM Tomer Maimon <tmaimon77@gmail.com> wrote:

> Modify GPIO direction setting in pin configuration function by using
> generic GPIO functions to set the GPIO direction instead of direct
> access to the GPIO direction register.
>
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Patch applied with Kun Yi's tested-by tag!

Yours,
Linus Walleij
