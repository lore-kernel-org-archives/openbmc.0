Return-Path: <joel.stan@gmail.com>
Received: from mail-yb0-x243.google.com (mail-yb0-x243.google.com
 [IPv6:2607:f8b0:4002:c09::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wd9Hn6hL4zDq5j
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 22:48:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="f3pkVd3f"; 
 dkim-atps=neutral
Received: by mail-yb0-x243.google.com with SMTP id 130so434703ybl.2
 for <openbmc@lists.ozlabs.org>; Wed, 31 May 2017 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=WfX3q7Dp9nCpLoG6ByQbGfJyLvX9+Qh5sKPwYCQ0A+M=;
 b=f3pkVd3fgCwwV4d8U9vifOSVVESAPI+zdh/Gn49dOlCNpvrGAL72M9C29ih9wRFxIr
 XFN+tznUBu6lj4MMvHbIMA0uRpGt53Soy9DWirSfEpSn9+OtJ2a1tryyxiwQwVQ+rOn6
 SQRxXaeN4Aab2EAqNMynqV9Krx8Euk/ef9HcFXNCHFZuD3xhP9zxU4mNKRHA3f5Awaav
 gdRjEc40Kn5rlTuR2I2bF9PXfm8aH5pWWagaf4R8DbJMgxe+X0jQXqftTntJnIlKn/hV
 IyqLDVocdlK6FfyumUo8iAm0MhROt6Z9YF09UbzzWmix1+wHMYVYaMSJwyAhSu5Vmb3a
 BzmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc:content-transfer-encoding;
 bh=WfX3q7Dp9nCpLoG6ByQbGfJyLvX9+Qh5sKPwYCQ0A+M=;
 b=j8XG8YIeai8Tp1vDyK5ZPbUygwJQXHgpq3zR9ZQ20o+bsane5CqHDSaUksv9Gxji7S
 Esl11b2udjjg3Q28f9N/r54c5L9n05QmMIRJVONuX4B4Ym+Y4/LBGJViUp/NEEruoOUb
 FwiyAGe6pBoxpXjlkwTROjU2khAJNnhcsuyAIBQE0DAzo3Q/qHX/uO0iHSdCnI1uesLe
 gz8/fhLzA6vAzZYesjuBgIIvHZEhXMu7qxiYCeRbQ7KdWSEphRUXOZd1BQbmf5FKkQf0
 PhS9yjU1FL7xrM8v7/QZrexY2sJB/Wt2N61e4sgdfm3GvWcopYVYaCQqIt9c9A2HQraM
 8zmg==
X-Gm-Message-State: AODbwcDft0uUeB8qpiXOg/HLk02MRvB1zfwRfE/Oophb6W2qyJEQFjoN
 D0FSt77v0w3tdiGWtYjwKP3da7np0w==
X-Received: by 10.37.110.135 with SMTP id j129mr33930855ybc.123.1496234883468; 
 Wed, 31 May 2017 05:48:03 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.37.183.7 with HTTP; Wed, 31 May 2017 05:47:43 -0700 (PDT)
In-Reply-To: <78ec6cac-79f9-643e-71eb-dfeae156c9d4@kaod.org>
References: <1495746791-2748-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XcPUcbZt4xKHh+bNGq799ObpD1dfGaZamPL=Q9-UStS9Q@mail.gmail.com>
 <78ec6cac-79f9-643e-71eb-dfeae156c9d4@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 May 2017 22:17:43 +0930
X-Google-Sender-Auth: Cg-bZ4rZm4Mm36ObXKCf7pYpYKk
Message-ID: <CACPK8XcmU6fwBKoUB60Z_mvb2iwZQUWp3xrs1ZUw0ycp+b4fdA@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10 v2] arm: dts: aspeed: Add missing clock
 sources for barreleye
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A. James" <eajames@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Wed, 31 May 2017 12:48:06 -0000

On Fri, May 26, 2017 at 3:47 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote=
:
> On 05/26/2017 06:33 AM, Joel Stanley wrote:
>> On Fri, May 26, 2017 at 7:13 AM, Eddie James <eajames@linux.vnet.ibm.com=
> wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>
>>> Reorganize flash controllers into the ast2400 config. Barreleye wasn't
>>> booting with the new aspeed-smc driver.
>>
>> Your commit message mentions Barreleye, but you're also updating Palmett=
o.
>>
>> Can you please update all of the ast2400 platforms?
>>
>> Also cc Cedric on your next version so he can check that we're doing
>> the correct thing.
>
> Joel,
>
> I would also like to add CONFIG_VMSPLIT_2G on the G4 to define
> correctly the SMC controller flash mapping window on the AHB Bus.
> It is limited to 32MB currently

Yes, we should do that, I agree.
>
> Do you think we can take these ?
>
>         http://patchwork.ozlabs.org/patch/752285/

"ARM: dts: aspeed-g4: fix AHB window size of the SMC controllers"

This one did not apply, as the device tree we have in dev-4.10 is
ancient compared to upstream. I think Eddie's series that converts the
machines over to match the ast2500 should help.

I will apply it once I have applied Eddie's v5 (as v4 needs some fixes
for missing fast-read properties).

>         http://patchwork.ozlabs.org/patch/752287/

I applied this one.

Apologies for not applying them earlier. I had assumed they were
intended for the upstream tree. I have applied both of them to my
staging tree for upstream as well.

Cheers,

Joel
