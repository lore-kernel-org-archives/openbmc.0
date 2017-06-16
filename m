Return-Path: <venture@google.com>
Received: from mail-pg0-x236.google.com (mail-pg0-x236.google.com
 [IPv6:2607:f8b0:400e:c05::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wq3C02zfXzDq88
 for <openbmc@lists.ozlabs.org>; Sat, 17 Jun 2017 00:48:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="POuo/3tB"; 
 dkim-atps=neutral
Received: by mail-pg0-x236.google.com with SMTP id v18so21374618pgb.1
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jd0HrUqfcplhqyrzQ+SNxbOHooDlM/DVAD3bHVCfEVg=;
 b=POuo/3tBKXC2kOkIMs/aEoNvOyIpfaA11lRHcsDCN9jB3DDzV0Qj6+WUd86tkOFM+f
 Y6VjdHV+kybXUcgnfeIGVZ79b8hgNGVpCNJyhRjF6Twt+3n3oSRcNdjAv5QZzrNPWdOe
 WtIx+6LrSZfBHssOdvAXFJTac252GpG0alITjZIwZTl8sizg9IeJx+6vxaABHufxQcj5
 v2FqRSHZIJxCkqcVtcmu3p6rDdzErwnYaNnshzJzO7V93e1Elp/fXSvbEb2RIHnXZ6fh
 Fpgg9BFmvnEGZd5Svuiiusf8ItwVMQ2UReHnPTpGAsTxJY8QzI3TkkOjXQjTMQJlLY2C
 6Szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=jd0HrUqfcplhqyrzQ+SNxbOHooDlM/DVAD3bHVCfEVg=;
 b=sPP1re62JG0R0NDOYep0IeMcXJ0zy6u927PYnoucp9GAHUOzC2D7T5uKTZ2S1xlOb6
 I9UqRYywgMR+k3xwR6+o/FtfxrN1OQoOOD9UYZjvwovPCrhzIlK5LUSipgB6T6PR2eUI
 scle33JRnG5PFEK/ZcPj/AL3W+A0WvuaGai0JwOv1pFUemWgpzs+SJElxBVw2crg+VaN
 B/TWgdTYiUHuUmsEYHJC+ZM4iMQLkzonKdID7D0V3gfp6qizlSL4oGeQW2NzONhraaXF
 +T0OTZU0vLR/f19OKk9DllbGmh2sn08/oB12SW35Zp5u2CDEsvdSFwgqe2LcwVksBZDQ
 BO+Q==
X-Gm-Message-State: AKS2vOzIm9vUTQppi0yrHFBPv9hIKep/HMClgpvqfhmcSB35oFP/172T
 gie4ZSQuSkKv7cjsgsjVELAULk9e2eY6
X-Received: by 10.98.34.8 with SMTP id i8mr11539199pfi.194.1497624489705; Fri,
 16 Jun 2017 07:48:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.160.108 with HTTP; Fri, 16 Jun 2017 07:47:49 -0700 (PDT)
In-Reply-To: <CACPK8Xe_MT6Ssq3XPF1EO-pzS89Ja-_PHPOtne7vttn7TVzaHg@mail.gmail.com>
References: <20170613221019.100175-1-venture@google.com>
 <CACPK8Xe_MT6Ssq3XPF1EO-pzS89Ja-_PHPOtne7vttn7TVzaHg@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 16 Jun 2017 07:47:49 -0700
Message-ID: <CAO=notxv7eoNBv8=rdCYA+EoxJheKDFbWzycDSuh+f1KkXVgCg@mail.gmail.com>
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
X-List-Received-Date: Fri, 16 Jun 2017 14:48:13 -0000

Joel;

Thanks!  This was my first patch email series, so I appreciate your
help.  So I ran into something last night while reviewing something
that jumped out at me.  I'll need to send a new patch for the quanta
dts momentarily to address this.  In linux-4.7 the i2c-mux driver
pca9546 had a different compatibility string from 4.10.  Since we
don't own those devices on our BMC image in testing (we're mastering
them from the host via i2c over IPMI),  So, let me submit a patch to
fix that.

Patrick

On Thu, Jun 15, 2017 at 9:51 PM, Joel Stanley <joel@jms.id.au> wrote:
> Hi Patrick,
>
> On Wed, Jun 14, 2017 at 7:40 AM, Patrick Venture <venture@google.com> wrote:
>> Signed-off-by: Patrick Venture <venture@google.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 20 +++++++++++++++++++-
>
> I had some issues with conflicts between the 4 patch series and the
> two patches you'd sent before then. So merged all of your device tree
> changes for the Q71L as one patch.
>
> Next time you're sending changes that may conflict, put them all in
> the same series. It's okay to send a v2 of the series with additional
> patches added.
>
> Also, in the case of your patch #4 where you needed to make a fix,
> it's convention to re-send the entire series. No worries this time
> though, I got it sorted in the end.
>
> I noticed we did not have the dts added to the Makefile, so it was not
> building. I fixed that too. Please take a look a the tree and make
> sure all of the device tree nodes are in there as you expect them to
> be.
>
> Cheers,
>
> Joel
>
>>  1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> index 4b5047b5d592..2b01c5bcc88b 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> @@ -145,7 +145,7 @@
>>          *    SSD 1,
>>          *    SSD 2
>>          */
>> -       i2cswitch@77 {
>> +       i2c-switch@77 {
>>                 compatible = "pca9548";
>>                 #address-cells = <1>;
>>                 #size-cells = <0>;
>> @@ -177,6 +177,24 @@
>>
>>  &i2c7 {
>>         status = "okay";
>> +
>> +       /* 0: PSU4
>> +        *    PSU1
>> +        *    PSU3
>> +        *    PSU2
>> +        */
>> +       i2c-switch@70 {
>> +               compatible = "pca9546";
>> +               reg = <0x70>;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +       };
>> +
>> +       /* PDB FRU */
>> +       eeprom@52 {
>> +               compatible = "atmel,24c64";
>> +               reg = <0x52>;
>> +       };
>>  };
>>
>>  &i2c8 {
>> --
>> 2.13.1.518.g3df882009-goog
>>
