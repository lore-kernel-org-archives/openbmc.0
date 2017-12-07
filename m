Return-Path: <pombredanne@nexb.com>
Authentication-Results: ozlabs.org; spf=none (mailfrom) smtp.mailfrom=nexb.com
 (client-ip=2a00:1450:400c:c09::234; helo=mail-wm0-x234.google.com;
 envelope-from=pombredanne@nexb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nexb-com.20150623.gappssmtp.com
 header.i=@nexb-com.20150623.gappssmtp.com header.b="Go/teYiW"; 
 dkim-atps=neutral
Received: from mail-wm0-x234.google.com (mail-wm0-x234.google.com
 [IPv6:2a00:1450:400c:c09::234])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yt7g61CKkzDsQ0
 for <openbmc@lists.ozlabs.org>; Fri,  8 Dec 2017 08:20:16 +1100 (AEDT)
Received: by mail-wm0-x234.google.com with SMTP id f140so221923wmd.2
 for <openbmc@lists.ozlabs.org>; Thu, 07 Dec 2017 13:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nexb-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=TQbQ/icNwdBcjmI74KtAe0dtH7Ug0v54MXqErMXj1Xk=;
 b=Go/teYiWhb6BgEaCtU3tBHOZ8HMiAJAhhHKjJeldsQmu4KtzQ6g2JsQMlPB2sl5Ayd
 RLBNLap2Hh/voJiZ2K6StnEi5WBrJxCMBvZCEQPe4miEvYG2VIhnXF8NzIJ1paXMxhMf
 QLkv0nX1k2SkPsKhh5bCdrwHJd+r7JtvilPyKnkyUGx8y6Nxe5OyUQgMrNoPHgNUzgJp
 lbUxI98QbNuqw1flBKC/jNvUAOtqwHup41SYI92eyoB877nzgbSn4YSweZiGSJo6gfGs
 +UWTuIy6Xso5ZPfA+HUPwP7M7hjdqQ+TibwCHl0KIzbmdXdnbWA8ZQFmDy4EVRFt1x93
 HI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=TQbQ/icNwdBcjmI74KtAe0dtH7Ug0v54MXqErMXj1Xk=;
 b=OZjKFRGQhYkzjEsXFYPOzN3fwHXWOXlnsqIxNYdVjMjOvYvg3rb4Q+pluod5J5UHvf
 JZ1G3iQ7RPwM6czYuNnoB00psjwvyZjyyzC2nFfx/wXASf1hgDVv2j8VsVHQXM8QRQ4p
 P97RzQzLFTCCn1p7xSSjWYuq0hsi0tBVfnahQ8KJIV99EDegb3BhZ0g5rZeSO69mXrXe
 y/5vYW49xFq9pNqi+cLwDQhJKqFPeC0c+Kp3pqCW1qh+1E5r03dQu1vdISH00P8UsnJ9
 eKCW2IN41YuKTYUAZIpcWhIvlMpmPGRmjHpC2gisk/q45P/ztkoieigCHhiHpeKQkNWw
 3SMw==
X-Gm-Message-State: AKGB3mLdZZk8n1q6gTJIZQKZEoSTxd9/kcy+QR9hKgAlh13FaVnKZdTl
 oTqVqMmIILGCuDN7ZCIyCNOX8aBD9YeM6Rah7KHcFg==
X-Google-Smtp-Source: AGs4zMatk5Relq6bySEAwwmxso/Obei82nlgG+Fm9jWLNNYfIiOCRjlnLdgjpUCzYbD+HFlu11XBcExiVVZNluUEYQ8=
X-Received: by 10.28.61.135 with SMTP id k129mr2166407wma.81.1512681613771;
 Thu, 07 Dec 2017 13:20:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.157.195 with HTTP; Thu, 7 Dec 2017 13:19:33 -0800 (PST)
In-Reply-To: <CAFd5g45+dNuayw=s08iwAj2wrUYNXnGd5SbA+OVvsL_J6APHGA@mail.gmail.com>
References: <20171117190747.21642-1-brendanhiggins@google.com>
 <20171117190747.21642-2-brendanhiggins@google.com>
 <CAFd5g45+dNuayw=s08iwAj2wrUYNXnGd5SbA+OVvsL_J6APHGA@mail.gmail.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Thu, 7 Dec 2017 22:19:33 +0100
Message-ID: <CAOFm3uG=i3gOnKEMEPNii070+pB7Aqt2GmxgB5G0DCfGzhCkZQ@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] arm: npcm: add basic support for Nuvoton BMCs
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Mark Rutland <mark.rutland@arm.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Avi Fishman <avifishman70@gmail.com>, Rick Altherr <raltherr@google.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, julien.thierry@arm.com, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 07 Dec 2017 21:20:19 -0000

Brendan,

On Thu, Dec 7, 2017 at 9:37 PM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> Any update on this?
>
> On Fri, Nov 17, 2017 at 11:07 AM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> Adds basic support for the Nuvoton NPCM750 BMC.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
>> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
>> Tested-by: Avi Fishman <avifishman70@gmail.com>

<snip>

>> --- /dev/null
>> +++ b/arch/arm/mach-npcm/npcm7xx.c
>> @@ -0,0 +1,25 @@
>> +/*
>> + * Copyright (c) 2017 Nuvoton Technology corporation.
>> + * Copyright 2017 Google, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */

Have you considered using the new SPDX ids here instead of the
traditional license boilerplate?

This could come out this way:

// SPDX-License-Identifier: GPL-2.0
// Copyright (c) 2017 Nuvoton Technology corporation.
// Copyright 2017 Google, Inc.

It is shorter and simpler, with a better code/comments ratio.
And if you wonder about why using C++ style comment, please check
Linus posts on the topic, as well as Thomas doc patches.

Thank you for your kind consideration!

-- 
Cordially
Philippe Ombredanne
