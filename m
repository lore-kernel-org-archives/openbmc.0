Return-Path: <tmaimon77@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4001:c06::243; helo=mail-io0-x243.google.com;
 envelope-from=tmaimon77@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="orDnfehF"; 
 dkim-atps=neutral
Received: from mail-io0-x243.google.com (mail-io0-x243.google.com
 [IPv6:2607:f8b0:4001:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yVpRR74NTzDrJv
 for <openbmc@lists.ozlabs.org>; Mon,  6 Nov 2017 21:18:11 +1100 (AEDT)
Received: by mail-io0-x243.google.com with SMTP id d66so15133916ioe.5
 for <openbmc@lists.ozlabs.org>; Mon, 06 Nov 2017 02:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UfNXH1ZYmmtJAAW//Y5r4/hfxn1rYAYTrkemJx42nZE=;
 b=orDnfehFzNAv7GEgCscA1vfBXm9R8Nrso/SPc4nzj3r5QskHpWcG1TH+1Ayf+7aDWm
 wM5PcfemAZwRGnWePPk7wqPrX2TjgJ5SDz5cHFDz5qSgzOMV/8XrGGE0J/Eh0zXgBpkT
 yFj1YPGe8TWA4H/CjCQuzCrNE6m6Xh4Dz7o7HwSDYXowsjXOxX5WyI/GjvQKvqafjJ1N
 qPbGQmAXwzf6oR22a5EhRIZIhJfJHhk7wDMwFwLmS3GmWmLzGnPJjmEhrAslE2nO2tvk
 BA0N8SiFqAaew+eb/a6CxIBE+s5FBbWN36pYbwVmap3rDVeM+UcYIT75fyDN9nOLcmTz
 9eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UfNXH1ZYmmtJAAW//Y5r4/hfxn1rYAYTrkemJx42nZE=;
 b=RexB3ylOOf0g6Vw1ZrN+8oCctn5hoLvWEWkqUlWASCfT9UNXukOluIZUI8CvzMw5Q8
 lXg3zvydEqUAs0yVOS95A6OgvXGwtXYaR/W7phWYyfC1R4eaa0fnKI62yANlxZHmqyxR
 H17fvhqjercLiiQDeBBCQQA/3PDTS61vILyEnrpDiYXSVSfXUrzQbrIIfM/+YNs33z4E
 mFp6B7gp8JtNx5gUtHG1wrCuK3bjlszD4flNVEY4YVxKO1guJXNHFCTwRD8+6s44gnRq
 ySHuguz+b3cwGXAJPy7JkzvTtYqj7F+m5J7NvzrTAN1IFlWErA8gByx2AQLUuntzOQfn
 sziw==
X-Gm-Message-State: AJaThX4N4b7Jsy/I31mhGpNTWckn6kHL6JN+TaJHocJlquCU1hHjDKLv
 XKvt8cYS0xGa2cjdLpnyqkMd54qlydADXjMHLmE=
X-Google-Smtp-Source: ABhQp+TZrK3teewZQE2ltBCHQ0egbAELj7bHQcYjc5lYC7kidg6qhto6W+/hXfNuHvfIkHFw22RFUip7oUJ2WmfW+t0=
X-Received: by 10.107.128.102 with SMTP id b99mr18541942iod.109.1509963489288; 
 Mon, 06 Nov 2017 02:18:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.28.66 with HTTP; Mon, 6 Nov 2017 02:18:08 -0800 (PST)
In-Reply-To: <CAFd5g45esV+m1FJyZY=nu_nZpP_1749sYUMmRXfet41Ju+7Vsw@mail.gmail.com>
References: <1509538604-8218-1-git-send-email-tmaimon77@gmail.com>
 <CAFd5g45esV+m1FJyZY=nu_nZpP_1749sYUMmRXfet41Ju+7Vsw@mail.gmail.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 6 Nov 2017 12:18:08 +0200
Message-ID: <CAP6Zq1iFBx1H6SW8SfoPa811mtnJyLk9pycoBfeZitSD7dg-fg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] clocksource: npcm: add NPCM7xx timer driver
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
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
X-List-Received-Date: Mon, 06 Nov 2017 10:18:12 -0000

On 4 November 2017 at 02:28, Brendan Higgins <brendanhiggins@google.com> wrote:
> On Wed, Nov 1, 2017 at 5:16 AM, Tomer Maimon <tmaimon77@gmail.com> wrote:
>> Addressed comments from:
>>  - Daniel Lezcano: https://www.spinics.net/lists/devicetree/msg196683.html
>>
>> Changes since version 1:
>>  - Rename driver name
>>  - Removing unnecessary dependencies in configuration
>>  - Adding prefix to the macros
>>  - No changes to dt-binding documentation since v1
>>
>> Asked Brendon to modify NPCM7xx device tree for support NPCM7xx timer driver
>> https://www.spinics.net/lists/arm-kernel/msg614424.html
>
> Rob Herring asks that we keep the device tree binding the same as I have it.
> Unless, there is some part of the conversation that I am missing.

you are right that he asked to keep the competible as you have in the
device tree but
the reg is incorrect in your device tree, please modify it as follow:

timer0: timer@f0008000 {
        compatible = "nuvoton,npcm750-timer";
        interrupts = <0 32 4>;
        reg = <0xf0008000 0x1000>;
        clocks = <&clk NPCM7XX_CLK_TIMER>;
};

>
>>
>> Changes have been tested on the NPCM750 evaluation board.
>>
>> Tomer Maimon (2):
>>   clocksource: npcm: add NPCM7xx timer driver
>>   dt-binding: timer: document NPCM7xx timer DT bindings
>>
>>  .../bindings/timer/nuvoton,npcm7xx-timer.txt       |  25 +++
>>  drivers/clocksource/Kconfig                        |   8 +
>>  drivers/clocksource/Makefile                       |   1 +
>>  drivers/clocksource/npcm7xx-timer.c                | 224 +++++++++++++++++++++
>>  4 files changed, 258 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/timer/nuvoton,npcm7xx-timer.txt
>>  create mode 100644 drivers/clocksource/npcm7xx-timer.c
>>
>> --
>> 2.14.1
>>

Thanks!
