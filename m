Return-Path: <venture@google.com>
Received: from mail-pf0-x22c.google.com (mail-pf0-x22c.google.com
 [IPv6:2607:f8b0:400e:c00::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyPbt6whSzDr4H
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 00:01:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CRRNi9R6"; 
 dkim-atps=neutral
Received: by mail-pf0-x22c.google.com with SMTP id e7so34066517pfk.0
 for <openbmc@lists.ozlabs.org>; Wed, 28 Jun 2017 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Dyfl58z/mVLfI7XOXygCz8VXBcvOgiGM3ECQqN+930w=;
 b=CRRNi9R6mMibPyAffWA2uJm8tfBet8zXXrigRhEVufHGKObAWyxKPbuP6IA+MIYWFt
 rP4qMb7Vl+rA8T6LnhruH7QAZ42+OVUatQ9sWkJT+GPU9p1ClGWemvONQyKgFs6P1Zxe
 etgS/CXnEbIeNIUnzML4cXrvPncjXOf/ovEvR3SlLqTLeJYe4lVf4amz8x/m7cPCoO1v
 p8YX3q4SMdP3K4Q0MVynyGdQhyWgmj1ViZ929IguCZ7jZzg8lh9LFfKhG8UgmNP49fr8
 ZETKQGfAPdnEMF3fmurkvRWq6UdtJtDv342q031cF532L2IxESyVC7jnWy09WMuBU7LV
 3avA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Dyfl58z/mVLfI7XOXygCz8VXBcvOgiGM3ECQqN+930w=;
 b=WNwcEC5ztKkntctiAEXnmkxPmf2qE5IXqTPf8GM/pB7ixnOcRKFDsmlTvTXwMjuGgB
 3rW0Btl5IrKiT9nkLQEaEMMUch0YIG4bW0/6ZUMheDiDpqnlHhm9SMgixBdSoSBRAygt
 HIv5Z2m1h+RjX/gzBT8w6f6IuupH37aJP49I8qtmFXa5HjzDFF/WxQfhFXYZ7lp4Hu1w
 8QW1o+bLrSoITrlCGES1H+woLDaSbFbnk6x6WbrbpC/jOtIzDgH8pfER0d3gG9k1/L2t
 psHrmKNgbIvCPWPJJhIKbaX5KmgwgtOrC5DWuJXCqIc9+TRa2D7sqfNeB9ZZaT6VEnnu
 Ub8Q==
X-Gm-Message-State: AKS2vOw+kKDm4ZUWwGIg9UnL6NAjtFd9KkaU9EeUAJ4U82/pCGaIKNrG
 XNbvJM44I1pXgsOlx67P6+QzWEnAdprx
X-Received: by 10.84.224.142 with SMTP id s14mr12297637plj.195.1498658504529; 
 Wed, 28 Jun 2017 07:01:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.165.205 with HTTP; Wed, 28 Jun 2017 07:01:23 -0700 (PDT)
In-Reply-To: <CACPK8XfH0OPN4Lch-JmNWDpRO_5wPDic+-8dFjA3Dzr0LkvU8w@mail.gmail.com>
References: <20170627134459.125774-1-venture@google.com>
 <CACPK8XfH0OPN4Lch-JmNWDpRO_5wPDic+-8dFjA3Dzr0LkvU8w@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Wed, 28 Jun 2017 07:01:23 -0700
Message-ID: <CAO=notxaRU_R7REqCXYKJDzLFVducV5WBDOJ2YnwTG5p7kDasg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] ARM: dts: aspeed: quanta: Enable pwm
 fans
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Wed, 28 Jun 2017 14:01:47 -0000

On Tue, Jun 27, 2017 at 11:06 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Jun 27, 2017 at 11:14 PM, Patrick Venture <venture@google.com> wrote:
>> Signed-off-by: Patrick Venture <venture@google.com>
>> ---
>> v2: Moved pwm_tacho_fixed_clk to clocks.
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 51 ++++++++++++++++++++++++++++
>>  arch/arm/boot/dts/aspeed-g4.dtsi             |  5 +++
>>  2 files changed, 56 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> index e609c53d58f5..3abc2954d26e 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> @@ -46,6 +46,57 @@
>>                         gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_LOW>;
>>                 };
>>         };
>> +
>> +       pwm_tacho: pwm-tacho-controller@1e786000 {
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +               reg = <0x1E786000 0x1000>;
>
> Nit: convention is to use lowecase for hex numbers in the dt.

Easy fix will come in next version. :D

>
>> +               compatible = "aspeed,ast2500-pwm-tacho";
>> +               clocks = <&pwm_tacho_fixed_clk>;
>> +               pinctrl-names = "default";
>> +               pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default
>> +                       &pinctrl_pwm2_default &pinctrl_pwm3_default>;
>
> It looks like you're using fans 0..7, but you're only requesting the
> pins for the first four fans. Should you be requesting all 8?

The pwm actually drives a pair on this board.  So, we have 8 fans, but
only four active pwm controls.  I don't know if this is a driver issue
but the fans are paired and work as a pair.

>
> Cheers,
>
> Joel
>
>> +
>> +               fan@0 {
>> +                       reg = <0x00>;
>> +                       aspeed,fan-tach-ch = /bits/ 8 <0x00>;
>> +               };
>> +
>> +               fan@1 {
>> +                       reg = <0x01>;
>> +                       aspeed,fan-tach-ch = /bits/ 8 <0x01>;
>> +               };
>> +
>> +               fan@2 {
>> +                       reg = <0x02>;
>> +                       aspeed,fan-tach-ch = /bits/ 8 <0x02>;
>> +               };
>> +
>> +               fan@3 {
>> +                       reg = <0x03>;
>> +                       aspeed,fan-tach-ch = /bits/ 8 <0x03>;
>> +               };
>> +
>> +               fan@4 {
>> +                       reg = <0x00>;
>> +                       aspeed,fan-tach-ch = /bits/ 8 <0x04>;
>> +               };
>> +
>> +               fan@5 {
>> +                       reg = <0x01>;
>> +                       aspeed,fan-tach-ch = /bits/ 8 <0x05>;
>> +               };
>> +
>> +               fan@6 {
>> +                       reg = <0x02>;
>> +                       aspeed,fan-tach-ch = /bits/ 8 <0x06>;
>> +               };
>> +
>> +               fan@7 {
>> +                       reg = <0x03>;
>> +                       aspeed,fan-tach-ch = /bits/ 8 <0x07>;
>> +               };
>> +       };
>>  };
>>
>>  &fmc {
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index a998a00a2728..9cc959fccfa0 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -36,6 +36,11 @@
>>         };
>>
>>         clocks {
>> +               pwm_tacho_fixed_clk: fixedclk {
>> +                       compatible = "fixed-clock";
>> +                       #clock-cells = <0>;
>> +                       clock-frequency = <24000000>;
>> +               };
>>         };
>>
>>         ahb {
>> --
>> 2.13.1.611.g7e3b11ae1-goog
>>
