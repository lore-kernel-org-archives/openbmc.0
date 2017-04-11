Return-Path: <linus.walleij@linaro.org>
Received: from mail-io0-x234.google.com (mail-io0-x234.google.com
 [IPv6:2607:f8b0:4001:c06::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w2K0w3WtqzDq5x
 for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2017 17:48:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="LkWlncGX"; 
 dkim-atps=neutral
Received: by mail-io0-x234.google.com with SMTP id t68so94293609iof.0
 for <openbmc@lists.ozlabs.org>; Tue, 11 Apr 2017 00:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=uadi/FMr1sigLgrkVij1JYpbiieVBPAgN+QmYQWovfo=;
 b=LkWlncGXRxrMXEcjl9du/kuL5tQJnVI3gh5lN3gVCi7fHpdS/U1TqR1S2KGPzjInsP
 RgrEQlFLXoB7Px0aAazX252LX7ZrjuKw44EXw63qECh2m/P79XkRCVrydNklwYIrLoEk
 AoB3uNOYq8rK6ln8y5YHrcsa9LPl/uopWjgJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=uadi/FMr1sigLgrkVij1JYpbiieVBPAgN+QmYQWovfo=;
 b=Gitev4817QfX9TNNXsjLL2T1fCCLKIrw+zhi/ND7znY6wcg2ej8mk5BZzyyJyLe7q4
 nfOpM+I7iK5Ql7OA5Vibpl4/aJU+7YyeWwKE17LsJl/SvLfBspW4p3jtzCd1BC+8vMh1
 Xa0WHwNceQXisGdpXF4jNS4aMbQAbJY8DSsH9WpkmLwDBiLDWFwhuO6gLutsKpLN5YEc
 7j2j5AP7pY6BBvnAXZo6UuWjL1Km4+UFh6Hpv/9oK19Dt5QyPceBq5WENj7jFEMS2UwT
 2fInVs2d643SnAHTsMBWyIRVk0aA2HzphuqkSDuBLKuWXVGOIKIt6/9RkfMi8ROBf/i+
 Znhg==
X-Gm-Message-State: AN3rC/6LtVD9F6i2MAdl6cnLTwt3GmaLm8JVH33qn0EmIfCHvsUvpRw0Q9Gyn3JqX8gqaF/9vrQW/ik2qPmjaLKy
X-Received: by 10.36.69.16 with SMTP id y16mr15662786ita.25.1491896893009;
 Tue, 11 Apr 2017 00:48:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.122.7 with HTTP; Tue, 11 Apr 2017 00:48:11 -0700 (PDT)
In-Reply-To: <20170407125817.15834-1-andrew@aj.id.au>
References: <20170407125817.15834-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 11 Apr 2017 09:48:11 +0200
Message-ID: <CACRpkdb2qm_uL-xRdjnft68QwF7xxnO8NmzUwxQYME_Uc5QH1A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Fix unused-const-variable warnings
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
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
X-List-Received-Date: Tue, 11 Apr 2017 07:48:18 -0000

On Fri, Apr 7, 2017 at 2:58 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Three video input signals suffered from a search/replace failure in
> some copied code.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
