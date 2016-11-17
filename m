Return-Path: <joel.stan@gmail.com>
Received: from mail-yw0-x243.google.com (mail-yw0-x243.google.com
 [IPv6:2607:f8b0:4002:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tK8B50czXzDvsq
 for <openbmc@lists.ozlabs.org>; Thu, 17 Nov 2016 16:02:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="i+wX1cLg"; 
 dkim-atps=neutral
Received: by mail-yw0-x243.google.com with SMTP id r204so17521627ywb.3
 for <openbmc@lists.ozlabs.org>; Wed, 16 Nov 2016 21:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=H794COdlZO3IdH0S2ito+hf9Z1SqOISG5CVzW7bSScI=;
 b=i+wX1cLgM482+w/pBOErAdfIJWZCfbOwOIacIGT0QmL+5NXmY+KZwYY6Kafui4aJvo
 FWSnDVYIGxuLIMJdAX1Gnt3L8ZI6yIkDcJZ1ym82b3w5IFbNeRNBGRm3fQ+QuyaV33hq
 zdRV5il4NkMLyJKLeckiVAyO7ftS5LHzIJJZcaRHAIjDuOnsZdaQORxD8RNL2mwTTuPS
 0ETUP/gbrPboskPDUmxriS5dcnd44LQAQmZIDWXhZey/RVuMITOstHDgYFVl34LoiqXT
 uI8j6QSSf4PfIfez6rJK7hZ1VT22sXNO1+RZAGnfEGaEZo+cHIveuMNdBxIUOHTpeO8X
 VbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=H794COdlZO3IdH0S2ito+hf9Z1SqOISG5CVzW7bSScI=;
 b=dbzp3W9AIT4HOwUV9Wtgk/lfXkwWHqEoa2a7zF1ilVDNEj4iM+cRpZ84o5pEcB7X8r
 bLYURlXXUQGnXAiPnA0pCiX0WVrkerfBsOgsY+sq8HPflMd4N2+rpq3yFAGlrfOPXxOy
 BxK1C4ZSvbfsvDfl6BKfk8X3UppN8a9QguefAxW7gmKY7jMycloJfyqc1hdlFl1RwZne
 xWa6YnfDvZ+X2v3Lttvm60y4aFI2aMN5qFK7mdzzeY/Gyk+oJjaT99FcQFd0KUk/oARl
 seX1EB+5rWL9jPFVFfFJGKwp6KW/aire0qwt7koh7ac7VfQgsqf+aEQ1KaF51ePALFTc
 t0aA==
X-Gm-Message-State: ABUngvfF810vn/PtCKwmG31cbbqvK0ptSGzm6nE+54sb/Sb4jtQRG0oATxOi0aG3Zkq7rfehfkiZG2woEQ28EQ==
X-Received: by 10.157.63.199 with SMTP id i7mr476788ote.63.1479358922960; Wed,
 16 Nov 2016 21:02:02 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Wed, 16 Nov 2016 21:01:42 -0800 (PST)
In-Reply-To: <1479335546.5215.9.camel@aj.id.au>
References: <1479316169-25297-1-git-send-email-clg@kaod.org>
 <1479335546.5215.9.camel@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Nov 2016 15:31:42 +1030
X-Google-Sender-Auth: yhX5ilMjoLYxr9RIsQM082gRZI0
Message-ID: <CACPK8XeiTa_t9Y8BKejFP83LqTYuvhs8fv5ayXG8KUj5NwPHNA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7] ARM: dts: aspeed: resurrect PNOR on ast2500
 evb
To: Andrew Jeffery <andrew@aj.id.au>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Thu, 17 Nov 2016 05:02:06 -0000

On Thu, Nov 17, 2016 at 9:02 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Wed, 2016-11-16 at 18:09 +0100, C=C3=A9dric Le Goater wrote:
>> It had gone to the Tartarus again. Let's bring it back to light.

Thanks for the lesson in Greek mythology.

>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
>> ---
>>  arch/arm/boot/dts/aspeed-ast2500-evb.dts | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> index 3dc472ae10e9..f60c367573f3 100644
>> --- a/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> +++ b/arch/arm/boot/dts/aspeed-ast2500-evb.dts
>> @@ -30,7 +30,10 @@
>>
>>  &spi1 {
>>       status =3D "okay";
>> -     pnor@0 {
>> +     pinctrl-names =3D "default";
>> +     pinctrl-0 =3D <&pinctrl_spi1_default>;
>> +
>> +pnor@0 {
>
> Whitespace is a bit busted though?

I will fix this when I apply.

Reviewed-by: Joel Stanley <joel@jms.id.au>

Cheers,

Joel
