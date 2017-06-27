Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x241.google.com (mail-yb0-x241.google.com
 [IPv6:2607:f8b0:4002:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wxVqH0PDBzDqj1
 for <openbmc@lists.ozlabs.org>; Tue, 27 Jun 2017 12:53:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uQwQ4cFh"; 
 dkim-atps=neutral
Received: by mail-yb0-x241.google.com with SMTP id 84so812457ybe.0
 for <openbmc@lists.ozlabs.org>; Mon, 26 Jun 2017 19:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=nk1XvGODJJuhF6GfbrIkC15L+RCifqEPu+vptOkJhVU=;
 b=uQwQ4cFhKXHMtElaS/luDH75yre34MX3SkXz1odTN2Yt4LYwApjboxFNYiH3+7YknZ
 sxVALieFSNSdyDNhO3n/D4b+SRY1bmTU/bIYkLJH5N4OTMW56n+od9CWg/QQ/Gw9Lt59
 3lGRq3d4N441+FjQs4TFGkfXI7p7QdW9CiZISAqXE8Rjpi3nkXnRX1H4xiWfmQUKWinw
 K6K+fcnhEaZ0eIeIZI0ZAU8BwybGfg7N4MFBlMkhrQ8iUpz+8YATVm3WTnKRZALFCqt6
 b0z2jDOod2gmvn/eMp0EWGG5Y3VBFz1SEF1eE1cE3I2x1x5snlz4gLiO7vhP7YozDOZc
 6r1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=nk1XvGODJJuhF6GfbrIkC15L+RCifqEPu+vptOkJhVU=;
 b=Bf0QNNbs3QRHf3VSxT+a/AzhpscChCM9e2r3qt0oAliuTlI9pW/CCyM/Mf5RCC8yMO
 K5gv5j/82zq3MbPQjbW1F2U/mn2CvpjPT0h7rgRfP0nfIa0da7XtVirD8khvk1/DuAnz
 RixacrZHtaul2ItC98oIrRmKTsHfN/oV+EFOZWjiGOXpJ7BDB/s869g2so7ytBIIO73B
 zP6MaIsZ0PnsXF+2Fghg0iPiBczaidNc/EJAlt8iR4Z7kLa/IIemIo65cWkrLZI7nm9T
 JHIV1wZJvE7O9YaCidQuLcjf6DvHPDBZPlfWVy3rAX/Ka0aD0ZyIy0lNg+KO2xQJ4V3E
 cjRg==
X-Gm-Message-State: AKS2vOzjpCFvQOSHaBHgCejqy2MMS2X189RH6qqXOfHujSUyLaQfuhho
 yOX1+Lplr/AIrnTSR3czt57nrS1b2Q==
X-Received: by 10.37.88.193 with SMTP id m184mr2269465ybb.39.1498532007097;
 Mon, 26 Jun 2017 19:53:27 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Mon, 26 Jun 2017 19:53:06 -0700 (PDT)
In-Reply-To: <CAO=notxN66ZN1HFvBSKpFrCETcqpsQ7N4q3dUh-iE3gqBje3MQ@mail.gmail.com>
References: <20170623012421.63639-1-venture@google.com>
 <CACPK8XfuBONVYNEQyymzL_g3beDSwwOjvJG5NgL6gL6f1CM-tg@mail.gmail.com>
 <CAO=notxN66ZN1HFvBSKpFrCETcqpsQ7N4q3dUh-iE3gqBje3MQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 27 Jun 2017 12:23:06 +0930
X-Google-Sender-Auth: P1dC1cIVSgeKnpEHSeGga52G1uY
Message-ID: <CACPK8Xc5YJF+_PyKxuw=Lrze62NXnhVLJTh2pvYXjBXNR0ozUw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed: quanta: Enable pwm fans
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 27 Jun 2017 02:53:32 -0000

On Tue, Jun 27, 2017 at 1:37 AM, Patrick Venture <venture@google.com> wrote:
> If you're referring strictly to the clock, maybe I should put it under:
>
> https://github.com/openbmc/linux/blob/dev-4.10/arch/arm/boot/dts/aspeed-g4.dtsi#L38
>
> Which I didn't notice before :)

Yep. Lets stick it there.

>
> Patrick
>
> On Mon, Jun 26, 2017 at 12:18 AM, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Fri, Jun 23, 2017 at 10:54 AM, Patrick Venture <venture@google.com>
>> wrote:
>> > Signed-off-by: Patrick Venture <venture@google.com>
>> > ---
>> >  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 51
>> > ++++++++++++++++++++++++++++
>> >  arch/arm/boot/dts/aspeed-g4.dtsi             |  6 ++++
>> >  2 files changed, 57 insertions(+)
>> >
>> > diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> > b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> > index e609c53d58f5..3abc2954d26e 100644
>> > --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> > +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> > @@ -46,6 +46,57 @@
>> >                         gpios = <&gpio ASPEED_GPIO(B, 3)
>> > GPIO_ACTIVE_LOW>;
>> >                 };
>> >         };
>> > +
>> > +       pwm_tacho: pwm-tacho-controller@1e786000 {
>> > +               #address-cells = <1>;
>> > +               #size-cells = <1>;
>> > +               reg = <0x1E786000 0x1000>;
>> > +               compatible = "aspeed,ast2500-pwm-tacho";
>> > +               clocks = <&pwm_tacho_fixed_clk>;
>> > +               pinctrl-names = "default";
>> > +               pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
>> > +                       &pinctrl_pwm2_default &pinctrl_pwm3_default>;
>> > +
>> > +               fan@0 {
>> > +                       reg = <0x00>;
>> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>> > +               };
>> > +
>> > +               fan@1 {
>> > +                       reg = <0x01>;
>> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x01>;
>> > +               };
>> > +
>> > +               fan@2 {
>> > +                       reg = <0x02>;
>> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x02>;
>> > +               };
>> > +
>> > +               fan@3 {
>> > +                       reg = <0x03>;
>> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x03>;
>> > +               };
>> > +
>> > +               fan@4 {
>> > +                       reg = <0x00>;
>> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x04>;
>> > +               };
>> > +
>> > +               fan@5 {
>> > +                       reg = <0x01>;
>> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x05>;
>> > +               };
>> > +
>> > +               fan@6 {
>> > +                       reg = <0x02>;
>> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x06>;
>> > +               };
>> > +
>> > +               fan@7 {
>> > +                       reg = <0x03>;
>> > +                       aspeed,fan-tach-ch = /bits/ 8 <0x07>;
>> > +               };
>> > +       };
>> >  };
>> >
>> >  &fmc {
>> > diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi
>> > b/arch/arm/boot/dts/aspeed-g4.dtsi
>> > index a998a00a2728..c93b0460cada 100644
>> > --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> > +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> > @@ -184,6 +184,12 @@
>> >                                         reg = <0x2c>;
>> >                                 };
>> >
>> > +                               pwm_tacho_fixed_clk: fixedclk {
>> > +                                       compatible = "fixed-clock";
>> > +                                       #clock-cells = <0>;
>> > +                                       clock-frequency = <24000000>;
>> > +                               };
>>
>> This is a bit strange. I don't think it should live at this spot in
>> the device tree.
>>
>>
>> > +
>> >                                 hwrng@1e6e2078 {
>> >                                         compatible = "timeriomem_rng";
>> >                                         reg = <0x1e6e2078 0x4>;
>> > --
>> > 2.13.1.611.g7e3b11ae1-goog
>> >
>
>
