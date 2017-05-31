Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x242.google.com (mail-yw0-x242.google.com
 [IPv6:2607:f8b0:4002:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wd9N35JYHzDq5j
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 22:51:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wx4WkAl1"; 
 dkim-atps=neutral
Received: by mail-yw0-x242.google.com with SMTP id 5so869248ywe.1
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=g+oOjl/nlR2Bs6/91GFvOSLbVgbQHzVyoLs3D1MB2II=;
 b=Wx4WkAl1+SZjVA9/EYM9T4doYtXNvcL+ndixaBJqfHbwAdofJHTPdkxTbZXa7Wm/gt
 vbqWYcRI9QNjzWsgOMO1llevNkjfuCUbIiOnFVbFC57SaXH9EcafRg+PHq648rCMdttF
 CJNuiGVhdYw310msfSokvHSWSn9wJsVPexYhiOPIRkB8qa1OmoDgMuwFYp9j0v9n1beQ
 nMldXzQ2D/waw/SwHn38RjENYo/NOo7zAia1NfP7GHZOQ9yKWtm1hlGhZ3OT0wyh8XC3
 W5m8kzZELNGmlhXsXoUgaDVP/zCC5n9mDTq2DkTuSe8C8ceLrIyU/xl8ysskIW8sHwg4
 sAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=g+oOjl/nlR2Bs6/91GFvOSLbVgbQHzVyoLs3D1MB2II=;
 b=qDgKXsA8TM9yCimbf5QsJ96CCEbhqlOjNxK/qjNZ6hDw4Yi21WbF6eGGxx3oDyoInW
 QbLCA5NHRL8RGmZ3FnL5iruaM5q3TV/xj/UyynzreDi4mXvffL0fz5EwS5KzRAPKJNmT
 mbmmkugvpclA5IUTYQEpkS4WdgCFCCzYulyaBSmlzZNFRUzFiI+2l/Zh2/n/BjSTHHVU
 32oMc3kjylOq+5h1V1TdG2T1PQ03F6S+HLJ6sxuLICpaQH9aqw5CmOdC6wJ2kuXk6q9e
 O5VdsoZI08PMfPs5SDBQVPK092Ozh3YFmxGRAp+7EqlEuQAOcqPJVkmatLiqATDdzZ/L
 kX+g==
X-Gm-Message-State: AODbwcAMwW+un1CM63BAUNEMkvlVojeM690BKJde0YphQRX0TeCmYqv6
 Br2uQXmfadcKauFpPxbMAgJBMFpOZw==
X-Received: by 10.129.81.194 with SMTP id f185mr19631157ywb.308.1496235105794; 
 Wed, 31 May 2017 05:51:45 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Wed, 31 May 2017 05:51:25 -0700 (PDT)
In-Reply-To: <CAARXrtkTzBUoGPmy7hf_sGWzdefm2zVt_8jMHedc0SSXDZroZQ@mail.gmail.com>
References: <20170525074818.7284-1-joel@jms.id.au>
 <20170525074818.7284-2-joel@jms.id.au>
 <CAARXrtkTzBUoGPmy7hf_sGWzdefm2zVt_8jMHedc0SSXDZroZQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 May 2017 22:21:25 +0930
X-Google-Sender-Auth: oBBX3lKufdaYsrNQklD3VNeHm4Y
Message-ID: <CACPK8Xcu9-jE1TE7oXRungyg3HHF3iOjs1X4DzGWr0nsEQ8F9w@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 2/2] ARM: dts: aspeed: romulus: Add Maxim
 MAX31785
To: Lei YU <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Nickolaus Gruendler <ngruend@us.ibm.com>
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
X-List-Received-Date: Wed, 31 May 2017 12:51:48 -0000

On Wed, May 31, 2017 at 4:26 PM, Lei YU <mine260309@gmail.com> wrote:
> Reviewed-by: Lei YU <mine260309@gmail.com>

Thanks, applied to dev-4.10.

Cheers,

Joel

>
> On Thu, May 25, 2017 at 3:48 PM, Joel Stanley <joel@jms.id.au> wrote:
>> From: Nickolaus Gruendler <ngruend@us.ibm.com>
>>
>> This fan controller is present at 0x52 on i2c-12.
>>
>> Signed-off-by: Nickolaus Gruendler <ngruend@us.ibm.com>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index 5ca0f6e6a6a4..eae406aeb6ce 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -206,8 +206,13 @@
>>  &i2c12 {
>>         status = "okay";
>>
>> +       /* Fan Controller */
>> +       max31785@52 {
>> +               compatible = "maxim,max31785";
>> +               reg = <0x52>;
>> +       };
>> +
>>         /* CPLD */
>> -       /* Fan Controller 0xa4/a5 */
>>         /* Power Supply */
>>         /* Temp Sensor */
>>         /* Temp Sensor */
>> --
>> 2.11.0
>>
