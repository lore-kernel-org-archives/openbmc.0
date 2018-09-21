Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="DwyBz5Es"; 
 dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42H7bj5XtYzF3Ql
 for <openbmc@lists.ozlabs.org>; Sat, 22 Sep 2018 08:30:57 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id l15-v6so13386512lji.6
 for <openbmc@lists.ozlabs.org>; Fri, 21 Sep 2018 15:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n2jvFQjTqMRH8h9dfmz9B+usUOiuChKBPfAil8USXMQ=;
 b=DwyBz5Es4YJGCw1HmvdWcNw1zOH1s+3lLzPu6vlJc/VVL8DVrbWN27CGlbp5AH71vx
 p7WRntPrrUir1GrhgX11NhLsBSbZU5Lztm0hYf8I4G5Xd/WkcjgDkZ5WqjokUxRYg9Nu
 XNzCkUHApG+/jxn3oA4tDo19Tx5ypc4PUlBb1C0EwAriY7kgAX6Rz0uUweAEtp16LIM7
 ukpjyH6GMXxY+JjZbS84Txx86NEAcYYU++jY5XOqmmLpS0PPrwyUsc+eFZ5nDETc6f4C
 kYvpI4A7jk5EQ1mN37gvhXGJkJgJ2bZwBajzLYFAYThrcge3og7LZT3RdHxQ8GC7S3Mm
 pZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n2jvFQjTqMRH8h9dfmz9B+usUOiuChKBPfAil8USXMQ=;
 b=ZlmtmHqLl5m6JL+BaRsEiTxghVRprC29e36Zu/W9XcU7P8TA1V/WVx5OXB5TroeSOH
 6w6AsS1xvILMo/NhslZKrO7WOh8FZVTvZawVhZSa541iBFhoImfRiP/EQ2zqJZf2ZNiN
 x4Xf3Qby1hpYdmeN3l0nBM6+M+d7OKc3cW0/tRw1cKy6zY6NVUnS3SdhWPkRC+jRczHx
 K76edu6ZeBHMw6n4+eUzZKR6Ve/Z+XzZ8F723GzMhKAZWZC3121fUC4SOeSTZpQKIKSK
 veuYR/rpJap0UhnqCDIqOEH3N+p0CmMQ0ovivuknovpJZM5g0O7WR3movOTe1nxRR+pG
 kEUQ==
X-Gm-Message-State: ABuFfohuy7lEAVhpIbQAml5zlCcJe4ifpDv3x01EP+hdCwvvZIt6Gyjt
 pDheyPr6zYv6BO6wGwbwE6FVxS5jRG2GwY4EeM8M0A==
X-Google-Smtp-Source: ACcGV63JuZ1ZM0WKJZqkSXCz3QCuUga6GNyIagoO6OEdLsKYjm+QHyfj0474TKRsUiN7h2RUM3ErLbQHyTwq2PRT1G8=
X-Received: by 2002:a2e:21d5:: with SMTP id
 h82-v6mr3774527lji.46.1537569053736; 
 Fri, 21 Sep 2018 15:30:53 -0700 (PDT)
MIME-Version: 1.0
References: <20180921221025.75003-1-brendanhiggins@google.com>
 <f5943177-6f1b-9344-3821-2aac001ff45d@linux.intel.com>
In-Reply-To: <f5943177-6f1b-9344-3821-2aac001ff45d@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 21 Sep 2018 15:30:42 -0700
Message-ID: <CAFd5g46==5HG2stvuVfOUtsSW37SvLN6cCmOhRSxibrUpxb8aA@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: aspeed: fix invalid clock parameters for very
 large divisors
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 linux-i2c@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
X-List-Received-Date: Fri, 21 Sep 2018 22:30:59 -0000

On Fri, Sep 21, 2018 at 3:26 PM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
<snip>
>
> > +     if (base_clk_divisor > ASPEED_I2CD_TIME_BASE_DIVISOR_MASK) {
> > +             base_clk_divisor = ASPEED_I2CD_TIME_BASE_DIVISOR_MASK;
> > +             clk_low = clk_high_low_mask;
> > +             clk_high = clk_high_low_mask;
> > +             dev_err(dev,
> > +                     "clamping clock divider: divider requested, %u, is greater than largest possible divider, %u.",
>
> Please put a newline character at the end of the string.

I always forget to do that. I wonder if anyone has considered adding a
warning for this to checkpatch?

>
> Thanks,
> Jae
>
> [....]
