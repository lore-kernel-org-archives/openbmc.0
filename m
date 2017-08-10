Return-Path: <brendanhiggins@google.com>
Received: from mail-oi0-x232.google.com (mail-oi0-x232.google.com
 [IPv6:2607:f8b0:4003:c06::232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xSVY270tlzDqtM
 for <openbmc@lists.ozlabs.org>; Thu, 10 Aug 2017 11:14:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="D8nueFrh"; 
 dkim-atps=neutral
Received: by mail-oi0-x232.google.com with SMTP id f11so62222281oic.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2017 18:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=QNFxKkMwui0Ct/Mm5RmGlueouq6LRGnbZvN741g6p/U=;
 b=D8nueFrhoBq4aiPsHPtj4Sudb8CPKvfJ+AARnBucEBnDWMNv6YA65jutn+LCrsEaFG
 CU+HzSMUOWvpjiZTcuDy3JarRmMjS760P8ABCPPfh1AOxV5Ry9eOg1twLjVh74qJuFdN
 nUONKt002XDgIibFjKkMKunR3i6nI/yRxxVnyrEo3Dr0pCJf8dH/R34OgTKqiB54bIE7
 Nj31sB5ZbkaewJwKG8CMzxpyU1eip5wxtbsTTBRBKo2t61gk2Igyr2VTXwO5ORq5omOk
 vuGs8vvCf9GG/nmFKiD2frGIHcQiG50cgl44EvzL93u5AFNkfUnPK0Q2qzZIK6uqj7eC
 MxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=QNFxKkMwui0Ct/Mm5RmGlueouq6LRGnbZvN741g6p/U=;
 b=r6juMZwV7TPdNlJwSxr4ypfUGwQMTUlcE8l2639ZF4nfoYmS/IxBT6SZo6qg2VQW0w
 bFnoaJ/KlHsoLlrTnNJ7tUSozMJdcP4mt/s7bDp1Iu5EQ53OsTa3phb0J/2jbkznYs1p
 /bo1qrZMei2ckhRiVXBNvav1lRzQS5s1y0t41FxIivXGbInP/d3EX9AixOINVgQGXufs
 9K/ASmA5a2h+H+lVMMBgTEW5t4iA7DCaYagtazYWNM686I+y/1aw01nfoA4AaSNiamNT
 ukek1YFGN4kAfxNQroYgbbUtacwEQ/YFZuPhCr6Aw+aMNNitKkY0gfBwl1V4FiUEVXdM
 zYJA==
X-Gm-Message-State: AHYfb5imFczyG721q9ZmqdRZPBeAH3xcM3W8D/ym3aKVRMxoGSrCaXaC
 dfwCxprN+fq6UIBExAKBrxYFYJ+HWM3s
X-Received: by 10.202.253.20 with SMTP id b20mr10242513oii.236.1502327683901; 
 Wed, 09 Aug 2017 18:14:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.168.69.205 with HTTP; Wed, 9 Aug 2017 18:14:43 -0700 (PDT)
In-Reply-To: <57021502276176@webcorp01h.yandex-team.ru>
References: <20170804231854.19730-1-brendanhiggins@google.com>
 <57021502276176@webcorp01h.yandex-team.ru>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 9 Aug 2017 18:14:43 -0700
Message-ID: <CAFd5g47LA0jyhvnRb4i6GXsQOdPbJJrn+uCsQgnMRQgah6gKfA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] ipmi: bt-i2c: added IPMI Block Transfer over I2C
To: "Anton D. Kachalov" <mouse@yandex-team.ru>
Cc: "corbet@lwn.net" <corbet@lwn.net>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "minyard@acm.org" <minyard@acm.org>, "joel@jms.id.au" <joel@jms.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "openipmi-developer@lists.sourceforge.net"
 <openipmi-developer@lists.sourceforge.net>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
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
X-List-Received-Date: Thu, 10 Aug 2017 01:14:47 -0000

On Wed, Aug 9, 2017 at 3:56 AM, Anton D. Kachalov <mouse@yandex-team.ru> wrote:
> Hello,
>
> I would like to mention one of the our related work for IPMI and I2C.
>
> We use OpenIPMI stack to connect to the computing nodes through the I2C
> using IPMB (BT is not supported by nodes):
>
> https://github.com/ya-mouse/meta-openbmc-yandex/blob/master/meta-yandex/meta-openrack/meta-shaosi/recipes-kernel/linux/linux-obmc/ipmi_i2c.c
>
> It lacks complete slave support (slave part is only for receiving known
> packets with query results due to OpenIPMI implementation in kernel) and use
> one local slave to communicate with a number of target systems on the same
> bus (currently supported only 1-to-1 schema).
>
> With this stuff we able to use ipmitool across different /dev/ipmiX devices
> to communicate with nodes.

Cool, I met someone else who had a similar use case which is part of why
I decided to share this (not sure if should say who).

So it sounds like we are probably not going to go with the approach I proposed;
if you indeed find this useful, I would suggest that we put this in our OpenBMC
repository and switch it out with the suggested method at some point.

Let me know what you think
