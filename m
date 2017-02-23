Return-Path: <xow@google.com>
Received: from mail-qk0-x234.google.com (mail-qk0-x234.google.com
 [IPv6:2607:f8b0:400d:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vTjcm1hF1zDqGW
 for <openbmc@lists.ozlabs.org>; Fri, 24 Feb 2017 05:36:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="X6hzuIfy"; 
 dkim-atps=neutral
Received: by mail-qk0-x234.google.com with SMTP id n127so39891442qkf.0
 for <openbmc@lists.ozlabs.org>; Thu, 23 Feb 2017 10:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=JkK5buB2yRe6a60ghnxy6hM3R9EuxRPezrBi361oeC4=;
 b=X6hzuIfyQspSJUTyC/T6Jy1wmuGuPTewB4wsWZkOcbHbH/AT4Ev9Gv9yzqZFHqX5MQ
 GIKnpJC4CNa8lMGJ+Z5oeIMWoilIKmP07uNcMyvYoqTMJqjWN+IIDj9x7Ww5Qq9cPDv1
 zo8DDBELl5bzfv4Wtk1cJ8xbgWFcxTksCxuwxQAtL1zW3srFm4HH+FTxrSB88ea3Iylr
 B9y+EP9zjUW9W6zsLYwhW6IifplTi2i0YM2VLdLBUjFvOb3aWyXD1zxpbzoLjYlmOd66
 E1+5umGoYSBMWaSTp8S/SulO2pVtAKUAc82g4j/b4hS4MTmzKNyyI3GU9COvOn0Nr8/K
 917A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=JkK5buB2yRe6a60ghnxy6hM3R9EuxRPezrBi361oeC4=;
 b=atcgCKfg80ell7cZmugqpr/fUsIGM4GXQgHpp7SDgE9ZP2yqQoic8BqdfDrcZ77w0K
 VDzTbnO2GoPyvwSCce4qJNiMk838Up3PKXegh1ke1CFEZndLoEar37msg2CtXOEK5dNw
 AMqV83UrMzEolvQXOw4Y31DUzBp+eTlENam+Z+C16N/KPbF0ZGOiMfAWI2SQM57pnC0e
 D3h+q6mWnsBtiAnywJn2a0Vnv8egAW3oz1Cv0Y9BlHOx5Ysm7ToGmlp1L2IWw8lgGtnl
 x3sGeauIZGcCm7ciXPH0va6AmenOjqn6xPnY4feBxtvOaL9TY9nTflQg5BN0uq757c3g
 GJGQ==
X-Gm-Message-State: AMke39l9OutcVuZsLj9vjRzhO7Jjx0gU7JAzjpUYTnSjdxOvXMC3o389fMWO8wMe/KCEdmWL6f5mQ0sBwn2CajWv
X-Received: by 10.55.192.153 with SMTP id v25mr36430492qkv.305.1487874996971; 
 Thu, 23 Feb 2017 10:36:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Thu, 23 Feb 2017 10:36:36 -0800 (PST)
In-Reply-To: <CAARXrt=dKRZh0AczANUee4asj-KxxU4zKqMhWd+_CiO7CQ75BQ@mail.gmail.com>
References: <20170221051259.18383-1-joel@jms.id.au>
 <20170221051259.18383-2-joel@jms.id.au>
 <CAARXrt=dKRZh0AczANUee4asj-KxxU4zKqMhWd+_CiO7CQ75BQ@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Thu, 23 Feb 2017 10:36:36 -0800
Message-ID: <CAPH-5w6F_P9z6JgQcTOp3Brqt3jw7T1m5NYZJqUuo4Fz9rZPrQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 2/2] ARM: dts: aspeed: Reserve memory on all
 P9 machines
To: Mine <mine260309@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Cyril Bur <cyrilbur@gmail.com>
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
X-List-Received-Date: Thu, 23 Feb 2017 18:36:40 -0000

Hi Mine,

On Wed, Feb 22, 2017 at 7:34 PM, Mine <mine260309@gmail.com> wrote:
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> index e1c9b3f4fe44..c3a6a8656b3e 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> @@ -25,9 +25,9 @@
>>                 #size-cells = <1>;
>>                 ranges;
>>
>> -               flash_memory: region@94000000 {
>> +               flash_memory: region@bc000000 {
>>                         no-map;
>> -                       reg = <0x94000000 0x04000000>; /* 64M */
>> +                       reg = <0xbc000000 0x04000000>; /* 64M */
>
> For Zaius with 512MiB RAM (what I saw in Foxconn), the memory size
> will be adjusted by Uboot,
> which is OK.
> Will this reserved memory be adjusted from 0xbc000000 to 0x9c000000?

We have no plans to use RAM size other than 1 GiB for Zaius BMC. Can
you please explain what you saw at Foxconn?

thanks
xo
