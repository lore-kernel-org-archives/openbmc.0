Return-Path: <joel.stan@gmail.com>
Received: from mail-it0-x243.google.com (mail-it0-x243.google.com
 [IPv6:2607:f8b0:4001:c0b::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tF2300J7nzDvHf
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 23:11:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gcYclUOW"; 
 dkim-atps=neutral
Received: by mail-it0-x243.google.com with SMTP id e187so3000296itc.0
 for <openbmc@lists.ozlabs.org>; Thu, 10 Nov 2016 04:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=Nt78/NqVCwdJJx0XgamazPoUxhyJx/mHaP7EbaOuNB0=;
 b=gcYclUOWfnTX6necb/KQI5uVKKjELvSyjiEUbK4ycBFx3PZlfT7pox3V1p0K1migG2
 bzyFS0Ik5zaqrbcCli31UjQpk6QIALfpfqwjVjmGaUysFSrD2i9iFOJ+3Nov3cZWPmLB
 tZtbcjh1FmfDunkKfqdTKv0tWQ7BsoTeFfxnFmnfjQvLhzz6APLAjBpXHixtA2xfnvsX
 YQNVHZhLlu8dPQg6jfiPmYDeIespSZwDdwH0U4sizoqRLSBji3bzyxr1Zo/ANfdFj4ax
 lfBj/Lys6cDWUesiaW8wmscqg28cPDUeRbxlXODZChGHzC/J+4JM1r1YCyFWRyqxstGB
 vtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=Nt78/NqVCwdJJx0XgamazPoUxhyJx/mHaP7EbaOuNB0=;
 b=M1SgSdDAfUezV/4pfwHeWEIvKugqcGePxKsoZ40bNsv7/PTpX4kfrbtz28zUN7C1Dh
 4pOrF7NJ4uUwX+QBAByG6wvzYkpT4XVFDTRF2oZHqtJkEHv7rN958shU53PyQDPbcgHR
 dNQ8NxQeJd0U77dvlxkO1WQRR/hgzipgRreQoalfVH2OmgkSgXFxUjM3KG2R8s3/Trbc
 ZHTtyjZVgAqAEIz2LUoXPZX4+rFa9ksnAlJHcE58x+IuQkx3xystR3gjbJgMLOmL6WyD
 wvgHRhlGtR/8TfYMWFWPRKdCDNwgkx3PGh6s9+GveONZwTnNkHOD4hkFKjmBBC3zgPR4
 Obyg==
X-Gm-Message-State: ABUngvdD+TaUi1SkEnhGZ1Q+TGxUuQpK2IqhGt60vE8UtloQSKCd2g6eJn11uZgeGJ5QSYLLnBaAxHbOTuz7pw==
X-Received: by 10.202.216.136 with SMTP id p130mr2374537oig.109.1478779898210; 
 Thu, 10 Nov 2016 04:11:38 -0800 (PST)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.182.97.41 with HTTP; Thu, 10 Nov 2016 04:11:17 -0800 (PST)
In-Reply-To: <8fac795c-8365-6731-806e-83c3457e2533@kaod.org>
References: <1477465067-19034-1-git-send-email-clg@kaod.org>
 <40804db4-242b-8e46-d435-ebae8a55ad7a@kaod.org>
 <CACPK8Xdzo5ONSrD7BCnjNfdF5+zX2t3=1hR52uF7qO3JC-j7Jg@mail.gmail.com>
 <8fac795c-8365-6731-806e-83c3457e2533@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Nov 2016 22:41:17 +1030
X-Google-Sender-Auth: ChvreX9LX8iU4orGg6N5ORrWEsk
Message-ID: <CACPK8XdMjCcZbFb57ow-+qvszr-QBS77uGqCWWUijA9J3Qo6CA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.7 0/8] BT driver sync up
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 10 Nov 2016 12:11:40 -0000

On Thu, Nov 10, 2016 at 10:34 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>> So please drop these two patches. This is too early.
>>>
>>> I will send later an interesting fix from Corey which handles
>>> concurrent reads and writes a little better than we do today.
>>> But after this is all merged.
>>
>> Okay, thanks for the clarification. I applied these patches to dev-v4.7:
>>
>>  ARM: dts: aspeed: Enable BT IPMI BMC device
>>  ARM: aspeed: Add defconfigs for CONFIG_ASPEED_BT_IPMI_BMC
>>  ipmi: add an Aspeed BT IPMI BMC driver
>>  ARM: dts: aspeed: remove previous iBT definitions
>>  ARM: aspeed: remove previous definitions in default config
>>  Revert "misc: Add Aspeed BT IPMI host driver"
>
> It looks safe to take that one also :
>
>         http://patchwork.ozlabs.org/patch/690292/

Oops, will need to update the device trees again. Yep, I will include
this one along with some updates to the device trees.

>
> May be, it is time now for a followup with :
>
> +       { .compatible =3D "aspeed,ast2500-ibt-bmc" },
>
> ?

For upstream? Yeah. I would consider collecting all of the acks from
the patch you posted and adding the second string in too, then posting
as a v2.

Cheers,

Joel
