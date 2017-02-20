Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vS09b4WbtzDqD0
 for <openbmc@lists.ozlabs.org>; Tue, 21 Feb 2017 10:25:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="FbhSPINy"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id 2so3055023ywn.3
 for <openbmc@lists.ozlabs.org>; Mon, 20 Feb 2017 15:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=iDL0NobuIpeN4E1BpdQI5M2CUEVFq9OABL69vQ+zHRU=;
 b=FbhSPINyZwm6e87kDXQ3qrjJqadohoThJUAYhmIx5/Gq7dOfyUfZ17JFhN31Pbe2aO
 HhQ/5x2NzlF1PMmEX34+kxE97W5Eq6nQjZGuS4Wlfzew0YiZuwqr7AJZnV5pYYCtzo6N
 I7C4pGlbl7M2cnUcBUrKjSxf1vNZwyDNCK8txhn/RZfidnY2GJP6W/HS2fTBIj/K53LG
 chUCqbUmNeWfzZX8qILIV+9zBn8JSyHUSwXXr3GpyaAy55VJRdQN/+uJNTBEzG+IIkjh
 z8kqhWDMI0PeT6F7S7SnC2ElNzwqnUNWfUii/Vuz7wwL3yc+Z/sSgus7Dy71J24qbs2G
 gatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=iDL0NobuIpeN4E1BpdQI5M2CUEVFq9OABL69vQ+zHRU=;
 b=qebwOdzWnC2WQ6UYFqt5e6WccGCtHSzHHeHBrnbsR0kbQam/1ZDm4zoEigQUS4Ud1g
 duH73EI2kBIEd5J3AdVNzIXAMZE2sr3Os2fYB83S3+4a4HH17bgjxYSSeLlSXOZCCrZz
 zH6axTE2JUW4IrAQXe7ZVTxHoGqhiYTJC/go+26JgeUjekrGa6l+WXiuhACeWxPBVznf
 qmNOiTyLARUlmzXYMlxjk8CxBLKEwfFFm0STsvIXsmDFNiGvIGtXckONFMYu9OE4TKqu
 7Uq/p0sV15kx5dwEpB07F8oTAmdgrNReS6wJdyLyUvMQfchh5Qv9UtVe9cfeGFEXbPjt
 lWng==
X-Gm-Message-State: AMke39l4w3QK+yDac6fh5BmmIvf1ZvRrXmB/ZV5KKGiT3tReB3wv0J2xl0M1ya78RoPJJ+8JksPg4cfbQHpzvQ==
X-Received: by 10.13.247.134 with SMTP id h128mr20678252ywf.56.1487633137330; 
 Mon, 20 Feb 2017 15:25:37 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.27.133 with HTTP; Mon, 20 Feb 2017 15:25:16 -0800 (PST)
In-Reply-To: <4154cce0-0565-0dc7-a4c9-b8877285c011@linux.vnet.ibm.com>
References: <1487057409-19872-1-git-send-email-mine260309@gmail.com>
 <4154cce0-0565-0dc7-a4c9-b8877285c011@linux.vnet.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 21 Feb 2017 09:55:16 +1030
X-Google-Sender-Auth: rqPLxdJxXNXjEyQn8sjAOFt-rhg
Message-ID: <CACPK8Xe8=JHKUW6mL7JZuNbqHUMmHNhcdQVB+jeqJTg6mkTFqg@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 2/3] ARM: dts: aspeed: romulus: Add
 fsi-master GPIO bindings
To: Eddie James <eajames@linux.vnet.ibm.com>
Cc: Lei YU <mine260309@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Mon, 20 Feb 2017 23:25:40 -0000

On Tue, Feb 21, 2017 at 9:50 AM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
> Looks good.
>
> Acked-by: Eddie James <eajames@linux.vnet.ibm.com>
>
>
>
> On 02/14/2017 01:30 AM, Lei YU wrote:
>>
>> Define the pins used on Romulus by the FSI GPIO master.
>>
>> Signed-off-by: Lei YU <mine260309@gmail.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index f47eb63..bc13ad9 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -1,7 +1,7 @@
>>   /dts-v1/;
>>
>>   #include "aspeed-g5.dtsi"
>> -#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/gpio/aspeed-gpio.h>
>>
>>   / {
>>         model = "Romulus BMC";
>> @@ -31,6 +31,17 @@
>>                 };
>>         };
>>
>> +       fsi-master {
>> +               compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>> +
>> +               status = "disabled";
>> +
>> +               clock-gpios = <&gpio ASPEED_GPIO(AA, 0) GPIO_ACTIVE_HIGH>;
>> +               data-gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_HIGH>;
>> +               mux-gpios = <&gpio ASPEED_GPIO(A, 6) GPIO_ACTIVE_HIGH>;
>> +               enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>> +               trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
>> +       };
>>   };

I just noticed that this is inside the i2c11 node. We want it to be up
the top, so I moved it there.

Applied to dev-4.7.

Thanks to everyone for the review.

Cheers,

Joel
