Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="kT2m8N1F"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 437zZ95xrhzDqGk
 for <openbmc@lists.ozlabs.org>; Tue,  4 Dec 2018 09:05:05 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id y20so15718688qtm.13
 for <openbmc@lists.ozlabs.org>; Mon, 03 Dec 2018 14:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3YZ5aZQeTRK1cTeSk1lQOb1HXK6qMedbp8bdI0u74as=;
 b=kT2m8N1F78MDWW5opHxVuIKsIlpLUjRJH9TxJ4sQ56dVz6QTNMs/6iIe3pmDgmbVqC
 1i9rboldlTJFdveL4QzKQb8fZvc38QHXPH2D+P/t7NjrJXRODNLX9aMHhaSvDw0oEELD
 IcEESuilv/0CXGekyAKW9FyH8I6CybFkPSvOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3YZ5aZQeTRK1cTeSk1lQOb1HXK6qMedbp8bdI0u74as=;
 b=OqsMQ8FGsg5ryfbGTHGscb+ZU+wnCdDL4D1ndfFPHfr7Hdo/TCgYUfTNi7nbLaop5I
 GO14ZQuq/BLJAo5R1CR4nQO1+/OlNR8lpYxPqj752ROpBAMN9sT9GINUinAR8KnhYnMz
 80eerd6XNtPsMWUvkD3eaNepWr6VE4gjStm/U+ntmaXSjB48EovLl56wbmOmBRIXpalq
 dicrLHiS+ICkaWUAPHP4gHGv+kA+tuLeihYWokT9tkEFAoU1ptkL4dC/pjmrvODQeyT4
 pxq5i4DooQBQsHeoqRvcilkMHcDzWhwpi5euQIWqBY5exR75/W89Q8MVyX/t0ksaRcVU
 qkOw==
X-Gm-Message-State: AA+aEWae8LdNZQW1PSbkLcr6Uq8unsIyeYmu5ol+q9TZq3JAyYUyKSMM
 geE3+mWLvsAYnf2xT7V2Nb3JIGKMmhIcvYEU/8I=
X-Google-Smtp-Source: AFSGD/Vba9hmVkWWRtrgcllq5/N5vYaD0xl9q3SU8SqgVVsxAYtNhHEfgLY76+mKcM4hv7HF8JyBzu/uE16Xyyr58YY=
X-Received: by 2002:ac8:29b7:: with SMTP id 52mr16937402qts.266.1543874703444; 
 Mon, 03 Dec 2018 14:05:03 -0800 (PST)
MIME-Version: 1.0
References: <CACPK8Xfo5zzyLUa-8fU6j7d5GpVnFea1k3PC93vxiOvYAGV7ZQ@mail.gmail.com>
 <CACPK8Xfxq=df=nW+U57v4vHaJ8B96bi8ABddH_vZNHBBQcLXTA@mail.gmail.com>
 <1E4319BB-39C3-455F-B659-B37F0153F0D9@fb.com>
 <MWHPR15MB1486493B01A346850E6B73A7B2AE0@MWHPR15MB1486.namprd15.prod.outlook.com>
In-Reply-To: <MWHPR15MB1486493B01A346850E6B73A7B2AE0@MWHPR15MB1486.namprd15.prod.outlook.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 4 Dec 2018 08:34:52 +1030
Message-ID: <CACPK8XesPmDBEP_eftmh0Fm_4H7StxWfzzYvStD3HaMiFzX2Tw@mail.gmail.com>
Subject: Re: Linux dev-4.19
To: Amithash Prasad <amithash@fb.com>
Cc: vijaykhemka@fb.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Mon, 03 Dec 2018 22:05:07 -0000

On Tue, 4 Dec 2018 at 07:25, Amithash Prasad <amithash@fb.com> wrote:
>
> >> I have couple of NCSI patch which were up streamed last week in linux-=
next kernel. Will those be part of this 4.19 kernel in openbmc or what is p=
rocedure to pull those patches in openbmc build. As these are required for =
Meta-facebook build with networking working.
> Joel,
>
> Thanks for cherry-picking a few of the NCSI changes into dev-4.19! Along =
with these, can we get a couple more cherry-picked into dev-4.19?
>
> One patch from linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/net/ncsi?h=3Dnext-20181203&id=3D16e8c4ca21a238cdf0355475bf15bd72e92feb8f
>
> One merged patch to bring in the Tiogapass device tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/a=
rch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts?id=3D3368e06e2a91a65cff5=
9e520acc51b9adf4900bf

Nice work. This is a great way to request the patches get merged. I'm
happy because they're already on their way upstream, and the URLs with
SHAs make it easy for me to cherry pick.

Merged!

Cheers,

Joel
