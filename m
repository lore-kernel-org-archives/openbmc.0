Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="A08oMoaw"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42K0YQ6h86zF3FW
 for <openbmc@lists.ozlabs.org>; Tue, 25 Sep 2018 09:20:26 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id z13-v6so11441553qts.5
 for <openbmc@lists.ozlabs.org>; Mon, 24 Sep 2018 16:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vFV4dnlatzbguNcNR/N13waU+Yimxo+sUEj115HJZJA=;
 b=A08oMoawSGdS/ISuOn8gkzopwRW4qrK+cXoWiBa5VTKbq3zBNAVqR9bAJfhunAwehA
 UlKkHN0/nLwS15g6Lo0uGVL9NRp8p1vkuWX0ZQ8HWONifYRB1tVgbPUvQuY87DMGm7eh
 7oiqbLKvOEPW3Wfl/w1mIEsrilboPQQGigGl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vFV4dnlatzbguNcNR/N13waU+Yimxo+sUEj115HJZJA=;
 b=YTD1GhBhYpK+9Acy5QBYypc8Q1ey/imCgL4vasDa9uqWsmB4D2k1oVKexLks+Y6YgO
 i5nS+FYJI4N/wliRhQNfILaZFyZkj7vWNiPivQeIH1ytobMqR5BRDdNXnl8cvFbyU3l3
 9GOR6i7LIqXusiX3ajQUpSIZ3Cymz65MGY87IMRMpEB2rhMkJuwCsdVwt4q/DMTyK910
 eBIQReJFHk6e63Fl7ZazLKsuS5hLbVteoEv4Uuu+KPgnKrfbEvRAIC6CixJaxo8A2kSZ
 X8jgfGOY/k0uFRA716uZmGzqfOP1REpLtf3+Oorn4uapV0kqaEM6Wpa0fW8XMA2sZ8UR
 KKYg==
X-Gm-Message-State: ABuFfog/Pv2BQWsjfTa+Llt4ldIgBJXrASY5N9SHLRay8AFzNwiujjoz
 yJKrvXm52RCRTsntD7OzY4/hKIJgNWPGOIXgyjo=
X-Google-Smtp-Source: ACcGV6293BhLYBqd+Jcq7bV3cjqa+bqry9aCHoUa3t5UlTxwehMeUNeOLBpJYGy84K8VLnA4GrvEYkhbtkxKdi2k/0I=
X-Received: by 2002:aed:3667:: with SMTP id
 e94-v6mr869282qtb.285.1537831224427; 
 Mon, 24 Sep 2018 16:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180919221331.2511558-1-taoren@fb.com>
 <CACRpkdZGjvLZY7snev5W2rRGgO7bQsSqn5u2v5Nw0tH9sa4yBw@mail.gmail.com>
 <84F9ED20-0964-462E-B389-39B107A232D3@fb.com>
 <CACPK8XeEZeMskkxNChhNSO+brpoPJ5FqweWNXe22BpyytwCwFw@mail.gmail.com>
 <E3FA56EF-0B3C-4DBE-9A63-428EB342887D@fb.com>
In-Reply-To: <E3FA56EF-0B3C-4DBE-9A63-428EB342887D@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 25 Sep 2018 08:50:11 +0930
Message-ID: <CACPK8Xd03w51FM8iJsFNhWkpRFMhy97XZpxOhbRwbD3ytQcRbg@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/fttmr010: fix set_next_event handler
To: Tao Ren <taoren@fb.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, cov@fb.com, 
 Tian Fang <tfang@fb.com>
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
X-List-Received-Date: Mon, 24 Sep 2018 23:20:28 -0000

On Sat, 22 Sep 2018 at 03:41, Tao Ren <taoren@fb.com> wrote:
>
> On 9/20/18, 8:33 PM, "Joel Stanley" <joel@jms.id.au> wrote:
>
> > I gave this a spin on the ast2400. It looked okay, but I was wondering
> > if you could share you test case so I can run the same test?
>
> Thank you Joel for the testing.
> Sure I can share the test (a small c program which measures delay introduced by nanosleep()), but what would be the preferred way to share it? Like a format-patch? Or maybe I should refine the test and send to openbmc for review?

Whatever method is easiest for you. A patch file or a tarball is fine.
I will then add it to the set of tests I run when testing aspeed
kernels.

Cheers,

Joel
