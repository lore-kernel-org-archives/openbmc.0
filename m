Return-Path: <joel.stan@gmail.com>
Received: from mail-ua0-x242.google.com (mail-ua0-x242.google.com
 [IPv6:2607:f8b0:400c:c08::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tNDlR3yK3zDvkj
 for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2016 16:38:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RxIKBfua"; 
 dkim-atps=neutral
Received: by mail-ua0-x242.google.com with SMTP id b35so766572uaa.1
 for <openbmc@lists.ozlabs.org>; Mon, 21 Nov 2016 21:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=+05Rt5kHem3XeiXzOPQp6tEnNeJL+YoOpJjwNyHcKGc=;
 b=RxIKBfuaa+c6bjPEYWyTA2FNrBkK42vzWD2PggHFOdkoTZkTw+HAp95VGCdrshDc9C
 cr5zdEpcG2jjLJxqkYh+qVxxyHR2Fb/w4Cc/dhKWzSsteORwEGxwZBGvaxDToGu0vE4/
 g5EvgjCkTPv10eF7UQbiulsydjTUsejzPhCXasPsDHUFWeCDzWa4Jc490xpz1E0MBFgF
 fNC5lijg15vWLppWsU0r61wWw30DkWQbwlrraVxxE2vj8592VaLKfh+TnTiVNjjIVaX9
 z809tMHWf9+pnWfV+bmMDC4wCCYZZQaQNvMS5uxEAva7iklNyBSNPTGElNzuMPggrWuF
 yjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=+05Rt5kHem3XeiXzOPQp6tEnNeJL+YoOpJjwNyHcKGc=;
 b=O3o0riO362x9GyLxhsMDH2n5jJp9VXSUIyJ1CugzhFK5mqvMnL5HJJCV4lOVCUzVNT
 0xxgB/nM4dDjl4hiNQ6ww40oLTTe8dumeDJOhYc+GNVfKJTt2D+wC7PP8qCbSqcbxZcz
 it00/HokWwY7FN/IfCKrrmejqaV0nixrstiNSNKh1HYM6PuODZa+8TfCi9QypfdG45Mj
 uvDPm7wQVrxxfh3qPePAShxF2alKBOe0dY9gOXAwwmzx+P98CX4xjKNB09HrGlYbFXm+
 MCZi2aYG5FE9KYW6hz3uS+trXmeS+INwCWMZX94fDB1k8TpgyfD+5qyiYd0/6CLHtGni
 5dEg==
X-Gm-Message-State: AKaTC025nBNlB+cVhBFB6vWIO7S+LDLM7qxsYIBzQWcZ6/GTTP8SFk2O2/073krd7nrnSHTxaHPhO9pyTL0eNw==
X-Received: by 10.176.82.181 with SMTP id v50mr8102185uav.31.1479793089119;
 Mon, 21 Nov 2016 21:38:09 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.0.193 with HTTP; Mon, 21 Nov 2016 21:37:48 -0800 (PST)
In-Reply-To: <1479792147.2503.30.camel@aj.id.au>
References: <20161122040849.31604-1-joel@jms.id.au>
 <20161122040849.31604-4-joel@jms.id.au>
 <1479792147.2503.30.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 22 Nov 2016 16:07:48 +1030
X-Google-Sender-Auth: LCfbwdWRxedPOq_RjpDXfpLQJx0
Message-ID: <CACPK8Xeam22AU+U_Vpg+nd_yyaNye-vJ=W5rbE-uD460K-ryBQ@mail.gmail.com>
Subject: Re: [PATCH 4/7] arm: dts: aspeed: Remove unused pinmux from Palmetto
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Tue, 22 Nov 2016 05:38:12 -0000

On Tue, Nov 22, 2016 at 3:52 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Tue, 2016-11-22 at 14:38 +1030, Joel Stanley wrote:
>> These were set as the common code in the board file set them to these
>> states. A close reading of the schmeatic suggests this is not required.
>>
>> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 9 +--------
>>  1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> index 8fe248f4d531..d16c67935499 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> @@ -71,14 +71,7 @@
>> >     pinctrl-0 = <&pinctrl_flbusy_default &pinctrl_flwp_default
>>
>> >                     &pinctrl_vgahs_default &pinctrl_vgavs_default
>> > -                   &pinctrl_ddcclk_default &pinctrl_ddcdat_default
>> -
>> > -                   &pinctrl_pwm1_default &pinctrl_pwm2_default
>> > -                   &pinctrl_pwm3_default &pinctrl_pwm4_default
>> > -                   &pinctrl_pwm5_default &pinctrl_pwm6_default
>> > -                   &pinctrl_pwm7_default
>> -
>> > -                   &pinctrl_bmcint_default &pinctrl_flack_default>;
>> +                     &pinctrl_ddcclk_default &pinctrl_ddcdat_default>;
>
> Do we need any of it?

I don't think so. We could try removing the rest. Can you send a patch?

>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
>>  };
>>
>>  &mac0 {
