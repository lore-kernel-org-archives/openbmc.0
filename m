Return-Path: <mine260309@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com
 [IPv6:2607:f8b0:400d:c0d::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vP1tH2BgKzDq60
 for <openbmc@lists.ozlabs.org>; Thu, 16 Feb 2017 14:32:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="kk7IV+Fy"; 
 dkim-atps=neutral
Received: by mail-qt0-x241.google.com with SMTP id w20so692278qtb.1
 for <openbmc@lists.ozlabs.org>; Wed, 15 Feb 2017 19:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=kFJGHnopPORDJpMwXNLEAd2dJ8awLddJACsMyf679kk=;
 b=kk7IV+FytzSeTdC0ZQUbizJkvLCFgvxwFySf6gHa2xVuFToHgcdXrtetiPUNFTKQAA
 HlKxlLICf5gRCGlnWimmAbAcX7PbSMikadnBrIddV53+5Cq20kI1rXEdgboTivstpwIc
 /WJ1/ftMxZGRqol8zszCL5FUBy9kqvyvhdlIRd+04vH9cSzxNtA29NW2COI2ymmKYk7w
 AssXaSOW6jKq3Fb073/hDXbYuJeZvn9ch63QtFpApf+6ABUhD1BVypRnYaTDASYQGcPi
 /Oh2aamZAI9zJktq5ZhogK5g+i1lCcWUsyNvlVr8EnDuygAabpGHBjmszBp4CGzpyGu4
 +Pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=kFJGHnopPORDJpMwXNLEAd2dJ8awLddJACsMyf679kk=;
 b=iR5TWInQN8mvWQkdNgz3ZDcRLQ8mMnA+RRuQxmSxKdr7YhUTbeMLG5j9mmrp/ZprLX
 +WrcP9VAE0TyiBN1U1w6CPhOUl9si7xYBRsGilpvKakM9uFWycYsq6jDcUNvAet5Owq7
 6Jakc6/ir3fCacQe6ygKgS086K+F3mvbWbJTbn/3R6WG/MxaAgzPne3NdDJohyttZaMe
 cilqC7hlEoosfdH9IMFiUjmhG9VHLVwnPWDC/L5uxxDJdU34DUcRBydHjgZYmQkvcYrq
 l/KBO86nU2pKL3rwlryT9sxwu6mVUsOmk7o6+F19WMrsQabWh+FzJIPIKBPGS6UirjGh
 SZDg==
X-Gm-Message-State: AMke39kyH6Hux2QOrAtB7LnNL1yhpJ8iQnRuKTwNxvj1mLNe3YVoMCTeLVjInVpeoM1MAH6gJhsw7HxoYnAkRA==
X-Received: by 10.200.1.2 with SMTP id e2mr94910qtg.142.1487215925107; Wed, 15
 Feb 2017 19:32:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.122 with HTTP; Wed, 15 Feb 2017 19:32:04 -0800 (PST)
In-Reply-To: <1487207539.3661.30.camel@aj.id.au>
References: <1487057115-14622-1-git-send-email-mine260309@gmail.com>
 <1487207539.3661.30.camel@aj.id.au>
From: Mine <mine260309@gmail.com>
Date: Thu, 16 Feb 2017 11:32:04 +0800
Message-ID: <CAARXrtksFuxQ7ZvYpm6bTLvn7DMFAJ1b1uPvyW_8dEDbSd9JzQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 1/3] ARM: dts: aspeed-bmc-opp-romulus:
 Enable mailbox and LPC control nodes
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
X-List-Received-Date: Thu, 16 Feb 2017 03:32:07 -0000

Hi Andrew,

On Thu, Feb 16, 2017 at 9:12 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Lei,
>
> On Tue, 2017-02-14 at 15:25 +0800, Lei YU wrote:
>> Also add the reserved-memory node needed by the LPC
>> control driver.
>>
>> > Signed-off-by: Lei YU <mine260309@gmail.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index c23627e..f47eb63 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -19,6 +19,18 @@
>> >     memory {
>> >             reg = <0x80000000 0x40000000>;
>> >     };
>> +
>> > +   reserved-memory {
>> > +           #address-cells = <1>;
>> > +           #size-cells = <1>;
>> > +           ranges;
>> +
>> > > +         flash_memory: region@94000000 {
>> > +                   no-map;
>> +                     reg = <0x94000000 0x04000000>; /* 64M */
>
> So these values are also used in the zaius dts. Why are we reserving
> 64M 128M down from the top of the RAM address space? Is the top 64M
> meant to be reserved for anything as well? Why not reserve the top 64M?
>

This is a good question, but honestly I just copied this part from Witherspoon,
and this is just the same as Zaius.
Maybe Joel has some comments on this?

>> +             };
>> > +   };
>> +
>>  };
>>
>>  &fmc {
>> @@ -44,6 +56,16 @@
>> >     };
>>  };
>>
>> +&lpc_ctrl {
>> > +   status = "okay";
>> > +   memory-region = <&flash_memory>;
>> > +   flash = <&spi1>;
>> +};
>> +
>> +&mbox {
>> > +   status = "okay";
>> +};
>
> This looks fine.
>
> Andrew
>> +
>>  &uart5 {
>> >     status = "okay";
>>  };
