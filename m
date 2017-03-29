Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x234.google.com (mail-qt0-x234.google.com
 [IPv6:2607:f8b0:400d:c0d::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtfCv6yKlzDqJV
 for <openbmc@lists.ozlabs.org>; Thu, 30 Mar 2017 07:16:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GmWRN74a"; 
 dkim-atps=neutral
Received: by mail-qt0-x234.google.com with SMTP id x35so22837724qtc.2
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 13:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=aWZQNPwABBlbq+drlpvUdeAdKPS5Ril+BwUN/9TwTCo=;
 b=GmWRN74aKhY87W9v5lZVlwNM+zAr2ZQG/ywdS20U/0wGNs6UaaUsy3icsMz6EYXssv
 /bGmDK5jbqPcn08M6eoRcSvBd5MKT1ydqqDa3p+0AAt7SN21P/h7bYG2hxGQvf1xZxRu
 y2wzU4wz9Zf5d5kQiZ3LTnRgGCpMra5a18YWzK0eTraadOup+ri/lST3NyCf0rnsFF9m
 GXcga/portp1S5wVu0DdrfVxoCIp/A/u0YbbegHzv8h/C1pcnk90zGzpTBYmmzswXiTe
 V9D2QH31xJl8CoDvN+jPKysQi49ho51W9HezJpn8pC8z8lwdYR2htYDsLzTrpTa27BtI
 TrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=aWZQNPwABBlbq+drlpvUdeAdKPS5Ril+BwUN/9TwTCo=;
 b=iZIx8qpBtfL5Eg1S/9Fj+t3Hwys42NVJRJIPpUSCwkvaos0o801uZkoL+A/nrw6WrL
 0Ar6NY+zqK6HlJXoXExOHDwcgkI+dpAgdSXdbwzqa2R/lS5q+9hIs+6nke8Oe67HdJQU
 mVFPUemjDc8wvsBa9OO1+rpoB2q/Joqa/vtZw9GnmJO8S7bOGvPksxsjc9fwLriyxQnu
 u1/4DiEs/LCInbYE2E1p9Z1RDwDQEuFVxG8ccWOGwN/AVdYSjRWWytzWPu90gJeGmmQn
 fLkOBFA9JvPudPcjboJhyVyBzim5m3mUkvWc9LqEzBtr7xB7lg9TAHVKiK9vdDf2aCXh
 33ng==
X-Gm-Message-State: AFeK/H1kSIzTVb+9m0MLBksXJGYy4nAMAwZr8J1s7LcCiAKlStc/MZHBDcAP5BETl1CeJ4kyUC2OjmU4WPSKTgqO
X-Received: by 10.200.38.72 with SMTP id v8mr2713130qtv.27.1490818569167; Wed,
 29 Mar 2017 13:16:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.38 with HTTP; Wed, 29 Mar 2017 13:16:08 -0700 (PDT)
In-Reply-To: <CACPK8XdYNi2mna=aBbYvMroujLOPbVkPdU-DeYGrevjRBjHodQ@mail.gmail.com>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-3-brendanhiggins@google.com>
 <CACPK8XdYNi2mna=aBbYvMroujLOPbVkPdU-DeYGrevjRBjHodQ@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 29 Mar 2017 13:16:08 -0700
Message-ID: <CAFd5g4435JY72nk7xHa4KohvaGqK2UYOB4XLD3EajGCbgEzPFQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] irqchip/aspeed-i2c-ic: Add I2C IRQ controller for
 Aspeed
To: Joel Stanley <joel@jms.id.au>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Kachalov Anton <mouse@mayc.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
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
X-List-Received-Date: Wed, 29 Mar 2017 20:16:12 -0000

> Nit: Make this aspeed-i2c-domain to make this consistent with the
> other Aspeed drivers in the kernel tree.
>
> Could this irq code be embedded in the i2c driver? We took a similar
> approach for the Aspeed GPIO driver, which has a similar IRQ structure
> of one hardware IRQ that tells the driver to check status registers
> for the precise irq source. The upside being all of the i2c code is in
> the same place in the kernel tree.

In the previous version of the patch, this code was embedded in the
I2C driver as the "struct aspeed_i2c_controller;" I really did not
change anything about it other than rename some stuff and change the
init method to match what irqchip code wants. I pulled it out into a
separate driver because I was asked to by Vladimir; nevertheless, it
does turn the I2C driver into a normal platforms driver, which is
nice. Another benefit: if we put our dummy irqchip code in with the
other irqchips, it makes it easier for the irqchip people to recognize
when we are reusing the same patterns; for example, I would not at all
be surprised if there are other dummy irqchips which have the same
exact map(...) operation (I looked and did not see anything), but it
is quite possibly something that other people want to do. If we put
this stuff in drivers/irqchip, it is more likely that the irqchip
people would recognize this as a common use case. I do not think
either of these reasons I provided are particularly compelling, but I
do not think the reasons to move it out are particularly compelling
either (unless we decide we do not want make our own irq_domain).

Cheers
