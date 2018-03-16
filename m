Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4003:c06::244; helo=mail-oi0-x244.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="oVX08b5G"; 
 dkim-atps=neutral
Received: from mail-oi0-x244.google.com (mail-oi0-x244.google.com
 [IPv6:2607:f8b0:4003:c06::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 402ZNr6dpfzF1DH
 for <openbmc@lists.ozlabs.org>; Fri, 16 Mar 2018 16:52:27 +1100 (AEDT)
Received: by mail-oi0-x244.google.com with SMTP id b8so7714626oib.11
 for <openbmc@lists.ozlabs.org>; Thu, 15 Mar 2018 22:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nKXRndVno8MGOSYHYks1QiXJctLK9/52BmA0+4O6eko=;
 b=oVX08b5GfZx52SWaIGOo7gmFHKx6f40LAXek7jyGZyyyv5fAjSUtr1Z5u5iMXP83KQ
 mtpz3TRzDLXVv28+gYM9vvw5LtRry5VUIqpyKUkA9kjnUZBM8ojpR0l74F1iKu/g8lMP
 kJtkwGRuUz07ruZ4wcovgD+T0CvOlta0xVNcFQYTOdN8wOdNSryvClOU8WpV1ThoPu8k
 MPk9WMdW5Q3gkAcDdSTgO08iAa/P/d8uc1+eCZ4LmwiY0yYouakW9Hj6hhwywmAeOIV6
 +ppsaoEmcR+jRiD6Nfc2XpX2FxV7mYtF+lOZ2UbOzEG+vbER4cYYCjX24w4t5FTTj/Zy
 YchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nKXRndVno8MGOSYHYks1QiXJctLK9/52BmA0+4O6eko=;
 b=Tv1mGFxhsqqYncRMnG0rxh3IDDFoc21eJK7lx1SgQalgNMdX17w3rCPgVrEwAeJ0Uy
 tzPcxHeic2Hvbbq7QJb6S9hEJa+RhVhu86hvMut6W0FLaq5JoUO48KiHZ41nTgzYq+sJ
 Mv9uIfwnu8eXsGw5mteD0YiS2xnj3F6mTpmKeEoIB0igdDJvJqV9s6D1x2+reflZEG4Q
 ubGxs7j7dS4vegRSYgSfIZWBvaiDAAFq138NRg366aNG3nzeJP28unvC5f4O2ztOybJf
 cHVRFLz+F688XH1WBaqEzTii3w0KxjbOTA1wTdYQNWnfzRftDA3eF2chogcvIYAw/Ze/
 704w==
X-Gm-Message-State: AElRT7Et4SXgR2X6L3oNT/9uAvy2bueAKe1l5rfwzH5cS5oug8wcL+8y
 alWtnjaP+TWKRa+tH8wzp/IxmhxRFu0Ua4TWHN1CmQ==
X-Google-Smtp-Source: AG47ELsZbNEte0/OL9T6j9W1knVsjghpTYeGQEkjDwJEaJ6DmJlNLGMjJcVcq1wwYAiZFVCGbFeAiPMOh5Ub3QGRWf0=
X-Received: by 10.202.106.201 with SMTP id f192mr324898oic.121.1521179544785; 
 Thu, 15 Mar 2018 22:52:24 -0700 (PDT)
MIME-Version: 1.0
References: <1521155412-29229-1-git-send-email-tmaimon77@gmail.com>
 <1521155412-29229-3-git-send-email-tmaimon77@gmail.com>
In-Reply-To: <1521155412-29229-3-git-send-email-tmaimon77@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 16 Mar 2018 05:52:14 +0000
Message-ID: <CAFd5g44NOFRmQbDJfRLw_SwsHwVB-hxsUYMYSmkqeyRKmXqSqQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm: npcm: Enable L2 Cache in NPCM7xx
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Patrick Venture <venture@google.com>, 
 Avi Fishman <avifishman70@gmail.com>, Joel Stanley <joel@jms.id.au>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Nancy Yuen <yuenn@google.com>
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
X-List-Received-Date: Fri, 16 Mar 2018 05:52:30 -0000

On Thu, Mar 15, 2018 at 4:16 PM Tomer Maimon <tmaimon77@gmail.com> wrote:

> Enable L2 Cache in Nuvoton NPCM7xx BMC.

> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> ---
>   arch/arm/mach-npcm/npcm7xx.c | 2 ++
>   1 file changed, 2 insertions(+)

> diff --git a/arch/arm/mach-npcm/npcm7xx.c b/arch/arm/mach-npcm/npcm7xx.c
> index 5f7cd88103ef..c5f77d854c4f 100644
> --- a/arch/arm/mach-npcm/npcm7xx.c
> +++ b/arch/arm/mach-npcm/npcm7xx.c
> @@ -17,4 +17,6 @@ static const char *const npcm7xx_dt_match[] = {
>   DT_MACHINE_START(NPCM7XX_DT, "NPCM7XX Chip family")
>          .atag_offset    = 0x100,
>          .dt_compat      = npcm7xx_dt_match,
> +       .l2c_aux_val    = 0x0,
> +       .l2c_aux_mask   = ~0x0,

You need to limit this to the specific bit(s) you want to set and verify
that
the l2c driver does not already manage that bit appropriately and that it
can
not be specified via the dtsi.

We discussed this a little while ago with Rob here:
https://www.spinics.net/lists/arm-kernel/msg613372.html

>   MACHINE_END
> --
> 2.14.1


Cheers
