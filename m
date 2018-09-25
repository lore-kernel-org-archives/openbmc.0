Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="BcnyPvCI"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42KW5S15JDzDqBx
 for <openbmc@lists.ozlabs.org>; Wed, 26 Sep 2018 05:16:25 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id y10-v6so21337431ioa.10
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hqj9sxfHL4+nnoioNvGJ0QwEnHVqHYvJCYXK0FLJxyU=;
 b=BcnyPvCIHZOMr+1lVaWonikbXRInFRSlYb9jcHhIZFv9Tx/IQN13xi2ak4g1bMIvIa
 cRxrnchXoSsHivsYw09j1SQK68Pv1LiWmGLpt33DS1I8IqZMvk0d5h0NCFiP6Xdp6BxB
 rcUM82J5oeM1FPU6AOZvvkkUtMpLsqhdnF8W8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hqj9sxfHL4+nnoioNvGJ0QwEnHVqHYvJCYXK0FLJxyU=;
 b=o0x77Lrohubf8S+GTwdMW7uy8Y30h6AbVnI0ZAiK/I3WE1GaecRYNhZ3VH3z89MHlp
 XHFNrOiumNRYMWhE/hBf2QLLnH/n8/x6kmslrU+I4ScPKWm6a4TQcXZNRBhzS+iBqNy/
 p6oW1Y9M4BQ5OldlUGC7R1fhW+ODTjRIaPe6jI17wDOOX48q+UfjC6r4tlJS3ndTuO5S
 //SMULbZpQRij9iE1t7e2L7ysOOrg+hnXM3xDuHXSYxt8bFe+qgTBoREeYUh9bPKf8+W
 Qj69IeFlFsUSDN2f2NvTqgese+KyaIBv8cRiczhqGtrAgMKpUTmrMTWsFNvS/+AVyjSU
 USHQ==
X-Gm-Message-State: ABuFfoinK6W5aOBZgP1UO2b4CAzNN+844XZydM4k73ilaRf7/JdjwR/K
 R5ig6AWCDj8t5h8YSxuwZc3pcLipxUeURTSVTu2O1g==
X-Google-Smtp-Source: ACcGV61FJByoDXcGshdY3PcN1vnmwXxGo49RLOPj6dxPrVQy842caFW9ibrLARMRuWquvTVSWXJWA7D7h+hmI5iDxHY=
X-Received: by 2002:a6b:630a:: with SMTP id
 p10-v6mr2239891iog.175.1537902982801; 
 Tue, 25 Sep 2018 12:16:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180919221331.2511558-1-taoren@fb.com>
 <CACRpkdZGjvLZY7snev5W2rRGgO7bQsSqn5u2v5Nw0tH9sa4yBw@mail.gmail.com>
 <84F9ED20-0964-462E-B389-39B107A232D3@fb.com>
 <CACPK8XeEZeMskkxNChhNSO+brpoPJ5FqweWNXe22BpyytwCwFw@mail.gmail.com>
 <E3FA56EF-0B3C-4DBE-9A63-428EB342887D@fb.com>
 <CACPK8Xd03w51FM8iJsFNhWkpRFMhy97XZpxOhbRwbD3ytQcRbg@mail.gmail.com>
 <571BD9E6-5A5B-4B66-AFAB-EC4E97B0A0D7@fb.com>
In-Reply-To: <571BD9E6-5A5B-4B66-AFAB-EC4E97B0A0D7@fb.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 25 Sep 2018 21:16:09 +0200
Message-ID: <CACRpkdZbHwTFbi__5gobypc43OzvgpJ3qL5c9=xLq8KEbVQqdw@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/fttmr010: fix set_next_event handler
To: sdasari@fb.com
Cc: Joel Stanley <joel@jms.id.au>, taoren@fb.com, cov@fb.com, 
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 25 Sep 2018 19:16:29 -0000

On Tue, Sep 25, 2018 at 7:13 PM Sai Dasari <sdasari@fb.com> wrote:

> =EF=BB=BFOn 9/24/18, 4:21 PM, "openbmc on behalf of Joel Stanley" <openbm=
c-bounces+sdasari=3Dfb.com@lists.ozlabs.org on behalf of joel@jms.id.au> wr=
ote:
>
>     I will then add it to the set of tests I run when testing aspeed
>     kernels.
>
> Thanks Joel! Curious to know what would be the best place to keep these k=
ind of Kernel test cases for sake of review and/or adding new test cases as=
 needed.

tools/time in the kernel tree?

Uh oh there is something familiar there already:
ls tools/time
udelay_test.sh

Yours,
Linus Walleij
