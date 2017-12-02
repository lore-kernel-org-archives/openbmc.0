Return-Path: <linus.walleij@linaro.org>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c0b::243; helo=mail-it0-x243.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="UbIA5MD+"; 
 dkim-atps=neutral
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ypvyC6DYCzDwP1
 for <openbmc@lists.ozlabs.org>; Sun,  3 Dec 2017 02:22:11 +1100 (AEDT)
Received: by mail-it0-x243.google.com with SMTP id z6so5593051iti.4
 for <openbmc@lists.ozlabs.org>; Sat, 02 Dec 2017 07:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=VZGzyFwQdb1mqLxMnc0TadSiJgXWhhAudMb5w6877i0=;
 b=UbIA5MD+tTZfGdKZES/d2fo/y/svcjlU7jc2Ve58BVhidbwxCkvHJKZclA833dHD1A
 vpKRNGLbtMDJBVVOVVfBP4B9AFNEi6u1a1q5gosV4xXvGdSTePSBY8ZxUcoHYAxgTfUE
 9FGMctdQRBQTJNkSb8Wjx7DZ+znvjNHmkF/IM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=VZGzyFwQdb1mqLxMnc0TadSiJgXWhhAudMb5w6877i0=;
 b=N2NFT4hVHOksDfm0vu9zl0BPDzNYV/1jp5FH2dcnrKr20LjuWmLQKamCfRa/wNUwbE
 T4Xqc3ZzwRn6aKCtCKobXb9/eIsYL7poTISm3AdaGAB/FddDouIMEFjpSLuI+y2U8G+d
 UA/0mc2yfiikUpRB0xq41EJ9pAppuCzlZt+isor5pzEEjiMfTXFhyaidSRXxzHM9RWLC
 UIlxqX+mUKxF1VT3Em1UtL+93WhVlnK4UIo0DB0fXCqX2yyF46dJc2PTWW7PANVWFhEh
 ZA3tO4vM4IEMURdKIyg0zoo4M7MQ2rJ+N0sWctfuUXq9wWCK1lRKp9tiKMziHx+QJVVO
 h45w==
X-Gm-Message-State: AKGB3mIzhkVpzuwlObntAFQ9XWLD20V44L5NzTeWI4mphGnLVFP/wmMB
 82OYQ9Lm6WtYiiYUOoA8dWQDtBrDieSkV8EsB625PQ==
X-Google-Smtp-Source: AGs4zMaPgXl1eRCgbq8n65Gzoo0OUA0EMGIAVL6eZXw9mLSUWXWtXhsnC5mCKUAYiIy65XWuM4OmzpCItv830ib5yDU=
X-Received: by 10.36.57.13 with SMTP id l13mr6510467ita.101.1512228130085;
 Sat, 02 Dec 2017 07:22:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.29.76 with HTTP; Sat, 2 Dec 2017 07:22:09 -0800 (PST)
In-Reply-To: <20171130035525.29653-3-andrew@aj.id.au>
References: <20171130035525.29653-1-andrew@aj.id.au>
 <20171130035525.29653-3-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 2 Dec 2017 16:22:09 +0100
Message-ID: <CACRpkdZoch=yFLKGpV2ne6anX7ZjWoem96dgAtWTJJQ0ZSJ9sQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: aspeed: Add support for reset tolerance
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Frank Rowand <frowand.list@gmail.com>, 
 Joel Stanley <joel@jms.id.au>,
 Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 linux-aspeed@lists.ozlabs.org
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
X-List-Received-Date: Sat, 02 Dec 2017 15:22:12 -0000

On Thu, Nov 30, 2017 at 4:55 AM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Use the new pinconf parameter for state persistence to expose the
> associated capability of the Aspeed GPIO controller.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Reviewed-by: Joel Stanley <joel@jms.id.au>

Patch applied.

Yours,
Linus Walleij
