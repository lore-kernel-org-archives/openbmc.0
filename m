Return-Path: <linus.walleij@linaro.org>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4001:c0b::243; helo=mail-it0-x243.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="WrMQau+B"; 
 dkim-atps=neutral
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42GLg90yXPzF3LV
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 01:46:12 +1000 (AEST)
Received: by mail-it0-x243.google.com with SMTP id f14-v6so13752024ita.4
 for <openbmc@lists.ozlabs.org>; Thu, 20 Sep 2018 08:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vB6icuBZtONcdJE81OTynlGpnhhW6fzCbvvtxe8DkLI=;
 b=WrMQau+BpefXqQvP07/ruh3mFJYJ552mcL7eohJuW3DQgykWBte7Sx3S6iVe2MdcIz
 a/kGDNkIQXQThGpVpGpwZak6XNFq8LeOuCJyuYlDDEfdimvURc728JQ57gSBfEGAECiL
 0z/MyE45UEAIB+e0goCCysvdkb4tkg+Co9sbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vB6icuBZtONcdJE81OTynlGpnhhW6fzCbvvtxe8DkLI=;
 b=rhvlVajwkJmbj+hCDn27AsKNjR4bTRwf+Sa1A2NIjVHHqOo1HmpFuGeAFbrQhUjpMx
 zqvlWERqTtAPkmE4+F9bySvRKB71DTnEo4fDp1FOCXHSB2s0k8H/1M9j9rFNEjApFVbu
 YphA0Qect3xc/5f2B9pvkb+/SlH9r5QOc4xNdNUdl3SLMwqn3w4nwLgItU5ZFh5cOJTY
 cwamJX4gaOUKv7O3k2wlEUr1lrQ5LkpfrKFY/6hH94Lq3nj24pstnPUfET8HSQBVafFm
 31QkM8YP9Jzyj+d+tzTy8rLbdSGkFBwZRKNcZgCvbgjyq1msVYpe431C3RjKhU5EWxAq
 QREQ==
X-Gm-Message-State: APzg51CHAQQHQRBSMp4+Ckfxf0VuwnBZiK1d8d1wQNjLBnXVds/WwYVd
 jMkPZGt+pmrsx0j6vbqGvFCSFem92nnst1l0qPzUfQ==
X-Google-Smtp-Source: ANB0VdapblOv9Jf68dKod1lHvNIk5i5HkehWxIOM/i9GwP5Q3i4crble/ChXy5Y5MgLC2ktlGCR0X9TCJ3kHKUiUFBw=
X-Received: by 2002:a24:7605:: with SMTP id z5-v6mr2440285itb.62.1537458369879; 
 Thu, 20 Sep 2018 08:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20180919221331.2511558-1-taoren@fb.com>
In-Reply-To: <20180919221331.2511558-1-taoren@fb.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 20 Sep 2018 08:45:57 -0700
Message-ID: <CACRpkdZGjvLZY7snev5W2rRGgO7bQsSqn5u2v5Nw0tH9sa4yBw@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/fttmr010: fix set_next_event handler
To: taoren@fb.com, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, cov@fb.com, tfang@fb.com
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
X-List-Received-Date: Thu, 20 Sep 2018 15:46:14 -0000

On Wed, Sep 19, 2018 at 3:13 PM Tao Ren <taoren@fb.com> wrote:

> Currently, the aspeed MATCH1 register is updated to <current_count -
> cycles> in set_next_event handler, with the assumption that COUNT
> register value is preserved when the timer is disabled and it continues
> decrementing after the timer is enabled. But the assumption is wrong:
> RELOAD register is loaded into COUNT register when the aspeed timer is
> enabled, which means the next event may be delayed because timer
> interrupt won't be generated until <0xFFFFFFFF - current_count +
> cycles>.
>
> The problem can be fixed by updating RELOAD register to <cycles>, and
> COUNT register will be re-loaded when the timer is enabled and interrupt
> is generated when COUNT register overflows.
>
> The test result on Facebook Backpack-CMM BMC hardware (AST2500) shows
> the issue is fixed: without the patch, usleep(100) suspends the process
> for several milliseconds (and sometimes even over 40 milliseconds);
> after applying the fix, usleep(100) takes averagely 240 microseconds to
> return under the same workload level.
>
> Signed-off-by: Tao Ren <taoren@fb.com>

Actually this is much more intuitive too, it is the typical way to handle
a down-counting timer. Good catch!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Sorry for any cargo-cult programming on my part :/

Would be nice to get a nod from the AST2400 users that this works
for them too, so included them in the To: field.

I can't test it on up-counting hardware right now but I convinced
myself it is handled just like before so it shouldn't be an issue.

It actually would make kind of sense to restart the up-counting
timer from zero and set match to whatever value is passed in
as well, so I might send a patch for this. It's no regression though
so no hurry with that.

Yours,
Linus Walleij
