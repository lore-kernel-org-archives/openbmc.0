Return-Path: <joel.stan@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4010:c07::241; helo=mail-lf0-x241.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qPMdSZeW"; 
 dkim-atps=neutral
Received: from mail-lf0-x241.google.com (mail-lf0-x241.google.com
 [IPv6:2a00:1450:4010:c07::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytMny4py8zDqlG
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 17:27:02 +1100 (AEDT)
Received: by mail-lf0-x241.google.com with SMTP id a12so10753774lfe.4
 for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2017 22:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=eG0AZUg/96dHFjK+wjU19h4yzf5on41pnNJ6UVn1Qpw=;
 b=qPMdSZeWTQo4FjhxftkGffkGvRes3C7jd6aySj0i9qAKJBeUlv/h1WRWuPn92bWqHK
 oSFQ/2XyhCMv6R0M9/QPP8QL7gZD2rjDZTafx0GBc80bkgXf4oyHgpcRGj/Zd7IutSTd
 X0+Q2+10WnsnRFfD+Ngy4/qigDsWTc8EGqtJsVJOijltNf7U9ICGTeTNjBmYmL/03EzA
 k0jNM8WYIRMQ5CjocEVHmV4CxWe1z6LQpbnZyMJsAD5LdQC3X2LbxK2IHQ0ka1OCRRkc
 hXQ1pB5ZpMxW3u8TP/swAQIyZI/uL1KZtP2CrnWPzvkeKtrjzcOYGPYUUduju64LgD6v
 BJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=eG0AZUg/96dHFjK+wjU19h4yzf5on41pnNJ6UVn1Qpw=;
 b=WV1veVaLwyjfKzzK1hiHIm7lNnrMosnyduUalKvICW5VGCqNGrGXiorpbg/oHhc3Gb
 /fOH6E3biOZhnkcWJtPBuqezYkiMBz7xLW8Iai29QfbNogH7S43+2q1ChyxVnDjxew/D
 0ZScESQnrJ0F9g/xsLmPs6UcH26wbmnbvkvC1bCvtgNje3jAKS8DQGJBoRF1G6Bcx4/3
 vfisxvxzsRaDiaHtQ01kGygS2RMhZtL8HC/RrdVGNoTkmcxUhUWo0LCpiI/jGeYloVBc
 hdGJoiWUH+c7Mi7tKlc+hMWC9bL97f1ocvfdcbtjgHPUEFLZ5/aRKwuezPh6hMg561Z6
 h93g==
X-Gm-Message-State: AKGB3mJKxCKmJ3+r+hN6B9qVSrz7qTSIOPuKynAbrybIueJoHus5GqNo
 9sTs/Bv2OcGLw/UfrH4xGIkX8rG05+hiSmfOTRE=
X-Google-Smtp-Source: AGs4zMbfHfvlicokowuypw8fLVXlWXjSGqQt9A+L/0O1EcXjWREy+33b2/NyaEtkrTtpUW1kDxzUfvEERXDcoE8jRLk=
X-Received: by 10.25.162.72 with SMTP id l69mr10437937lfe.45.1512714419045;
 Thu, 07 Dec 2017 22:26:59 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.25.155.83 with HTTP; Thu, 7 Dec 2017 22:26:38 -0800 (PST)
In-Reply-To: <CAO=notyiwG+HeGNXqdk1TPnYu40CEWdeL_ukujkHwYSkGwvmqQ@mail.gmail.com>
References: <20171127200738.188390-1-venture@google.com>
 <CAO=notyiwG+HeGNXqdk1TPnYu40CEWdeL_ukujkHwYSkGwvmqQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 8 Dec 2017 16:56:38 +1030
X-Google-Sender-Auth: UcM5kwirGLHw85ijJXwfFzW54Iw
Message-ID: <CACPK8XehSTH_SN4GmaHktJ48vAgm4C0tXBpjKdpT3gGhL0=XoA@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed-g4: add serial gpio driver entry
To: Patrick Venture <venture@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Fri, 08 Dec 2017 06:27:03 -0000

On Tue, Nov 28, 2017 at 6:40 AM, Patrick Venture <venture@google.com> wrote:
> There isn't yet a binding for this, but if it's acceptable. I'm going
> to submit a gpio driver strictly for the serial gpio once I can test
> on an ast2500.  I'm presently finalizing the ast2400 version of the
> driver.

We can stage the device tree change in the openbmc tree if it helps
your development.

Applied to dev-4.10.

Cheers,

Joel

>
> - Patrick
>
> On Mon, Nov 27, 2017 at 12:07 PM, Patrick Venture <venture@google.com> wrote:
>> Adds the serial gpio driver entry for the aspeed
>> ast2400.
>>
>> Signed-off-by: Patrick Venture <venture@google.com>
>> ---
>>  arch/arm/boot/dts/aspeed-g4.dtsi | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
>> index 424d843ec1da..b82ebefcb025 100644
>> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
>> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
>> @@ -238,6 +238,15 @@
>>                                 clocks = <&clk_hpll>;
>>                         };
>>
>> +                       sgpio: gpio@0x1e780200 {
>> +                               #gpio-cells = <2>;
>> +                               gpio-controller;
>> +                               compatible = "aspeed,ast2400-sgpio";
>> +                               reg = <0x1e780200 0x100>;
>> +                               interrupts = <40>;
>> +                               interrupt-controller;
>> +                       };
>> +
>>                         timer: timer@1e782000 {
>>                                 compatible = "aspeed,ast2400-timer";
>>                                 reg = <0x1e782000 0x90>;
>> --
>> 2.15.0.417.g466bffb3ac-goog
>>
