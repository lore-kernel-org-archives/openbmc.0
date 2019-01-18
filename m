Return-Path: <joel.stan@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="iRnhXj64"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43gkMv3xnXzDqcW
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jan 2019 12:47:23 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id t13so13646111qtn.3
 for <openbmc@lists.ozlabs.org>; Thu, 17 Jan 2019 17:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uTwo0yITEGKp6cTbipX0KbZvBbv3f4rj2ICmUTMtejg=;
 b=iRnhXj64b80HfZFXu0ykvlYD1yb6EzU65nI3rRetwsQrJhJno6kBwy1zerO1r1bRyJ
 W8MI+oCJo6yxh/jIbesF9YKyofkByp9Fg1r1e+Jok1LeOME0JvGL4UFwiz5AKXbC5Vna
 D9zI3xUEiJFNWxsMFEEFM6v/6DRzybcZMVKfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uTwo0yITEGKp6cTbipX0KbZvBbv3f4rj2ICmUTMtejg=;
 b=OmdWb1PTTbREoKyu0GJen/yzWNrmHIJodDLPvqRHbkC+6Dr0grC9cWJBI+sqqK4Ffg
 TF6/DescP3mg37LqYHKadM2qq5E9ID8tjEx84qCy+HHZTMpVvPOtvLE8gqwe07sXeWTE
 2N2GHScPylICO2cQh6C/f5xAq4yEt3HCVrYkISc7g22BOAUY8sECl8IUI3/YQtmBnEPb
 s2SYVrFMaHDU/hfEh0IBLfqIvhA78tne4Zkcz+AjZN/sVt0bl6AgEPgVhEudt1RRek9j
 neHQ2MWHhq4X1eVBlx/B+B8o5/nVnrXQptWP2UGmqT9ftPopgRrxNw4iFeSCZljJULdv
 UqcA==
X-Gm-Message-State: AJcUukcuL+SihZ8TtFN6Zd7PgmzROIC9Xevg62ZSf2Zf9NuFv2PCOC20
 Pt3C7K778drWO/xoCLhbAEiPyoEHgXmYzOP5b6s=
X-Google-Smtp-Source: ALg8bN5s1S18KgznjwO4dhn9Mq/f5WN9bFsBjlfPJ6opbGBWDw3+6eWXoCzFvZjJ9v+H4f/2X07g68z69fxED1Lqx+I=
X-Received: by 2002:ac8:3065:: with SMTP id g34mr14218910qte.136.1547776040664; 
 Thu, 17 Jan 2019 17:47:20 -0800 (PST)
MIME-Version: 1.0
References: <1531342898-15790-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1531342898-15790-10-git-send-email-eajames@linux.vnet.ibm.com>
 <alpine.DEB.2.21.1901180140150.1647@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1901180140150.1647@nanos.tec.linutronix.de>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 18 Jan 2019 12:47:08 +1100
Message-ID: <CACPK8Xf3=pTRubt0VnUJ6GyT7bG15oCL+XtqzfeAAtccqbR_xg@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] hwmon (occ): Add sysfs attributes for additional
 OCC data
To: Thomas Gleixner <tglx@linutronix.de>,
 Eddie James <eajames@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org, 
 devicetree <devicetree@vger.kernel.org>, linux-doc@vger.kernel.org, 
 Greg KH <gregkh@linuxfoundation.org>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Guenter Roeck <linux@roeck-us.net>, 
 Jean Delvare <jdelvare@suse.com>, Mark Rutland <mark.rutland@arm.com>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Rob Herring <robh+dt@kernel.org>, 
 Kate Stewart <kstewart@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 18 Jan 2019 01:47:24 -0000

On Fri, 18 Jan 2019 at 11:44, Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Eddie,
>
> On Wed, 11 Jul 2018, Eddie James wrote:
>
> > --- /dev/null
> > +++ b/drivers/hwmon/occ/sysfs.c
> > @@ -0,0 +1,188 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * OCC hwmon driver sysfs interface
> > + *
> > + * Copyright (C) IBM Corporation 2018
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + */
>
> The above license information is inconsistent.
>
> The SPDX license identifier says GPL v2 only, but the license notice says
> GPL v2 or later. This is just wrong.
>
> Please decide which one to use and please also remove the boiler plate
> text. It is redundant.
>
> See Documentation/process/license-rules.rst

Thanks Thomas.

Eddie, as IBM contributed code our preferred license is GPLv2+. Be
sure to include the copyright line in your header (I noticed some OCC
files are missing this, please audit all of your recent
contributions):

// SPDX-License-Identifier: GPL-2.0+
// Copyright IBM Corp 2019

Cheers,

Joel
