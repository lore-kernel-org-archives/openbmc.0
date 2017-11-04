Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::241; helo=mail-qk0-x241.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NgcT1Y8P"; 
 dkim-atps=neutral
Received: from mail-qk0-x241.google.com (mail-qk0-x241.google.com
 [IPv6:2607:f8b0:400d:c09::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yTKSD1m9KzDrCy
 for <openbmc@lists.ozlabs.org>; Sat,  4 Nov 2017 11:28:42 +1100 (AEDT)
Received: by mail-qk0-x241.google.com with SMTP id w134so5217882qkb.0
 for <openbmc@lists.ozlabs.org>; Fri, 03 Nov 2017 17:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=nnn1IXfX3gilFdZZHZ466c2F9Pu0wkAWIRaisykXmtU=;
 b=NgcT1Y8PwdjH3DjEcVs4HYK/xM/caZFR0kfIsBoRyANNcsegR8hRGDEoNfssX8wTHK
 fapkok64e4qE8WIo3tpiqlhptx+H4hd2ZycEda+A3qHzoGP9S2+9lce1hXL6qotbqI9m
 s4+cQs/5ZVy7wDmCmVe7Wq4MYteUBUz8PtgUdrh+BWrF9UsQKBOD7Ddm/0IIZSsnGq8g
 bUXzorZ7H0XuJfXwrr5KYG2BFjMCO4uamscLbJDkWeGD9qghVg/zdi8v+nhY9mOod4qp
 unXChoFc//6GpowZJnWIbUOTl1EN+DKvy6K5s7XYzKl0AXTyyLirb7kLKG09J/krE5da
 eYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=nnn1IXfX3gilFdZZHZ466c2F9Pu0wkAWIRaisykXmtU=;
 b=O0kv6Uo+byIiFeYVQRcWN/T3wGrYckqGtiRAiwA/NziwYQhoa39EnkkJDcdop915eg
 hgntA0zR+oqS43II26vThAgFoKZLZ9jxE5aQ3qIcOBBWroWv+0i90XguSUPqjXnLRuyl
 DdODTKky0vlktX7tvdOkjtM6rp7oU3tsaKTd8Y1Mhdgc/zEiR/gP4Rmpe01cwAW0tevF
 dCvfd4rRHnULx44H0GahmHIBxUflzl6mVAoOXTCDNl+Xhs1S9Q7/HFwoLW+UflYHgGNM
 5pH6ZitltrksT9JRRvZgrGYHLqC9Lg9fhmvKSkQxqhaD1xztyTUsztSz3EDy5ZOUqxwG
 EOog==
X-Gm-Message-State: AJaThX672se7UXBVGjo40u8VSrXtZZf0ZJXrslaJJTNZy6ZUEKU+6tyI
 4BL/kG2hOYz+g/DyEeq1ABCgQAjthN+cLMrvxoru2w==
X-Google-Smtp-Source: ABhQp+Toc1YRouwpaTnWBwv6QTecz4qXBqSlfIBlRytJfiM9I/wUxnMw7HzRrg0+07Nxo0LWPCdvPsXlNvzAKAZv3S4=
X-Received: by 10.233.222.135 with SMTP id s129mr11549826qkf.261.1509755320278; 
 Fri, 03 Nov 2017 17:28:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.81.200 with HTTP; Fri, 3 Nov 2017 17:28:39 -0700 (PDT)
In-Reply-To: <1509538604-8218-1-git-send-email-tmaimon77@gmail.com>
References: <1509538604-8218-1-git-send-email-tmaimon77@gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 3 Nov 2017 17:28:39 -0700
Message-ID: <CAFd5g45esV+m1FJyZY=nu_nZpP_1749sYUMmRXfet41Ju+7Vsw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] clocksource: npcm: add NPCM7xx timer driver
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 daniel.lezcano@linaro.org, 
 Thomas Gleixner <tglx@linutronix.de>, Avi Fishman <avifishman70@gmail.com>, 
 Rick Altherr <raltherr@google.com>, Joel Stanley <joel@jms.id.au>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
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
X-List-Received-Date: Sat, 04 Nov 2017 00:28:46 -0000

On Wed, Nov 1, 2017 at 5:16 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> Addressed comments from:
>  - Daniel Lezcano: https://www.spinics.net/lists/devicetree/msg196683.html
>
> Changes since version 1:
>  - Rename driver name
>  - Removing unnecessary dependencies in configuration
>  - Adding prefix to the macros
>  - No changes to dt-binding documentation since v1
>
> Asked Brendon to modify NPCM7xx device tree for support NPCM7xx timer driver
> https://www.spinics.net/lists/arm-kernel/msg614424.html

Rob Herring asks that we keep the device tree binding the same as I have it.
Unless, there is some part of the conversation that I am missing.

>
> Changes have been tested on the NPCM750 evaluation board.
>
> Tomer Maimon (2):
>   clocksource: npcm: add NPCM7xx timer driver
>   dt-binding: timer: document NPCM7xx timer DT bindings
>
>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  25 +++
>  drivers/clocksource/Kconfig                        |   8 +
>  drivers/clocksource/Makefile                       |   1 +
>  drivers/clocksource/npcm7xx-timer.c                | 224 +++++++++++++++++++++
>  4 files changed, 258 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>  create mode 100644 drivers/clocksource/npcm7xx-timer.c
>
> --
> 2.14.1
>
