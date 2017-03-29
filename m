Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x22f.google.com (mail-qk0-x22f.google.com
 [IPv6:2607:f8b0:400d:c09::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vtPJK4X3RzDqH3
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 21:34:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="GYNeoONC"; 
 dkim-atps=neutral
Received: by mail-qk0-x22f.google.com with SMTP id r142so8709212qke.2
 for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2017 03:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=gOqYWeKK+izQCEFr9KzkhbaVuGWjdXZwz6ivkhD93GQ=;
 b=GYNeoONCIdYI/RZrlThef2G1fY0P31YviArZQ19aVYRW+N79VGxyT9qysZ2vLfJWTn
 KDzw7PLxtW5U3DODklp4PZPSHS+s5SttL0UOfVClIGUc7ltbkhm4gbFyrCs0qjHnrE3R
 FBUfFB3b30k292bsdRdFHlzNapX5K8wGHz/wo7yQCwIqw8Z/BwOIxfJiFYjlT8SUDUal
 y/h8JPD5ZWjQ763rU08bJAFIu0IGQb7JMH2OKQz5cbfxcTnJxvW4waXPYMMqCJTC4Qsx
 BMxkZPawtHuch8bBO/KEzoMaDZ1KaxWjdpsakIxd30ykmYGOCDJnk0E1aeG47QfWjLQb
 0UaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=gOqYWeKK+izQCEFr9KzkhbaVuGWjdXZwz6ivkhD93GQ=;
 b=FX8DZsgQNmcue7Tppqy55jtoXP+XdblS4N+A27HaiwkvOK0IG5na8u2NAwfIo4j+t+
 kBfEWiMx2upy7Mp1gfwToCdziP2lbRtq0MKnPJFcpqX8a2ACLIX7B674KHsZ7CTNwIb8
 CdwgdO0GZYGO1luUjraOvYPBCjovB1gOmmFl78HmrsD+KixPrx/x6etaTBqhkkfnLQ3H
 mT8rXWartxHJl7TtoNhYAOuKgXDpjS19bBDSCBi66pBX4mYC6j5v55qySlp3Jq02MFvo
 NA3NU9JhLYZtpMhzCFc/F+Mw+NAPACDN/4EX0wHsehpouhYAfYzdHfZ1P2jHm8PQHBt3
 N2MA==
X-Gm-Message-State: AFeK/H1eKFRSDTXIZGwv8/g+aHIT/Yr1AUWWWb8C+w9Ifl8xuNu8pVuPU8JCU+t6YSqAkLtshMvRBKa+6db2D8+f
X-Received: by 10.55.106.131 with SMTP id f125mr27888992qkc.238.1490783643282; 
 Wed, 29 Mar 2017 03:34:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.152.38 with HTTP; Wed, 29 Mar 2017 03:34:02 -0700 (PDT)
In-Reply-To: <1490690980.3177.108.camel@kernel.crashing.org>
References: <20170328051226.21677-1-brendanhiggins@google.com>
 <20170328051226.21677-2-brendanhiggins@google.com>
 <1490690980.3177.108.camel@kernel.crashing.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 29 Mar 2017 03:34:02 -0700
Message-ID: <CAFd5g47Pij6TxkmS6akWoAL0FZ2WLh+FWUrr099RiabWn+pneQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] irqchip/aspeed-i2c-ic: binding docs for Aspeed I2C
 Interrupt Controller
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
X-List-Received-Date: Wed, 29 Mar 2017 10:34:10 -0000

I think I addressed this on the other email with the actual driver.
Anyway, I thought that this is pretty much the dummy irqchip code is
for; I have seen some other drivers do the same thing. It is true that
this is a really basic "interrupt controller;" it cannot mask on its
own, etc; nevertheless, I think you will pretty much end up with the
same code for an "I2C controller;" it just won't use an irq_domain.
