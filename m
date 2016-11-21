Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tMdQK1yd7zDvWg
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 17:06:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sSkji0+s"; 
 dkim-atps=neutral
Received: by mail-oi0-x243.google.com with SMTP id m75so1829445oig.1
 for <openbmc@lists.ozlabs.org>; Sun, 20 Nov 2016 22:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=VUkE5uql1vLDIQ2m+AQDek7aFlZJAnjB5byIT8rMwYs=;
 b=sSkji0+sYlm2xU99q6uEF+ovsmQmJNPQi/1fKS2vKWfU2WJlsbZ+thdsgoC8Uh3RJf
 MXenQ6XZBrv4UmX8R+k60Fh33TdI0zmJF0KuvnwQ2IKyiWbC/VuSEBY8Znec5uow/1t7
 SmH4ySKhzUPG+YiGflSI23O5HRWaSkko+03CQBwnH0MncUWZsRN0p9TPBNmNw1rUf6di
 vn7mX18MNL9xcQ/QqNMQVQTu4Ju8PaGzVWiGeKmMYVuR+VsfGUWKOmJ8vkQ47ja1VPM0
 s9ooSFw1074YZ5MXoWTCYUp17H4euptajlpbfMf+aImcz0pzIVmWziyFeevJHJlpwPLS
 VL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=VUkE5uql1vLDIQ2m+AQDek7aFlZJAnjB5byIT8rMwYs=;
 b=eFeRJwa3rF7iatp99DtCxFXjIetYRG/2kvYPRN1cz4nlAm+8ylxN83V7ZigPPPg8rP
 iBBCuC9ko9laGOmcN+++86BbYarHD7sS1vDPMjM/5WFz8iUt3JvmJTciwSPHrAAu+UUQ
 ehbC1rwBOzTLbDAGfRAI6uTGpmIpJpTk99yqt8J74ZDLx1Vvrlq7UGGIJAwBqxsUncb1
 zucYdbxPtyexy2y9ZEvV0nGexQPpDYnZTniY6j5cGUtzp+PAL57R9JhlK6IU/5wGoMAJ
 uimiBLAx3F6AOyp1n4lxBPR5EW65n1KjRUhxZrOmGcGG12nnL4wHx/JAmI9tlA6K+VH3
 eGrQ==
X-Gm-Message-State: AKaTC02+APbooDepuXoYZ5i3gdzXw0jLuqtirubdDmck2JatbnfzAX2zQ/8+xR0EXPk9dR4BSWteeZzLAl7cgw==
X-Received: by 10.202.253.208 with SMTP id b199mr4323016oii.142.1479708375495; 
 Sun, 20 Nov 2016 22:06:15 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Sun, 20 Nov 2016 22:05:54 -0800 (PST)
In-Reply-To: <1479707274.5215.19.camel@aj.id.au>
References: <OF6A1A7417.88F14B99-ON0025806F.004E9A7D-8625806F.004EA327@notes.na.collabserv.com>
 <CAA0LjjXej1XQ=voNfX_=5YL21bgjf73WK-UE=OgBcb=Pt=aKhg@mail.gmail.com>
 <1479707274.5215.19.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 21 Nov 2016 16:35:54 +1030
X-Google-Sender-Auth: vnF4EAQ1XCr7YQHYsJPNGmCGCQk
Message-ID: <CACPK8Xd+E7iS--2VGKYgYHHbE3iTGr3hWnyKJx9ioThDvAg5Ag@mail.gmail.com>
Subject: Re: Fw: [PATCH] aspeed-bmc-opp-palmetto: Add GPIO hogs to devicetree
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Christopher Bostic <christopher.lee.bostic@gmail.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>,
 xxpetri@de.ibm.com, zahrens@us.ibm.com
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
X-List-Received-Date: Mon, 21 Nov 2016 06:06:17 -0000

On Mon, Nov 21, 2016 at 4:17 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
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

Yeah no way.

It did motivate me to take a look at the gpio-management daemon that I
think we need to solve this problem.

Cheers,

Joel

>> Currently I'm attempting to grab a descriptor for this without that
>> requirement.
>
> Have you been testing on a Palmetto using an OpenBMC build? If so the
> request should still fail as the patch is applied in the OpenBMC kernel
> build. All I'm proposing here is we move it from OpenBMC into the
> Aspeed kernel tree.
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
