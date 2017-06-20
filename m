Return-Path: <venture@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wsVrL3FqRzDqhk
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 00:40:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NEV7Ltxf"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id 132so29809055pgb.2
 for <openbmc@lists.ozlabs.org>; Tue, 20 Jun 2017 07:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=m34qPpR77KcE3Ytx8XdoITaDLSF7yiLlmPg/+aVX7HU=;
 b=NEV7Ltxfu7FMAbwIUfgIZIUpe704/FTBqn6TjEqeZvnYWMBjmcgoaBQx88aSh+7aq8
 zMEkRfXhyf6UiArnS6czd5vjXpTRH5nSOR945YPFSIy+xdEt9rrMhZqz0Fjr8A7GKNOv
 EPh3tHU5eNLkWoZTWZiyXUb7fxbzFPmp8XIAdMuFKR//ze/ue1jrXigtFR4caszKoa1Y
 tHPJtpfhxulxCb2eNOfIgn4ktYn4OInDmQFM+5WsDaCWNdfMJkxJ1ZJWpcc1lpAfZVEU
 PRLfC0V+IB3wVYRtEm3fWDCvUDFH11AgcnGapV2Qn+dDCFx0I2QDYnwJky85Y7bhf/PD
 7a0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=m34qPpR77KcE3Ytx8XdoITaDLSF7yiLlmPg/+aVX7HU=;
 b=qjJiRWPvtxDvIj/NNAGqHJHpW4RvZ1XM7x/a+Gpnaky3TjrlyobxvJk3ZiI3Ua24Cz
 03yr2yW/7rcb68EhUkbKTnsNCt0v+h4Z/GH/NRU/xwG526bWswlkqDxQsqIMJiHljzU8
 hlPAyF1u8O6f6BzLHwYV1h8T9/cueMct/yrvZ6jnGAhuX8gPTMTIRsotKvmc5WeFBZZs
 hTlibDxevBI7wl2Ci7VokFAjytQRShK7CN6u52xe5pp9SDvFAmFxK0wMe2oxO0Mti0Y+
 SVwROMeC8/1nPhHYWCRRUNlVvCnspe9+JM6Cgku7HdNOw6+hnZWIPZik+hAY63Dmmehs
 TpYA==
X-Gm-Message-State: AKS2vOy6wwdZhHEo93mp9v8JRvzoOrlwOVQdTZ4ZQSNboUSDYy+EVsHQ
 K2Mq82cWs/aK09TpJh/7/wMxrULjfIACmak=
X-Received: by 10.84.130.33 with SMTP id 30mr36529688plc.240.1497969631881;
 Tue, 20 Jun 2017 07:40:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.160.108 with HTTP; Tue, 20 Jun 2017 07:40:11 -0700 (PDT)
In-Reply-To: <CACPK8Xfv7r6FCADf+M1H+yNcGGkTLPQfS3ZPKa=wvU5DsxJ1EQ@mail.gmail.com>
References: <20170613221019.100175-1-venture@google.com>
 <CACPK8Xe_MT6Ssq3XPF1EO-pzS89Ja-_PHPOtne7vttn7TVzaHg@mail.gmail.com>
 <CAO=notxv7eoNBv8=rdCYA+EoxJheKDFbWzycDSuh+f1KkXVgCg@mail.gmail.com>
 <CACPK8Xfv7r6FCADf+M1H+yNcGGkTLPQfS3ZPKa=wvU5DsxJ1EQ@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Tue, 20 Jun 2017 07:40:11 -0700
Message-ID: <CAO=notwT49Hduqn0o17D8X4oGM8Eudhp2S3oXNPfD17nFtbNbA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2 4/4] ARM: dts: aspeed: quanta-q71l: PDB
 FRU and mux on the PDB in front of the PSUs.
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Tue, 20 Jun 2017 14:40:35 -0000

Joel;

I haven't made the jump to 4.10 yet.  I'm in the process at the
moment.  I have a "locally" modified 4.7 that I've been using with a
specific ast2400 defconfig.  But I expect to be moved over or at least
ready to in the next couple weeks.

