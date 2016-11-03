Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x241.google.com (mail-oi0-x241.google.com
 [IPv6:2607:f8b0:4003:c06::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t90L91nLWzDt20
 for <openbmc@lists.ozlabs.org>; Fri,  4 Nov 2016 09:40:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=m/v5yayQ; 
 dkim-atps=neutral
Received: by mail-oi0-x241.google.com with SMTP id 62so9268317oif.1
 for <openbmc@lists.ozlabs.org>; Thu, 03 Nov 2016 15:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=rsIlFMrj0LRbIPYPtPU1DlFmo20ud4637Ku8l6lVtB4=;
 b=m/v5yayQGJivyiJDIbW2YcH+tyqxoVhTXeWmhLMkDhv3J/snsx1oqQKXKGliPKjYKg
 xmzf9D4GmDi2XiRCD8NL8SRWxp6KHbo6Dw3ZCEofkcC+/q/9DcQNXgwkitmAub/gFnvO
 yS+BiICxcE42B9Nu4ut5WsBWxnFHH7aj7atl6SGjFQucCR4eqhB0m0YlEolBunXvjjDO
 EtfeTiLsP8rzNeFTkcbO7G3bm8Sj89HHcgEJqOcnHWoO/Rd5WJICFfXdf92LXAFSL+sI
 nCwehrGtD8e1+aQI02IXmVOwXho3uOfLH460oddVmmjHJ9X6l7/UMNdGzkJDbEUEou1G
 RU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=rsIlFMrj0LRbIPYPtPU1DlFmo20ud4637Ku8l6lVtB4=;
 b=OO0lRlnQtSTrSW7vK271bylY1zMrF/4QgK9BQp3+9Gv4Y3reWQQQaJFWtB6YPdPKDK
 uN/SYrUryLasxiD1wHMpatkJopg1WWZX8UXFJheisJeepfNzGGYZfV+69X84PeUwW0z5
 yDq0fzcuAMdw2kUKPClxfDRi4L2vJJlLqhFaShjR+2Y6vBKRcu5psV2JWBAHIjV7nmlY
 56jXVqDW3XowGZQvnsCLnKGIgLHkW31bAJO5dOKNLsxbia/TY4rba43aSZClE6SLq+Gl
 nL3dZZfPlf2L5YQ+YeFw31EAKePyEMh7YaarPp7ifHXBFTYrRVXKPc7UR2rho9x9f+3g
 Qs8w==
X-Gm-Message-State: ABUngvcHp2LKhxJnzTrG5zB2cTxwZty8EzeTh0zz/7TFaSgQxYiiyI9Sy3e6JaAl1OHuC022wnYdqctYZ5A/EA==
X-Received: by 10.202.77.140 with SMTP id a134mr4360104oib.137.1478212847517; 
 Thu, 03 Nov 2016 15:40:47 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.107.226 with HTTP; Thu, 3 Nov 2016 15:40:27 -0700 (PDT)
In-Reply-To: <1478145374.27396.20.camel@aj.id.au>
References: <20161103000537.19830-1-joel@jms.id.au>
 <1478145374.27396.20.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 4 Nov 2016 09:10:27 +1030
X-Google-Sender-Auth: 8U4rPOO__ErozC1qW5XCysqqqOc
Message-ID: <CACPK8Xeexy3iRzHwOf6fxhgVoikJ0dCdyo3TNGh-pbkUKruPxA@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: ast2500-evb: Mux MDIO pins
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
X-List-Received-Date: Thu, 03 Nov 2016 22:40:49 -0000

On Thu, Nov 3, 2016 at 2:26 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 2016-11-03 at 10:35 +1030, Joel Stanley wrote:
>> These are required for the MAC to talk to the PHY.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks for the review.

Applied to dev-4.7.

Cheers,

Joel
>
>> ---
>>  arch/arm/boot/dts/aspeed-ast2500-evb.dts | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> index 33b3907c436b..37b6793698e0 100644
>> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> @@ -47,14 +47,14 @@
>>       status = "okay";
>>
>>       pinctrl-names = "default";
>> -     pinctrl-0 = <&pinctrl_rgmii1_default>;
>> +     pinctrl-0 = <&pinctrl_rgmii1_default &pinctrl_mdio1_default>;
>>  };
>>
>>  &mac1 {
>>       status = "okay";
>>
>>       pinctrl-names = "default";
>> -     pinctrl-0 = <&pinctrl_rgmii2_default>;
>> +     pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
>>  };
>>
>>  &i2c3 {
