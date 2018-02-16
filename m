Return-Path: <pombredanne@nexb.com>
Authentication-Results: ozlabs.org; spf=none (mailfrom) smtp.mailfrom=nexb.com
 (client-ip=2a00:1450:400c:c0c::241; helo=mail-wr0-x241.google.com;
 envelope-from=pombredanne@nexb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nexb-com.20150623.gappssmtp.com
 header.i=@nexb-com.20150623.gappssmtp.com header.b="QYI3guyc"; 
 dkim-atps=neutral
Received: from mail-wr0-x241.google.com (mail-wr0-x241.google.com
 [IPv6:2a00:1450:400c:c0c::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zjXVr4RWjzDqMZ
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 23:28:28 +1100 (AEDT)
Received: by mail-wr0-x241.google.com with SMTP id s5so2758589wra.0
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 04:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nexb-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=hP3K3I8CsumDyx+STqlu55AU9kE0cDE5M12YfgKyAbg=;
 b=QYI3guyczfiI2UeKfGfI1rMXpi+eISBaZEIrJ9QtNg6IOt7Gn72YPc+BXvNCw9kUip
 dMAVb6k9Jt2MLUorAxdPGYwfTdQtjjIXnAPCHmOztwwpNoFxFU+bw0GEzaNzR4uAfoYW
 GTTff/dG/kSNUyJgNVRZp7SC3Eh4etgw13lePLyOFE5udg30L3ZOIf9UqyEItqo8Lvwx
 cl4tJafFVwJngzHIfZNcRSVcvcuxTd6V/NrJ2AqDDukKw5REp08PCtisgsNb85QGQYYZ
 9RQUSeNG37bSK/7zQBL9BzVYKqfwECkwlKDt1uRgfHh1DddiSjpFMjM0Cl7Ow9+/m7hW
 XpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=hP3K3I8CsumDyx+STqlu55AU9kE0cDE5M12YfgKyAbg=;
 b=d2+z8gwXYB721cabcxSjiRo03Z0tC0aAJujmfrV350DnqJxK+97moV83j07Jsnx5tF
 2GZnmJRzC4hF5Y+4NGUXIueFOi6/gv73Cg30lHcgg+laU/aWki4i0BLNLBpf1Zh+9x5O
 qzvD23i9/pd0or1NAIbQr90G+rKjUdXwjTZzsq++f+hT7irWpF2TqejEUXrFJDUTwjOG
 WMrGQ1liEIapIrWSKo9uW5oqGCX5e+RgANZOz7mkCjDpvBCFQjnEp5H8jf9v70Wtn+Up
 e88LUWSO/QGdhtDMG7c4DNOW/hAMbNW4KbpXyyOkNqd1+uGMNu2dZQ5/kdHAASvKf27Z
 5x/Q==
X-Gm-Message-State: APf1xPAOyA7u3Fa5F4Yp12D4fg7LeaTLwSXGtuUy1cKb9MCpRfumS+1t
 isPYD8wL7xg60ZOGbly3/nMNRahCMGIcavmC/e7R+Q==
X-Google-Smtp-Source: AH8x225ghbN1ooU8t1DPBKPoVCmpGiVSmwwyiUWkcSvOF4TIREXUyg0oth532yY75/0ZHD7aYGPcVYKwy188dF09aLw=
X-Received: by 10.223.146.231 with SMTP id 94mr5747228wrn.164.1518784104948;
 Fri, 16 Feb 2018 04:28:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.195.139 with HTTP; Fri, 16 Feb 2018 04:27:44 -0800 (PST)
In-Reply-To: <1518701454-22697-2-git-send-email-tali.perry1@gmail.com>
References: <1518701454-22697-1-git-send-email-tali.perry1@gmail.com>
 <1518701454-22697-2-git-send-email-tali.perry1@gmail.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Fri, 16 Feb 2018 13:27:44 +0100
Message-ID: <CAOFm3uHCkv893H_y-fJthNiW0=wO23ddCkZKBdfeiOOF0GAE_Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] clk: npcm7xx: add clock controler. fixed clock at
 DT
To: Tali Perry <tali.perry1@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Rick Altherr <raltherr@google.com>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Fri, 16 Feb 2018 12:28:41 -0000

Tali,

On Thu, Feb 15, 2018 at 2:30 PM, Tali Perry <tali.perry1@gmail.com> wrote:
> --- /dev/null
> +++ b/drivers/clk/clk-npcm7xx.c
> @@ -0,0 +1,759 @@
> +/*
> + * Nuvoton NPCM7xx Clock Generator
> + * All the clocks are initialized by the bootloader, so this driver allow only
> + * reading of current settings directly from the hardware.
> + *
> + * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com
> + *
> + * SPDX-License-Identifier: GPL-2.0
> + * Released under the GPLv2 only.
> + */

Thank you for using the SPDX tags! but this can be streamlined a bit per [1]

The correct way would come out as this: (note the tag placement and
comment style and the removal of the now redundant unstructured
notice)

> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NPCM7xx Clock Generator
> + * All the clocks are initialized by the bootloader, so this driver allow only
> + * reading of current settings directly from the hardware.
> + *
> + * Copyright (C) 2018 Nuvoton Technologies tali.perry@nuvoton.com
> + */

And yes you may be surprised by the use of C++ style comment for
this... This has been discussed on list and is what Linus prefers.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/license-rules.rst
-- 
Cordially
Philippe Ombredanne
