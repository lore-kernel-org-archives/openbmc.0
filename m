Return-Path: <venture@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1r2J0zWWzDqhp
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2017 14:03:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TzscHd44"; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id e7so108862981pfk.0
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jul 2017 21:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=4dcbX5qNDInj95Hv+q4Y71hd2PPBF9zj0cC2LjqifzE=;
 b=TzscHd44Vk4qT2s1T9QtFbpWoKUeUxnSt2LlMjuhM7C/T45QRYfnhVou7ukkm5Ixbq
 Qs7QIWgRkbN/BL4f1sj1GdBellSPJQVFwLNTFSyeSPfX2zNdxWkn6sDuP/XeKBlm99Eq
 7xQR3AmGI2Bw2j3V6z42yboNzxP8K167vGvVfaK+czGVSXB/MgamG99lNjWoDPW+vduy
 91t/5gUg+J7ctAthbi6h/+Mdkh3//n9S5WXMheCO0NmpWGGQdSi999j47Voed8Zh/0zH
 uLgazlPZ3RuWSTDKvwXlYB6x/KH45bb3X2c+zPgJhnaK5TKPywTeexC8HRxFCKWro3Hh
 +Uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=4dcbX5qNDInj95Hv+q4Y71hd2PPBF9zj0cC2LjqifzE=;
 b=PUgv2PAdcIKNfUF6jMIjD/rnVRiHIQAu82QDTc0hxU8h3FpBi7QX/ampYZm3qpdW1x
 VgaiQ8Xqj07ez3d9X3W65Tcs1SY3UWAzNbciQh0/8cSsmi8PdffalEUxwIR5922IQ5fd
 5P2VcFGz3+lIic/0pWKstDpg3aI9WcAmz53+H9QxA9zDYffxEYcwhu5BqRtDC2uyXwRL
 rJmoz8TysqHOKNkc6Kjz5kg/M1lqAEN++j4ORDdqz/axFOBmTNLoKjd6HMM40ydnu0SF
 fxaWxc3AviPJ1IXwtP8ZZDJbtPkLHZlC7SxqJKA3TRgFmdgivbtQ/uSqJiwlDwDtTqq9
 cLJA==
X-Gm-Message-State: AIVw112RT+6VCkPIKON7xc2lqvPtxtdG0wOrq+GCWwkN9+ZNYKPisYKH
 lGFc07bri7MaCuBJfxHGWnEJXM1+yeBk+q8=
X-Received: by 10.98.85.196 with SMTP id j187mr13003864pfb.19.1499140981237;
 Mon, 03 Jul 2017 21:03:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.165.205 with HTTP; Mon, 3 Jul 2017 21:02:40 -0700 (PDT)
In-Reply-To: <AM4PR05MB33309565B8A039D9E92ECB7EA2D60@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <20170630114844.30027-1-c_mykolak@mellanox.com>
 <CACPK8Xe6g2VZUQBwJopcBBLwjzjsxAaX9arw6Gqh7ZO23htGGA@mail.gmail.com>
 <CAO=notzKhBGwE-2f5jS4JhpL9mgmBouzig9NgWgjUGj_VcWjew@mail.gmail.com>
 <DB5PR05MB1224BD072CC2CA2A7E7FB58AEFD60@DB5PR05MB1224.eurprd05.prod.outlook.com>
 <CAO=notz7P3_KLyUP_8m+zP4qj50RMc8cTw+u-HN_d0YFnmh+XA@mail.gmail.com>
 <AM4PR05MB33309565B8A039D9E92ECB7EA2D60@AM4PR05MB3330.eurprd05.prod.outlook.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 3 Jul 2017 21:02:40 -0700
Message-ID: <CAO=noty-OmBK6wvhSpKSC3J9GwEzixu-w5pLTD02kEC=zmnmmw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] aspeed-g5: add aspeed,ast2500-pwm-tacho.
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: Mykola Kostenok <c_mykolak@mellanox.com>,
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
X-List-Received-Date: Tue, 04 Jul 2017 04:03:04 -0000

