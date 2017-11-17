Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JAy/oDSf"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ydpBd6sYjzDrRj
 for <openbmc@lists.ozlabs.org>; Sat, 18 Nov 2017 06:31:21 +1100 (AEDT)
Received: by mail-qk0-x244.google.com with SMTP id w125so676762qkb.6
 for <openbmc@lists.ozlabs.org>; Fri, 17 Nov 2017 11:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=yKG/l0DFrmbEfo4Y6mG1bv20cP1ZWrE4EUazTc8PRsw=;
 b=JAy/oDSfd/l+az/KY07GNtOjZGRnU1bzTFmuGax5jmw6HBz5j2g7R1wKnPWkVO1Rjk
 J1IwoaWZvSPBQd83lnV61LjFa64WO+Xmdm7gqFyOLsIBYWRtD1q9CZDoijB+E4dLUYHJ
 pJ/SDelJ3seHdkShAP3+j2kYOOXy7bZyzGSczHzlNPT11hGylYSqGeUvMPN58tLkl2qe
 y+YHbl8F4UcFYAgvoNg0g2sCBjkthTqtL2iWmRkFoXqcND0zZ0uQwffi0Wg6GO+zbd5b
 htKgFYImKn8Hbav7Cmv/CmNCMHaH7s9cfv6HHFX/vqfRvGgYUFgjNvoroBxh57LN49O0
 ebjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=yKG/l0DFrmbEfo4Y6mG1bv20cP1ZWrE4EUazTc8PRsw=;
 b=D5BCE7fRM94yptohlpPkw/iQmH1wdh/8J4cN2xgtZiloJn23pZu5JheaHecsWbcfvX
 OrlPtQuC0chl38MFgzcANV0WGSfkG7vpWOats5nhlZLJXFQfKJIV+uiGQD2+mZdPO+Dm
 vFgysF6knzZCM8O+giozrhKTJ25bhrV+MwTl0sCbq2a8ATWhUBMvtA2mS2DiGxktA7Rs
 lH6c563k4wrySRhuDupQY10CYo/yG3Syl+gN4ZwY7/v62NmfVbuy1jW/Kn7WD8p8ZG5q
 4dxuwOCAWtMEVR8nQgpA2seG81fJ5NB2yhXrO/I7GR4skBGX+8sVmIH8NRz8esPCeNQD
 4zyQ==
X-Gm-Message-State: AJaThX6caHkJEvJu4aPc0+CnIcEgwdR+ozzCPUGNhCNdmS4B5ljB0rF6
 xTWwh3PiMyKpHqKZtaDn7bCwQ3V30Oc1kN60+bMw1w==
X-Google-Smtp-Source: AGs4zMbibQbR2gP4CMu8qJsiGatRUbMClzMPKx/zV+KWen0vZ4sksOweKJzSGOeXitVHnRlVlo2I5uVhT1haGBeFYrk=
X-Received: by 10.55.179.198 with SMTP id c189mr10302795qkf.211.1510947079319; 
 Fri, 17 Nov 2017 11:31:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.99.79 with HTTP; Fri, 17 Nov 2017 11:31:18 -0800 (PST)
In-Reply-To: <20171106223950.ophliqmm7tz7aglu@rob-hp-laptop>
References: <1509985716-25759-1-git-send-email-tmaimon77@gmail.com>
 <1509985716-25759-3-git-send-email-tmaimon77@gmail.com>
 <20171106223950.ophliqmm7tz7aglu@rob-hp-laptop>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Fri, 17 Nov 2017 11:31:18 -0800
Message-ID: <CAFd5g44WLpUzNAn=s+8g00__2wQsa=c-t9tfwkA4-3CUWVvP2g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-binding: timer: document NPCM7xx timer DT
 bindings
To: Rob Herring <robh@kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Avi Fishman <avifishman70@gmail.com>, Rick Altherr <raltherr@google.com>, 
 Joel Stanley <joel@jms.id.au>, devicetree <devicetree@vger.kernel.org>, 
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
X-List-Received-Date: Fri, 17 Nov 2017 19:31:22 -0000

On Mon, Nov 6, 2017 at 2:39 PM, Rob Herring <robh@kernel.org> wrote:
> On Mon, Nov 06, 2017 at 06:28:36PM +0200, Tomer Maimon wrote:
>> Added device tree binding documentation for Nuvoton NPCM7xx timer.
>>
>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> ---
>>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       | 25 ++++++++++++++++++++++
>>  1 file changed, 25 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
