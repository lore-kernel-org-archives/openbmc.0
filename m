Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::242; helo=mail-oi0-x242.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pf5HS34g"; 
 dkim-atps=neutral
Received: from mail-oi0-x242.google.com (mail-oi0-x242.google.com
 [IPv6:2607:f8b0:4003:c06::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41S1BZ23MLzF35V
 for <openbmc@lists.ozlabs.org>; Sat, 14 Jul 2018 04:13:09 +1000 (AEST)
Received: by mail-oi0-x242.google.com with SMTP id d189-v6so63814914oib.6
 for <openbmc@lists.ozlabs.org>; Fri, 13 Jul 2018 11:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qop5IxV6RcoTDB/Lt4qWrcoaLpC27ka4Ke3FcS3VCag=;
 b=pf5HS34gC/rJ3gFYn6Xru+GORC2+Lg0PQqkqZkW9rCE8AkPqKMFLeWc3LRQL2QvnYI
 Q225bQQF84LOMzFgxOWgDjVBD87nT14TjvVlNCd25s3JEcPxl/KGsWMmV1CprUdp2+GA
 RU28PafSBQOJ5QwaYY3XgGCFZLJvrkC1POGcJx86ir7gfu3xBJeSlh76AIyLYu6Ye2cH
 8WEHze6hBxtGVU/N3qVRlaB4xJRXGSzie0ykDwAgMPCsec2L9WS9qBJs9Hq6PNVWmHHs
 24K1UG4rBkbO7SHXVQPNwRp0KxCKYqFqk1od26g3MEgCZ+u9fN284HzFJDUixq3dkWkK
 mxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qop5IxV6RcoTDB/Lt4qWrcoaLpC27ka4Ke3FcS3VCag=;
 b=AmwFoepNjDmzPsCVIUgMFzkUGeS1jg9OrMK+bcm9QquSCN0AUiMB9n7eFaLrYK9Lpg
 YDeY5EqAb/sw2s2EH/BZvQxDt8Z4k9BbzkQtWP5QtA/mFHB7fkZCX+TQ2i9cZVCr+4ON
 vs4VbaChjK/7jI0rGKE+CEa9LGh50ToQ+bCA3FQy0q0TfpN3WRiwk59At1fc1J1EiIfP
 sW37MiWhp7QuCZk8smNeFaS6vn/iuuH7Zh8kyv4Tfxfk9/6bVVEYUVuAvda17oY3g/JT
 LtIeXiY07xBgY8ois5xz23Kd2O/cKilsZjzut2bS1AnRWtvnZdmQADgGBC4kmBNQgbBi
 MJCg==
X-Gm-Message-State: AOUpUlHVN5nywRRSfmBjPsDmmFaLIY+QjVOEaifkLwQ6wtQXiEKK3bgY
 QwbatH+APj/CU9oPkl8jH0VhJdiyxtNnEn5V9xRfLQ==
X-Google-Smtp-Source: AAOMgpcVK/90U91c/Rflu/XKes5FPhq/5DZjmFv+A4K+6cCQgP9o4puIQbL63qWbnKJhVgMZ5+ym17kOE5gzNBw+Hsw=
X-Received: by 2002:aca:a641:: with SMTP id
 p62-v6mr8168945oie.151.1531505587188; 
 Fri, 13 Jul 2018 11:13:07 -0700 (PDT)
MIME-Version: 1.0
References: <20180626165812.4141-1-jae.hyun.yoo@linux.intel.com>
 <CAFd5g45z--ucXf-So517tgrayZT6x2TGvaUvaDF7zeRNn7CPXw@mail.gmail.com>
 <e51471e6-0f8a-bffc-34c8-1e74239fdbcf@linux.intel.com>
 <CAFd5g47j_h4ZrT8Eg1FZ8sAj5ekCUH20jUVub75ozdkg8_YW7Q@mail.gmail.com>
 <921b1ab7-9c9f-0aeb-da89-5a1a27d009f0@linux.intel.com>
 <d3f10fc1-635b-3a5d-a967-2816eac005fc@linux.intel.com>
In-Reply-To: <d3f10fc1-635b-3a5d-a967-2816eac005fc@linux.intel.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 13 Jul 2018 11:12:55 -0700
Message-ID: <CAFd5g47zdPdqqjVJtNHtFk+jKgciKbMcEH9M-W9rL4DgLM5hkg@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Improve driver to support multi-master use
 cases stably
To: jae.hyun.yoo@linux.intel.com
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 james.feist@linux.intel.com, 
 vernon.mauery@linux.intel.com, Benjamin Fair <benjaminfair@google.com>, 
 Patrick Venture <venture@google.com>, gary_hsu@aspeedtech.com, 
 Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Jul 2018 18:13:11 -0000

On Fri, Jul 13, 2018 at 10:22 AM Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
>
> On 7/12/2018 11:21 AM, Jae Hyun Yoo wrote:
> > On 7/12/2018 2:33 AM, Brendan Higgins wrote:
> >> On Wed, Jun 27, 2018 at 10:55 AM Jae Hyun Yoo
> >> <jae.hyun.yoo@linux.intel.com> wrote:
<snip>
> >> <snip>
> >>>>> +       for (;;) {
> >>>>> +               if (!(readl(bus->base + ASPEED_I2C_CMD_REG) &
> >>>>> +                     (ASPEED_I2CD_BUS_BUSY_STS |
> >>>>> +                      ASPEED_I2CD_XFER_MODE_STS_MASK)))
> >>>>
> >>>> Is using the Transfer Mode State Machine bits necessary? The
> >>>> documentation marks it as "for debugging purpose only," so relying on
> >>>> it makes me nervous.
> >>>>
> >>>
> >>> As you said, the documentation marks it as "for debugging purpose only."
> >>> but ASPEED also uses this way in their SDK code because it's the best
> >>> way for checking bus busy status which can cover both single and
> >>> multi-master use cases.
> >>>
> >>
> >> Well, it would also be really nice to have access to this bit if
> >> someone wants
> >> to implement MCTP. Could we maybe check with Aspeed what them meant by
> >> "for
> >> debugging purposes only" and document it here? It makes me nervous to
> >> rely on
> >> debugging functionality for normal usage.
> >>
> >
> > Okay, I'll check it with Aspeed. Will let you know their response.
> >
>
> I've checked it with Gary Hsu <gary_hsu@aspeedtech.com> and he confirmed
> that the bits reflect real information and good to be used in practical
> code.

Huh. For my own edification, could you ask them why they said "for debugging
purpose only" in the documentation? I am just really curious what they meant by
that. I would be satisfied if you just CC'ed me on your email thread with Gary,
and I can ask him myself.

>
> I'll add a comment like below:
>
> /*
>   * This is marked as 'for debugging purpose only' in datasheet but
>   * ASPEED confirmed that this reflects real information and good
>   * to be used in practical code.
>   */
>
> Is it acceptable then?

Yeah, that's fine.

<snip>

Cheers
