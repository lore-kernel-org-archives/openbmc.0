Return-Path: <brendanhiggins@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eBELvfvP"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Dlkk6CFGzF1nb
 for <openbmc@lists.ozlabs.org>; Tue, 18 Sep 2018 11:28:46 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id n5-v6so289185otl.5
 for <openbmc@lists.ozlabs.org>; Mon, 17 Sep 2018 18:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c5v+LXMTadmZ3qiLNZUn7bqc7NqxVxbWTqGkPS2D5kc=;
 b=eBELvfvPIlDYyHyOunwWPFNcFtPW2LNmOP3lI4QMl40/fYzzpSI57cf74C1h94ifF4
 c+mjVItAizgTuuHGaWcn8/Wcdc+duQD2aO98Z/+DLMFh2LmI3tdoPijNfeCaWeW00KeE
 u0+J0LBN4rLL2Hrjas1P2aacKl5lF6ZhLtivL0sveqafdO3nlIXoaxwmy3HrIspmNSo6
 HjPmlF+Qr1yQduJwtlao4i+2T/xfYSeDcwcp09qVbG5+E+W6ob7lUbzRxLV9HaJaSVu8
 ZTl9jGhdoZkXH9l+wn9ij7mupb1+cLyxduzf+v9LAJ8UE5ABdO2jOqIy0jRdbH2cqIXC
 latQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c5v+LXMTadmZ3qiLNZUn7bqc7NqxVxbWTqGkPS2D5kc=;
 b=cuTv4aQy5E3oeziHSXNkHfhd5ktCXFVWx5Pse1PxKEi/Fp7D53jY3/GINgs8pPFxac
 7TUOMxAm2ClaYVGborEKV+Fvn486aEWZOJ7zpiLNUN/jj0Ue9bYPepDqIKCdcEy1Mblv
 KdBRIJ2sfO5faa7gBG6hVGwjc1wvguAObkHySv94MiD6yj9oJqb8W5FgCJlrvrbI36oc
 ZjNX0JeIL2WKl9l0N1N4GNxMrOCsw73q3og9jLPJJedyv6NvvrRz/CEI23BvozAG+7ze
 dvIUdORvNPJ2/XejoCO09M5+MpBSJl+jXf0u/KgKfUOen+BZ4F1mbmzIGecmL/a+hL9y
 3QNA==
X-Gm-Message-State: APzg51C0Qe+OOLE9tpb5Ocs6ZknDtPRcGXfNsIAIpJCL2nHXUvH1Z+cL
 YNOga37gEF3smFd7q61LFo56b1stFwIcAPIUr85gqLEi0jv+Gg==
X-Google-Smtp-Source: ANB0VdaLKsslc6XtQQn416UFFiueyc3mYXz3QCJW3rk0d/N4OX4LKIEuIQTyFQ++Y9PfYSFsTuE0Uw+Hl8dixY9xw2s=
X-Received: by 2002:a9d:6554:: with SMTP id
 q20-v6mr14595081otl.209.1537234123361; 
 Mon, 17 Sep 2018 18:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <1536895810-28903-1-git-send-email-linux@roeck-us.net>
 <CACPK8XchoryZ_RS8f4n=-GoT-Ak+dXuC3cgqLmxK9C=gySEJFQ@mail.gmail.com>
In-Reply-To: <CACPK8XchoryZ_RS8f4n=-GoT-Ak+dXuC3cgqLmxK9C=gySEJFQ@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 17 Sep 2018 18:28:32 -0700
Message-ID: <CAFd5g44dZ+SvCBGNztuq2izMb7401izXVoq=fU9=BehrwikVwA@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Acknowledge most interrupts early in
 interrupt handler
To: Joel Stanley <joel@jms.id.au>
Cc: linux@roeck-us.net, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Andrew Jeffery <andrew@aj.id.au>, linux-i2c@vger.kernel.org, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
X-List-Received-Date: Tue, 18 Sep 2018 01:28:47 -0000

On Mon, Sep 17, 2018 at 6:11 PM Joel Stanley <joel@jms.id.au> wrote:
>
> On Fri, 14 Sep 2018 at 13:00, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Commit 3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events
> > properly") moved interrupt acknowledgment to the end of the interrupt
> > handler. In part this was done because the AST2500 datasheet says:
> >
> >  I2CD10 Interrupt Status Register
> >    bit 2 Receive Done Interrupt status
> >          S/W needs to clear this status bit to allow next data receiving.
> >
> > Acknowledging Receive Done before receive data was handled resulted in
> > receive errors on high speed I2C busses.
> >
> > However, interrupt acknowledgment was not only moved to the end of the
> > interrupt handler for Receive Done Interrupt status, but for all interrupt
> > status bits. This could result in race conditions if a second interrupt was
> > received during interrupt handling and not handled but still acknowledged
> > at the end of the interrupt handler.
> >
> > Acknowledge only "Receive Done Interrupt status" late in the interrupt
> > handler to solve the problem.
> >
> > Fixes: 3e9efc3299dd ("i2c: aspeed: Handle master/slave combined irq events properly")
> > Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>
> Thanks for getting to the bottom of this Guenter. I gave it a spin on
> Romulus (ast2500) and Palmetto (ast2400) without issue.
>
> Tested-by: Joel Stanley <joel@jms.id.au>
>

Nice work! Thanks!

Acked-by: Brendan Higgins <brendanhiggins@google.com>
