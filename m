Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x244.google.com (mail-vk0-x244.google.com
 [IPv6:2607:f8b0:400c:c05::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vJhbL6pyLzDqBr
 for <openbmc@lists.ozlabs.org>; Thu,  9 Feb 2017 13:19:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ty6QZriZ"; 
 dkim-atps=neutral
Received: by mail-vk0-x244.google.com with SMTP id r136so13403415vke.1
 for <openbmc@lists.ozlabs.org>; Wed, 08 Feb 2017 18:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=osch7luK73lzEY9T4ejIrZOsItonD8iAWYUExp4LXnw=;
 b=ty6QZriZp0mUx9pn9j4hDz8jlz4MWqotvA2BnHfrYSyG1Aqtb2izwl5ur0fHTByo8B
 vzYwcM/Zvd+Ey/XeDps9LoMj6ShD0K2yf9D1qgv+NUXYWpTM5KbVgxoOD30dUc2HVJ7i
 WX8nP3RRaBMcTU34KTEofmu7AadBnX5zCwYIesGv1NTUooyVLDUSPmRnqpAfcZXpb3NU
 MiAtqsFiGlzknMsSgHYNBy/8lvtQXxaZ3OJzn72q8IIts/t38FZg4DeKCn53mTDdoPX8
 VmkJoOQwYzPnxk56Myd01FmqZ1G3rW4XyHLQv81qYlrjXHlxxbrNR+JyOTKHatRmbu7W
 KgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=osch7luK73lzEY9T4ejIrZOsItonD8iAWYUExp4LXnw=;
 b=N5IOCJGRa3/NFY4ZEFdiqr2q8Zt4tHqdupY6QkdxK+SsH35CBHKijHL6S/EImswnC7
 S5mFik+AJmvgX/ItWt6wWcE8Q9NS3yRZCMoPJPy6qprttlxtZ6XehjX8MmOWPKa5CjUE
 E3YMH7ESTEugSHOueOi8ZqL0wYIsxPQHuH0V+o2ZAqb/glHhTPk767CICiV7CTg3j3VK
 5pLI0Q4hllYWYeuHAH09ggd6SUeX0Edixd8JemoC5CvleMHjM++Fx6eJrZRF5fOEmKmg
 GcOKNq8KFmYzm+d/ypkjpmpX3l9dchcTpDyXylb8m7+QWvfUbAQbN/p0I42FnFxuzIEf
 OPHQ==
X-Gm-Message-State: AMke39n6gpVevGieuNzuYalMGFrf/CepzLps8CvvUT8sN8cq2dOikSNKyjE/AQmHM+55KWZEYF1aPGcgJUohiQ==
X-Received: by 10.31.49.81 with SMTP id x78mr384036vkx.82.1486606747048; Wed,
 08 Feb 2017 18:19:07 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.92.150 with HTTP; Wed, 8 Feb 2017 18:18:46 -0800 (PST)
In-Reply-To: <CAPH-5w6ckMjyxn=J2deBycOexc9cCdsMXxLYq44GPQM-xG9S7g@mail.gmail.com>
References: <20170207023737.26936-1-joel@jms.id.au>
 <CAPH-5w6ckMjyxn=J2deBycOexc9cCdsMXxLYq44GPQM-xG9S7g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 9 Feb 2017 12:48:46 +1030
X-Google-Sender-Auth: KKR1Tth2RGC5Em7lAaHCDcgMsuE
Message-ID: <CACPK8Xd_G-a5ih+WU16pqOM+_gX-ik-eaUsOu_qdMETzqwk+uQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add FSI pins to Zaius device tree
To: Xo Wang <xow@google.com>
Cc: Rick Altherr <raltherr@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 09 Feb 2017 02:19:11 -0000

On Wed, Feb 8, 2017 at 6:29 AM, Xo Wang <xow@google.com> wrote:
> Hi Joel,
>
> Thanks for keeping us up to date.
>
> On Mon, Feb 6, 2017 at 6:37 PM, Joel Stanley <joel@jms.id.au> wrote:
>> Pin assignments for the EVT-2 board as described in pdbg. The status is disabled
>> so this does not enable the in-kernel FSI driver yet.
>>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> ---
>>
>> Tested on zaius5 with the driver enabled and it worked.
>>
>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> index e2195a641414..e1c9b3f4fe44 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>> @@ -74,6 +74,18 @@
>>                         gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_LOW>;
>>                 };
>>         };
>> +
>> +       fsi-master {
>> +               compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>
> Andrew's comment for Witherspoon applies here as well
> ("ibm,fsi-master-gpio" makes sense as the "definitive" name).

I agree. I had an offline chat with Andrew about it, suggesting that
he review the bindings that Chris Bostic has sent upstream. There's
already a few issues identified with them that we will have to clean
up.

I suggest leave this matching the other systems for now, and when we
settle on the new binding I will migrated all machines to use that.

>
>> +
>> +               status = "disabled";
>> +
>> +               clock-gpios = <&gpio ASPEED_GPIO(C, 3) GPIO_ACTIVE_HIGH>;
>> +               data-gpios = <&gpio ASPEED_GPIO(C, 2) GPIO_ACTIVE_HIGH>;
>
> FYI, we'll return to the Norm-recommended assignments for these at the
> next board spin to keep FSI pins on their own GPIO port. Not sure how
> helpful that is in the context of the FSI kernel driver since it's not
> poking the registers directly.

I assume there are electrical reasons for doing that.

How do you suggest we handle the old and new device tree?

We could detect the board revision and then fix up the device tree in u-boot.

>
>> +               trans-gpios = <&gpio ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
>> +               enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>> +               mux-gpios = <&gpio ASPEED_GPIO(P, 6) GPIO_ACTIVE_HIGH>;
>> +       };
>>  };