On Mon, Jul 3, 2017 at 10:19 AM, Vadim Pasternak <vadimp@mellanox.com> wrote:
>
>
>> -----Original Message-----
>> From: openbmc [mailto:openbmc-
>> bounces+yanivab=mellanox.com@lists.ozlabs.org] On Behalf Of Patrick
>> Venture
>> Sent: Monday, July 03, 2017 6:23 PM
>> To: Mykola Kostenok <c_mykolak@mellanox.com>
>> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> Subject: Re: [PATCH linux dev-4.10] aspeed-g5: add aspeed,ast2500-pwm-
>> tacho.
>>
>> On Mon, Jul 3, 2017 at 8:19 AM, Mykola Kostenok
>> <c_mykolak@mellanox.com> wrote:
>> > Thanks.
>> >
>> > Best regards. Mykola Kostenok.
>> >
>> >> -----Original Message-----
>> >> From: Patrick Venture [mailto:venture@google.com]
>> >> Sent: Monday, July 3, 2017 5:54 PM
>> >> To: Joel Stanley <joel@jms.id.au>
>> >> Cc: Mykola Kostenok <c_mykolak@mellanox.com>; OpenBMC Maillist
>> >> <openbmc@lists.ozlabs.org>
>> >> Subject: Re: [PATCH linux dev-4.10] aspeed-g5: add
>> >> aspeed,ast2500-pwm- tacho.
>> >>
>> >> On Sun, Jul 2, 2017 at 11:14 PM, Joel Stanley <joel@jms.id.au> wrote:
>> >> > On Fri, Jun 30, 2017 at 9:18 PM, Mykola Kostenok
>> >> <c_mykolak@mellanox.com> wrote:
>> >> >> Add aspeed,ast2500-pwm-tacho to dtsi.
>> >> >> Enable aspeed,ast2500-pwm-tacho for msn.
>> >> >>
>> >> >> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
>> >> >
>> >> > Patrick, you're our pwm/tach expert. Can you please review this one?
>> >> >
>> >> > Cheers,
>> >> >
>> >> > Joel
>> >> >
>> >> >> ---
>> >> >>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts | 45
>> >> +++++++++++++++++++++++++++
>> >> >>  arch/arm/boot/dts/aspeed-g5.dtsi              | 16 ++++++++++
>> >> >>  2 files changed, 61 insertions(+)
>> >> >>
>> >> >> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> >> >> b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> >> >> index c71a6dbe1410..55d5dc15d136 100644
>> >> >> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> >> >> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> >> >> @@ -144,3 +144,48 @@
>> >> >>         status = "okay";
>> >> >>  };
>> >> >>
>> >> >> +&pwm_tacho {
>> >> >> +       status = "okay";
>> >> >> +       pinctrl-names = "default";
>> >> >> +       pinctrl-0 = <&pinctrl_pwm0_default>;
>> >> >> +
>> >> >> +       fan@0 {
>> >> >> +               reg = <0x00>;
>> >> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>> >> >> +       };
>> >> >> +
>> >> >> +       fan@1 {
>> >> >> +               reg = <0x00>;
>> >> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
>> >> >> +       };
>> >> >> +
>> >> >> +       fan@2 {
>> >> >> +               reg = <0x00>;
>> >> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x02>;
>> >> >> +       };
>> >> >> +
>> >> >> +       fan@3 {
>> >> >> +               reg = <0x00>;
>> >> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x03>;
>> >> >> +       };
>> >> >> +
>> >> >> +       fan@4 {
>> >> >> +               reg = <0x00>;
>> >> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x04>;
>> >> >> +       };
>> >> >> +
>> >> >> +       fan@5 {
>> >> >> +               reg = <0x00>;
>> >> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x05>;
>> >> >> +       };
>> >> >> +
>> >> >> +       fan@6 {
>> >> >> +               reg = <0x00>;
>> >> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x06>;
>> >> >> +       };
>> >> >> +
>> >> >> +       fan@7 {
>> >> >> +               reg = <0x00>;
>> >> >> +               aspeed,fan-tach-ch = /bits/ 8 <0x07>;
>> >> >> +       };
>> >> >> +};
>> >>
>> >> These all use the same pwm? Is that deliberate?
>> >>
>> >
>> > Yes, we have so.
>>
>> Oh, ok.  Well, then that looks fine.
>
> Guys,
> We would like to send a patch which added pwm as a cooling device.
> But this change requires some changes in dts, like:
>
> &pwm_tacho {
>         status = "okay";
>         pinctrl-names = "default";
>         pinctrl-0 = <&pinctrl_pwm0_default>;
>
>         tach-channels {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
>                 fan@0 {
>                         reg = <0x00>;
>                         aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>                 };
> ..

I had a version of the dts that was like this in a way, where it
grouped them together as such a while ago and it was fine.  I have no
problem with re-organizing the layout with groups.

>         pwm-channels {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 #cooling-cells = <2>;
>
>                 pwm@0 {
>                         reg = <0x00>;
>                         cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
>                 };
> ...
>         };
> };
>
> Would it be acceptable to modify pwm layout in dts?
>

I think I'd like to hear from Joel on this change.  From the recent
activity, I get the impression this pwm-tacho controller is now being
used by multiple platforms so we'll converge on a stable layout
shortly if not immediately.

> Thanks,
> Vadim.
>
>>
>> >
>> >> >> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi
>> >> >> b/arch/arm/boot/dts/aspeed-g5.dtsi
>> >> >> index 992242d3b22e..01c86bb71932 100644
>> >> >> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>> >> >> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
>> >> >> @@ -35,6 +35,14 @@
>> >> >>                 i2c13 = &i2c13;
>> >> >>         };
>> >> >>
>> >> >> +       clocks {
>> >> >> +               pwm_tacho_fixed_clk: fixedclk {
>> >> >> +                       compatible = "fixed-clock";
>> >> >> +                       #clock-cells = <0>;
>> >> >> +                       clock-frequency = <24000000>;
>> >> >> +               };
>> >> >> +       };
>> >> >> +
>> >> >>         ahb {
>> >> >>                 compatible = "simple-bus";
>> >> >>                 #address-cells = <1>; @@ -366,6 +374,14 @@
>> >> >>                                 #size-cells = <1>;
>> >> >>                                 ranges = <0 0x1e78a000 0x1000>;
>> >> >>                         };
>> >>
>> >> I didn't put mine behind the ahb.  I am still learning device-tree-fu.
>> >> this likely isn't an issue at all.
>> >>
>> >
>> > Actually It's under apb.
>>
>> In the diagram of the aspeed part, it is under the apb.  I meant in the device
>> tree layout, at least in my version; I don't think I placed it under that parent.
>> So yours is _more_ correct.
>>
>> >
>> >> >> +                       pwm_tacho: pwm-tacho-controller@1e786000 {
>> >> >> +                               compatible = "aspeed,ast2500-pwm-tacho";
>> >> >> +                               #address-cells = <1>;
>> >> >> +                               #size-cells = <0>;
>> >> >> +                               reg = <0x1e786000 0x1000>;
>> >> >> +                               clocks = <&pwm_tacho_fixed_clk>;
>> >> >> +                               status = "disabled";
>> >> >> +                       };
>> >> >>                 };
>> >> >>         };
>> >> >>  };
>> >> >> --
>> >> >> 2.11.0
>> >> >>
