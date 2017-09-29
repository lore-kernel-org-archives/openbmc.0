Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:400c:c0c::243; helo=mail-wr0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aurxVKt8"; 
 dkim-atps=neutral
Received: from mail-wr0-x243.google.com (mail-wr0-x243.google.com
 [IPv6:2a00:1450:400c:c0c::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y3LVg2r6PzDsTN
 for <openbmc@lists.ozlabs.org>; Fri, 29 Sep 2017 15:59:38 +1000 (AEST)
Received: by mail-wr0-x243.google.com with SMTP id z1so349591wre.1
 for <openbmc@lists.ozlabs.org>; Thu, 28 Sep 2017 22:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=OPuZifpHlDTaWjQAPud5eDWtYpyloteqgW1SzUudVAo=;
 b=aurxVKt8kzXEZdoqPspAcuIaZ5YBLfxm2dVLVMhxCa7IRHHNO7Z3B+onC94B9Baxe8
 eZPfROT7DHFq/DydQiPF6QNHy44aTX8uhIc25DnKg27nFemJxULQP/8IqdU4+FBwDmH5
 zxcEco/rwhsIuNkAQucT0eGmLll8ddeqXJgd2R0Ysmgf6panXKbsbrDmIpmenu4cau5p
 BXxU+VZnsvH9gh17JcOxNLbyt8nPUnY7+6l/rLVt29VbHoCM50DhF0ADPxvnmeVbbMeZ
 8XR1fkBoDkhHOBAuGnN/i1TPuPO5nED46aEYfWvZzpSAEKHvg9HjeiyglkFqatgrUqFL
 t9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=OPuZifpHlDTaWjQAPud5eDWtYpyloteqgW1SzUudVAo=;
 b=PtsjkamrbaHDnDklbcBDJSRDF+qSpq2xMceXn4dhHQxBUd2k2eM05VhM3pGpOktNXX
 z7DJ0BSFspGf2q1w1OYSUdZZUyrv2o2QhsdAmg9HPa9UbETP0c84JcdjPXKzWAvkdxWD
 VEggaQuY5ngH/PYXZbTUq41EhDxEK/9CUXKH24vIo8YQWBf5GL1YRM2mgB3vHf3D/C5z
 JaYdDdlHzqOs0owSA1EcUWtN6bI7gxFgq+gAM8xqb1j0DKRB7nXfRf2/x81RFKIRoZgU
 02cUWgyVub+ijUYSIoH5aX2V0UpEC3EOrfSRXsEjdMvzfB+WoXmn/yYoPpu/g6MjCIra
 XS6A==
X-Gm-Message-State: AHPjjUh52Wa9ueyWtr3k+3iwi+I6fb1K9082+1GTUG7PO80fp9mBzTEq
 ba/k31PvMOKpW00SS4XluSGM3mfwKfyiRIFx6tfm9A==
X-Google-Smtp-Source: AOwi7QCEgFIkYsduDKEX39SHAzdjz9pZCujjPBTetWUTZLg9sMa2Q647dxFkjBv+7dVwBWpQ6YHH21UuEO+sfKo7MAY=
X-Received: by 10.46.71.193 with SMTP id u184mr3064413lja.166.1506664775521;
 Thu, 28 Sep 2017 22:59:35 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Thu, 28 Sep 2017 22:59:15 -0700 (PDT)
In-Reply-To: <HK2PR02MB15240578C4FBBB5691498874D97E0@HK2PR02MB1524.apcprd02.prod.outlook.com>
References: <HK2PR02MB15240578C4FBBB5691498874D97E0@HK2PR02MB1524.apcprd02.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 29 Sep 2017 15:59:15 +1000
X-Google-Sender-Auth: 5VAm6nlIHg_oyAu_v2Luj6bnboo
Message-ID: <CACPK8Xf9SqzavrCzmzqzc=55MmupAT4k7GL1Ta549M6FN3UvQA@mail.gmail.com>
Subject: Re: [PATCH] arm:dts: add max31785 to Garrison device tree
To: Yi Li <adamliyi@msn.com>, Andrew Jeffery <andrew@aj.id.au>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2017 05:59:40 -0000

On Fri, Sep 29, 2017 at 1:15 PM, Yi Li <adamliyi@msn.com> wrote:
> Add max31785 device tree node to enable Fan Control on Garrison.

Looks okay to me. I'll get Andrew's ack on the bindings before I merge.

Cheers,

Joel

>
> Signed-off-by: Yi Li <adamliyi@msn.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts | 89 +++++++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> index c67fe58..6b96e36 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-garrison.dts
> @@ -63,6 +63,95 @@
>         status = "okay";
>  };
>
> +&i2c3 {
> +       status = "okay";
> +
> +       // FIR (fan / SATA backplane)
> +       max31785@52 {
> +               compatible = "max,max31785";
> +               reg = <0x52>;
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               fan@0 {
> +                       compatible = "pmbus-fan";
> +                       reg = <0>;
> +                       tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
> +               };
> +
> +               fan@1 {
> +                       compatible = "pmbus-fan";
> +                       reg = <1>;
> +                       tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
> +               };
> +
> +               fan@2 {
> +                       compatible = "pmbus-fan";
> +                       reg = <2>;
> +                       tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
> +               };
> +
> +               fan@3 {
> +                       compatible = "pmbus-fan";
> +                       reg = <3>;
> +                       tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
> +               };
> +
> +               fan@4 {
> +                       compatible = "pmbus-fan";
> +                       reg = <4>;
> +                       tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
> +               };
> +
> +               fan@5 {
> +                       compatible = "pmbus-fan";
> +                       reg = <5>;
> +                       tach-pulses = <2>;
> +                       maxim,fan-rotor-input = "tach";
> +                       maxim,fan-pwm-freq = <25000>;
> +                       maxim,fan-dual-tach;
> +                       maxim,fan-no-watchdog;
> +                       maxim,fan-no-fault-ramp;
> +                       maxim,fan-ramp = <2>;
> +                       maxim,fan-fault-pin-mon;
> +               };
> +       };
> +};
>
>  &i2c4 {
>         status = "okay";
> --
> 1.9.1
>
