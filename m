Return-Path: <brendanhiggins@google.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:400d:c09::244; helo=mail-qk0-x244.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="W826oKj7"; 
 dkim-atps=neutral
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com
 [IPv6:2607:f8b0:400d:c09::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zmm6N2RDWzF0qm
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 05:22:03 +1100 (AEDT)
Received: by mail-qk0-x244.google.com with SMTP id s188so3180070qkb.2
 for <openbmc@lists.ozlabs.org>; Wed, 21 Feb 2018 10:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=F9V2zSnu8Y9wJDIRAbD+74m1WekztcLCmZCoEIPwKWo=;
 b=W826oKj7TCcXCLiGOTj5vckpFbAKT/bbN1R6Um/NtSfEPvn+sdsddfmWn5weltQQfx
 UEGnAtCdgCyTn+L9lUHIY9P6gFMUYabXiCBFdsRXp6MprK8MS1DvTcNNxZISHhXCTXhD
 jtnyf5euiwwjPsVu2MnJZcKanmk3uVHAC1snepzyHxtjrtuCEFf0FJN93T+2gOW0I7kR
 m3CiydQfcm/ce9hvUASahbyR5ipX0emXNJELpYRTOmd1BhXIDdIZzxOanAF6LnwH3OOQ
 wYHReLxq6dlB9Q6WRruZ7Oe7UU8cadV/qUL6hnL1re8fsF4daWqeK/YQboGnuUYwdATn
 vBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=F9V2zSnu8Y9wJDIRAbD+74m1WekztcLCmZCoEIPwKWo=;
 b=eXFESdf/9bwJqohY7Zht03DmwBvOm176V2G8wyEx2j+3qxzXe1iDzMVJzek9e2GtI6
 c3ZhbQRjxYtiWimx+KyRPt1FH+GY7GAQJpiu31ErikxVexNOKRwHTNtmV23tSLxycmd0
 J8ZFNgoWaXinKQ7GfXsZsSu99t9HzJHyNpB40rOylsV+KnADSV8Ad26BUYoBzDNp4Ng1
 z2brR3VD4WRtNRZFdXPua1b/8FmN72jszHM+J/r3X4zIOrOyki4uDtyxILmGsHxZ8R9g
 n9neoiqwI9AOK8MWvVsYfHRYtUsebLbebPq8TfIEIM+Hz/VK0jEdZ9Z5rUxr+e4Mun2Z
 oeTA==
X-Gm-Message-State: APf1xPDFkmaBrcdNgI4piKQGdkyUrR/0BIxpNl2KzScnlVMjWCz0Ao4T
 8nkrXgayOFdH5YTF9wuog92/MODjY046WSvNNF3o6w==
X-Google-Smtp-Source: AG47ELspmRHIHfE7Y5ctWCGjlAC1iVPu8LoRm4ZfDi6hb3uMx5mwzkcBrCi+I+qGaX+ii90YkTCbW0/qfnMrzMGnvQk=
X-Received: by 10.55.65.81 with SMTP id o78mr1269574qka.274.1519237320727;
 Wed, 21 Feb 2018 10:22:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.34.104 with HTTP; Wed, 21 Feb 2018 10:22:00 -0800 (PST)
In-Reply-To: <CAL_JsqKq-+fKapT6RKwqBubRuJszpKMJevS7NOObPP-bVA2_kw@mail.gmail.com>
References: <1518701959-22899-1-git-send-email-tali.perry1@gmail.com>
 <1518701959-22899-2-git-send-email-tali.perry1@gmail.com>
 <CAFd5g44gBJp0-mYEWGdyiA67BCi2pZWAG2bYPS-WdJEwH1oA5A@mail.gmail.com>
 <20180219144905.bfrycjnas7dcuo34@rob-hp-laptop>
 <CAFd5g44argF0oaOq7fOM0YbCBK5h8NyRia+H8CbRC5qAQHe5WA@mail.gmail.com>
 <CAL_JsqKq-+fKapT6RKwqBubRuJszpKMJevS7NOObPP-bVA2_kw@mail.gmail.com>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 21 Feb 2018 10:22:00 -0800
Message-ID: <CAFd5g470T=bd-mg2C8DerOx0p7Nj2A6JhS0GueP8y8DLr3JN0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] clk: npcm750: update text with fixed clocks
To: Rob Herring <robh@kernel.org>
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
X-List-Received-Date: Wed, 21 Feb 2018 18:22:05 -0000

On Wed, Feb 21, 2018 at 5:23 AM, Rob Herring <robh@kernel.org> wrote:
> On Tue, Feb 20, 2018 at 10:47 PM, Brendan Higgins
> <brendanhiggins@google.com> wrote:
>> On Mon, Feb 19, 2018 at 6:49 AM, Rob Herring <robh@kernel.org> wrote:
>>> On Thu, Feb 15, 2018 at 02:38:12PM -0800, Brendan Higgins wrote:
>>>> On Thu, Feb 15, 2018 at 5:39 AM, Tali Perry <tali.perry1@gmail.com> wrote:
>>>> >
>>>> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>> >
>>>>  <snip>
>>>>
>>>> I think this should probably be rolled into [PATCH v2 1/1] npcm750: add fixed
>>>> clocks (moved from drivers/clk/clk-npcm7xx.c):
>>>> https://www.spinics.net/lists/arm-kernel/msg634678.html
>>>
>>> No, binding docs, dts files and driver code should all be separate
>>> patches.
>>
>> My mistake. This patch has a dt-bindings include file; should the include file
>> go in here, with the dtsi changes, or in its own separate patch?
>
> It defines the binding, so with the binding documentation.
>

So two things, first off, the include file I was asking about is not a dtsi, but
a file that defines a bunch of macros for referencing clocks. I don't know if
that makes a difference.

Second, the patch that I referenced above, "[PATCH v2 1/1] npcm750: add fixed
clocks (moved from drivers/clk/clk-npcm7xx.c):
https://www.spinics.net/lists/arm-kernel/msg634678.html", *does* contain a dtsi
and nothing else, and defines these bindings, which is why I thought it went in
with the binding docs.

Cheers
