Return-Path: <christopher.lee.bostic@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMyV35HcZzDvrr
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 05:55:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hdlG+RKO"; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id w194so25377914vkw.3
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 10:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=TC4e5zS44owBw1dqWrbg+6n9rzHdAouC0f3rvtUxyVg=;
 b=hdlG+RKOQA2rmMlVS0Juwk/kEMHYD8I9RKQtekFUhzcH4L1PVSW/yLgKfzGCL7QxYP
 /7uqv3kipIj4F/rpjFTkjuW7fx26kb0JwtTdoaj0VMDllUFH2EuwDwNrmbomTzdVvfoZ
 eF1GY6nGMebtJF3soyTGBpQYBD8ulJDFhnC9AO7IZT00dChqMs3UYkplg0S7ZABiCI7U
 mHIBLh8y1eUAOsvKW7klip4AgX+4CTDeCYPi1ko6YidRsQdxr1Xu///35z1cY2lH9oU5
 wY3Koop5NX9IMW1U051ajVSV2vqKBCMmuyrrSOw44ShzBYnq6nfTNjEMOf36HgFyjdGz
 dPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TC4e5zS44owBw1dqWrbg+6n9rzHdAouC0f3rvtUxyVg=;
 b=B+LYMz0aeq3gIlgiembRkmnnXsJeDloVEZ2OsQyBE4MvGWrSkahm+zawAoK0VO2M6e
 Bh/uyJCCVbHiw4pubV0Z0b8SK6m6vvpe1UemwQJPmoj3cbxA8J5lfpj0wXRvinBtl1y6
 6XvY/LQY6+ZLD6LwvYg2k1/kCh6I6wE9b+jSJGuMsPWxnMgRPuN4zXstkNAQmGyzulxt
 WIvkwEjum3kU0uuhafX58Om4hNQ+3E6yjqBi1DjPhbu7uenS36RoYK1aH0fHLhRiHxxf
 cSg0CGmY6I5EM6sLlqSHCeuhOyr4JN2qh/0GRH7EaiX/ZmT3OvQOhuUqml1lmUfaffyv
 O4IQ==
X-Gm-Message-State: AKaTC02L2tRA4kasv9XYabBELFlny5zIuSvC5gqp4bIPtLsx3rWYXb63Vw3kkULZSESvVPoZrbQ3SrWqz+8PCA==
X-Received: by 10.31.94.84 with SMTP id s81mr7428205vkb.167.1479754537604;
 Mon, 21 Nov 2016 10:55:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.36.243 with HTTP; Mon, 21 Nov 2016 10:55:37 -0800 (PST)
In-Reply-To: <1479707274.5215.19.camel@aj.id.au>
References: <OF6A1A7417.88F14B99-ON0025806F.004E9A7D-8625806F.004EA327@notes.na.collabserv.com>
 <CAA0LjjXej1XQ=voNfX_=5YL21bgjf73WK-UE=OgBcb=Pt=aKhg@mail.gmail.com>
 <1479707274.5215.19.camel@aj.id.au>
From: Christopher Bostic <christopher.lee.bostic@gmail.com>
Date: Mon, 21 Nov 2016 12:55:37 -0600
Message-ID: <CAA0LjjVH3BEtu7et_2VtpLXgbrHOfRTNvpQFL8c0Eh-kdDLH_Q@mail.gmail.com>
Subject: Re: Fw: [PATCH] aspeed-bmc-opp-palmetto: Add GPIO hogs to devicetree
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>,
 Jeremy Kerr <jk@ozlabs.org>, xxpetri@de.ibm.com, zahrens@us.ibm.com
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
X-List-Received-Date: Mon, 21 Nov 2016 18:55:40 -0000

On Sun, Nov 20, 2016 at 11:47 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Chris,
>
>>
>> Hi Andrew,
>>
>> I notice Pin H6 is in your list assigned as a gpio-hog.   This is a
>> pin I use for the voltage direction control via the translator for
>> openFSI.  Not familiar with the history here but is that pin being
>> used for other purposes or is required to be flagged as a gpio-hog?
>
> Ultimately none of these should be hogged. This was just a brain-dead
> way to get the GPIOs in a state that can boot a Palmetto host. There
> was a time where several issues including wrong GPIO state prevented
> OpenBMC from booting a Palmetto host for a month or so, hence this
> patch.
>
> Happy to drop the H6 hog if we still boot okay. I'm still waiting for
> Joel to weigh in on whether he wants to take it.
>
>
>> Currently I'm attempting to grab a descriptor for this without that
>> requirement.
>
> Have you been testing on a Palmetto using an OpenBMC build? If so the
> request should still fail as the patch is applied in the OpenBMC kernel
> build. All I'm proposing here is we move it from OpenBMC into the
> Aspeed kernel tree.

