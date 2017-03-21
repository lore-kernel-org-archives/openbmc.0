Return-Path: <mine260309@gmail.com>
Received: from mail-qt0-x242.google.com (mail-qt0-x242.google.com
 [IPv6:2607:f8b0:400d:c0d::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vnJrm2rv3zDq7c
 for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2017 14:56:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qHg3ltpk"; 
 dkim-atps=neutral
Received: by mail-qt0-x242.google.com with SMTP id r5so20039768qtb.2
 for <openbmc@lists.ozlabs.org>; Mon, 20 Mar 2017 20:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=x8JHIvmLcVG3Ggy8gR8VgoPIXT4wYM1qE8YqVzfEg1o=;
 b=qHg3ltpkqr3ydpDO9fxUB9C7NDBpDtN4leeL1V3SNBN1lYkplFmcJWllKlKcVZfKwW
 MhBsPBj7YkJSipzcYn8UFkQMU4NtBtKSZJhFTRTUad8jAIk9u+O4K5xuz+4vW1o1HqI8
 iUK2sIsqOAkxnk3HFDQXNJt7HcbSCAO28OE8A6u+A/wGxUwB3QhQxXX/b4KT+6ISTTT1
 91DqNlz6DYzyjDrkMV5noM7Gie0gYgcwJ+kW01Zrr7Mby2h0T+zBSrvXoX/skntOJAD7
 Sm75ZXrMo0k2k6j3dWbwBOaN6VCir6mzQHEYb5QIHbKdMVobwjddzIaWuhpnwOgm87f0
 ocZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=x8JHIvmLcVG3Ggy8gR8VgoPIXT4wYM1qE8YqVzfEg1o=;
 b=suWQCXxLoq6I8uinRFt/lLTXvHfyA9vR1H1S2cdloBZQVbzOLK1gpJZ2m+x3LR+H3e
 M0WgHIM41sQ2z/POOQIWugWoNSoLLTPrLgidu/pYa8uxboFtt/kqSY/M/Xc2IG/C3I0M
 eEeon028RVZa6Zs63iDK6ZedDlwTBIUVgTr4AwSIUEM3whHeH/I/ioh6llhVe0Ept9+w
 gQqadz8ZBDQUZsVsljmy41GZZ4qUpBLWbOxIlLxD6tmKSXdqjX+0yJ50Md2sROXpDZaV
 jp6GbVeN9qyo1oPmiT0hdeC2qiMIaKy/O/NICVEVtJwXNuQSzLh/tgjhZcIDJtIr1BAz
 KZNA==
X-Gm-Message-State: AFeK/H1m2JP93I1+UWwN24MN6iXb+dB4hUAjcJ8pdy9QzkrV705OuCrXsMMGBpfzdvje6grpJ+lk6bFJf4TnxA==
X-Received: by 10.200.38.206 with SMTP id 14mr27345230qtp.62.1490068565948;
 Mon, 20 Mar 2017 20:56:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.137.9 with HTTP; Mon, 20 Mar 2017 20:56:05 -0700 (PDT)
In-Reply-To: <CACPK8Xey7qvU4_POhc3wXTuNs7tvQjRqNaJsZ2QuMnv=wgqYkA@mail.gmail.com>
References: <1489562028-22480-1-git-send-email-mine260309@gmail.com>
 <CACPK8Xey7qvU4_POhc3wXTuNs7tvQjRqNaJsZ2QuMnv=wgqYkA@mail.gmail.com>
From: Lei YU <mine260309@gmail.com>
Date: Tue, 21 Mar 2017 11:56:05 +0800
Message-ID: <CAARXrtkRBnUxZrWykfPVrcB46NDFwQdEigcJ9AJQYZPZFZb84g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: romulus: Add GPIO hogs
 for nic_mode_func
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Tue, 21 Mar 2017 03:56:09 -0000

On Tue, Mar 21, 2017 at 8:44 AM, Joel Stanley <joel@jms.id.au> wrote:
> On Wed, Mar 15, 2017 at 5:43 PM, Lei YU <mine260309@gmail.com> wrote:
>> GPIOD3/D4 are the "NIC_FUNC_MODE_0/1" pins connected to Broadcom
>> 5719 which control the PCIe functions.
>> Add GPIO hogs to pull down GPIOD3/D4 to use that function.
>
> On other systems we had three GPIOs that set the mode of the NIC. I
> notice the schematic for romulus has three FUNC_MODE pins. Is there a
> reason you're only setting two of them?
>
Nick (the chief engineer of Romulus) specifically asked to pull down only the
two GPIOs, and mentioned there's no need to pull down GPIOD5.
So this patch only set the two pins for nic_func_mode0/1.

> I have applied this to dev-4.7. Please send a follow up for
> FUNC_MODE_2 if you want to set that.
>
> Cheers,
>
> Joel
>
>
>>
>> Signed-off-by: Lei YU <mine260309@gmail.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index b8b2d7f..2266c85 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -181,6 +181,21 @@
>>         status = "disabled";
>>  };
>>
>> +&gpio {
>> +    nic_func_mode0 {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(D, 3) GPIO_ACTIVE_HIGH>;
>> +               output-low;
>> +               line-name = "nic_func_mode0";
>> +    };
>> +    nic_func_mode1 {
>> +               gpio-hog;
>> +               gpios = <ASPEED_GPIO(D, 4) GPIO_ACTIVE_HIGH>;
>> +               output-low;
>> +               line-name = "nic_func_mode1";
>> +    };
>> +};
>> +
>>  &vuart {
>>         status = "okay";
>>  };
>> --
>> 1.9.1
>>
