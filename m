Return-Path: <venture@google.com>
Received: from mail-pf0-x236.google.com (mail-pf0-x236.google.com
 [IPv6:2607:f8b0:400e:c00::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1VWv2sl9zDr1n
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2017 00:54:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="E/Y2LVD5"; 
 dkim-atps=neutral
Received: by mail-pf0-x236.google.com with SMTP id c73so101424810pfk.2
 for <openbmc@lists.ozlabs.org>; Mon, 03 Jul 2017 07:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nL6PjxwoMZu8PrqNROkwJtJYeuHtPu6yhx4qMpyR/Og=;
 b=E/Y2LVD5BCzGhbnDZAgxAY8BndSAZDbpGG+PY+upnlFIwkeUYGuMue7PorxJt8++kM
 SQwx3qwtIGDMxHFETG+M/scX9r/1CGroM1iJ/5AuYpeJwMMfS8NInVLqxbK7QUeZdl+2
 DjaiU/4qYlxBVorcvCdZWMflxg0i27iWv/10+2zhhPUs18mAEiE1xBKRVAeM0eSD18IG
 PgXQD3Q5SZBVl94Oe/Mhw/Dk+wbHJxGRbnpKIVXoXP6RnJlKeGQpO6FGO0oWVDWQCAMY
 KAsrxGgv5GuMWqn9tJWWA+tXiM3WgE+Gysb/yCxqIXGV6HpWcD3g8AD2aieiQYbg6/YM
 1JTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nL6PjxwoMZu8PrqNROkwJtJYeuHtPu6yhx4qMpyR/Og=;
 b=s+vspMKYsYxDhJ7aFTfpU6xVte7p2tOa6+3IycnS3wUoOa3nWxZqaDXRhUxfI+7v/Q
 DMiKnbaL7P8y97UdKupTWPREbhqJM+07H8ylj1D6SaXm0BLn/V23Ko2oq+wGHmAw48Uq
 lZVkPE7oty7QM13nKQTG8mt6rH8jpvvLjXSdFzx8un+7PT2VsYxbb6y+mw+Dab9GddXS
 QGJCMHp3E0AcllleJhO5yBauNdnbfu0auqWa21d6j4GuSj6eHxlt6fIwLWq6R4FppCmZ
 NO6gpRs3cb/gbT37qfgFNjF02ybH3iYBzqFnoJZMgbmdpCqlT7o+M5DGtvrAp+uFqkJJ
 INFQ==
X-Gm-Message-State: AIVw112UsJj1DXyKPvIrzEaAdjSLN9m7XvHtFmJk/3tbUuh1kQoMUNFD
 YyYU7itJIo64uOq6cqO9rZE0rDQtiPFS
X-Received: by 10.99.53.135 with SMTP id c129mr10900333pga.68.1499093639730;
 Mon, 03 Jul 2017 07:53:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.165.205 with HTTP; Mon, 3 Jul 2017 07:53:39 -0700 (PDT)
In-Reply-To: <CACPK8Xe6g2VZUQBwJopcBBLwjzjsxAaX9arw6Gqh7ZO23htGGA@mail.gmail.com>
References: <20170630114844.30027-1-c_mykolak@mellanox.com>
 <CACPK8Xe6g2VZUQBwJopcBBLwjzjsxAaX9arw6Gqh7ZO23htGGA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 3 Jul 2017 07:53:39 -0700
Message-ID: <CAO=notzKhBGwE-2f5jS4JhpL9mgmBouzig9NgWgjUGj_VcWjew@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] aspeed-g5: add aspeed,ast2500-pwm-tacho.
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Mon, 03 Jul 2017 14:54:04 -0000

On Sun, Jul 2, 2017 at 11:14 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Fri, Jun 30, 2017 at 9:18 PM, Mykola Kostenok <c_mykolak@mellanox.com> wrote:
>> Add aspeed,ast2500-pwm-tacho to dtsi.
>> Enable aspeed,ast2500-pwm-tacho for msn.
>>
>> Signed-off-by: Mykola Kostenok <c_mykolak@mellanox.com>
>
> Patrick, you're our pwm/tach expert. Can you please review this one?
>
> Cheers,
>
> Joel
>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts | 45 +++++++++++++++++++++++++++
>>  arch/arm/boot/dts/aspeed-g5.dtsi              | 16 ++++++++++
>>  2 files changed, 61 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> index c71a6dbe1410..55d5dc15d136 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-mellanox-msn.dts
>> @@ -144,3 +144,48 @@
>>         status = "okay";
>>  };
>>
>> +&pwm_tacho {
>> +       status = "okay";
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&pinctrl_pwm0_default>;
>> +
>> +       fan@0 {
>> +               reg = <0x00>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>> +       };
>> +
>> +       fan@1 {
>> +               reg = <0x00>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x01>;
>> +       };
>> +
>> +       fan@2 {
>> +               reg = <0x00>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x02>;
>> +       };
>> +
>> +       fan@3 {
>> +               reg = <0x00>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x03>;
>> +       };
>> +
>> +       fan@4 {
>> +               reg = <0x00>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x04>;
>> +       };
>> +
>> +       fan@5 {
>> +               reg = <0x00>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x05>;
>> +       };
>> +
>> +       fan@6 {
>> +               reg = <0x00>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x06>;
>> +       };
>> +
>> +       fan@7 {
>> +               reg = <0x00>;
>> +               aspeed,fan-tach-ch = /bits/ 8 <0x07>;
>> +       };
>> +};

These all use the same pwm? Is that deliberate?

>> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
>> index 992242d3b22e..01c86bb71932 100644
>> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
>> @@ -35,6 +35,14 @@
>>                 i2c13 = &i2c13;
>>         };
>>
>> +       clocks {
>> +               pwm_tacho_fixed_clk: fixedclk {
>> +                       compatible = "fixed-clock";
>> +                       #clock-cells = <0>;
>> +                       clock-frequency = <24000000>;
>> +               };
>> +       };
>> +
>>         ahb {
>>                 compatible = "simple-bus";
>>                 #address-cells = <1>;
>> @@ -366,6 +374,14 @@
>>                                 #size-cells = <1>;
>>                                 ranges = <0 0x1e78a000 0x1000>;
>>                         };

I didn't put mine behind the ahb.  I am still learning device-tree-fu.
this likely isn't an issue at all.

>> +                       pwm_tacho: pwm-tacho-controller@1e786000 {
>> +                               compatible = "aspeed,ast2500-pwm-tacho";
>> +                               #address-cells = <1>;
>> +                               #size-cells = <0>;
>> +                               reg = <0x1e786000 0x1000>;
>> +                               clocks = <&pwm_tacho_fixed_clk>;
>> +                               status = "disabled";
>> +                       };
>>                 };
>>         };
>>  };
>> --
>> 2.11.0
>>
