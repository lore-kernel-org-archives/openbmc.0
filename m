Return-Path: <robh@kernel.org>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=robh@kernel.org;
 receiver=<UNKNOWN>)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xwyW911cQzDq5k
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 06:37:57 +1000 (AEST)
Received: from mail-qt0-f180.google.com (mail-qt0-f180.google.com
 [209.85.216.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97CFF21C98
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 20:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97CFF21C98
Authentication-Results: mail.kernel.org;
 dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=robh@kernel.org
Received: by mail-qt0-f180.google.com with SMTP id q4so1855135qtq.8
 for <openbmc@lists.ozlabs.org>; Mon, 18 Sep 2017 13:37:54 -0700 (PDT)
X-Gm-Message-State: AHPjjUiKZwqCWms1RJO5EeBI+qDg8jHEyyGyRqXFO34ElBoCkAqk0/n4
 An+9phn5jIPMCZZ96obqfQYDg4FW3ua+gRi7nQ==
X-Google-Smtp-Source: AOwi7QDJPO6ZbaCgRwaC6gdp3fim+cOWKrpIgc1YLGne9cuZpoR1STBqX0F6DsUUJSXJWSx5JQfCFgG431qVxoRzsjU=
X-Received: by 10.200.26.211 with SMTP id h19mr52648003qtk.341.1505767073832; 
 Mon, 18 Sep 2017 13:37:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.209.75 with HTTP; Mon, 18 Sep 2017 13:37:33 -0700 (PDT)
In-Reply-To: <20170918194625.xz5y7tkemjnbwunh@rob-hp-laptop>
References: <20170909015308.30001-1-brendanhiggins@google.com>
 <20170909015308.30001-3-brendanhiggins@google.com>
 <20170918194625.xz5y7tkemjnbwunh@rob-hp-laptop>
From: Rob Herring <robh@kernel.org>
Date: Mon, 18 Sep 2017 15:37:33 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+R6WXgHqYHypc49YAPVu_GH1SJ6LSKwcL-J_8Sc_aCmQ@mail.gmail.com>
Message-ID: <CAL_Jsq+R6WXgHqYHypc49YAPVu_GH1SJ6LSKwcL-J_8Sc_aCmQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 avifishman70@gmail.com, 
 tmaimon77@gmail.com, Rick Altherr <raltherr@google.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 openbmc@lists.ozlabs.org
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
X-List-Received-Date: Mon, 18 Sep 2017 20:37:57 -0000

On Mon, Sep 18, 2017 at 2:46 PM, Rob Herring <robh@kernel.org> wrote:
> On Fri, Sep 08, 2017 at 06:53:07PM -0700, Brendan Higgins wrote:
>> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
>> specific device tree for the NPCM750 (Poleg) evaluation board.

[...]

>> +/ {
>> +     model = "Nuvoton npcm750 Development Board (Device Tree)";
>> +     compatible = "nuvoton,npcm750";
>> +
>> +     chosen {
>> +             stdout-path = &serial3;
>
> stdout-path is a path string, not a phandle.

Sorry, it's Monday and my brain is not working. This is fine.

Rob
