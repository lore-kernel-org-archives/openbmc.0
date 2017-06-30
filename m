Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wzSFV3TNnzDr60
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 17:04:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XylKSz9u"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id k192so315271ybk.1
 for <openbmc@lists.ozlabs.org>; Fri, 30 Jun 2017 00:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=i1YBO5AM9lPs8HxtRpqCahHSFh0JvhEw+T5j0qpAnv0=;
 b=XylKSz9ucRYl0ILOgrswZOXsdx9dpvDnY/g8CkiyoNzWGrx5XIQKaj1jJSAs7JLqqH
 NDJVWUWVD6X7R+/9A7sEqXOOW+cWnCe3N2fNBMSEUzdsAeFXFvzALNGf3a/lwOtJLd9Y
 s1ehgcNUDaX+uOczD0K5z4k6BOhq2yWrX/86FC3O70zcXjtIWS/2U/Akrlod9xx0OtaN
 Iq1oQetRVhh42N3SzXR+rW+Wx1Po9zXqxYulKxfcEGcAzKLz2w/2OYAn2VVbXu4xQClV
 5fyh3ZHJ8Ol9/PNj+h4gP0y/mIM8EH5DgKhcdpkBmDwfOoSBh14K/tKAEf731urESlHQ
 B8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=i1YBO5AM9lPs8HxtRpqCahHSFh0JvhEw+T5j0qpAnv0=;
 b=dWGocxjNv9mD+l9jCXQ49mCOlaloTnkPny4HURYqG7LWcKdeyIVCJRw2BtDJ0aiGQg
 IfZTFAvet+PuE28tjxgJyDwCCWjG8dDcJUffT8t9AiW2sDVu+xIg4hrFXgrrX5+Z9cjg
 chKK0LfklguNnQE9y6H7m+BDV60fqj1mwDs3hyA/DoXajS30o8hKFxxPnujWxTpMn7wd
 HPg4zw/q5alV+R2TZRYoB+53+sKl580RITRaTkiJubwYcuAf5CaU6IfOCI8noLI3AJF3
 0Ngtvv+ORF9iTy+BtupwMUcnuKaulQUJAXKfEOt1/NyrLoDhWTWJT/cq4TaJ3QMDcw1w
 kYqA==
X-Gm-Message-State: AKS2vOw0hT1Q94/Ad0rWx4OgakI9OcWQXe4OhBKdJ6hfL+OxCn0XwDiI
 Zd5zvs+dbTALP7F4zel8idLhXmBdBQ==
X-Received: by 10.37.88.193 with SMTP id m184mr14741142ybb.39.1498806267459;
 Fri, 30 Jun 2017 00:04:27 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.177.8 with HTTP; Fri, 30 Jun 2017 00:04:06 -0700 (PDT)
In-Reply-To: <1498801595.5203.19.camel@aj.id.au>
References: <20170630054302.20162-1-andrew@aj.id.au>
 <1498801595.5203.19.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 30 Jun 2017 16:34:06 +0930
X-Google-Sender-Auth: j0wdMhrzEuPk_D4WoPqDmsZqmic
Message-ID: <CACPK8Xemge72U6wNRAWURMSFfqTsU+piB63B9zBicARuB5DXYQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: aspeed: palmetto: Deconflict FSI trans line and hog
 of GPIOH6
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Sweta Potthuri <spotthur@in.ibm.com>
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
X-List-Received-Date: Fri, 30 Jun 2017 07:04:31 -0000

On Fri, Jun 30, 2017 at 3:16 PM, Andrew Jeffery <andrew@aj.id.au> wrote:
> Whoops, I missed adding "linux dev-4.10" in the subject prefix, but
> hopefully there's enough context :)
>
> On Fri, 2017-06-30 at 15:13 +0930, Andrew Jeffery wrote:
>> The hogs are left-overs from the Bad Old Days of Palmetto development.
>> The specification of the trans GPIO for fsi-master-gpio conflicted with
>> one of the hogs.
>>
>> Remove the hog to allow fsi-master-gpio to allocate the GPIO.
>>
>> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Thanks, applied to dev-4.10 with a small tweak to the commit message.

Cheers,

Joel

>> ---
>>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts | 7 -------
>>  1 file changed, 7 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> index f7a7cbf77aba..a171e41790c1 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts
>> @@ -295,13 +295,6 @@
>> >             line-name = "SYS_PWROK_BMC";
>> >     };
>>
>> > -   pin_gpio_h6 {
>> > -           gpio-hog;
>> > -           gpios = <ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
>> > -           output-high;
>> > -           line-name = "SCM1_FSI0_DATA_EN";
>> > -   };
>> -
>> >     pin_gpio_h7 {
>> >             gpio-hog;
>> >             gpios = <ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
