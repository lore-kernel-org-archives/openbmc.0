Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x22f.google.com (mail-qk0-x22f.google.com
 [IPv6:2607:f8b0:400d:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wBwcv6k43zDq5b
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 18:00:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="flGvSphM"; 
 dkim-atps=neutral
Received: by mail-qk0-x22f.google.com with SMTP id u75so40590045qka.3
 for <openbmc@lists.ozlabs.org>; Tue, 25 Apr 2017 01:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=MOnCa/lcvqGysB9IqKwN/dOIqqjpEYkw+V6ZspyWmOo=;
 b=flGvSphMTv2Kds5rHQWN5P27UI2RfGwBImhQlJaTmEiJf2VYXEH8dmJ2vs3boiTGz2
 sMB1b8waKne3GVVS+dRo3fFVncw/komblOHbbHaM72JXliZ3C0c76T/5gaTBxQUm7bm5
 3XIL+jfKERgTERpAtZl+DelVk3eq6slzJCYqz2nkwpsveZRMVJYmI9buFepuQV5evpJo
 qsn9xshGonmKUkC5H7G6Z/f3Daf1WCpgSqglWAAkRPXz5d8II751SuSmhTc9b8AZoCv5
 VsZReG1uljgdsiCSY2LLcnpfWX/pWnr7bl7zhY0vJ8Aksgy181E+54PAbZ04Mmzy/5i2
 T8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=MOnCa/lcvqGysB9IqKwN/dOIqqjpEYkw+V6ZspyWmOo=;
 b=VVZ9PHmvHJubQsVrhFoatgImc9j6B5lWyY5wuCrQ5DIsUpYMEfwoiTlhKiCvo7/Adw
 MSNO5ll9cIcF87KfqQM4l3sRT3qsPBLPAdNfU07dTuXv7qvHzGm1CC+0/zkebatc1TpX
 jhcJGFPZJD+e+p0D/R06zRwJbkIRoMKEcnF9eMh0AlqHXZ8sACgSir95uWCzEvPI/m9G
 qQC8ZB+Ya2ENB9iVM0kg3Mj+2hO7sSdisuqJ3ENhW+X99PLfnKworg6IaQRdRLpESzQw
 c4G3uGMbBt4kYjFvXREWM3Tv4M1sDzvf/xs+dk2f7aLsgpYwVDgbu3+y5OZfski3R0ju
 jTUQ==
X-Gm-Message-State: AN3rC/6g78Wkquwuvd8yAJ3ZgORS8lddG3WuYb3g+1zBRq0YHFBxZN4/
 NdgfxAzxiUoNIDMMPsvENFdzg7n/k2SF
X-Received: by 10.55.76.12 with SMTP id z12mr31464595qka.205.1493107244581;
 Tue, 25 Apr 2017 01:00:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.162.69 with HTTP; Tue, 25 Apr 2017 01:00:44 -0700 (PDT)
In-Reply-To: <1493086864.25766.266.camel@kernel.crashing.org>
References: <20170424181818.2754-1-brendanhiggins@google.com>
 <20170424181818.2754-5-brendanhiggins@google.com>
 <1493086864.25766.266.camel@kernel.crashing.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 25 Apr 2017 01:00:44 -0700
Message-ID: <CAFd5g46kbNg9wGtT1aHt+oRYHjLBdiEPd1Nu7gZoHe5A9Mn-1g@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] i2c: aspeed: added driver for Aspeed I2C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, 
 Joel Stanley <joel@jms.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Kachalov Anton <mouse@mayc.ru>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Ryan Chen <ryan_chen@aspeedtech.com>
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
X-List-Received-Date: Tue, 25 Apr 2017 08:00:48 -0000

Adding Ryan to thread.

>> +static int __aspeed_i2c_init_clk(struct aspeed_i2c_bus *bus,
>> +                                struct platform_device *pdev)
>> +{
>
> Minor nit ... I'm really not fan of those underscores.
>
> We use __ functions in some cases in the kernel for low level
> helpers, usually when it's a low level variant of an existing
> function or an "unlocked" variant, but I don't think generalizing
> it to pretty much everything in the driver is worthwhile here.
>
> If you want to be explicit about locking, I would suggest you
> use a comment in front of the function explaining if it
> expects to be called with the lock held.
>
> We tend to only do that when *both* functions exist and one is
> implemented in term of the other.

Okay, I guess that makes sense. Sorry, I thought the "unlocked"
variant might refer to a function that you have to pay close attention
to the context in which it is called; with as many functions as I have
that require the lock to be held, I would like there to be some way to
say the function is "unsafe," but I guess if there is no convention to
do that, then there is no convention to do that.
