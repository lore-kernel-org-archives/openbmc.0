Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400d:c0d::243; helo=mail-qt0-x243.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Dx/pKZ6X"; 
 dkim-atps=neutral
Received: from mail-qt0-x243.google.com (mail-qt0-x243.google.com
 [IPv6:2607:f8b0:400d:c0d::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41wp1c4TzlzDrWY
 for <openbmc@lists.ozlabs.org>; Thu, 23 Aug 2018 12:16:19 +1000 (AEST)
Received: by mail-qt0-x243.google.com with SMTP id z8-v6so4580718qto.9
 for <openbmc@lists.ozlabs.org>; Wed, 22 Aug 2018 19:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A5Nmvq62u42arKtyTKtOUMEr9shjiYUuz5NTBMyZCvQ=;
 b=Dx/pKZ6XZzAxjMJJKsG5ZI1D+UNWVDff+yXgXtW3TV4uMtU8PYNFDr7BQfRPz25miy
 nRu52/4zmlSyfRxUnbbkVx1nyKQhXcFrCOF+DulCksO2Cd5KZCCpIewg2Glxv4s95caz
 XvV8XOIUK8MOyGoVGOvfxmsee/XxgqLJBLLc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A5Nmvq62u42arKtyTKtOUMEr9shjiYUuz5NTBMyZCvQ=;
 b=uffk4TiGK6H67JIQ71q1SJNl1LTlVAL+LX30pMmi10kl72Ae0B98Jimr/2q0gTpcPy
 rFJ2lgNG4R2YjbG4KbLaQdoe15dbtjm1rl7pySi1ImOOYJY3L4tp0p8ezvePlTaFM4P4
 ugVJ14KZZWriKkbvx82iuKd+2dmAbFCcokQMEm5gx7AkfjlHJqNhNekqINcDPSnZlrdH
 +EIlIbqTdjIRg2dCytpwPRcPHlwO5pDbAZXMlXwRdqhHchYeukJVNuHyPxoViXYbzfkf
 +HVzKqqTwJ2DbN4djqeIPVAdhLVv+AbXHDcITI6Il/xR1XJj7iU5tCeVVAEI5rct4HO6
 C7AA==
X-Gm-Message-State: AOUpUlH7T/wUV44/5OLKQHR+DdqXYsQqjP0VyanSUVraq09hM7gOWfab
 COQwkREu+TTuSrJ0znZUxvkQfPwjO54xarmvqaD7DjXz
X-Google-Smtp-Source: AA+uWPzW+EWV71T/ym22qolm5TbMfT8iFsyedZab7nyVB2xPCyaOhrR5V3oK+dnjLEdMIU3S/C52KFleXYO6gKD1iWE=
X-Received: by 2002:a0c:c345:: with SMTP id
 j5-v6mr53691847qvi.245.1534990577628; 
 Wed, 22 Aug 2018 19:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XfCipieyTjP8BkZg4mmpVXWiEDDZbs4KxbS0i4DXLbUJg@mail.gmail.com>
In-Reply-To: <CACPK8XfCipieyTjP8BkZg4mmpVXWiEDDZbs4KxbS0i4DXLbUJg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 23 Aug 2018 11:46:06 +0930
Message-ID: <CACPK8XfJKJ3TjPdv-fwW1p4jMtbyV957pcuvc+LGQh7oRJ99Jw@mail.gmail.com>
Subject: Re: Linux kernel: Moving to 4.18
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Eddie James <eajames.ibm@gmail.com>, Tomer Maimon <tomer.maimon@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2018 02:16:21 -0000

On Wed, 22 Aug 2018 at 10:51, Joel Stanley <joel@jms.id.au> wrote:
> Assuming everything that was in linux-next gets merged for 4.19, this
> will leave us with about 36 out of tree patches. I've appended the
> list of commits below. If you are the author it would be great to hear
> your plans as a reply to this email.

> Joel Stanley (14):
>       ARM: dts: aspeed-ast2500: Update flash layout

This isn't upstream as the evb is not technically an openbmc machine.

>       ARM: dts: aspeed: Add LPC mailbox node
>       ARM: dts: aspeed: Enable mbox
>       ARM: dts: palmetto: Enable mbox and occ-hwmon nodes

The Mailbox driver is in flux. The first submission was rejected, and
we don't have anyone working on upstreaming at this point.

>       iio: Add driver for Infineon DPS310

This driver was rejected upstream as it only works for the temperature
control part of the DPS310. The iio maintainer wanted support for the
accelerometer component as well, which is a substantial re-write.

>       ARM: dts: aspeed-g5: Add DAC MUX userspace control
>       ARM: dts: aspeed-g5: Clean up sio registers

This relates to Andrew's misc-register work.

>       ARM: dts: aspeed-g5: Add resets and clocks to GFX node
>       ARM: dts: aspeed: Enable the GFX IP
>       drm: Add ASPEED GFX driver
>       drm: aspeed: Debugfs interface for GFX registers
>       dt-bindings: gpu: Add ASPEED GFX bindings document

I need to add pixel clock calculation support before submitting a
non-RFC version upstream.

>       ARM: dts: aspeed: Enable VHUB on Romulus

This can go upstream.

>       ARM: config: aspeed: Add out of tree drivers

OpenBMC specific.
