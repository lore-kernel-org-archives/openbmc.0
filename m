Return-Path: <linus.walleij@linaro.org>
Received: from mail-io0-x236.google.com (mail-io0-x236.google.com
 [IPv6:2607:f8b0:4001:c06::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBR1J2sCZzDq5W
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 22:46:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="LXeiQoyD"; 
 dkim-atps=neutral
Received: by mail-io0-x236.google.com with SMTP id a103so190309656ioj.1
 for <openbmc@lists.ozlabs.org>; Mon, 24 Apr 2017 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=3i7mcUXxqEY4lIE6L9pmPwfM5VSBmuIG2/gRusyG7eY=;
 b=LXeiQoyDL84qs559w7avj1qEXOM9MnB3RD2VNgETM3cVoIYlacdH3i9c7fGGdlM5XQ
 NWEFvJqzhEapoe57QvJ+4qfsqyGH1trvTjDpk44GOTRbbRhJxo5ArPFef6X1Ccld6s0N
 499G4udg9j2k13EIYm36dhIfkELsM9DXN5FOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=3i7mcUXxqEY4lIE6L9pmPwfM5VSBmuIG2/gRusyG7eY=;
 b=mCWewnpsYiAN7K1bIFT3ISetpDKsu3zW4vHyVQB2SzSEj9zf0fm6xdPsYdmWmlZXgs
 xdSr7UDlGDhkQmMaHkmLlEX2zvPulKrDtEOykov07in5yHTTJjsiBt9wGd+lVJegrD0u
 IpSjFo/Wzqg5UA8jUgOiTRQcbEZaA12n53Xc8wnIDyQ3xlWkc+Xfq3G+q7Dqg0mXebVN
 mudJQv/Ct759f6sigT34uKU/1Uq2+AsXJUp8XgC+kupiI6MawkqaCIce6L+pHKDlhrRf
 SWAszSp17rf1PjPkCjwLcqN8eMBmncYp72tRNh0KBkMUppUiZwYw809mgWV73eaSmvPP
 wY1w==
X-Gm-Message-State: AN3rC/7892EfSLL78hWkdowsN6s2m8ktjdMgdqZAx42MZ+VKgdQJfvty
 F8hiiEYCDFNYTuXDC0EzWjVE4uprxFDN
X-Received: by 10.107.17.28 with SMTP id z28mr7837979ioi.151.1493038001472;
 Mon, 24 Apr 2017 05:46:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.76.210 with HTTP; Mon, 24 Apr 2017 05:46:40 -0700 (PDT)
In-Reply-To: <20170407125902.15960-2-andrew@aj.id.au>
References: <20170407125902.15960-1-andrew@aj.id.au>
 <20170407125902.15960-2-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 24 Apr 2017 14:46:40 +0200
Message-ID: <CACRpkdaY=vqfSoytpUv3ZFM6rLpUbbmCdf-Qy5K=sPCfWboYMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] gpio: aspeed: dt: Fix description alignment in
 bindings document
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
X-List-Received-Date: Mon, 24 Apr 2017 12:46:44 -0000

On Fri, Apr 7, 2017 at 2:58 PM, Andrew Jeffery <andrew@aj.id.au> wrote:

> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied with Rob's ACK.

Yours,
Linus Walleij
