Return-Path: <xow@google.com>
Received: from mail-qt0-x230.google.com (mail-qt0-x230.google.com
 [IPv6:2607:f8b0:400d:c0d::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vK7kw4qqbzDq5x
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 06:42:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="fE8k4FXf"; 
 dkim-atps=neutral
Received: by mail-qt0-x230.google.com with SMTP id v23so14430855qtb.0
 for <openbmc@lists.ozlabs.org>; Thu, 09 Feb 2017 11:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=2qCC5U8JbRfFirf5tAsW7/A4c0xFp1zE7nzHN5legj0=;
 b=fE8k4FXfzJrG/3HITtWlYO2cNj3rpsqyJ3c6IscJtKD/ETn5INAafMg37QtEkG/629
 ZJVfEuud/qzL7/5fDdVdH95O5k4lZFEtxkghhYqyXkxHHHy/aNps4BoskeN+TobwvYPB
 aYWMtCXtAxQC/MYYAZDMp1WRErFwax3ZQnbhp4mAzx4C7qBqtAzRJljORkiW6rEFjZWu
 CiUc9F2zd5JZ9aOR118+P0r6D9d2tw0JcJFFopxGDYZ+oWWDzMYOzvkh0DD9+krj2MXY
 9bDJKjDA/3A1yDaYNgZDYRXajWBnDhQ8Vi/+1Q1t4Rqp1Lf6R4AGulY9LrKKGg/kR4zY
 9bvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=2qCC5U8JbRfFirf5tAsW7/A4c0xFp1zE7nzHN5legj0=;
 b=htsH9w5i7wqB5Vjk9Y/MN1xwzJMO8vn1Jcou75E0NEJZFkLDAIoUROq1IwtTzN1ddB
 vLhX4encs+mLs8GjxRooTi1XT9O/VMjstip5HqZZBi5WrEJBkuT6taHhpP4q3ooADIPf
 6bXs+CbAX7jNtmJJLoy3jWh3Z3tgIG21oJgh54msyXl+hUdYez2YJVw+CmS5STdu/2j/
 mD14M7oRWjxvYesxt/pZKIN92IQ3OaZhtHj1ipiIhKnEmEZw9otJv0M22VO1QFyGZNdZ
 7aIiwkMy2AYlcUWrXDZu1lYUMHed41bOJg/1gfcSWKN6tga6qJSmyP5+4aqXFjQDuuwL
 KmDw==
X-Gm-Message-State: AMke39lTF5mAiCgEemty12QZtrMkkhnPjrZmsKfKcujZEc4D5RIF2uKm6QTMkVGgY5vGMQiyUZPK9+01GaZSvCUG
X-Received: by 10.200.41.153 with SMTP id 25mr4329590qts.108.1486669334406;
 Thu, 09 Feb 2017 11:42:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.21.116 with HTTP; Thu, 9 Feb 2017 11:42:13 -0800 (PST)
In-Reply-To: <CACPK8Xd_G-a5ih+WU16pqOM+_gX-ik-eaUsOu_qdMETzqwk+uQ@mail.gmail.com>
References: <20170207023737.26936-1-joel@jms.id.au>
 <CAPH-5w6ckMjyxn=J2deBycOexc9cCdsMXxLYq44GPQM-xG9S7g@mail.gmail.com>
 <CACPK8Xd_G-a5ih+WU16pqOM+_gX-ik-eaUsOu_qdMETzqwk+uQ@mail.gmail.com>
From: Xo Wang <xow@google.com>
Date: Thu, 9 Feb 2017 11:42:13 -0800
Message-ID: <CAPH-5w45qp_r6nDHPOQXURpUuP2dwDKhTT=wrb6t0uPgyq2Dnw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add FSI pins to Zaius device tree
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Thu, 09 Feb 2017 19:42:17 -0000

On Wed, Feb 8, 2017 at 6:18 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Wed, Feb 8, 2017 at 6:29 AM, Xo Wang <xow@google.com> wrote:
>> Hi Joel,
>>
>> Thanks for keeping us up to date.
>>
>> On Mon, Feb 6, 2017 at 6:37 PM, Joel Stanley <joel@jms.id.au> wrote:
>>> Pin assignments for the EVT-2 board as described in pdbg. The status is disabled
>>> so this does not enable the in-kernel FSI driver yet.
>>>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> ---
>>>
>>> Tested on zaius5 with the driver enabled and it worked.
>>>
>>>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts | 12 ++++++++++++
>>>  1 file changed, 12 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>>> index e2195a641414..e1c9b3f4fe44 100644
>>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts
>>> @@ -74,6 +74,18 @@
>>>                         gpios = <&gpio ASPEED_GPIO(AA, 2) GPIO_ACTIVE_LOW>;
>>>                 };
>>>         };
>>> +
>>> +       fsi-master {
>>> +               compatible = "ibm,fsi-master", "ibm,fsi-master-gpio";
>>
>> Andrew's comment for Witherspoon applies here as well
>> ("ibm,fsi-master-gpio" makes sense as the "definitive" name).
>
> I agree. I had an offline chat with Andrew about it, suggesting that
> he review the bindings that Chris Bostic has sent upstream. There's
> already a few issues identified with them that we will have to clean
> up.
>
> I suggest leave this matching the other systems for now, and when we
> settle on the new binding I will migrated all machines to use that.
>

Reviewed-by: Xo Wang <xow@google.com>

>>
>>> +
>>> +               status = "disabled";
>>> +
>>> +               clock-gpios = <&gpio ASPEED_GPIO(C, 3) GPIO_ACTIVE_HIGH>;
>>> +               data-gpios = <&gpio ASPEED_GPIO(C, 2) GPIO_ACTIVE_HIGH>;
>>
>> FYI, we'll return to the Norm-recommended assignments for these at the
>> next board spin to keep FSI pins on their own GPIO port. Not sure how
>> helpful that is in the context of the FSI kernel driver since it's not
>> poking the registers directly.
>
> I assume there are electrical reasons for doing that.
>

Not that I know of. Somebody was thinking that moving all the FSI pins
to their own GPIO port(s) would allow a single byte or word write to
the output data register to set pin states without read-modify-write.

I don't think that's an optimization we can apply through gpiolib for
the kernel FSI driver. Hence my skepticism about helpfulness.

> How do you suggest we handle the old and new device tree?
>
> We could detect the board revision and then fix up the device tree in u-boot.
>

Yeah, sounds good. Having board revision detection and device tree
fixups in U-boot seems useful in general.

>>
>>> +               trans-gpios = <&gpio ASPEED_GPIO(O, 6) GPIO_ACTIVE_HIGH>;
>>> +               enable-gpios = <&gpio ASPEED_GPIO(D, 0) GPIO_ACTIVE_HIGH>;
>>> +               mux-gpios = <&gpio ASPEED_GPIO(P, 6) GPIO_ACTIVE_HIGH>;
>>> +       };
>>>  };

cheers
xo