I do have some tweaks I need to verify and push.  The torvalds
upstream aspeed-pwm-tacho driver is a bit different from the one I've
been using as the one I've been using is machine tunable.  For
instance, my quanta test board and another system both use it, but may
be better served with different values.  For instance, in the need for
speed I reduced the fan_tach period very low and reduced the wait time
to literally a short spin loop (based on the reference driver).
However, now if the fan is going <30% of its speed, it won't return a
value at all.  But on my platform, I never expect it to be driven that
slowly unless it's failed.  It's this reason and those like it that
have kept me from pushing some of my final patches with regard to
linux.  I do have at least one more dts change to push for 4.10.  I
hope to have that out this week.

Thanks for your help.

Patrick

On Mon, Jun 19, 2017 at 7:15 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Sat, Jun 17, 2017 at 12:17 AM, Patrick Venture <venture@google.com> wrote:
>> Joel;
>>
>> Thanks!  This was my first patch email series, so I appreciate your
>> help.
>
> No worries. You're doing a great job; keep the patches flowing.
>
>> So I ran into something last night while reviewing something
>> that jumped out at me.  I'll need to send a new patch for the quanta
>> dts momentarily to address this.  In linux-4.7 the i2c-mux driver
>> pca9546 had a different compatibility string from 4.10.  Since we
>> don't own those devices on our BMC image in testing (we're mastering
>> them from the host via i2c over IPMI),  So, let me submit a patch to
>> fix that.
>
> Cool. How are you going with the move to 4.10? Do you have a list of
> drivers and tweaks that you need to get ticked off before you update?
>
> One of my goals to help everyone stay on the latest kernel. Having
> your changes in the tree sooner means the move to the next kernel tree
> (probably 4.12?) will be easier.
>
> Cheers,
>
> Joel
>
>>
>> Patrick
>>
>> On Thu, Jun 15, 2017 at 9:51 PM, Joel Stanley <joel@jms.id.au> wrote:
>>> Hi Patrick,
>>>
>>> On Wed, Jun 14, 2017 at 7:40 AM, Patrick Venture <venture@google.com> wrote:
>>>> Signed-off-by: Patrick Venture <venture@google.com>
>>>> ---
>>>>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 20 +++++++++++++++++++-
>>>
>>> I had some issues with conflicts between the 4 patch series and the
>>> two patches you'd sent before then. So merged all of your device tree
>>> changes for the Q71L as one patch.
>>>
>>> Next time you're sending changes that may conflict, put them all in
>>> the same series. It's okay to send a v2 of the series with additional
>>> patches added.
>>>
>>> Also, in the case of your patch #4 where you needed to make a fix,
>>> it's convention to re-send the entire series. No worries this time
>>> though, I got it sorted in the end.
>>>
>>> I noticed we did not have the dts added to the Makefile, so it was not
>>> building. I fixed that too. Please take a look a the tree and make
>>> sure all of the device tree nodes are in there as you expect them to
>>> be.
>>>
>>> Cheers,
>>>
>>> Joel
>>>
>>>>  1 file changed, 19 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>>>> index 4b5047b5d592..2b01c5bcc88b 100644
>>>> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>>>> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>>>> @@ -145,7 +145,7 @@
>>>>          *    SSD 1,
>>>>          *    SSD 2
>>>>          */
>>>> -       i2cswitch@77 {
>>>> +       i2c-switch@77 {
>>>>                 compatible = "pca9548";
>>>>                 #address-cells = <1>;
>>>>                 #size-cells = <0>;
>>>> @@ -177,6 +177,24 @@
>>>>
>>>>  &i2c7 {
>>>>         status = "okay";
>>>> +
>>>> +       /* 0: PSU4
>>>> +        *    PSU1
>>>> +        *    PSU3
>>>> +        *    PSU2
>>>> +        */
>>>> +       i2c-switch@70 {
>>>> +               compatible = "pca9546";
>>>> +               reg = <0x70>;
>>>> +               #address-cells = <1>;
>>>> +               #size-cells = <0>;
>>>> +       };
>>>> +
>>>> +       /* PDB FRU */
>>>> +       eeprom@52 {
>>>> +               compatible = "atmel,24c64";
>>>> +               reg = <0x52>;
>>>> +       };
>>>>  };
>>>>
>>>>  &i2c8 {
>>>> --
>>>> 2.13.1.518.g3df882009-goog
>>>>
