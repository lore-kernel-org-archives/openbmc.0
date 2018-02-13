Return-Path: <arndbergmann@gmail.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4003:c0f::244; helo=mail-ot0-x244.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="A7V5ExBy"; 
 dkim-atps=neutral
Received: from mail-ot0-x244.google.com (mail-ot0-x244.google.com
 [IPv6:2607:f8b0:4003:c0f::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zgtW83GvWzF1RM
 for <openbmc@lists.ozlabs.org>; Wed, 14 Feb 2018 06:53:08 +1100 (AEDT)
Received: by mail-ot0-x244.google.com with SMTP id q12so18338281otg.10
 for <openbmc@lists.ozlabs.org>; Tue, 13 Feb 2018 11:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=niagko5JAYteaoAt+aC3B8/NfR1Syt9bCfX9MJeToCs=;
 b=A7V5ExByQleFknXmDoiSpfPD1rKSagqZ0uyUX+7KzYQRfDij0da5somZ8f0KJIdSbG
 xn8nTtA2aeLXe9mEWB7L5LVzHkp8sMOP9WIvCUei+mgfDZXHs1JIfdahfUJdH/aikmRd
 dxNimOSjLQZXVWkYECzeCq/9fkfQxF3/Gih1uKKdVosxNN79PwlgsGCM5fKP/8aOn1bs
 FVW3R/S/wxpQXyfLrgVBFzYAzGuekXAroBD0eH2zGR9BJn2bWtAMapq1yqWFDfkbwXyR
 ARd++HUp/Dfbm4ozlHIXTQMsp0jz+BhkFfqA9e9A7yZnsyidPMuiBqOlr3HFpVZHkd+X
 R6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
 :date:message-id:subject:to:cc;
 bh=niagko5JAYteaoAt+aC3B8/NfR1Syt9bCfX9MJeToCs=;
 b=EtIsSTcdbP3G2L2JKLK67HI4GV/RBYQAFyjTfjz8vMpydAUOKYmAk/l3gHnM1tpTlZ
 aTCou9FRc9Puf+2zPwLdgDq9sk9ukt9uH4SS2NLzrMXaWmHPbnf1lAyVnKKDwfZFE5KM
 lCpALaeBDiC5TiN6hh3ziVrPP5a2vzIVQ3pI7RNTOJ6hNCAIQAsf1mCKqedqhspDVy9c
 +qeW/Acnd89vSEjmo+fVGhkxBl1dGLZH3SoiA3fRCdlxvRf89AbLo6HOZq4kis1N1W6r
 VXfpaEQMVTHq7Fc+VuWWI57FBI2FNzjhyGyv7O/olPg4ciSOuMT+5F5YVpZf87pXMG+9
 /LDg==
X-Gm-Message-State: APf1xPCwBhDaNrDVvl1gbxUwyqRlNj/sB/8VzdbbKUdoXM2ECOI9iZZe
 KNeZaZ0exbtYqSjJY0lgTP7wbeGA+mrjZeXucr4=
X-Google-Smtp-Source: AH8x227G0yQlz5hMe9gQmxOiu9ezDo0YY4Q98SEwrHmJcl+Yt/5pngdXkeSh52Qkf2Uq6KPZcDUWfRC+AcMqil1Svn4=
X-Received: by 10.157.26.44 with SMTP id a41mr1681302ote.108.1518551586237;
 Tue, 13 Feb 2018 11:53:06 -0800 (PST)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
Received: by 10.168.66.10 with HTTP; Tue, 13 Feb 2018 11:53:05 -0800 (PST)
In-Reply-To: <CAFd5g44iHgSoPfko6hgMjz=QMm6ZUScUWbnho1w0bL_brTCjrA@mail.gmail.com>
References: <20180205235757.246758-1-brendanhiggins@google.com>
 <20180205235757.246758-3-brendanhiggins@google.com>
 <CAK8P3a0SJTAkv7_QtDW1sDWFDYHw8tFWZqO6EMwpZ_5KPbhq3Q@mail.gmail.com>
 <CAKKbWA6Otc1ZO_yHpfhxPjbgvvn-QXcXG9sy5=3FZDY8d_20rw@mail.gmail.com>
 <CAFd5g44iHgSoPfko6hgMjz=QMm6ZUScUWbnho1w0bL_brTCjrA@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 13 Feb 2018 20:53:05 +0100
X-Google-Sender-Auth: NqQNWPp37fbuCqXL8licFxQ8f1o
Message-ID: <CAK8P3a0CESqe9gEPhBXO0-J9SB=wyM6p3Fg-abr3BDtExYgfYw@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] arm: dts: add Nuvoton NPCM750 device tree
To: Brendan Higgins <brendanhiggins@google.com>
Cc: Avi Fishman <avifishman70@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
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
X-List-Received-Date: Tue, 13 Feb 2018 19:53:09 -0000

On Tue, Feb 13, 2018 at 8:12 PM, Brendan Higgins
<brendanhiggins@google.com> wrote:
> On Tue, Feb 13, 2018 at 1:29 AM, Avi Fishman <avifishman70@gmail.com> wrote:
>> On Tue, Feb 13, 2018 at 10:30 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>>> On Tue, Feb 6, 2018 at 12:57 AM, Brendan Higgins
>>> <brendanhiggins@google.com> wrote:
>>>> Add a common device tree for all Nuvoton NPCM750 BMCs and a board
>>>> specific device tree for the NPCM750 (Poleg) evaluation board.
>>>>
>>>> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
>>>> Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>
>>>> Reviewed-by: Avi Fishman <avifishman70@gmail.com>
>>>> Reviewed-by: Joel Stanley <joel@jms.id.au>
>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>> Tested-by: Tomer Maimon <tmaimon77@gmail.com>
>>>> Tested-by: Avi Fishman <avifishman70@gmail.com>
>>> ...
>>>> +               enable-method = "nuvoton,npcm7xx-smp";
>>>
>>> I see this has already been reviewed quite a bit, but I'm curious
>>> about the 'npcm7xx'
>>> part here. Shouldn't that be a real chip name rather than a wildcard?
>>
>> There is a family of npcm7xx, some with SMP and some without.
>> For those who has it, it is common for all to use the same
>> "nuvoton,npcm7xx-smp".
>
> I think Arnd is right. In this case it should be "nuvoton,npcm750-smp". We can
> use CPU_METHOD_OF_DECLARE to alias to as many compatible properties as needed.
>
> Although everything in the 7xx family currently is either single core or has the
> same SMP behavior, you could paint yourself into a corner if you were to make
> one SMP device in the 7xx family which behaves differently from all other
> devices and then need to come up with new compatible string names just for that.

Right, this is the reason for the very simple 'no wildcards in DT
identifiers' rule.
There simply isn't a reason to make an exception here.

       Arnd
