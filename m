Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x22c.google.com (mail-qk0-x22c.google.com
 [IPv6:2607:f8b0:400d:c09::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtP6p5WxWzDqGv
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 21:25:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AgrGmpkO"; 
 dkim-atps=neutral
Received: by mail-qk0-x22c.google.com with SMTP id d10so8615048qke.1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 03:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=+CDD5LMXRQk/GdBa7nD8ZR/fTi0WqawUz93NNmSOwK8=;
 b=AgrGmpkOlphzc4yqBh49f+0nhl0TKOsv0dQ5h12qVu8W7yKGMDw5S9S2UMxCJMBmmQ
 Jzl8vKYhFycowIZjyy6certohRjPNe5cjlmSuhwyIPCl5Qyoee1YYOgoqsN/kSrIUgHc
 D3Qmxxi1o19p99GUMwfKkX14UTQm6ISn4a+tK74ne+AY0DnjQd8NsNR3Veq2jp5+LApk
 HYY2ynEwIJwfPSDUiFppiBzidToXXWeCblrO6mUON689B0vdjVupieHpSsT1qtDYBxeu
 1g6Dq2M1JbUuzAhPPNDHAwdmNBVY5vGdMU0jMFTuP9LuUcjf9pKBSJ0L8HlDEjlSIZZU
 y4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=+CDD5LMXRQk/GdBa7nD8ZR/fTi0WqawUz93NNmSOwK8=;
 b=eCVQcnfhYjToCqLWcAaBUHUtZo3BzJgSoyk13aZPDQBT5ZVJ+UdlJTHta+bEl96Myn
 E95U/YRVmUFkq7X4SGzQXOCL6pNJ7cpW4+Na6SDL0VFRSYmIkLz9BaFNpmtbFXrKMF1w
 9a3To17KXuM6TZNY7qOj3ngr1iIV4WRlPO+DFOIbt0akVK/piGgRvzAHxSooPmoGi3zK
 4dCwfH1NA9FqNnnSE45PYefgQC32K71HmpKRdqCXyaaqi2q46Zt61QtNMBa9KCvy/Lmc
 gRLdUSm2kvMDKRR2uVdPNQaSIGIxmra8W9tbdvAj7e+yZRKaEuzMkW4vpRu66V4PFAMx
 6LwA==
X-Gm-Message-State: AFeK/H1gy6J5q/TOOobtatI+MUnMHWo+9J8U5ZJD2SYXkPA848/PxCD7lSy88DWvHhDqt8vNuhMtfnJYmHZMvfK8
X-Received: by 10.55.209.216 with SMTP id o85mr31754961qkl.180.1490783152282; 
 Wed, 29 Mar 2017 03:25:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.38 with HTTP; Wed, 29 Mar 2017 03:25:51 -0700 (PDT)
In-Reply-To: <1490691283.3177.112.camel@kernel.crashing.org>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-4-brendanhiggins@google.com>
 <1490691283.3177.112.camel@kernel.crashing.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 29 Mar 2017 03:25:51 -0700
Message-ID: <CAFd5g45gYTEtjAAaFoF3Jm6NBfbdyHtnjE6-vxDyhDfLX9nLNg@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] i2c: aspeed: added documentation for Aspeed I2C
 driver
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, robh+dt@kernel.org, mark.rutland@arm.com,
 tglx@linutronix.de, jason@lakedaemon.net, Marc Zyngier <marc.zyngier@arm.com>, 
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
X-List-Received-Date: Wed, 29 Mar 2017 10:25:55 -0000

>> +             bus = <0>;
>> +             clocks = <&clk_apb>;
>> +             clock-frequency = <100000>;
>
> For busses it's more traditional to make this "bus-frequency" but
> that's a nit and Linux/fdt has not respected that tradition terribly
> well. If you respin, it might be work changing.
>
> The clock-frequency tends to be the frequency of the controller itself.

Ah, okay. I will change this on the next revision.
