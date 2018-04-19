Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c09::242; helo=mail-qk0-x242.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="PjxZBHZc"; 
 dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="GLY95lpW"; 
 dkim-atps=neutral
Received: from mail-qk0-x242.google.com (mail-qk0-x242.google.com
 [IPv6:2607:f8b0:400d:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40RT0p56ZyzF239
 for <openbmc@lists.ozlabs.org>; Thu, 19 Apr 2018 16:02:34 +1000 (AEST)
Received: by mail-qk0-x242.google.com with SMTP id c136so4334396qkb.12
 for <openbmc@lists.ozlabs.org>; Wed, 18 Apr 2018 23:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=hlfq2o+UDNHsVzpEJhLmAiTyYGczgWwnHjgJU2tvzkA=;
 b=PjxZBHZc3WVdOQkWj46qD8GEiVJs92eBwfn1k8/9e25WtHG8sycI/ZzK1voRmEN1Nh
 tFqx/RoOl2uR/IeaZoe/2uqrBQpXhd96CuOKUfmv2PlIqFUXzI6yPaAO6h4aLI9Y49Fq
 0freG3tqk36NbSovzB9ebb707RFj9vEhN8FJSo84XeDaN6r+MgigTTQJkcGyN+CCtOnE
 M8Xx0chNHgaW5tjsXdCSOT3a53RI3IW7JRYiWCuTv1N+uKDLarff9JlZRMZHozk1l/Ft
 Qv4ZYjudntBKPsD83ncKWa04+HJndoymtkhy7Cld7x3ElSQ+iEkRj9KiRecCtwoMYdBN
 Lz3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=hlfq2o+UDNHsVzpEJhLmAiTyYGczgWwnHjgJU2tvzkA=;
 b=GLY95lpW7L1YhFfWn2pNYNGPCbwvoF6DtrsTlO9ZL6F8qkGd83t3m3jqYZk7ZCTKsB
 r9Q8ngNTWsJh6mJbLpRVjTqzQXynFmuWyjK+O4SXv0iAksfHp3h0YHpZ2hP+DbtJ+axe
 zmAiHOt30d6bsB+e6/uza51IXLL23HzThhOns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=hlfq2o+UDNHsVzpEJhLmAiTyYGczgWwnHjgJU2tvzkA=;
 b=knuiUODs/YMrdd6ndtTbeg071hoTuuQdEApXtnL3oN/wyno8TRMAnCGpr6t/D3cCPD
 bIvW3cEPSKE9Kbaae0u4iZPc01F7gxS2wHcGjEx9UfxBho1DIalUFgGZPOsm13VWQl0f
 4KrmvF43mVrK7V8i9LJlgkMtLIHg/M0CegnRiYStIOHDlxHzjR9Q3dRdslZ/4Fofdnl1
 hHJONCpaNv8dTWwx10Fgd9ohMFtCHPkPSvL0C2pDulO+zDEADyZcqvNFqJVv1uE4Vggo
 A3Jd7OcmeOhiCp+b6jn8choz/RxoWHVFGMFsWjXuTsH8uaGnDKsVa5tiGkEWw/hRHGKM
 km2g==
X-Gm-Message-State: ALQs6tBbsjNyU6s0S3ruPqKmqUmMEzu2vsWy/7gxja03P+mrC2WTQt/w
 LJNyVB42tw07lgji5PiEXG8tmsSZ+mxJXlmXZoo=
X-Google-Smtp-Source: AIpwx48ejs2DXr7J55bNoNWYIV+i5N2QWhVtFnIm4KkR/CT9geNcCCvCd2VARNyaf5zQYWCG5SA4e3PFjnM5tHOUHeU=
X-Received: by 10.55.197.196 with SMTP id k65mr4715722qkl.158.1524117752088;
 Wed, 18 Apr 2018 23:02:32 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.200.24.79 with HTTP; Wed, 18 Apr 2018 23:02:11 -0700 (PDT)
In-Reply-To: <1524117180.2470565.1343247416.56A216DB@webmail.messagingengine.com>
References: <20180419042004.25168-1-joel@jms.id.au>
 <20180419042004.25168-4-joel@jms.id.au>
 <1524117180.2470565.1343247416.56A216DB@webmail.messagingengine.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Apr 2018 15:32:11 +0930
X-Google-Sender-Auth: tkf0cTtB0Ha-6MABCoDB0L4Ug-o
Message-ID: <CACPK8XexhjanxCt35N8XewixkOZp69HjUFE=N-Q5MHq1Z56WYA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.13 3/5] ARM: dts: aspeed-g5: Add resets and
 clocks to GFX node
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Apr 2018 06:02:36 -0000

On 19 April 2018 at 15:23, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 19 Apr 2018, at 13:50, Joel Stanley wrote:
>> The ast2500 has a reset for the CRT device that must be deasserted
>> before it can be used. Similarly it has a clock gate for a clock called
>> D1CLK that must be set to running.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  arch/arm/boot/dts/aspeed-g5.dtsi | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
>> index 25a88dd44d91..4ca4bc463347 100644
>> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
>> @@ -175,6 +175,10 @@
>>                               compatible = "aspeed,ast2500-gfx", "syscon";
>>                               reg = <0x1e6e6000 0x1000>;
>>                               reg-io-width = <4>;
>> +                             clocks = <&syscon ASPEED_CLK_GATE_D1CLK>;
>> +                             resets = <&syscon ASPEED_RESET_CRT1>;
>> +                             status = "disabled";
>> +                             interrupts = <0x19>;
>
> Bit of a nit, but it would be easier to reference the documentation if the interrupt was base 10...

I'm not sure why they are hex. I'd take an upstream patch to change
them all over to base 10.

>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Thanks for reviewing.

Cheers,

Joel
