Return-Path: <brendanhiggins@google.com>
Received: from mail-qk0-x234.google.com (mail-qk0-x234.google.com
 [IPv6:2607:f8b0:400d:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7rVP669jzDq5Y
 for <openbmc@lists.ozlabs.org>; Fri, 14 Jul 2017 08:44:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="WXcSyxFd"; 
 dkim-atps=neutral
Received: by mail-qk0-x234.google.com with SMTP id 16so62928930qkg.2
 for <openbmc@lists.ozlabs.org>; Thu, 13 Jul 2017 15:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ODy5ErAYfpvVHb8lZ+5ggLFQua99AdLv33juyP+Ogqk=;
 b=WXcSyxFd5fbbqceOEFYgD23rdMtR4cCfW7e4Fnz1crMZGVIHpt3HK2Q6uzN1UAyPAe
 eUZZBJK54x266xQkLOKtrs9NCMrTWJWTME7i2RVc1Nmjl/aAwOlMR0+E5goepA9Evc3n
 oM+aIHxT/hZXzLzaEaJdtwBBZtVeiyxg3qOAxmKPlLSgWw94xH9apKqHW3851u0UggbC
 VMC4jOXN3yc6yZbvyd/+aDMllvHKi1hyz/d6WiCdMsxSQtGGouIHFssPLjNPLj8gij8R
 6UMqzXV+Yq2bPTEpMVVqi4rKfk3+SpiGtLkgiq3R5ICShgNf2LLE6UQeBJ+U/RsFIbm2
 nADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ODy5ErAYfpvVHb8lZ+5ggLFQua99AdLv33juyP+Ogqk=;
 b=Zrpyn4K+IPHOC3aEPr03jFkHena7MS+NuH1PLAVwDs+jrLJzmN68il9tZmMpYK8eqZ
 sYDP8mNMrW+PbEqR6AHZgauAACdKGaF0nFzdp0Pcec2A2l748H+mVUvD/5kwJdTz4+7d
 Nn4dR848OraiVKl9rADQHmMslg/1uH9QQJFklSzS1qC60b5o3apEABidz2o3jmPU3kMw
 C2vLKw+oaCpzb2o0wwi0z9h5XhbXlrLCF+wRgq40rys3iORP8sRyEESEI9z2y6D3srwm
 3+P1n6FehixSbkl8AXJLHoRM4zQLX8cSXQsSXXzHW3RQSnNCY9V6rsopdOETO/xglsC2
 DWaw==
X-Gm-Message-State: AIVw113v7fB6EX7ikQSa8ZEWf88l2PS3ZXiZg0uDJgDwA/tjNFQqsX4d
 8PvlPNinVYMtyoDNRHW1U5Uxs1jyrI4G
X-Received: by 10.55.143.134 with SMTP id r128mr7441663qkd.129.1499985881217; 
 Thu, 13 Jul 2017 15:44:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.45.104 with HTTP; Thu, 13 Jul 2017 15:44:40 -0700 (PDT)
In-Reply-To: <20170628074515.GA1550@katana>
References: <20170620211516.13095-1-brendanhiggins@google.com>
 <20170620211516.13095-4-brendanhiggins@google.com>
 <20170623184305.xqqhjgrbdmgk6lsr@ninjato>
 <CAFd5g45=O2_MgfZEkmbY-=ZZY+izxeWSuhZT+B2e08P=O+WEog@mail.gmail.com>
 <20170627090042.GA2408@katana>
 <CAFd5g449iu6DGvMuP8-n8C6GBbr62G6_ZYS6Lh9038EB0XO9YA@mail.gmail.com>
 <20170628074515.GA1550@katana>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Thu, 13 Jul 2017 15:44:40 -0700
Message-ID: <CAFd5g45V0Ya0UdBZMCoazvE0Sh33F3_oMb84-kLXn1qH0h=b3A@mail.gmail.com>
Subject: Re: [PATCH v11 3/4] i2c: aspeed: added driver for Aspeed I2C
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Greg KH <gregkh@linuxfoundation.org>, "David S . Miller" <davem@davemloft.net>,
 mchehab@kernel.org, 
 Joel Stanley <joel@jms.id.au>, martin.petersen@oracle.com, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-i2c@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, 
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
X-List-Received-Date: Thu, 13 Jul 2017 22:44:46 -0000

Sorry, went on vacation and then forgot about our conversion.

>> the struct i2c_bus_recovery_info. Is i2c_generic_scl_recovery supposed
>> to be part of the user interface, or is it just intended to help put the
>> main recovery function together?
>
> Sorry, I don't understand the question. What do you mean?
>

What I meant is that it looks like the only use of it is putting
together a default
recovery function, but I was wondering if it is fair to use it on its own.
Basically what I was asking is whether I could use i2c_generic_scl_recovery
in the case where SCL is hung.

I think I have a pretty good idea of what to do, I should probably just put
together an RFC patch.
