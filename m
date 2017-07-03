Return-Path: <venture@google.com>
Received: from mail-pg0-x22d.google.com (mail-pg0-x22d.google.com
 [IPv6:2607:f8b0:400e:c05::22d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1WB84kgszDr3p
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2017 01:23:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="i7iVZ1nq"; 
 dkim-atps=neutral
Received: by mail-pg0-x22d.google.com with SMTP id t186so97168990pgb.1
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jul 2017 08:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=wP+NRvnFgE60oKKd9AKZm9UE7RoYrUD5fKvXz3lR5Fw=;
 b=i7iVZ1nquuWgHwFG8kstii59rJYmbScbSaps0J+Q/IaLivGQOHnxiHrX94TyJ9FlX8
 fgdkCITrNenhmFUfbRbc58VD/Qx0clYmtj6h6xZJfRjfgCut1mZZf0QxsTXgDDITTbBn
 Qr4JOLscmCgjYzCl9X6KZGPwDnmzAzcJN3+6nBv7I5/8yMldWuOOtUmLoSfUGiOslyRu
 5bAB3EdCc+ySxloRwR9fHX/Us7UfI53Dmn7zBL1dXG9vamfrffaAOy/7OE/YEe4+alVs
 nX1ZfDLgjPtHxow1NaioBUSP5gA639x0OpvKOpKIuMl0A+6xifd48FdlAypPiITJBMir
 IRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=wP+NRvnFgE60oKKd9AKZm9UE7RoYrUD5fKvXz3lR5Fw=;
 b=k1YH3/pbwYDx+4Kvr2lNgTRCc9s9dYAzDr+eC7dKkoeBqnESeLZQg67nWKtBLho0au
 ErhSbQnSfOPSpDvFRq9XpgdhWuvcwuXKzt9hynwFw+//2tD1zBLlkYPeDjd6q61w2E+U
 CklMLxLBGYM5SeXclalRGBZ/LEsEX0KALQvhnmTeVKytOA1alAFaeZCwZc2j4KhN4vbr
 S5D68hGxDJRsJOvYPB5EkC22MsJCx2TU4zsaqSEIqvMhrrOjwoXJDVonH3Uk44iKPioB
 +7IUV71ibh0hebm/CTTXBOgy44i0NZkzR0JQA8yAyG7zTZJaODrh25JpbBFocxHYVnT+
 Sl2w==
X-Gm-Message-State: AIVw113RE6MFB7Azw7h53rRKvEbrOLDuDqI+SdwEp8OcAG0yVqfn/535
 AJnxFsAZJmwTkYqrXWM3eIM+yekrIr3g
X-Received: by 10.98.43.80 with SMTP id r77mr10440571pfr.92.1499095422723;
 Mon, 03 Jul 2017 08:23:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.165.205 with HTTP; Mon, 3 Jul 2017 08:23:22 -0700 (PDT)
In-Reply-To: <DB5PR05MB1224BD072CC2CA2A7E7FB58AEFD60@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170630114844.30027-1-c_mykolak@mellanox.com>
 <CACPK8Xe6g2VZUQBwJopcBBLwjzjsxAaX9arw6Gqh7ZO23htGGA@mail.gmail.com>
 <CAO=notzKhBGwE-2f5jS4JhpL9mgmBouzig9NgWgjUGj_VcWjew@mail.gmail.com>
 <DB5PR05MB1224BD072CC2CA2A7E7FB58AEFD60@DB5PR05MB1224.eurprd05.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 3 Jul 2017 08:23:22 -0700
Message-ID: <CAO=notz7P3_KLyUP_8m+zP4qj50RMc8cTw+u-HN_d0YFnmh+XA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] aspeed-g5: add aspeed,ast2500-pwm-tacho.
To: Mykola Kostenok <c_mykolak@mellanox.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 03 Jul 2017 15:23:45 -0000

On Mon, Jul 3, 2017 at 8:19 AM, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
> Thanks.
>
> Best regards. Mykola Kostenok.
>
>> -----Original Message-----
>> From: Patrick Venture [mailto:venture@google.com]
>> Sent: Monday, July 3, 2017 5:54 PM
>> To: Joel Stanley <joel@jms.id.au>
>> Cc: Mykola Kostenok <c_mykolak@mellanox.com>; OpenBMC Maillist
>> <openbmc@lists.ozlabs.org>
>> Subject: Re: [PATCH linux dev-4.10] aspeed-g5: add aspeed,ast2500-pwm-
>> tacho.
>>
>> On Sun, Jul 2, 2017 at 11:14 PM, Joel Stanley <joel@jms.id.au> wrote:
>> > On Fri, Jun 30, 2017 at 9:18 PM, Mykola Kostenok
>> <c_mykolak@mellanox.com> wrote:
>> >> Add aspeed,ast2500-pwm-tacho to dtsi.
>> >> Enable aspeed,ast2500-pwm-tacho for msn.
>> >>
>> >> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
>> >
>> > Patrick, you're our pwm/tach expert. Can you please review this one?
>> >
>> > Cheers,
>> >
>> > Joel
>> >
>> >> ---
>> >>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts | 45
>> +++++++++++++++++++++++++++
>> >>  arch/arm/boot/dts/aspeed-g5.dtsi              | 16 ++++++++++
>> >>  2 files changed, 61 insertions(+)
>> >>
>> >> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> >> b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> >> index c71a6dbe1410..55d5dc15d136 100644
>> >> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> >> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> >> @@ -144,3 +144,48 @@
>> >>         status = "okay";
>> >>  };
>> >>
>> >> +&pwm_tacho {
>> >> +       status = "okay";
>> >> +       pinctrl-names = "default";
>> >> +       pinctrl-0 = <&pinctrl_pwm0_default>;
>> >> +
>> >> +       fan@0 {
>> >> +               reg = <0x00>;
>> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>> >> +       };
>> >> +
>> >> +       fan@1 {
>> >> +               reg = <0x00>;
>> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
>> >> +       };
>> >> +
>> >> +       fan@2 {
>> >> +               reg = <0x00>;
>> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x02>;
>> >> +       };
>> >> +
>> >> +       fan@3 {
>> >> +               reg = <0x00>;
>> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x03>;
>> >> +       };
>> >> +
>> >> +       fan@4 {
>> >> +               reg = <0x00>;
>> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x04>;
>> >> +       };
>> >> +
>> >> +       fan@5 {
>> >> +               reg = <0x00>;
>> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x05>;
>> >> +       };
>> >> +
>> >> +       fan@6 {
>> >> +               reg = <0x00>;
>> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x06>;
>> >> +       };
>> >> +
>> >> +       fan@7 {
>> >> +               reg = <0x00>;
>> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x07>;
>> >> +       };
>> >> +};
>>
>> These all use the same pwm? Is that deliberate?
>>
>
> Yes, we have so.

