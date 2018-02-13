Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::243; helo=mail-qk0-x243.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="RcQa6Rep"; 
 dkim-atps=neutral
Received: from mail-qk0-x243.google.com (mail-qk0-x243.google.com
 [IPv6:2607:f8b0:400d:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgsc74WQQzF0m1
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 06:12:23 +1100 (AEDT)
Received: by mail-qk0-x243.google.com with SMTP id e20so23743201qkm.7
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 11:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=WyQ2RPQTk3BNuczNGjtpphi5i0HN3XUajPC3nG1X5ZQ=;
 b=RcQa6RepyK8s10SaycNHNeizKszh00GbmN9Eiw4aunEYU9MvpujhFNAksgBmoAKVqy
 PzoSukHkMKoImT+AkFQZZBse4lj7zWw3xoxibeZ/K69W+vTBD4YEcKwQrpZSDRKjzumy
 5kle/b4nOmxYCT+SNxDYL0+wRJWQs0maOVTD79sgQi1jY2DqJ26hHkKAeUT2lEnfqxwm
 7dSQXQaLFAYK/ryHFQGl10Dnmvt3wvLTIUTSkUtba/J9nHgzOKHlD90UsxiID/ahs8zr
 Nt6ViQ9DDmkxwwqQUttbqc+4uFeEDZPOrN8AWIYF+dX9fzz92+BOD0k0PGWxonoNRv8y
 7/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=WyQ2RPQTk3BNuczNGjtpphi5i0HN3XUajPC3nG1X5ZQ=;
 b=NlNZ5oCs08NYN99vopK8Twn1tlPhYRwjDyaoXPL0tOF9BxQ6aXVByHwGhCGtiTw0dQ
 KeW/iAZb/h8AyoqeREZKZbAVj1IYedXcU3fu4vpBXEEh0kI9g9A3RRoGDaXzebpNtlIm
 6GcfbmdIXHCuSnuWrhzCNBWTCEv1KwieCcdCFb3tqVR4KPIiLJn/yI6fnwrBNLveLo7u
 8Inkg0fcsknWpEKyWsMOpVq1k5XC5ihc18zEZegnprxsC2v6PoIwBPUNSvwMf01LoDPb
 hyMgWbR3yV3H8xMTEccHNwKj93LmBht3V9EWyRBxRLQJN2Ul7hLKD1uA1kS4mkbDPgSk
 8Blw==
X-Gm-Message-State: APf1xPBrM7DYJmxiknuEkqX28YlHR+XaS5fR2EwthWxWVQvTixVuh4Nh
 bMEUlthfY5R/Q59q1A8plCaQWVCYu2HShieAWM6c3Q==
X-Google-Smtp-Source: AH8x227SVxARujG10k9/5Onoy8Q2AgqN/EQdroIIzlXdY1J9H4o+TS1VHclYPdnS9eTcq9uyOuAhZQaCdrxsSV41bHE=
X-Received: by 10.55.57.135 with SMTP id g129mr3429297qka.212.1518549139952;
 Tue, 13 Feb 2018 11:12:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.183 with HTTP; Tue, 13 Feb 2018 11:12:19 -0800 (PST)
In-Reply-To: <CAKKbWA6Otc1ZO_yHpfhxPjbgvvn-QXcXG9sy5=3FZDY8d_20rw@mail.gmail.com>
References: <20180205235757.246758-1-brendanhiggins@google.com>
 <20180205235757.246758-3-brendanhiggins@google.com>
 <CAK8P3a0SJTAkv7_QtDW1sDWFDYHw8tFWZqO6EMwpZ_5KPbhq3Q@mail.gmail.com>
 <CAKKbWA6Otc1ZO_yHpfhxPjbgvvn-QXcXG9sy5=3FZDY8d_20rw@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 13 Feb 2018 11:12:19 -0800
Message-ID: <CAFd5g44iHgSoPfko6hgMjz=QMm6ZUScUWbnho1w0bL_brTCjrA@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Avi Fishman <avifishman70@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Mark Rutland <mark.rutland@arm.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
 Julien Thierry <julien.thierry@arm.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Feb 2018 19:12:24 -0000

On Tue, Feb 13, 2018 at 1:29 AM, Avi Fishman <avifishman70@gmail.com> wrote:
> On Tue, Feb 13, 2018 at 10:30 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Tue, Feb 6, 2018 at 12:57 AM, Brendan Higgins
>> <brendanhiggins@google.com> wrote:
>>> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
>>> specific device tree for the NPCM750 (Poleg) evaluation board.
>>>
>>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>>> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
>>> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
>>> Tested-by: Avi Fishman <avifishman70@gmail.com>
>> ...
>>> +               enable-method = "nuvoton,npcm7xx-smp";
>>
>> I see this has already been reviewed quite a bit, but I'm curious
>> about the 'npcm7xx'
>> part here. Shouldn't that be a real chip name rather than a wildcard?
>>
>>        Arnd
>
> There is a family of npcm7xx, some with SMP and some without.
> For those who has it, it is common for all to use the same
> "nuvoton,npcm7xx-smp".

I think Arnd is right. In this case it should be "nuvoton,npcm750-smp". We can
use CPU_METHOD_OF_DECLARE to alias to as many compatible properties as needed.

Although everything in the 7xx family currently is either single core or has the
same SMP behavior, you could paint yourself into a corner if you were to make
one SMP device in the 7xx family which behaves differently from all other
devices and then need to come up with new compatible string names just for that.

>
> Avi
