Return-Path: <joel.stan@gmail.com>
Received: from mail-vk0-x22b.google.com (mail-vk0-x22b.google.com
 [IPv6:2607:f8b0:400c:c05::22b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sXhwl45ylzDsMD
 for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2016 19:15:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=rtWM/2JT; 
 dkim-atps=neutral
Received: by mail-vk0-x22b.google.com with SMTP id f76so125090996vke.0
 for <openbmc@lists.ozlabs.org>; Mon, 12 Sep 2016 02:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=WZUbhVe5UK7vS9opaxisBTeEEWTLfce+icFven1SbMA=;
 b=rtWM/2JTD3/THSEyXfuouFrJ6mIek5NiQS15WHv1e3y0Qe6ECrQuaJ4hgqwAwSw0u1
 EMl6wgQsDTu1AZ2PjwlHGMMn6VlKsau1aWyI9xoQKKEfU5q9JggEtg9yyBSKnk04y+vA
 7UxMr+MCXowt/SdD0LHxTK2l5ncoX9f8FoGDyFHy4MPSElIMQ9PqBIxfTUnCWTFJCGxN
 1decsLGGde7R0qSAWq+uWJGk6Jl0Z8fRml8RId/X+uKRa+mYyZ+7INIHkpfsYD2EhVrP
 ato4kCbda8a7w5Kk4Qapbi2RlyvQEDckCthSDyZaa5n+J8QKmphCdxKu3qnmLCfeTJG9
 Uj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
 :to:content-transfer-encoding;
 bh=WZUbhVe5UK7vS9opaxisBTeEEWTLfce+icFven1SbMA=;
 b=ZFsfKxiWpPGRq+dfWs4LULQM6HVAUglEEFEtudlkgmNxXfpz0MeKlZjvE/MN9lg2JV
 IpsPeX8G1rM1ZksaIF37lapZfq5tTkT7VZsK7FZhuw478VsKHXVmtHdf2EPKpokhXGZb
 GUig+XO5h+CM8ufL2PgUfkERSyTyHhE7MOueWIdTDoW2vO1/nX5y2oTp9AEna7X/DdFs
 MnafnTDdKV4b73NMxEeV+iODMubNOCvHstlL6s6dyV8umM+f3Dkion17ZwfTrOZdNURG
 qEYd3dlS1wU8JiHEGr6Yzc+eu1HssFtOBVJlaizwvJxBZjl/Nxf8BX13ZljMPH5JWhYz
 pSdw==
X-Gm-Message-State: AE9vXwMghvbb83Rftse4gvZzkXC30Z847db5Cbz0haRJzyzeAUsQdwATDUn/NbQahDUZaKlhOWqAYVCnRT78GQ==
X-Received: by 10.31.141.21 with SMTP id p21mr11249210vkd.152.1473671716204;
 Mon, 12 Sep 2016 02:15:16 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.176.80.221 with HTTP; Mon, 12 Sep 2016 02:14:55 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 12 Sep 2016 18:44:55 +0930
X-Google-Sender-Auth: s4fJ3Y7zAMzbj3qQCSGpuM3d_Fo
Message-ID: <CACPK8Xdtugha_jc7q3YsgMOGw2jz+Qw5A2P7mjXC2--80eH5=Q@mail.gmail.com>
Subject: [linux] clocksource driver queued for 4.9
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Sep 2016 09:15:20 -0000

Another piece of support that will land upstream in Linux 4.9.


---------- Forwarded message ----------
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Mon, Sep 12, 2016 at 6:40 PM
Subject: [PULL] clockevents for 4.9
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@kernel.org>, Alexandre Belloni
<alexandre.belloni@free-electrons.com>, Joel Stanley <joel@jms.id.au>,
Neil Armstrong <narmstrong@baylibre.com>, Linux Kernel Mailing List
<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
<linux-arm-kernel@lists.infradead.org>



Hi Thomas, Ingo,

This pull request for 4.9 contains a few changes:

 - Cleanup the atmel-pit timer (Alexander Belloni)

 - Add the Aspeed support (Joel Stanley)

 - Replaced setup_irq/request_irq and panic/pr_err on moxart (Daniel
Lezcano)

 - Add the Ox820 compatible string for oxnas (Neil Armstrong)

Thanks !

  -- Daniel


The following changes since commit 950d8381d915ee293a5b57f91e59dd8115684af1=
:

  Merge branch 'linus' into timers/core, to refresh the branch
(2016-09-08 14:05:16 +0200)

are available in the git repository at:

  http://git.linaro.org/people/daniel.lezcano/linux.git clockevents/4.9

for you to fetch changes up to 2ea3401e2a84eed3f5f55b2075706f88df160d85:

  clocksource/drivers/oxnas: Add OX820 compatible (2016-09-12 07:28:46
+0200)

----------------------------------------------------------------
Alexandre Belloni (3):
      clocksource/drivers/timer-atmel-pit: Drop at91sam926x_pit_common_init
      clocksource/drivers/timer-atmel-pit: Remove uselesss WARN_ON_ONCE
      clocksource/drivers/timer-atmel-pit: Simplify IRQ handler

Daniel Lezcano (2):
      clocksource/drivers/moxart: Replace setup_irq by request_irq
      clocksource/drivers/moxart: Replace panic by pr_err

Joel Stanley (3):
      clocksource/drivers/moxart: Refactor enable/disable
      clocksource/drivers/moxart: Use struct to hold state
      clocksource/drivers/moxart: Add Aspeed support

Neil Armstrong (1):
      clocksource/drivers/oxnas: Add OX820 compatible

 Documentation/devicetree/bindings/timer/moxa,moxart-timer.txt |   4 +++-
 Documentation/devicetree/bindings/timer/oxsemi,rps-timer.txt  |   2 +-
 drivers/clocksource/moxart_timer.c                            | 193
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------=
-------------------------------------------
 drivers/clocksource/timer-atmel-pit.c                         |  96
+++++++++++++++++++++++++++++++++++++--------------------------------------=
---------------------
 drivers/clocksource/timer-oxnas-rps.c                         |   2 ++
 5 files changed, 172 insertions(+), 125 deletions(-)

--
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for ARM=
 SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