Oh, ok.  Well, then that looks fine.

>
>> >> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi
>> >> b/arch/arm/boot/dts/aspeed-g5.dtsi
>> >> index 992242d3b22e..01c86bb71932 100644
>> >> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>> >> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
>> >> @@ -35,6 +35,14 @@
>> >>                 i2c13 = &i2c13;
>> >>         };
>> >>
>> >> +       clocks {
>> >> +               pwm_tacho_fixed_clk: fixedclk {
>> >> +                       compatible = "fixed-clock";
>> >> +                       #clock-cells = <0>;
>> >> +                       clock-frequency = <24000000>;
>> >> +               };
>> >> +       };
>> >> +
>> >>         ahb {
>> >>                 compatible = "simple-bus";
>> >>                 #address-cells = <1>; @@ -366,6 +374,14 @@
>> >>                                 #size-cells = <1>;
>> >>                                 ranges = <0 0x1e78a000 0x1000>;
>> >>                         };
>>
>> I didn't put mine behind the ahb.  I am still learning device-tree-fu.
>> this likely isn't an issue at all.
>>
>
> Actually It's under apb.

In the diagram of the aspeed part, it is under the apb.  I meant in
the device tree layout, at least in my version; I don't think I placed
it under that parent.  So yours is _more_ correct.

>
>> >> +                       pwm_tacho: pwm-tacho-controller@1e786000 {
>> >> +                               compatible = "aspeed,ast2500-pwm-tacho";
>> >> +                               #address-cells = <1>;
>> >> +                               #size-cells = <0>;
>> >> +                               reg = <0x1e786000 0x1000>;
>> >> +                               clocks = <&pwm_tacho_fixed_clk>;
>> >> +                               status = "disabled";
>> >> +                       };
>> >>                 };
>> >>         };
>> >>  };
>> >> --
>> >> 2.11.0
>> >>
