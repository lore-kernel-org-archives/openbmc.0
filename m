Return-Path: <linus.walleij@linaro.org>
Received: from mail-it0-x22d.google.com (mail-it0-x22d.google.com
 [IPv6:2607:f8b0:4001:c0b::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBRCW08G9zDq5W
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 22:55:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="S0XmTiTP"; 
 dkim-atps=neutral
Received: by mail-it0-x22d.google.com with SMTP id 70so56584322ita.0
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 05:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=YMu31kF7rcyv2UYC6XK3gmuqT5Me/Wk8noUSni8JySQ=;
 b=S0XmTiTPynalseFCDjDPkaG9C74R/n5ZA5HG5zLtvDz/9TnFBwkeE+M/uWbvRPoGGs
 s7X35GcwBqvRLPEojkJGWmK3z0Rg1NaVgJ2eOm+JzlveOHU6wsNp/wR542cgJzrsQAGc
 eW46A0Ft5RtgxWdLnHkWcOZ7Bx/8g154tppV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=YMu31kF7rcyv2UYC6XK3gmuqT5Me/Wk8noUSni8JySQ=;
 b=rUFARJzIVXggVvGFrK38kK+XypyWPZN+F/CKekYnIA9sPRjsLWNqTD9l1x7VZPuhxA
 2Po4oRWylW0h8e6a+dGy7EtE4UNn3YcbZciR1WSODiFBNLs7jZ9esdf7goJqJ/MTQTWg
 MDX3Xi7yxOxlLMTd+SjYPmEj6E864AeeSFyCQN2zKnBfunrWYMAVJTdlDep1/68AkByR
 FRyhCda97yrggv68L+CaDj6UhXaSosMf1EpJf6X58LEQAM5fxheWnItYEA65hoEd/m+A
 rahFMvsDCFIqz13o2ecm0GM96BuQ+7/MRLfarPloNde9g6tfQHDqWt0NTJdpTkUXhy/G
 XdtQ==
X-Gm-Message-State: AN3rC/5MEdrJJg309rJT75Oxc9JY/+68bNWiAvBd737uf2qJxXPQnAZo
 f0QK74gK3gvalqiCTjPIZcuD+vdRDWQ0
X-Received: by 10.36.141.131 with SMTP id w125mr13687702itd.56.1493038531243; 
 Mon, 24 Apr 2017 05:55:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.76.210 with HTTP; Mon, 24 Apr 2017 05:55:30 -0700 (PDT)
In-Reply-To: <20170407125713.15678-4-andrew@aj.id.au>
References: <20170407125713.15678-1-andrew@aj.id.au>
 <20170407125713.15678-4-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Apr 2017 14:55:30 +0200
Message-ID: <CACRpkdZ_7YyqGnn-SP5LpBUfRornvGV2SiimM4ZD7gUL5A42Rw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: aspeed: g4: Add pinconf support
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
X-List-Received-Date: Mon, 24 Apr 2017 12:55:35 -0000

On Fri, Apr 7, 2017 at 2:57 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Testing for pinctrl-aspeed-g4 was performed on an OpenPOWER Palmetto
> system, using the strategy outlined in the commit message for the
> change to the Aspeed pinctrl core.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied.

Yours,
Linus Walleij
