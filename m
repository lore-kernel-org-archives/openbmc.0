Return-Path: <f.fainelli@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::243; helo=mail-ot0-x243.google.com;
 envelope-from=f.fainelli@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QdSf9so7"; 
 dkim-atps=neutral
Received: from mail-ot0-x243.google.com (mail-ot0-x243.google.com
 [IPv6:2607:f8b0:4003:c0f::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zhjFx4c0CzF12M
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 14:59:33 +1100 (AEDT)
Received: by mail-ot0-x243.google.com with SMTP id f18so22317872otf.6
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 19:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:in-reply-to:references:mime-version:content-transfer-encoding
 :subject:to:cc:from:message-id;
 bh=ejuNsnZ5JJig9VKcaYhF8tETz9SFqfqX5hCyfT2WVa4=;
 b=QdSf9so7F4YaaWPVFWbnxALqdvEDo4OKCnVeGeT4SKJDjOrjm0/g1kvIFaT0kccI7g
 k65nBI2KUW8taZfbbHoX53dUh6OGFf7zgts0dgO+EX3JT7ZnIncNZGb7BtIILiluGMLd
 qS5q7SPyIBr1biXmok7cad/tupqFTOJpEv9f9sFXfyakRTyjQYurtFUKCh0m9ULexTjD
 H/q8NNvsGEfb3g2oJ/2Q8Zj0sCpQ0w86DDgGRb0jGpjKxTyUu6NTnffhaqBdlUtugfVE
 7FvEr9Hzz3y2rYtjSI3gGxsmwGgGmCeiKaOxtqWYjNBhnvymBriUjrKXFdgnhLMJMoIE
 ApLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:references:mime-version
 :content-transfer-encoding:subject:to:cc:from:message-id;
 bh=ejuNsnZ5JJig9VKcaYhF8tETz9SFqfqX5hCyfT2WVa4=;
 b=WwrDmODDSy+l2cHzg3MZ+AHaX31HXR4R+OpC6oCRaPYUrWA7t7O3WUJ7NqO2EgmZoE
 ZC6d5mmN2ZRR7FvOJ3pV4k8x9DGazDyMmmT6NrrP7LfS+R8gem55PTOUuVXzF6/sxu3D
 qszRmvYptihx126Czq2yKrEd6coYtKk8LPsmwypRDklc+zEAQha6v7Y6ytiURbWQJUtN
 5EhAX3FbzoOxDOOGtsuoMifS/TtF9oMSsYaL0iqp9/iY1atq/vb1iDh/pdj0hRkKUhpI
 Xxpo8j7m+GXudBdA1XrT/KOKD/t2YZ03URZEjdmo7WSnUzc0W770XRYYBhnqzNLQKWuW
 WwPg==
X-Gm-Message-State: APf1xPANIVQlUGXZAbampPNP0bYkSWODNTeE01cKWN/VHaUxHfjObaMl
 OihCiPZkcenT6Y+uDD4Oc9k=
X-Google-Smtp-Source: AH8x225Pp99FJi7rCsVMmmGoMX1plMkVMMEW3OtXwfprdQXMWkd5U8t8t6938ZMub/VIMWNrDsevaw==
X-Received: by 10.157.17.162 with SMTP id v31mr543598otf.30.1518667170921;
 Wed, 14 Feb 2018 19:59:30 -0800 (PST)
Received: from ?IPv6:2001:470:d:73f:f024:12b0:6c42:54c6?
 ([2001:470:d:73f:f024:12b0:6c42:54c6])
 by smtp.gmail.com with ESMTPSA id j20sm4602657oii.49.2018.02.14.19.59.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Feb 2018 19:59:29 -0800 (PST)
Date: Wed, 14 Feb 2018 19:59:25 -0800
In-Reply-To: <CACPK8XeOUrrGinU_fmnmn4atYm3Bs-xSoB2MqT0Yr-LytHt78Q@mail.gmail.com>
References: <20180205235757.246758-1-brendanhiggins@google.com>
 <20180205235757.246758-3-brendanhiggins@google.com>
 <CACPK8XdXOaPZ5i=qKns3=V87nhfY62PNr4kwH9xwVYxY0djo0g@mail.gmail.com>
 <CACPK8XeOUrrGinU_fmnmn4atYm3Bs-xSoB2MqT0Yr-LytHt78Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Joel Stanley <joel@jms.id.au>, Brendan Higgins <brendanhiggins@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
CC: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Mark Rutland <mark.rutland@arm.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, julien.thierry@arm.com,
 Philippe Ombredanne <pombredanne@nexb.com>,
 devicetree <devicetree@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <A86ACBBE-0825-482F-81BE-24B7CAED92CD@gmail.com>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2018 03:59:34 -0000

On February 14, 2018 6:28:51 PM PST, Joel Stanley <joel@jms=2Eid=2Eau> wrot=
e:
>On Tue, Feb 13, 2018 at 4:52 PM, Joel Stanley <joel@jms=2Eid=2Eau> wrote:
>> Hi Brendan,
>>
>> On Tue, Feb 6, 2018 at 10:27 AM, Brendan Higgins
>> <brendanhiggins@google=2Ecom> wrote:
>>> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
>>> specific device tree for the NPCM750 (Poleg) evaluation board=2E
>>>
>>> Signed-off-by: Brendan Higgins <brendanhiggins@google=2Ecom>
>>> Reviewed-by: Tomer Maimon <tmaimon77@gmail=2Ecom>
>>> Reviewed-by: Avi Fishman <avifishman70@gmail=2Ecom>
>>> Reviewed-by: Joel Stanley <joel@jms=2Eid=2Eau>
>>> Reviewed-by: Rob Herring <robh@kernel=2Eorg>
>>> Tested-by: Tomer Maimon <tmaimon77@gmail=2Ecom>
>>> Tested-by: Avi Fishman <avifishman70@gmail=2Ecom>
>>
>> This looks well acked, reviewed and tested=2E How do you plan to have
>> the ARM SoC maintainers merge your patches?
>
>Following up on an IRC conversation with Brendan:
>
>The process is normally to create a git branch based on on -rc1, apply
>your patches, and send them to the ARM maintainers=2E You then push a
>signed tag to a repository somewhere, send a pull request (a git
>request-pull email, not a Github PR) and Arnd, Olof or one of the
>other maintainers will pull your tree some time before the next merge
>window opens=2E
>
>Arnd, do we have this documented somewhere for new maintainers to
>follow?

I would add a few things that we had to go through before for Broadcom SoC=
s:

- send your pull requests to arm@kernel=2Eorg and copy Arnd, Olof and Kevi=
n

- you would want to get your PGP key signed by as many people as people as=
 possible which should not be a problem if you are in an area with lots of =
kernel people like the Bay Area (which reminds me I should do that)

- if you are going to be reasonably active every cycle consider getting a =
kernel=2Eorg account to host your tree (we are still not doing that=2E=2E=
=2E)

- for future pull requests, you might want to break them into e=2Eg: DTS, =
board/Kconfig, drivers, defconfig, maintainers file, and have as little dep=
endencies between each branch to minimize merge conflicts

- build test and run test your changes against at least one other platform=
, e=2Eg: QEMU to check for multiplatform issues

In case this is of any value, there is a script here that will automatical=
ly generate pull requests emails for you based on branches matching what wa=
s mentioned above, it will also take care of CC'ing the people involved in =
the different patches:

https://github=2Ecom/ffainelli/misc-scripts/blob/master/gen-pull=2Epl

It still requires you to create an appropriate tag for the pull requests, =
though I might semi-automate that in the future, at least spawn an editor a=
nd offer some guidance, based on commit messages as to what should be in th=
e pull request email/tag=2E

HTH

--=20
Florian
