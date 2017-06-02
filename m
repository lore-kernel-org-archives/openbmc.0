Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x230.google.com (mail-qk0-x230.google.com
 [IPv6:2607:f8b0:400d:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfJny6msmzDqLt
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 19:29:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fg2DxH/N"; 
 dkim-atps=neutral
Received: by mail-qk0-x230.google.com with SMTP id p66so38899947qkf.3
 for <openbmc@lists.ozlabs.org>; Fri, 02 Jun 2017 02:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=klR7H6AVDQyYZMSKf1hu/etMeTtRiNxMpm4dfaRFRgM=;
 b=fg2DxH/N6aLuuRU3CXRXs5GWgu14TXvcoT7VUNpn/lk50NoaOjzd/4IooNls3Jq4fL
 GRAOgNPz88nSuzT5ZyGUmKrEfk15rmIp4+Ya2oegNyh9SBnzzoAAPCICwbLW5KLIboma
 4WPsm7l7ifVu2JiS0WjGIZg+P4fKGDqZpJ1/gjqu153Alkk8NMbjBSHBdGSDzlJ1QOET
 KcHCrRa0ZVPM2H60CV5/1wRKv5CcuUlNbwMRYDoVMTN+F+UAJi6bkOJAkWgdi2qmsfG8
 EL02RBIwfUNtgQ62GWsEejnRr/xq7efd7W/NQaRY/MnPEiK/P2lvZ/c+59bX58GXGPth
 u1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=klR7H6AVDQyYZMSKf1hu/etMeTtRiNxMpm4dfaRFRgM=;
 b=si1YOqk6cpW1sDC86tQLnPzUxPad3cGV9yiAXDJwK3UQaQyVbEGHlpi0fXarreFUUS
 xzApkMWwGEuG6+ZsQkCyqzGbH0hjpWmVohQAIA45AvXIekdVE2nIWEYPaxO7B5NtOLBx
 gHHS9m0CRy6hdu2ckGFfeSX0nyqhpKmd87UTEGfYdIOhW08Ph1mIyIxQdTzmE1XtkbqR
 r79odoTdR10/8acGctsqwDlG3jCIsTxM72MDq72FyOZ6WygsT58i09sNqezEscalvgWq
 0bqpIMn3RHTwOve4Kc1HlR8eiKwlSrQIaPhLRLUkVD3JsT53OoSeuDAePUvajChmltoW
 dhLg==
X-Gm-Message-State: AKS2vOwxk4WFP6/BYTYiKxifhrlEDodmlsao1DGzeDbAOiT+QjJ51g9a
 StBvcDgtGm/QVMfInLnebaPUuooeOCUT
X-Received: by 10.55.192.17 with SMTP id o17mr6731745qki.254.1496395780175;
 Fri, 02 Jun 2017 02:29:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.122 with HTTP; Fri, 2 Jun 2017 02:29:39 -0700 (PDT)
In-Reply-To: <1496197001.3354.19.camel@kernel.crashing.org>
References: <20170525064925.16867-1-brendanhiggins@google.com>
 <20170525064925.16867-5-brendanhiggins@google.com>
 <1496197001.3354.19.camel@kernel.crashing.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 2 Jun 2017 02:29:39 -0700
Message-ID: <CAFd5g45en_S0NYgufoET_Lwgu3Rs=7RafsFJZeCUiYCWyxogag@mail.gmail.com>
Subject: Re: [PATCH v8 4/5] i2c: aspeed: added driver for Aspeed I2C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, 
 Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Kachalov Anton <mouse@mayc.ru>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 02 Jun 2017 09:29:43 -0000

I addressed all of your comments in my next revision except the one below.

>> +     time_left = wait_for_completion_timeout(&bus->cmd_complete,
>> +                                             bus->adap.timeout);
>> +
>> +     spin_lock_irqsave(&bus->lock, flags);
>> +     bus->msgs = NULL;
>> +     if (time_left == 0)
>> +             ret = -ETIMEDOUT;
>> +     else
>> +             ret = bus->cmd_err;
>> +     spin_unlock_irqrestore(&bus->lock, flags);
>
> I would make the interrupt handler self-clear msgs and I would copy
> cmd_err to a separate field (or ensure it's only set by the interrupt
> handler when msgs is non-NULL, by the completion code).
>
> That way you avoid the above lock which is racy, slave activity could
> get in there and trigger an error interrupt clobbering cmd_err for
> example no ? Or am I missing something...

The slave handler does not touch these fields, so that should be fine.
The only way I can think
that we could get in this state is if we had some sort of error
interrupt fire after we handled a
STOP or previous error; this should not happen, but I think it is
better to be safe than sorry.
Nevertheless, I do not think it is necessary to do more than what I
have already done because
it would mean the bus is in a pretty bad state anyway. Maybe I should
just drop the locks here.

If you disagree, could you elaborate on what you meant by putting
cmd_err in a separate field?
Did you just mean having one for xfer and one for everything else (like resets)?

>
>> +     /* If nothing went wrong, return number of messages transferred. */
>> +     if (ret >= 0)
>> +             return bus->msgs_index + 1;
>> +     else
>> +             return ret;
>> +}
>> +
