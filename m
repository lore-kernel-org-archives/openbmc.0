Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x242.google.com (mail-yb0-x242.google.com
 [IPv6:2607:f8b0:4002:c09::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wd9NG4ms1zDqH7
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 22:51:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z8J+gBb0"; 
 dkim-atps=neutral
Received: by mail-yb0-x242.google.com with SMTP id o185so439421yba.1
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 05:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=TeScfOv2jU6mx2HbQRBwwKUr1F9JV+YrBRAKT5PUA+M=;
 b=Z8J+gBb0vMWzLFqe8gJMv26eeZDFUjhVT3xz5wC/z5DXCWmMI5y4jI1v/E3qKJNFWf
 lhg/+mFb5xkuMnXwYrr59pdgxxZkv4g9YX/b+y03XEWcV6EGyHzksDmuCZLSErizYXxe
 rj3CBxhZf9l0NbCoK3YceOakxIU5uEiJHOx+BsRBOXz2ZiGLKP9tuFigdFuyYe9vlT4G
 rsBnIus2a7ExhJTAaiPlaGfFrv51lI2km9MheaRqsJYk5LeFDs7dr3HZRY1Zo1+Gvjs2
 mpwuvV96X+IYJ3qBirDpL+ArcTH93eUEbpGPYmZXfkQ1C71p3la86WQVm2jlGa2Mwcg7
 c51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=TeScfOv2jU6mx2HbQRBwwKUr1F9JV+YrBRAKT5PUA+M=;
 b=ejRaPO1X58ZNG01hpIHmR+RZxBwEi+OunhNY+PE6y9hO3sbzaOkJoYT3ldopsgNLJ2
 aKN6dG/Vi/9k06LGr+L1AZnBsOD7jGeTZPaTfyGcuU+8qa83e74Dd8C2xfn9bn3EdTxB
 N+KNn3yATzSt0yFkszso9ymgwbTKfDudfwWkW4EvLrESaHy9dN0TkIaiCtGGw2H/2Im4
 N7bsIJ87hHyX5WOYA4oZ6YUWShE+AjIC83wPh/DRQGtZudxLqRcCTMpSTSPlTx6jXIX+
 BqMddxvs7PDa1KjXQvlEqioUTnvn1TcMQIiDnvjEdxWvaIuHceiJ8pekBWJaW5/V3GqL
 jdTg==
X-Gm-Message-State: AODbwcDaBhXlpDjQ65hATIOaMHsSo/Fom1lEfJ/khd07g0nIrl7U+zUw
 bCOyc5tFqiSX0dMRc3G4lY4H3bwxNOJux9A=
X-Received: by 10.37.219.146 with SMTP id g140mr11921176ybf.135.1496235116347; 
 Wed, 31 May 2017 05:51:56 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Wed, 31 May 2017 05:51:35 -0700 (PDT)
In-Reply-To: <CAARXrt=4kSrO-G7bAK47mO=x23GYyN2wN35PaC9zW6Z2A2wjgA@mail.gmail.com>
References: <20170525074818.7284-1-joel@jms.id.au>
 <CAARXrt=4kSrO-G7bAK47mO=x23GYyN2wN35PaC9zW6Z2A2wjgA@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 May 2017 22:21:35 +0930
X-Google-Sender-Auth: u1fEIKprWKnve4ohgVUGHn4IzZ0
Message-ID: <CACPK8XdRR=07VNkv=BsaftjqGtsi8zOgivEho4+ZJvvudUm=fA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 1/2] ARM: dts: aspeed: romulus: Add
 checkstop gpio-keys
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
X-List-Received-Date: Wed, 31 May 2017 12:51:59 -0000

On Wed, May 31, 2017 at 4:27 PM, Lei YU <mine260309@gmail.com> wrote:
> Reviewed-by: Lei YU <mine260309@gmail.com>

Thanks, applied to dev-4.10.

Cheers,

Joel

>
> On Thu, May 25, 2017 at 3:48 PM, Joel Stanley <joel@jms.id.au> wrote:
>> From: Nickolaus Gruendler <ngruend@us.ibm.com>
>>
>> Signed-off-by: Nickolaus Gruendler <ngruend@us.ibm.com>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index ac728695e447..5ca0f6e6a6a4 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -42,6 +42,16 @@
>>                 enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>>                 trans-gpios = <&gpio ASPEED_GPIO(R, 2) GPIO_ACTIVE_HIGH>;
>>         };
>> +
>> +       gpio-keys {
>> +               compatible = "gpio-keys";
>> +
>> +               checkstop {
>> +                       label = "checkstop";
>> +                       gpios = <&gpio ASPEED_GPIO(J, 2) GPIO_ACTIVE_LOW>;
>> +                       linux,code = <ASPEED_GPIO(J, 2)>;
>> +               };
>> +       };
>>  };
>>
>>  &fmc {
>> --
>> 2.11.0
>>
