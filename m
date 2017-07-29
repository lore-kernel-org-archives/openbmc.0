Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x231.google.com (mail-qk0-x231.google.com
 [IPv6:2607:f8b0:400d:c09::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xK5bL3K1KzDrVd
 for <openbmc@lists.ozlabs.org>; Sat, 29 Jul 2017 10:06:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="rBqxzRYj"; 
 dkim-atps=neutral
Received: by mail-qk0-x231.google.com with SMTP id x191so60230970qka.5
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jul 2017 17:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=PyZyg50ve81K5wxHY55wfzO+Hm5vcOvBQgoecVtRzbk=;
 b=rBqxzRYjs1ojNr3syh92q5Qy9xvdSummQaed9920vTjtjkUmNnJCMwA2Tgo6BdUZOg
 JDCdQWiuBDaOTxMpb13H+ei00tGfS1Blz+4Sfc/KjrE7aF6GE6PZV3H87E86pgYgn6EQ
 RzV7LFM+lPQI9kF4aKeCUih8IMW6gOH6FkwRRNsBQZCmviTfbHL0Lb7wTjzqB8HUHe1Z
 /nJ0xfCntufGLtyOhO9K48UGxv7aKEytMy0e3iQoSRHAxMqfgyRfdu3A/lCHoa/795po
 NFGQpqVtAIRDqE2XwpzGGm82KYSW69+CF9gxMRzQRGN2EaqBBn2Gi66I5yxmEsKULCb+
 tsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=PyZyg50ve81K5wxHY55wfzO+Hm5vcOvBQgoecVtRzbk=;
 b=JnvYJoiMZsyLiqT7Mf37Ta4MnorhTMWUPixwdhKlBcw54xMazmsFkMCFtNVPFv4Sbg
 5fG/dB/sz5W4u5g/YKMnRVEMIvH0VhH9TZu8VT0l2QbXpZDL1so2mVFpZvAZj0ojD22v
 ZsciQNFwuPtKg9iBV8u5H+exmLLU6VFMuH/TzelYpG7MyHZmKpWE75HKsUX3i1uB4Fm2
 K9vxfF4xyx6oftLwsH4raz5QfMyCxVEc7SF5C5bMm1luPN4+A8aYsdffGTgRRrRfp83f
 azGEWqB67RYLQuZhIpI+Sx/PL5+G3gbQ45qgK+vkymRaIOZu7lljNfbu5S+R/ROWHR89
 h9qw==
X-Gm-Message-State: AIVw113pgrnfNVExavnLHoQXs1Mmg77HYBJG37W9VTX0pofhVYuPjT0A
 rKAPUXB+7yiwi9cZWhumk1IDfOMvHuun
X-Received: by 10.55.107.134 with SMTP id g128mr11736717qkc.166.1501286763105; 
 Fri, 28 Jul 2017 17:06:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.61.130 with HTTP; Fri, 28 Jul 2017 17:06:02 -0700 (PDT)
In-Reply-To: <CAPLgG=kUxfriYRq-fc+AD=eo1T+6xa4imzda7Fd_aXmAb2pD3Q@mail.gmail.com>
References: <20170728204558.6455-1-brendanhiggins@google.com>
 <20170728204558.6455-2-brendanhiggins@google.com>
 <CAPLgG==69mNpqoqKUf-0tT4iJJ5-aCg+1uaAoLJ5QSe+8LGYkw@mail.gmail.com>
 <CAPLgG=kUxfriYRq-fc+AD=eo1T+6xa4imzda7Fd_aXmAb2pD3Q@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 28 Jul 2017 17:06:02 -0700
Message-ID: <CAFd5g45O7rJymFgnWj3SnSKhCvXoX4_xCO8FqeBFCe0-Du9AYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] i2c: aspeed: add proper support fo 24xx clock
 params
To: Rick Altherr <raltherr@google.com>
Cc: Wolfram Sang <wsa@the-dreams.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Joel Stanley <joel@jms.id.au>, Robi Buranyi <rburanyi@google.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-i2c@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Sat, 29 Jul 2017 00:06:07 -0000

On Fri, Jul 28, 2017 at 2:00 PM, Rick Altherr <raltherr@google.com> wrote:
> Is clk_fractional_divider from include/linux/clk-provider.h appropriate here?
>

Alas, no. clk_fractional_divider is not flexible enough to specify the
divider the
way that it is represented in the Aspeed 24xx/25xx parts which have the divider
expressed as a "base clock" which is always a power of 2 along with the time
where SCL is high and the time that the SCL is low in units of base clock.
Thus, there are two separate "numerator" values and the denominator is
represented as the ilog2 of the actual value.

That being said, I could implement this as a custom clock subclass, which
would probably be cleaner that what I have done.
