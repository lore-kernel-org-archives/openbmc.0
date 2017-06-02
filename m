Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x22a.google.com (mail-qt0-x22a.google.com
 [IPv6:2607:f8b0:400d:c0d::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wfXmS3H7fzDqKX
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2017 04:29:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="pMMyXpv/"; 
 dkim-atps=neutral
Received: by mail-qt0-x22a.google.com with SMTP id f55so65478820qta.3
 for <openbmc@lists.ozlabs.org>; Fri, 02 Jun 2017 11:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ei0Ts8sQ/16+RDjFphx2tdJfJOH/e6PLXddrXNvM1WA=;
 b=pMMyXpv/5hCOSfKKBWfUQgK/CVpRqVyZkR7smZeKjhsj/y6B8h6w9lppcgX7BBwsUE
 G5pjNkJiHBrbpWZ4/49Ht8/YDyfRWb5Zs9Asqov2q9hdxuqF0XCEzazxCHqlP59L+gL/
 sFnbrVCdQjzJCAvyYbjFLQRpnuXDUqqOkf1s5kZ5+14wcI3P31d2KZinUFqrU3FNS28O
 ey1yDXba+iudmjz0cM4Kj6L5u+gXAihRxS2VEMj3Hv2Afs2duZlkjowqj+//CJIJ2lFN
 Nl/Dv5Aw93c1Y4hqecOn/VJAIS+9qmGVIoz6mvGwp7rAZWsmEG4L3t76V+2DZ5Oa0zh4
 tepQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ei0Ts8sQ/16+RDjFphx2tdJfJOH/e6PLXddrXNvM1WA=;
 b=mYrlKVJNErGWq6p0ost05PYuKTvRQE+0CPokVeB11IE7C8oiqRVeMxi5nbhRWgQaKy
 MhCyRyqPJEpZ4l6Dsm2oRqbUNT+Fo8sItdrV2kQ7tbc3zbbs6zP1XAeCVoTYXl+s48r4
 6lv4nAlj3I6cv565x0yRo13e7ouZ2SVrWDuia8tVue7JIqKif4eRSZWLcVJ29BmFbxpE
 DuIUK8INyYYV1xQ3JT6jTWqKL5du0tOJya6Ea8K+j89yWbxAjHrDTDjHmd0+FOwmH3S6
 UNQOGBH++d418/NfAVm3vn/WzbRIO4Yb/LAXex6RRRQarnmzLPsFVon5FensDHVBWPV2
 bMSg==
X-Gm-Message-State: AODbwcBLOpM3FVWxyb//ew/h5UsDkbZZr/TZu9V/Aqc5bk7lbwbN2Q5o
 CBLbrFJt8TI6iTMg7D5JBdfsfsjqXUq6
X-Received: by 10.200.35.177 with SMTP id q46mr10642906qtq.158.1496428148387; 
 Fri, 02 Jun 2017 11:29:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.73 with HTTP; Fri, 2 Jun 2017 11:29:07 -0700 (PDT)
In-Reply-To: <0db6df3c-013b-1d57-5c69-edfc53ef26c0@arm.com>
References: <20170602084603.30811-1-brendanhiggins@google.com>
 <20170602084603.30811-3-brendanhiggins@google.com>
 <0db6df3c-013b-1d57-5c69-edfc53ef26c0@arm.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 2 Jun 2017 11:29:07 -0700
Message-ID: <CAFd5g44FJyVHU1fss0zy1OrQVUQKVo27KQCS2GaRi7=JS-Gzmw@mail.gmail.com>
Subject: Re: [PATCH v9 2/5] irqchip/aspeed-i2c-ic: Add I2C IRQ controller for
 Aspeed
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Jason Cooper <jason@lakedaemon.net>, Joel Stanley <joel@jms.id.au>,
 Vladimir Zapolskiy <vz@mleia.com>, Kachalov Anton <mouse@mayc.ru>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
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
X-List-Received-Date: Fri, 02 Jun 2017 18:29:13 -0000

>> +     i2c_ic->irq_domain = irq_domain_add_linear(
>> +                     node, ASPEED_I2C_IC_NUM_BUS,
>> +                     &aspeed_i2c_ic_irq_domain_ops, NULL);
>
> nit: can you have at least one argument following the function name?
> Even if checkpatch shouts out you?

Makes no difference to me.

>
>> +     if (!i2c_ic->irq_domain)
>> +             return -ENOMEM;
>
> All these error paths are leaking the initial memory allocation.

Whoops, forgot I am not using devm_*.

>
>> +
>> +     i2c_ic->irq_domain->name = "aspeed-i2c-domain";
>> +
>> +     irq_set_chained_handler_and_data(i2c_ic->parent_irq,
>> +                                      aspeed_i2c_ic_irq_handler, i2c_ic);
>> +
>> +     pr_info("i2c controller registered, irq %d\n", i2c_ic->parent_irq);
>> +
>> +     return 0;
>> +}
>> +
>> +IRQCHIP_DECLARE(ast2400_i2c_ic, "aspeed,ast2400-i2c-ic", aspeed_i2c_ic_of_init);
>> +IRQCHIP_DECLARE(ast2500_i2c_ic, "aspeed,ast2500-i2c-ic", aspeed_i2c_ic_of_init);
>>
>
> Once you've fixed the trivial bug above, this should be good to go.
> What's the merging strategy? Can I take the initial two patches, and let
> someone else deal with the rest? Or do you want the whole series to be
> kept together?

I think it makes most sense to keep it together and let Wolfram merge the
whole thing since the I2C patches won't work without this and I would not
want to make the merging process unnecessarily complicated.
