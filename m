Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::241; helo=mail-qt0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l+EmPW55"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="kOqSYUxj"; 
 dkim-atps=neutral
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41VnWj3VXbzF3Hv
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 16:37:36 +1000 (AEST)
Received: by mail-qt0-x241.google.com with SMTP id d4-v6so3112126qtn.13
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jul 2018 23:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5ndAK/YVF1zReB992rb4s3RuWEbHcHV4B9oMBY2pkt4=;
 b=l+EmPW55ech1P+ASvf3/aFAKG92taAW3Fgmv5DeQV5l+oyYhN7UDiFWYQ8cwT81bVm
 jvl7oKXbzlC7/C2YGKhz2xrbABd6fKfLlCAXlQkyWKmCnme5e+dYi3t5PQYdASwsyCxA
 hHZeqtuOijZvHpQ9E67zi0LLfsgCRz5lO3DUhnKKvZDBmMVm674BtS5hh90toSTYTRLn
 DfX2d6N+xA6SkR2dK0fK0XNiQnYGZlRPN0gpz1G7bO+jjJmgVmtNT8p8SROom1uehxni
 /HiPMVEW2HCtvR7EOXy1/lBtWy4FJLzPFk2ZTe6fjIwSO13hHI9OyQuXAyC7U5qNw7kQ
 sVfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=5ndAK/YVF1zReB992rb4s3RuWEbHcHV4B9oMBY2pkt4=;
 b=kOqSYUxjVlBHI4okZS+v/Bd1RJpJkRm63qESvrJfM4DXKjQWOPOqNw5ZgARfzb2Nfo
 Xv/cikcx5BRHWfC1ozfgGnFoEz2NKYCF5AYbldo4z1oF0mPOtKReKMMTFS8j/AuURETT
 kNEfZ0O9HmGqoY/kvjqonbjALTVHKqlhI8dfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=5ndAK/YVF1zReB992rb4s3RuWEbHcHV4B9oMBY2pkt4=;
 b=HwPyWnGGhh9mYJLdIBdyZv0JqZmXqcBD5pKw35IqUgxAQmdXyUK4XKUKefM4RHOo+m
 quwWWQa1dogk1t1fIJBC33ZkQowb50VSg8m+NP6uanalD17MSWxObt1JtTVRDxszc0uS
 37pofPfvJnV7ldlsZQ7ZwoSipem9vvtxInismoHOl4aZ1CJlmHajSF7Dlea5SPD44sOL
 xZSsdBNbI3Pyfwz60jjsRd/nH5JdJp4RkpxXqOmTMkxBQtWoAVogTbuA0wdZQMOttjpr
 LzpMZ+ekVQf2Ax+n9mAGFxjgNaExk8wufAR2Tp3hFcklYNq3V/itBmHqe7YEyKOCUFrl
 rx+g==
X-Gm-Message-State: AOUpUlGwmnXWal+sYW6ST2tfWWdQVdOtPT01UIbBSn6DcT4B+G+pKwB+
 luka2QdKTFSeJzRrnr9wPqi1zH3Nkqqcy8r3IzE=
X-Google-Smtp-Source: AAOMgpeSaP/oLoQVC7OnJld7kkL4ymGA9MEX6PVBroaYmPDXhqne+TJvTyVawzC7I0yDYM2Q4b0UnV4BgRMV0PAtUE8=
X-Received: by 2002:a0c:a90b:: with SMTP id
 y11-v6mr5099989qva.208.1531895854638; 
 Tue, 17 Jul 2018 23:37:34 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 23:37:14
 -0700 (PDT)
In-Reply-To: <dea1363bae3cfaa7c8244b64bfab7dfddaae8e4a.camel@kernel.crashing.org>
References: <1531286230-28453-1-git-send-email-ryanchen.aspeed@gmail.com>
 <1531286230-28453-2-git-send-email-ryanchen.aspeed@gmail.com>
 <84064771141b017e5fe3cafef8dc8307f5d97eba.camel@kernel.crashing.org>
 <20180717060411.GA10750@ryan-ubuntu>
 <dea1363bae3cfaa7c8244b64bfab7dfddaae8e4a.camel@kernel.crashing.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 18 Jul 2018 16:07:14 +0930
X-Google-Sender-Auth: OSDj6fW1MLOs5LQviZh4Go6s_vY
Message-ID: <CACPK8XfiLvYMxAjEAvCQOiZBjFqVz733NVhpzfFTstFgDrP9zg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.17 1/7] clk: Aspeed: Modify clk-aspeed.c
 driver probe sequence
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Ryan Chen <ryanchen.aspeed@gmail.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
 Lei YU <mine260309@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2018 06:37:39 -0000

On 17 July 2018 at 19:15, Benjamin Herrenschmidt
<benh@kernel.crashing.org> wrote:
> On Tue, 2018-07-17 at 14:04 +0800, Ryan Chen wrote:
>> On Wed, Jul 11, 2018 at 03:47:56PM +1000, Benjamin Herrenschmidt wrote:
>> > On Wed, 2018-07-11 at 13:17 +0800, Ryan Chen wrote:
>> > > In Aspeed's SoC, all IP clk gating and pll parameter is in scu
>> > > controller, before IP driver probe, scu driver need prepare for it.
>> > > So buildin_platform_driver to core_initcall.
>> > >
>> > > Signed-off-by: Ryan Chen <ryanchen.aspeed@gmail.com>
>> > > ---
>> > >  drivers/clk/clk-aspeed.c | 7 ++++++-
>> > >  1 file changed, 6 insertions(+), 1 deletion(-)
>> > >
>> > > diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>> > > index 8796b8a..9e55743 100644
>> > > --- a/drivers/clk/clk-aspeed.c
>> > > +++ b/drivers/clk/clk-aspeed.c
>> > > @@ -573,7 +573,12 @@ static struct platform_driver aspeed_clk_driver = {
>> > >           .suppress_bind_attrs = true,
>> > >   },
>> > >  };
>> > > -builtin_platform_driver(aspeed_clk_driver);
>> > > +
>> > > +static int __init aspeed_clk_init(void)
>> > > +{
>> > > + return platform_driver_register(&aspeed_clk_driver);
>> > > +}
>> > > +core_initcall(aspeed_clk_init);
>> > >
>> > >  static void __init aspeed_ast2400_cc(struct regmap *map)
>> > >  {
>> >
>> > It's generally considered dangerous to register drivers at core
>> > initcall time.
>>
>> Understand.
>>
>> But if interrupt controller have clk gating.
>> the scu driver should be eraly than irq chip driver probe.
>> Is this point is reasonable?
>
> I'm not sure I understand what you are trying to solve other than
> making sure the clock driver is loaded before everything else. Joel, do
> we have a way to ensure that ? I noticed all other clock drivers use
> that macro to be initialized at of_clk_init, any reason we don't ?
>>
>> >
>> > Any reason we don't use the generic clock driver registration mechanism
>> > that runs at of_clk_init() time ?
>>
>> I will use "if (gate->reset_idx == aspeed_resets[ASPEED_RESET_SDHCI])",
>> is it suitable ?
>
> I'm on holiday, I don't have the code at hand to check. Joel ? What do
> you reckon ?

We don't need to do this. I mentioned this in my review; we have the
reset added to the clk driver already. With this, reset can be
released via the normal reset controller call in the sdhci driver.
