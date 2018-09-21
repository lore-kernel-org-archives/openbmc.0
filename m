Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="nnFQxrXW"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42GfLt67nLzF3PP
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 13:33:10 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id f62-v6so7471288qke.2
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 20:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cgIgCc/2dQPs4jWIV9FZ6VhZHEZWNMeOw3JNWYbORWM=;
 b=nnFQxrXW5uC5uPQoKI0AC6WGLJ0rxdfejUE7jLw+t1R+hQhdPCckpM4DM+OCtr+Ahd
 4cS5jZ62Uy6QR7s04MKRaekhVheOcQmF4nJ2JR+sDafcEH9ygsvUUjeR7K5jdrXXKcHv
 rQFpPiMOFX5h0RpLss1S4Z91PPJFsOMFTSJL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cgIgCc/2dQPs4jWIV9FZ6VhZHEZWNMeOw3JNWYbORWM=;
 b=BVV7hJ3T3DHw+HIHhJKT1wedjFIqWRgbfHOt2C2b+kkqiQEo3ufR0EoAq9W/2afDte
 UeP3zrfoIrfN3kAsZWhilhwpoluPwFTnnQInr1y6QRBTgJh0FhzbyVfRgGytMD9YyUGh
 nSo1bodR3jIRevqtMjFDaXvsfutydADU3zzTMaqe/B8LACokNwc7F4QaHgraDP4rnC39
 lBMSkQPzLWfsQKAe7ndhPYHVxeeP5GF54PVTb8L3AeCQ+68LhSssh1+5qhX1UlOezd5T
 CowtjbCxewfPXrQx55Ksb+hubBGhQVATL312OEKOnp9EjzM8mNKgULoHsoTKOWr9rIsz
 r6Pg==
X-Gm-Message-State: APzg51BowYd6bMndz7ouKaa3mBw4gU/IQlHeNju/uhEb8p/OIztrsWQM
 WxKFiwf7zoMs8tov/8lrWWzfZr8N5Hcvk+lS3Mg=
X-Google-Smtp-Source: ANB0VdYAj451FtZUYPeUe6b20rYC6Y/Q9JupLRxPZgWotjMFkEHHeka3asMBFaRLB3r4oCzrpakccJbfbyeUzu0kEEE=
X-Received: by 2002:a37:642:: with SMTP id 63-v6mr28907182qkg.11.1537500788234; 
 Thu, 20 Sep 2018 20:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20180919221331.2511558-1-taoren@fb.com>
 <CACRpkdZGjvLZY7snev5W2rRGgO7bQsSqn5u2v5Nw0tH9sa4yBw@mail.gmail.com>
 <84F9ED20-0964-462E-B389-39B107A232D3@fb.com>
In-Reply-To: <84F9ED20-0964-462E-B389-39B107A232D3@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 21 Sep 2018 13:02:56 +0930
Message-ID: <CACPK8XeEZeMskkxNChhNSO+brpoPJ5FqweWNXe22BpyytwCwFw@mail.gmail.com>
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
X-List-Received-Date: Fri, 21 Sep 2018 03:33:12 -0000

On Fri, 21 Sep 2018 at 06:39, Tao Ren <taoren@fb.com> wrote:
>
> On 9/20/18, 8:46 AM, "Linus Walleij" <linus.walleij@linaro.org> wrote:
>
> > Actually this is much more intuitive too, it is the typical way to handle
> > a down-counting timer. Good catch!
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Thank you Linus for the quick review!
>
> > Sorry for any cargo-cult programming on my part :/
> > Would be nice to get a nod from the AST2400 users that this works
> > for them too, so included them in the To: field.
>
> Make sense. I actually booted up kernel on qemu-palmetto (ast2400) but I'm doubting if test is valid because it depends on how qemu emulates the hardware. It would be great if someone can help to verify the patch on physical ast2400.

I gave this a spin on the ast2400. It looked okay, but I was wondering
if you could share you test case so I can run the same test?

Cheers,

Joel
