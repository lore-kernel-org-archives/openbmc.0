Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x230.google.com (mail-qk0-x230.google.com
 [IPv6:2607:f8b0:400d:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtNXt2cjPzDqGv
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 20:59:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="EkO0B6YN"; 
 dkim-atps=neutral
Received: by mail-qk0-x230.google.com with SMTP id f11so8140682qkb.0
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 02:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=lDtHm1bxPwbPyU+8Jcmccm+X26yPsqcMTJh8dGxZ/yw=;
 b=EkO0B6YNUvN5RBHIbwavLq+E9X72jfLu1W7/uaZIKsaTRbPX8ZpAd+IkYd52mlvHMU
 /OYHa2gyDmB0z04eBBOxwFZ+KV9VzE7/pfSUW5haZjjWAitP320hBgbGjFGrdJ47+j4q
 /GOOXf2Uk6I3kw5X4n/2mkmFSJrlT/4VnAu3D2pwrfTClH12xP6+UNj6xGd+MlzBqlUq
 Snk6Aq65KcM/0etfcLUWVb9a+4Vf5U0KnwGcdEe1z03Yf1+i4Vmq3ZQEyXaoPQA04uBh
 1h2pxj/7AvwLAzfJrQ8PXToFHORcVFZ7nPFESNevd8qFrnAjoCxTxOhE5H2nkMYXogjQ
 3qRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=lDtHm1bxPwbPyU+8Jcmccm+X26yPsqcMTJh8dGxZ/yw=;
 b=ggkbdKqnciWVy1rfs9k4Tn+58NR8a1N66eT//dc1h1DGmBwrC0sVQhWMlp2LwfLHJo
 YItCNfqDpMg6iIz395XEPOnfG1hTnyqu6YPbz9QFXoSg4utAXfG40MyAiOOw2V3781i5
 7rk8a6UUvzZlW2hEUwYdQL3nymu4SbBPMftp2UdlPl/TnZooncp5LbwONmPrRnSQ1u1e
 Lh8yMlf5+R2aZZ3LeHuiYlD8eb5xlqBwVgsHId5DeRmgGuS8x31RrPYeDdXm7UBbcwh5
 Vo+bAAzRjlXQnTg3/4hhML4i9AO3NE+iHke5Ku3r1LqlNtkUaMbokbUbGZRVgsK+gbx1
 Rl2Q==
X-Gm-Message-State: AFeK/H0n29H2IOOWx8mu329NZvHjUtLUu7yeAC42ezZVcuvrybFdKvLXxxTKdFI8mevdieKcA5PBzBl9vKXVCP+X
X-Received: by 10.55.1.202 with SMTP id u71mr20102931qkg.163.1490781594387;
 Wed, 29 Mar 2017 02:59:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.38 with HTTP; Wed, 29 Mar 2017 02:59:53 -0700 (PDT)
In-Reply-To: <1490734216.3177.140.camel@kernel.crashing.org>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-3-brendanhiggins@google.com>
 <49a13bbc-aec3-a349-4323-3c8d2728c62f@arm.com>
 <1490692375.3177.119.camel@kernel.crashing.org>
 <91936f1a-0a0d-4091-b981-976503a6f7cd@arm.com>
 <1490734216.3177.140.camel@kernel.crashing.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 29 Mar 2017 02:59:53 -0700
Message-ID: <CAFd5g46TAGHWtH7p1o=AJqy8_SygpJZ4RJkJpUwDD3nKxpB5YQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] irqchip/aspeed-i2c-ic: Add I2C IRQ controller for
 Aspeed
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, Wolfram Sang <wsa@the-dreams.de>,
 robh+dt@kernel.org, 
 mark.rutland@arm.com, tglx@linutronix.de, jason@lakedaemon.net, 
 Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Kachalov Anton <mouse@mayc.ru>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
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
X-List-Received-Date: Wed, 29 Mar 2017 09:59:59 -0000

The main reason I took this approach is just because I thought it was
cleaner from the perspective of the busses which are totally
independent (except for the fact that they share a single hardware
interrupt).

I did not make any measurements, so I doubt that I have anything to
add that you don't already know. I saw other usages of chained
interrupts that do the same thing (scan a "status" register and use
them to make software interrupts) and I thought that is basically what
the dummy irq chip code is for. The only thing I thought I was doing
that was novel was actually breaking out the dummy irqchip into its
own driver; it is not my idea, but I do think makes it a lot cleaner.
Nevertheless, it should be cheap in terms of number of instructions;
the most expensive part looks like looking up the mapping. In any
case, I think the low hanging fruit here is supporting buffering or
DMA, like Ben suggested.

To address the comment on being over engineered: outside of the init
function (which would exist regardless of how we do this, if not here
then in the I2C driver); the code is actually pretty small and
generic.

All that being said, it would not be very hard to do this without
using the dummy irqchip code and it would definitely be smaller in
terms of indirection and space used, but I think the code would
actually be more complicated to read. We would be going back to having
an I2C controller along with the I2C busses; where all the I2C
controller does is read the IRQ register and then call the appropriate
bus irq handler, which looks a lot like a dummy irqchip.

Cheers
