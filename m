Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="WdQ5/FK0"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44dX393k9lzDqL8
 for <openbmc@lists.ozlabs.org>; Tue,  9 Apr 2019 12:55:32 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id c189so9358978qke.6
 for <openbmc@lists.ozlabs.org>; Mon, 08 Apr 2019 19:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qgTtciUWAMbqkY8NfbuPJVbugxMxzpOlgKNJrCw5iJo=;
 b=WdQ5/FK02mGcw8y4MjmiS95K4ouE2EgyGAWhwbJe1CTTxMX2rsWhp1eiwpWVqYOQUW
 cc/pyX9UsCKNrqRaIyXWdgdhPfb1vGn/GfBM3ZUEwsr5kWCQg5ubCP2lFw3LHr0r0TaQ
 fJlNP0dwmQgPoavN0FE7RjKZT6f7UlZR2rUwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qgTtciUWAMbqkY8NfbuPJVbugxMxzpOlgKNJrCw5iJo=;
 b=f6sFPdDIUQJs6YW4E34/OkQyfZKL5JGUomHdGNInZgLpDA8lIgRdsJoW+mb23HBFkQ
 MJjyXsp3xRkFqXGVDq6RjhtAHfnAlrQR3BPouFMTjUO6G+liJr+MvxLYjP5bMpOg9Nx/
 se6C/5YNMlW3h6ksjj5ZjrMXYW62ZqyJgxQ73hP3jZZJLIcUc+dO6vZMzV0jVSN6xEjV
 54cQm2zFf8WdTvcIecozgW6V9v+0Tpb1iQDMfZZJ5ZNj30TY8O/V5ZjoImgrIvQC8ubK
 0A6prX3ebkgqbzBdWJS1NzkGMKsZR1wnwRYYkQUUOvNtRIk81NOQDYAbtmtbBz/76b2H
 2Ctw==
X-Gm-Message-State: APjAAAXFZDRjjn2Gec1J2ZXiq6xz0CeX6ubN1RbW3Bi03W2nqP3azOjs
 /EdzucChd+1KgxymkgnHODzJGLTJ3nEYgJdBA80=
X-Google-Smtp-Source: APXvYqxDqqrIAFO1vwrm4yDCbQILORd64URlFe9IzHi7y4ABs4QIMg5gftuBL0GjUIfmwOnbBr9u2OSxg6wtXg78Fag=
X-Received: by 2002:ae9:e313:: with SMTP id v19mr24384529qkf.153.1554778529032; 
 Mon, 08 Apr 2019 19:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <bae4a921-6e20-899e-5139-4d479ffd9f47@linux.intel.com>
 <03df9961-3cb8-467b-adab-743544a05963@www.fastmail.com>
In-Reply-To: <03df9961-3cb8-467b-adab-743544a05963@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 9 Apr 2019 02:55:17 +0000
Message-ID: <CACPK8XdpUh52GVEfH6KYrNV7zgLhLVuJtmpg4dNpQ2CdNfGVhg@mail.gmail.com>
Subject: Re: QEMU and CI
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Tue, 09 Apr 2019 02:55:35 -0000

On Tue, 9 Apr 2019 at 00:46, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hi Jason,
>
> On Tue, 9 Apr 2019, at 04:56, Bills, Jason M wrote:
> > Hello,
> >
> > I'm looking into what it might take to get the Intel S2600WF (Wolf Pass=
)
> > board running in QEMU and possibly CI.

You can boot your wolf pass image in the current qemu. To demonstrate
I grabbed a tiogapass flash image from CI and booted it:

$ arm-softmmu/qemu-system-arm -M ast2500-evb -drive
file=3Dflash-tiogapass,format=3Draw,if=3Dmtd -serial mon:stdio  -nographic
...
root@tiogapass:~# cat /etc/os-release
ID=3D"openbmc-phosphor"
NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference Distro)"
VERSION=3D"2.7.0-dev"
VERSION_ID=3D"2.7.0-dev-347-gd631110d4"
PRETTY_NAME=3D"Phosphor OpenBMC (Phosphor OpenBMC Project Reference
Distro) 2.7.0-dev"
BUILD_ID=3D"2.7.0-dev"
OPENBMC_TARGET_MACHINE=3D"tiogapass"

As Andrew said, your next step would be to add a wolfpass machine type
to upstream qemu. Take a look at the aspeed_boards array in
hw/arm/aspeed.c.

From there the next step is to add the peripherals that your machine
has. This will involve writing models for the i2c devices you have
attached, and perhaps emulators for host connected devices (PECI?).
This could be more involved so please use the list to discuss your
plans.

There are also a large number of peripherals inside the ASPEED SoC
that lack models. Let us know on the list if you think you will start
working on one so we don't duplicate efforts.

Submit your patches against the upstream qemu tree. Andrew, Cedric and
I are the upstream maintainers so we will be on cc there.

Cheers,

Joel

> >
> > In the OpenBMC docs, it points to a QEMU fork here:
> > https://github.com/openbmc/qemu.  Is this the right place for me to
> > start looking at what is currently implemented for QEMU in OpenBMC?
>
> Yes, with the note that most of the support is already upstream.
> openbmc/qemu contains the patches that haven't quite yet made it. If
> you're planning to add S2600WF support to QEMU I suggest you send
> your patches upstream first (like we do for the kernel), and we can
> backport them to our fork once they're accepted.
>
> It's mainly C=C3=A9dric, Joel and myself hacking on it - if you have WIP =
patches
> that you want to run past people before sending upstream then Cc us
> and the OpenBMC list for some quick feedback.
>
> Hope that helps!
>
> Andrew
>
> >
> > Thanks!
> > -Jason
> >