Hi Andrew,

Yes I have been testing on Palmetto using OpenBMC builds.  The H6
pin reports as busy when I request it so for now I have a workaround
to bypass the gpio interface.  All the other pins I grab via the normal
dts gpio devm_gpio_get interfaces.   Once the H6 hog can be removed,
assuming no other code needs it, I can remove my workaround in
the OpenFSI code.

Thanks,
Chris

>
> Andrew
>
>>
>> Thanks,
>> Chris
>>
>>
>> > diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> > b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> > index 21619fd8cd8d..5c689613e5bd 100644
>> > --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> > +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> > @@ -167,6 +167,133 @@
>> > output-low;
>> > line-name = "func_mode2";
>> > };
>> > +
>> > + pin_gpio_a0 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
>> > + input;
>> > + line-name = "A0";
>> > + };
>> > +
>> > + pin_gpio_a1 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
>> > + output-high;
>> > + line-name = "A1";
>> > + };
>> > +
>> > + pin_gpio_b1 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(B, 1) GPIO_ACTIVE_HIGH>;
>> > + output-high;
>> > + line-name = "B1";
>> > + };
>> > +
>> > + pin_gpio_b2 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(B, 2) GPIO_ACTIVE_HIGH>;
>> > + output-high;
>> > + line-name = "B2";
>> > + };
>> > +
>> > + pin_gpio_b7 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(B, 7) GPIO_ACTIVE_HIGH>;
>> > + output-high;
>> > + line-name = "B7";
>> > + };
>> > +
>> > + pin_gpio_d1 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(D, 1) GPIO_ACTIVE_HIGH>;
>> > + output-high;
>> > + line-name = "D1";
>> > + };
>> > +
>> > + pin_gpio_f1 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(F, 1) GPIO_ACTIVE_HIGH>;
>> > + input;
>> > + line-name = "F1";
>> > + };
>> > +
>> > + pin_gpio_f4 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(F, 4) GPIO_ACTIVE_HIGH>;
>> > + input;
>> > + line-name = "F4";
>> > + };
>> > +
>> > + pin_gpio_f5 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(F, 5) GPIO_ACTIVE_HIGH>;
>> > + input;
>> > + line-name = "F5";
>> > + };
>> > +
>> > + pin_gpio_f7 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(F, 7) GPIO_ACTIVE_HIGH>;
>> > + output-high;
>> > + line-name = "F7";
>> > + };
>> > +
>> > + pin_gpio_g3 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(G, 3) GPIO_ACTIVE_HIGH>;
>> > + output-high;
>> > + line-name = "G3";
>> > + };
>> > +
>> > + pin_gpio_g4 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(G, 4) GPIO_ACTIVE_HIGH>;
>> > + input;
>> > + line-name = "G4";
>> > + };
>> > +
>> > + pin_gpio_g5 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(G, 5) GPIO_ACTIVE_HIGH>;
>> > + input;
>> > + line-name = "G5";
>> > + };
>> > +
>> > + pin_gpio_h0 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(H, 0) GPIO_ACTIVE_HIGH>;
>> > + input;
>> > + line-name = "H0";
>> > + };
>> > +
>> > + pin_gpio_h1 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(H, 1) GPIO_ACTIVE_HIGH>;
>> > + input;
>> > + line-name = "H1";
>> > + };
>> > +
>> > + pin_gpio_h2 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(H, 2) GPIO_ACTIVE_HIGH>;
>> > + output-high;
>> > + line-name = "H2";
>> > + };
>> > +
>> > + pin_gpio_h6 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
>> > + output-high;
>> > + line-name = "H6";
>> > + };
>> > +
>> > + pin_gpio_h7 {
>> > + gpio-hog;
>> > + gpios = <ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
>> > + output-high;
>> > + line-name = "H7";
>> > + };
>> > +
>> > };
>> >
>> > &vuart {
>> > --
>> > 2.7.4
>> >
>> > _______________________________________________
>> > openbmc mailing list
>> > openbmc@lists.ozlabs.org
>> > https://lists.ozlabs.org/listinfo/openbmc
>> >
>> >
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
