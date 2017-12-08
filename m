Return-Path: <venture@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400c:c08::244; helo=mail-ua0-x244.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="h8+HuWpy"; 
 dkim-atps=neutral
Received: from mail-ua0-x244.google.com (mail-ua0-x244.google.com
 [IPv6:2607:f8b0:400c:c08::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ytcGt44vtzF066
 for <openbmc@lists.ozlabs.org>; Sat,  9 Dec 2017 02:49:26 +1100 (AEDT)
Received: by mail-ua0-x244.google.com with SMTP id h2so7749757uae.12
 for <openbmc@lists.ozlabs.org>; Fri, 08 Dec 2017 07:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=oZk0NyAi3hKmoyYlBsFHfE7joc0SwdSt8IHcAT8wbdk=;
 b=h8+HuWpykRMXvRcge9JuNAu0z2PDyC+VAKPnYrbVdCvmGZqKaC7kJraJJPX6wSLpTR
 IOk0nAW5/gerYjNAwVfb1fBZAXq8aXVx64mNvc10fC3BpcagTNJGF/dfdqx2D2d8LpA/
 r1oqCDFOi5ftoUmwbNifAoCR8t823iGH8oKDKW+g8e19jR0vlalGmpgpC7OucBhymGN4
 nokxJcklmVWQfWhAuqp2zghINxgQ1609DHmeTx36LT6cdruc3SX1uNOwd8WBhSENPG3S
 pOUh48LyuLTwsdF3J9GHO/x64zw4NrQNZ9o5pmBKAj0HRikHnWG66EToHeMHgh+73Kuw
 z2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=oZk0NyAi3hKmoyYlBsFHfE7joc0SwdSt8IHcAT8wbdk=;
 b=lPdgmJw06dsk1u9XVwQIt7mH3RMXTXfYi0HtTdZlDe2lVirKOalACG+Mremielivbv
 8ura4k24xY+oPw6DNKfIOPptqViw11hXvnlY/uNum2hkx13tngrKYZ0WwK/EFcwDzQ8q
 qZJBN+7P5dqv+WWc/TCYKFBQ/Xcg4kDX5oXRGfWpct+b/kGOfD/Un8jBC7fdP1oNQLLJ
 RWXG/Zrr3QWTFYvmOlXKyr8prGVwv+xpaLmu4GPIo6P0/+/spWijkDgCrPmlxaNUvbvA
 CQPA/hJD9rOqlpDAkeONve3n5grd8OWgGMGPZiUsonoePEd6T2e7ATwWJ+FB5MraxS3s
 1pMw==
X-Gm-Message-State: AKGB3mKrYTNPXtb3k2YxrJFbAaUFbafuqiAsQlTW4MFqvkbrFInL1BVJ
 ZJ44e/VHomizDRn6CWVHhTXy1AQKlaRFeLLP4etok9IR
X-Google-Smtp-Source: AGs4zMYKEnfg5t59B6NtVXvu9EntJgyo3TZbwDH+XF614XNacJYgbWofvsK1wT9fFLcfdGgEe12G9T0hfXskmE/EaA0=
X-Received: by 10.159.61.196 with SMTP id e4mr18793429uaj.156.1512748163297;
 Fri, 08 Dec 2017 07:49:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.94.150 with HTTP; Fri, 8 Dec 2017 07:49:02 -0800 (PST)
In-Reply-To: <CACPK8Xd8zoXjtw6mfwUsyoyZEamqEpPSHu-UkLvQD2s03L4nEw@mail.gmail.com>
References: <20171127201333.189812-1-venture@google.com>
 <CACPK8Xd8zoXjtw6mfwUsyoyZEamqEpPSHu-UkLvQD2s03L4nEw@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Fri, 8 Dec 2017 07:49:02 -0800
Message-ID: <CAO=notwhD_0_EHhh4NzX3GrXbbVne+wmC1nac=R2jO86+c10EA@mail.gmail.com>
Subject: Re: [PATCH linux] ARM: dts: aspeed: quanta: add i2cmux for frus
To: Joel Stanley <joel@jms.id.au>
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
X-List-Received-Date: Fri, 08 Dec 2017 15:49:27 -0000

Thanks.  I added the @1 from reading another device-tree that used
this not super commonly used node.  But your explanation makes perfect
sense.

Patrick

On Thu, Dec 7, 2017 at 10:32 PM, Joel Stanley <joel@jms.id.au> wrote:
> On Tue, Nov 28, 2017 at 6:43 AM, Patrick Venture <venture@google.com> wrote:
>> The memory riser frus on the board are controlled
>> by a gpio mux.
>>
>> Signed-off-by: Patrick Venture <venture@google.com>
>> ---
>>  arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts | 93 +++++++++++++++++++++-------
>>  1 file changed, 69 insertions(+), 24 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> index 42b1d8007316..b93b29191960 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-quanta-q71l.dts
>> @@ -119,6 +119,75 @@
>>                         <&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>,
>>                         <&adc 8>, <&adc 9>, <&adc 10>, <&adc 11>;
>>         };
>> +
>> +       i2cmux@1 {
>
> When you stick a unit name on a node, it is supposed to have a
> matching reg property. We don't have a reg property here, so we
> shouldn't have the number. This matches what the i2c-mux-gpio bindings
> describe.
>
> I dropped the '@1' for you when applying. It's in dev-4.10 now.
>
> Cheers,
>
> Joel
>
>> +               compatible = "i2c-mux-gpio";
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
