Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="USNevZFP"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xyzJD17zGzDr4N
 for <openbmc@lists.ozlabs.org>; Fri, 22 Sep 2017 13:20:28 +1000 (AEST)
Received: by mail-lf0-x241.google.com with SMTP id m199so3867951lfe.5
 for <openbmc@lists.ozlabs.org>; Thu, 21 Sep 2017 20:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=oi7SUYZnAvuppezmKJggvGtoOqUnIC2Wi3OzG8MGZEA=;
 b=USNevZFP27Q5KLsons8mfKseV3tfmChgatAfHDf/t7EQgmmZp2KHk1eLrulNlhoO69
 uLb9Y7dgN7fGFi/Yml4tQ8h+CFL3CNbs0Lch06B5xYxmM0oO0yNOQgX/dn35nHmG1W0U
 yQjDNVXrp0CY8foogvucMJG7Ab5oAeu/8TIvLVHzNoftc1PMXQ8uWK5uDIsxz0MjXhlw
 s4qXcqhtkc0uEdDS5g9j3N1LgXWifiXbfMsQwuY6Rob0nsjAbp2y5UzP9bbc5VaeEEXc
 BJlBNiCDKZ/WXqprwxG5J10ivBXbXkp3h5477eoRK/fSPM78dsZcQls44o/fMpTddg9p
 ixGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=oi7SUYZnAvuppezmKJggvGtoOqUnIC2Wi3OzG8MGZEA=;
 b=PLyyfXNLLY/WmdGF92rs0/yFSo5jcLvSY/L1dhS89N/HRKOvFslHet5lTXIAnOyDyG
 lHBHQjeFfU/sZo7sQRTb011u4OZOo1i6PnhMG1h8DORlsrGatbJbJkXa0ykTr/GMsFCt
 pUlaEUGryaAND4a3y7TfnjDIyqw8iiZeiN44unw1M6F7/rqZOf9fLoPH7fxPw5/7jhON
 enoDH4w7xDBfYefkNSGFmTgnkbBLSh2TSq64aefPH8OEXJOfC9DSXOqmwVPGoasO8Uww
 BxX/1YJKGqBTtbyLNeAbslcrn75S01VBx/FZr9PDY2uEIzPMmhrB5MjVf9qicGcnHKGi
 KxXQ==
X-Gm-Message-State: AHPjjUh5Dz2q8YRWRmXJxJHOK1vgH7gqYZPjrHbxdGTJAjXpQp9ZZIrJ
 ygOwL3gt+IZU7PtYEo1nz/zUPkJuJOh/rvdu1WE=
X-Google-Smtp-Source: AOwi7QDTM5M/5rDdfIsUJ8oEl9+V5+p60NicvP/quDN9aK86nepe/3gtJOAIxFlQmVg0JYyKw5tdlNh+edZNzMEYF/Y=
X-Received: by 10.46.71.193 with SMTP id u184mr1852188lja.166.1506050424184;
 Thu, 21 Sep 2017 20:20:24 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.103.82 with HTTP; Thu, 21 Sep 2017 20:20:03 -0700 (PDT)
In-Reply-To: <CAPLgG=mia_r-QnDzJsXkyaV6moqK4-bkBW_yQ=jzLnOW+F+rgw@mail.gmail.com>
References: <20170921062328.9256-1-joel@jms.id.au>
 <CAPLgG=mia_r-QnDzJsXkyaV6moqK4-bkBW_yQ=jzLnOW+F+rgw@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 22 Sep 2017 12:50:03 +0930
X-Google-Sender-Auth: RZMrhhr7BIm6SqKBb9Y_IVIpkqY
Message-ID: <CACPK8XeFnrutUuSRFEVRP1WS1z1HBHbqu-a1cu2sb1jXzFbxgw@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] ARM: dts: aspeed-g4: Fix timeriomem_rng
 probing
To: Rick Altherr <raltherr@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jeremy Kerr <jk@ozlabs.org>
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
X-List-Received-Date: Fri, 22 Sep 2017 03:20:29 -0000

On Fri, Sep 22, 2017 at 12:29 AM, Rick Altherr <raltherr@google.com> wrote:
> Is this superseded by the later patch that change syscon to include a
> ranges property?

Yep, spot on.

I didn't make the follow up v2, given it had little resemblance.
Perhaps I will next time to see if it results in less confusion :)

Cheers,

Joel

>
> On Wed, Sep 20, 2017 at 11:23 PM, Joel Stanley <joel@jms.id.au> wrote:
>> When booting we see this error:
>>
>>  timeriomem_rng 1e6e2000.syscon:hwrng@1e6e2078: timeriomem_rng: resource is missing
>>
>> Moving the timeriomem_rng node outside of the syscon fixes the issue.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  arch/arm/boot/dts/aspeed-g4.dtsi | 14 +++++++-------
>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index a83b6a8d73d4..38aadbf09be2 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -195,18 +195,18 @@
>>                                         reg = <0x2c>;
>>                                 };
>>
>> -                               hwrng@1e6e2078 {
>> -                                       compatible = "timeriomem_rng";
>> -                                       reg = <0x1e6e2078 0x4>;
>> -                                       period = <1>;
>> -                                       quality = <100>;
>> -                               };
>> -
>>                                 pinctrl: pinctrl@1e6e2000 {
>>                                         compatible = "aspeed,g4-pinctrl";
>>                                 };
>>                         };
>>
>> +                       hwrng@1e6e2078 {
>> +                               compatible = "timeriomem_rng";
>> +                               reg = <0x1e6e2078 0x4>;
>> +                               period = <1>;
>> +                               quality = <100>;
>> +                       };
>> +
>>                         adc: adc@1e6e9000 {
>>                                 compatible = "aspeed,ast2400-adc";
>>                                 reg = <0x1e6e9000 0xB0>;
>> --
>> 2.14.1
>>
