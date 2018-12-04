Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="VY6719Au"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4386Y33shwzDqgM
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 14:19:35 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id o89so8795994qko.0
 for <openbmc@lists.ozlabs.org>; Mon, 03 Dec 2018 19:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FS7lb3w/ewyxRNSTNIMyn5epHI+c1ctI3G9GH/nO3Pg=;
 b=VY6719Au93tJ4rbbT0aKVV/VTcZeaPGPVK2RcOu6I+EN1aSXoFKkOHcl2Jv+ThaYng
 POlyjvz/bjMj1P7e+KkJgjLSjA2bnAkUTTfWBtRJlB0aLyb5o2G59ZW0Xay6aDFVHCyE
 MJbWBiVz0FILNQNZM2qE2arr/LhvznD/+rlss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FS7lb3w/ewyxRNSTNIMyn5epHI+c1ctI3G9GH/nO3Pg=;
 b=VV50hFG6QtJEsyuDDkgJC+dYej4DJF9COW6smhH/H7yf5MTjkU4gWa3gKC9cvGQXt6
 w5Eku9uw4j3njacFongwW88X5C3c2fNOHC83OK1iapGmqybHlkQreFGpt1wVwgJ9AgSN
 Gwa+4EZLbtOiDCOnLqwyGPqgDxdJSyubk3HH5vcPxViKBuxMIWKu5HCKDxKxmypoN2+t
 RTlqzJfkW8mUp4hhIZ131+CxCG8WIOilMKQlqIbRaMbLLnFJnGcEdel3LxN08L6i3pTs
 rV19LFu/IFFr0MTvDr+9PTRqrJIkRZowEh8ryZwIppBve6CxK0qqUhbSWGsjT3+KLUfA
 JIxQ==
X-Gm-Message-State: AA+aEWZdLUIDYMipt/RKxBtq4otEnsuUS2VBZp1OaOWe49gTXNR6z6/S
 HiBXJSpnj6OArbvgLpCm/FDTHiwCeDa1OrC7QMU=
X-Google-Smtp-Source: AFSGD/Uqk1ws3ne0RFihK9VDULSVHKxcNg3nLc+vj/sWWB61CIoWZVWVfkBPwLA87DIXjc9vEUCapNmEt96+R/INL9M=
X-Received: by 2002:a37:781:: with SMTP id 123mr17195912qkh.231.1543893573242; 
 Mon, 03 Dec 2018 19:19:33 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfo5zzyLUa-8fU6j7d5GpVnFea1k3PC93vxiOvYAGV7ZQ@mail.gmail.com>
 <CACPK8Xfxq=df=nW+U57v4vHaJ8B96bi8ABddH_vZNHBBQcLXTA@mail.gmail.com>
 <1E4319BB-39C3-455F-B659-B37F0153F0D9@fb.com>
 <MWHPR15MB1486493B01A346850E6B73A7B2AE0@MWHPR15MB1486.namprd15.prod.outlook.com>
 <CACPK8XesPmDBEP_eftmh0Fm_4H7StxWfzzYvStD3HaMiFzX2Tw@mail.gmail.com>
 <VI1PR0502MB38692985438ED8BA1E4FACFFDDAF0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
In-Reply-To: <VI1PR0502MB38692985438ED8BA1E4FACFFDDAF0@VI1PR0502MB3869.eurprd05.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Dec 2018 13:49:20 +1030
Message-ID: <CACPK8Xd2FDD=FX7SK5cxWrkgGT190rJAHOJefs4Gws6qzJkfYA@mail.gmail.com>
Subject: Re: Linux dev-4.19
To: David Thompson <dthompson@mellanox.com>
Cc: Amithash Prasad <amithash@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, vijaykhemka@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2018 03:19:36 -0000

Hello Dave,

On Tue, 4 Dec 2018 at 13:43, David Thompson <dthompson@mellanox.com> wrote:
>
> Since 4.19 kernel is deemed "longterm" with a projected EOL of Dec 2020, =
is the plan to keep OpenBMC on this kernel version for a while?

I have no plans to stay on a given release once the next is out at
this stage. My goal is to get all of the code upstream, so that I
don't need to maintain any out of tree patches, and then system
integrator can pick whichever kernel they want for their system.

It would be straight forward to maintain a stable tree once the "dev"
tree has moved on past 4.19. I have some ideas on how this could work
if you are interested.

> I've yet to upstream any of my changes, my bad, and as a
> result I've gone through four kernel upgrades this year
> {4.13, 4.17, 4.18, and now 4.19}.

I encourage you to get your patches on the list! Do you have a run
down of what you keep out of tree?

Cheers,

Joel

> I'm curious about the OpenBMC kernel upgrade strategy,
> esp. after 4.19.
>
> Regards,
> - Dave
>
> -----Original Message-----
> From: openbmc <openbmc-bounces+dthompson=3Dmellanox.com@lists.ozlabs.org>=
 On Behalf Of Joel Stanley
> Sent: Monday, December 3, 2018 5:05 PM
> To: Amithash Prasad <amithash@fb.com>
> Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>; vijaykhemka@fb.com
> Subject: Re: Linux dev-4.19
>
> On Tue, 4 Dec 2018 at 07:25, Amithash Prasad <amithash@fb.com> wrote:
> >
> > >> I have couple of NCSI patch which were up streamed last week in linu=
x-next kernel. Will those be part of this 4.19 kernel in openbmc or what is=
 procedure to pull those patches in openbmc build. As these are required fo=
r Meta-facebook build with networking working.
> > Joel,
> >
> > Thanks for cherry-picking a few of the NCSI changes into dev-4.19! Alon=
g with these, can we get a couple more cherry-picked into dev-4.19?
> >
> > One patch from linux-next:
> > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/co
> > mmit/net/ncsi?h=3Dnext-20181203&id=3D16e8c4ca21a238cdf0355475bf15bd72e9=
2fe
> > b8f
> >
> > One merged patch to bring in the Tiogapass device tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commi
> > t/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts?id=3D3368e06e2a91=
a
> > 65cff59e520acc51b9adf4900bf
>
> Nice work. This is a great way to request the patches get merged. I'm hap=
py because they're already on their way upstream, and the URLs with SHAs ma=
ke it easy for me to cherry pick.
>
> Merged!
>
> Cheers,
>
> Joel
