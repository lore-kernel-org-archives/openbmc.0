Return-Path: <avifishman70@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c06::243; helo=mail-oi0-x243.google.com;
 envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NdHZZ/t9"; 
 dkim-atps=neutral
Received: from mail-oi0-x243.google.com (mail-oi0-x243.google.com
 [IPv6:2607:f8b0:4003:c06::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgcgk2r2JzDqNM
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 20:29:35 +1100 (AEDT)
Received: by mail-oi0-x243.google.com with SMTP id 8so13382837oix.7
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 01:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=GtLw2BkNY3nYOtjvgASdClqKzSZz2L6MEif1+MmKxiU=;
 b=NdHZZ/t9yHV07th6sXP4TfPdVAilp0lZCu8Xe8Ayz42J3jNTJoui8oEFUl0jHkJc1U
 iPisLob3bISPbnqxhIE1V/9mD1u3y3gV2nwtbMWjKdN7wonYVHh6QyKoHhjgjzWlnEJY
 RNAHj96VKJi0nu19ZgZU2JOAbVAT1HY8PGR2mAQysl7qDGhtgV5y/c42egChgpOfLqRO
 EI3UDVKV9r3/FNu52eOdewAlTy4KveQQONlrlc8WcoFwMgO+cOfF0t4W6BqeVlobF7DD
 TIayQBuarfDwE+a6g+vQOfKmwV7PoeuSUpWuXfVy7gb0xiUShobyXAZbjdvCCQ4GV2w2
 jXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=GtLw2BkNY3nYOtjvgASdClqKzSZz2L6MEif1+MmKxiU=;
 b=fbHEjRapHaKlEBmsXqmH12UAIi6GW0W+zwUu8+pk0+8mqyJjEEiX/sLNIx6Mq48Tbw
 g9kHOR5G8cTtHs7UGqXuCE1D2RqxUh2GKgH6FksipbPyh21aALkPaSnn5IkZQCpPLm6N
 enkFR0/lh2twZBngGVYqpqxH9GOUFub1BH9bfXTMUnnFv2h8KcuYnZZohbcPcPJLwwJD
 81FE67+Fq8jxJ5AXFwD0VHDg6DsLLGFiSS4SL0s/rzaPmuRDP4+rNPsZUMtkXdT3w9RH
 0QvXjj8Q/KPNONSJ0kTwvbuCjwMV0FtZfNyErpQMFVBDGB6oiaP71u9/MsJjDGu6CY99
 /Qbg==
X-Gm-Message-State: APf1xPAqC6fWutA12mV0z1Zk+7Hdx5jCEIqJd4NcWZHqy8DOh0WpQ3iX
 xCSEtmIE3164c4bUzigQU32ecCK0q2v+hDXrnQ==
X-Google-Smtp-Source: AH8x226dug8rBHqLsu9W9/Kqegy6eeLDjm+D+BAiQ4b4NlCFV8nSjEeL8BqAIkz8thZzqkep2bSurvW/4XKuwXnDxpg=
X-Received: by 10.202.197.140 with SMTP id v134mr354004oif.96.1518514172847;
 Tue, 13 Feb 2018 01:29:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.39.138 with HTTP; Tue, 13 Feb 2018 01:29:32 -0800 (PST)
In-Reply-To: <CAK8P3a0SJTAkv7_QtDW1sDWFDYHw8tFWZqO6EMwpZ_5KPbhq3Q@mail.gmail.com>
References: <20180205235757.246758-1-brendanhiggins@google.com>
 <20180205235757.246758-3-brendanhiggins@google.com>
 <CAK8P3a0SJTAkv7_QtDW1sDWFDYHw8tFWZqO6EMwpZ_5KPbhq3Q@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Tue, 13 Feb 2018 11:29:32 +0200
Message-ID: <CAKKbWA6Otc1ZO_yHpfhxPjbgvvn-QXcXG9sy5=3FZDY8d_20rw@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Arnd Bergmann <arnd@arndb.de>
Cc: Brendan Higgins <brendanhiggins@google.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Mark Rutland <mark.rutland@arm.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
 Julien Thierry <julien.thierry@arm.com>,
 Philippe Ombredanne <pombredanne@nexb.com>, 
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
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
X-List-Received-Date: Tue, 13 Feb 2018 09:29:39 -0000

On Tue, Feb 13, 2018 at 10:30 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Feb 6, 2018 at 12:57 AM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
>> specific device tree for the NPCM750 (Poleg) evaluation board.
>>
>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
>> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
>> Tested-by: Avi Fishman <avifishman70@gmail.com>
> ...
>> +               enable-method = "nuvoton,npcm7xx-smp";
>
> I see this has already been reviewed quite a bit, but I'm curious
> about the 'npcm7xx'
> part here. Shouldn't that be a real chip name rather than a wildcard?
>
>        Arnd

There is a family of npcm7xx, some with SMP and some without.
For those who has it, it is common for all to use the same
"nuvoton,npcm7xx-smp".

Avi
