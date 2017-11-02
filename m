Return-Path: <robh+dt@kernel.org>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yS5r36SYgzDr5J
 for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2017 11:41:39 +1100 (AEDT)
Received: from mail-qt0-f170.google.com (mail-qt0-f170.google.com
 [209.85.216.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E4DA2194A
 for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2017 00:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E4DA2194A
Authentication-Results: mail.kernel.org;
 dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
 spf=none smtp.mailfrom=robh+dt@kernel.org
Received: by mail-qt0-f170.google.com with SMTP id p1so4888048qtg.2
 for <openbmc@lists.ozlabs.org>; Wed, 01 Nov 2017 17:41:37 -0700 (PDT)
X-Gm-Message-State: AMCzsaXdKMg5d6YZCYC7VMsWKoBx3fJtaVOqUaYS2fipKi7QQlqFoGNl
 WiNSKMd7QIup911KQSgoMB0u5TvBVCh/D/oZLQ==
X-Google-Smtp-Source: ABhQp+SsNjv1ypLO+Rv9+1A9Pnt/MyopcfVXit0J2Cw7EtwVO7SRkal/DlH0u0IReVSROTUB7tIZeHvN1xXhUvCKmc0=
X-Received: by 10.200.8.239 with SMTP id y44mr2715082qth.341.1509583296458;
 Wed, 01 Nov 2017 17:41:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.130.134 with HTTP; Wed, 1 Nov 2017 17:41:15 -0700 (PDT)
In-Reply-To: <CAP6Zq1jPva2sFMYaNoN6C_4sXL9q=W_Wyt9Hy3+OsG6UJUVd6w@mail.gmail.com>
References: <20170919224001.22284-1-brendanhiggins@google.com>
 <20170919224001.22284-3-brendanhiggins@google.com>
 <CAP6Zq1jPva2sFMYaNoN6C_4sXL9q=W_Wyt9Hy3+OsG6UJUVd6w@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 1 Nov 2017 19:41:15 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKgwepy4Kb21oikYRsOtFpKJFTiLRs4q613AX+9opHQKg@mail.gmail.com>
Message-ID: <CAL_JsqKgwepy4Kb21oikYRsOtFpKJFTiLRs4q613AX+9opHQKg@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Mark Rutland <mark.rutland@arm.com>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Avi Fishman <avifishman70@gmail.com>, 
 Rick Altherr <raltherr@google.com>, Florian Fainelli <f.fainelli@gmail.com>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
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
X-List-Received-Date: Thu, 02 Nov 2017 00:41:40 -0000

On Sun, Oct 29, 2017 at 3:33 PM, Tomer Maimon <tmaimon77@gmail.com> wrote:
> On 20 September 2017 at 00:40, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
>> specific device tree for the NPCM750 (Poleg) evaluation board.
>>

>> +                       timer0: timer@f0000000 {
>> +                               compatible = "nuvoton,npcm750-timer";
>> +                               interrupts = <0 32 4>;
>> +                               reg = <0xf0000000 0x1000>;
>> +                               clocks = <&clk NPCM7XX_CLK_TIMER>;
>> +                       };
>
> I started the upstream process of NPCM7xx clocksource driver, I got
> the following comment:
> https://www.spinics.net/lists/devicetree/msg197916.html
>
> Is it possible to modify the the timer DT entry to:
>
> timer0: timer@f0008000 {
>         compatible = "nuvoton,npcm7xx-timer";

Please don't. Using 750 is correct. Using 7xx (i.e. wildcards) is not.

If there's subsequent SoCs with the same block, then you can do:
'"nuvoton,npcm760-timer", "nuvoton,npcm750-timer"'.

Rob
