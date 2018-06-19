Return-Path: <avifishman70@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c0b::243; helo=mail-it0-x243.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aZbSp0k9"; 
 dkim-atps=neutral
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 419Fmm206YzF0fX
 for <openbmc@lists.ozlabs.org>; Wed, 20 Jun 2018 03:48:07 +1000 (AEST)
Received: by mail-it0-x243.google.com with SMTP id v83-v6so1633460itc.3
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/P9s6tEMq5A1RGD5V7J/uSUpIswvKu6OhO5YchdPGKY=;
 b=aZbSp0k9hOLiuutJy2q6AfMCgYp4QxwBDqlxBWvWyX4hiycvKCZZFjLOi4N8r/B0X+
 iEjZqnzxsZY0Ojsg42QIk3+cjMMg1qiQYPgPUDn2ZdG3XZBVe2GZvMG9TQ/J0UAbIXKb
 nnJTB6nni+3ZtTyVGRMdbLFtbNGZa3Q+Dcs4mmM6E5Z23mhKq1X+UkDw3yxAAHUZUbRS
 tpFqeUOyA9wqrX2ioEBG1RSvBZjw1nYpUmstc1t4hudltKptH6iya8Wy8bR4rhkC8rJM
 44CEAyZt/1aoVF0w1ZH+q2HoQTLLxk+6lCmeHhMmIc4Kzlu6S7oTqjtP+BxFxgL5ag2Z
 Czaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/P9s6tEMq5A1RGD5V7J/uSUpIswvKu6OhO5YchdPGKY=;
 b=gLqCyQTFa755XLvdouLvWf2ixhj01ADlYpRye2JOX9+//mFuKMOjpBc+aVdqOUqWCS
 PR2SnfDw/Zt242QM9sP0L82Vmo+InlwIoS8PL/7jHK9PU4njb+tld64N/9BkGOgmx5he
 GJq9c3oQPmiR8Q+hDjoGmMJY/e19WoYWy7bwCnYjugE8ONan+TWDi3X5hTrcL86HedFB
 6x56TMpgb1SYlR2q6pnocOegn0u9lmbzZ5JmR6n2CEWrODyO78/v7xRdSNQLFQ4W/KQp
 93IkcCZGEEzf4fS7151iftKNecBDzlbkmj62f9fQX2FMwDSsGF+TzZYPCAXZVhVeqIz9
 1Xuw==
X-Gm-Message-State: APt69E3nZgOLf87D5eL54UVMqGgSWY46WLgKa2hCCQB0cbn3ZInCmufc
 XTXCNrkW5tqt7IknDu/zMc3fpGKEP7uagkWI+A==
X-Google-Smtp-Source: ADUXVKL0a8ZVwQTWVO7Mf9dtRYzmHv1ZuEzPI8EMDWBnZutrBpRhraPwC9wFJS8HP6rhtGE1TAFP+QvfFSyejWK3QL0=
X-Received: by 2002:a02:6065:: with SMTP id
 d37-v6mr14782764jaf.106.1529430486034; 
 Tue, 19 Jun 2018 10:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20180619142246.104469-2-avifishman70@gmail.com>
 <Pine.LNX.4.44L0.1806191044530.1473-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1806191044530.1473-100000@iolanthe.rowland.org>
From: Avi Fishman <avifishman70@gmail.com>
Date: Tue, 19 Jun 2018 20:47:54 +0300
Message-ID: <CAKKbWA79=k-HEinMNNw7y8bCg2s2M+_S8uFDuR-sQz7A7zFSPg@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] USB host: Add USB ehci support for nuvoton npcm7xx
 platform
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tomer Maimon <tmaimon77@gmail.com>, 
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Brendan Higgins <brendanhiggins@google.com>, mathias.nyman@linux.intel.com, 
 bjorn.andersson@linaro.org, jhogan@kernel.org, albeu@free.fr, 
 chunfeng.yun@mediatek.com, Tony Lindgren <tony@atomide.com>,
 baolu.lu@linux.intel.com, 
 Alex Elder <elder@linaro.org>, Dmitry Osipenko <digetx@gmail.com>, 
 Kate Stewart <kstewart@linuxfoundation.org>, hdegoede@redhat.com, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-usb@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, devicetree <devicetree@vger.kernel.org>
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
X-List-Received-Date: Tue, 19 Jun 2018 17:48:09 -0000

On Tue, Jun 19, 2018 at 5:49 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 19 Jun 2018 avifishman70@gmail.com wrote:
>
> > From: Avi Fishman <AviFishman70@gmail.com>
> >
> > This patch adds support for ehci controller for the Nuvoton
> > npcm7xx platform.
> > Most of the code was taken from ehci-spear.c + specific initialization
> > code
> >
> > Signed-off-by: Avi Fishman <AviFishman70@gmail.com>
> > ---
> >  drivers/usb/host/Kconfig        |   8 ++
> >  drivers/usb/host/Makefile       |   1 +
> >  drivers/usb/host/ehci-npcm7xx.c | 212 ++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 221 insertions(+)
> >  create mode 100644 drivers/usb/host/ehci-npcm7xx.c
> >
> > diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> > index 9f0aeb068acb..e3100b249f0f 100644
> > --- a/drivers/usb/host/Kconfig
> > +++ b/drivers/usb/host/Kconfig
> > @@ -185,6 +185,14 @@ config USB_EHCI_MXC
> >       ---help---
> >         Variation of ARC USB block used in some Freescale chips.
> >
> > +config USB_EHCI_HCD_NPCM7XX
> > +     tristate "Support for Nuvoton NPCM7XX on-chip EHCI USB controller"
> > +     depends on (USB_EHCI_HCD && ARCH_NPCM7XX) || COMPILE_TEST
> > +     default y
>
> Are you sure this is what you want?  The value defaults to Y whenever
> COMPILE_TEST is enabled?  Will that annoy people doing compile tests?
>

Do you recomment to change to:
default y if (USB_EHCI_HCD && ARCH_NPCM7XX)

> Aside from that one issue,
>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
>
> Alan Stern
>
