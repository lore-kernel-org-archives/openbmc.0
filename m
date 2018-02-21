Return-Path: <robh@kernel.org>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=robh@kernel.org;
 receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmlrW0s5QzDrF8
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 05:10:03 +1100 (AEDT)
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
 [209.85.220.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B95722179F
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 13:24:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B95722179F
Authentication-Results: mail.kernel.org;
 dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=robh@kernel.org
Received: by mail-qk0-f180.google.com with SMTP id n198so1863166qke.7
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 05:24:11 -0800 (PST)
X-Gm-Message-State: APf1xPBHZQCT3Wu/mz2R/hcJu+upkakGIsDpalSuFfga00+pXb7Xqlvn
 VgFIYO+eEAAPwMXB4eNqZkcBPX+AlwYdCPF2IA==
X-Google-Smtp-Source: AH8x225oDH7an3a+FMuEDI39cELszblfpHdBYMFvM+hM49ILnAft8S044xdvJ+6/VbIp5taDGq/iWDWgG6FnoSdO18k=
X-Received: by 10.55.31.163 with SMTP id n35mr5152154qkh.147.1519219450956;
 Wed, 21 Feb 2018 05:24:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.245.67 with HTTP; Wed, 21 Feb 2018 05:23:50 -0800 (PST)
In-Reply-To: <CAFd5g44argF0oaOq7fOM0YbCBK5h8NyRia+H8CbRC5qAQHe5WA@mail.gmail.com>
References: <1518701959-22899-1-git-send-email-tali.perry1@gmail.com>
 <1518701959-22899-2-git-send-email-tali.perry1@gmail.com>
 <CAFd5g44gBJp0-mYEWGdyiA67BCi2pZWAG2bYPS-WdJEwH1oA5A@mail.gmail.com>
 <20180219144905.bfrycjnas7dcuo34@rob-hp-laptop>
 <CAFd5g44argF0oaOq7fOM0YbCBK5h8NyRia+H8CbRC5qAQHe5WA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 21 Feb 2018 07:23:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKq-+fKapT6RKwqBubRuJszpKMJevS7NOObPP-bVA2_kw@mail.gmail.com>
Message-ID: <CAL_JsqKq-+fKapT6RKwqBubRuJszpKMJevS7NOObPP-bVA2_kw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] clk: npcm750: update text with fixed clocks
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Tali Perry <tali.perry1@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Rick Altherr <raltherr@google.com>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Nancy Yuen <yuenn@google.com>, 
 Patrick Venture <venture@google.com>
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
X-List-Received-Date: Wed, 21 Feb 2018 18:10:03 -0000

On Tue, Feb 20, 2018 at 10:47 PM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> On Mon, Feb 19, 2018 at 6:49 AM, Rob Herring <robh@kernel.org> wrote:
>> On Thu, Feb 15, 2018 at 02:38:12PM -0800, Brendan Higgins wrote:
>>> On Thu, Feb 15, 2018 at 5:39 AM, Tali Perry <tali.perry1@gmail.com> wrote:
>>> >
>>> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>> >
>>>  <snip>
>>>
>>> I think this should probably be rolled into [PATCH v2 1/1] npcm750: add fixed
>>> clocks (moved from drivers/clk/clk-npcm7xx.c):
>>> https://www.spinics.net/lists/arm-kernel/msg634678.html
>>
>> No, binding docs, dts files and driver code should all be separate
>> patches.
>
> My mistake. This patch has a dt-bindings include file; should the include file
> go in here, with the dtsi changes, or in its own separate patch?

It defines the binding, so with the binding documentation.

Rob
