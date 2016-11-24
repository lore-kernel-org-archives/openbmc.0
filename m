Return-Path: <brendanhiggins@google.com>
Received: from mail-qt0-x235.google.com (mail-qt0-x235.google.com
 [IPv6:2607:f8b0:400d:c0d::235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tPL8N2qn7zDvsC
 for <openbmc@lists.ozlabs.org>; Thu, 24 Nov 2016 11:45:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="Qu8vSjSl"; 
 dkim-atps=neutral
Received: by mail-qt0-x235.google.com with SMTP id c47so27139946qtc.2
 for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2016 16:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=UM0U00+yGwfNWQizWkstjqjoNwV6PlsD1kLHBY8G8Lw=;
 b=Qu8vSjSlxilcziRqaLG41xzY3RK9IHRsC3WsBqjNLzp07BgHYYy6sul5+DnuC7+n/k
 OmtJiJ7AfolrF/p1kJCRa0/iFzIORgy7nT+CeaZpvxNC3ytwA8QggQMuqqbg5MOWuGcc
 3hoC2a4eg3/Dfzjvt1V3+Uc6/m1xOd9kd0WCA7c71KDaJXK1SA986ZyP5KTKoxFvozc2
 CWf+p5PZrDEsd85LP31+4n4EVCFaXXPUrDmpHZdxuu9zsM3L2wVxFGqyQb73gTF0n/Qc
 idssdmN+efg868t7rUKwPvAFkUbRQFxTOy5JjVIdIOnkAdqs9b1V8Su7UemEXCJIrhil
 xAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=UM0U00+yGwfNWQizWkstjqjoNwV6PlsD1kLHBY8G8Lw=;
 b=DRv5d3v2PNXXZeV5nasoAuROQ9tnzQvYyjTLZHWcRU7jsM20edbq+p4QKvcbVLPeXX
 0UKLbHbqX6tLPL8pAiCVbcAIjq0z/lAjreINLNkNgWHOt1NN/Oq5XDfD3D3g250MTNwq
 FqWKzCVuxBC16cARTqoZcE1rwrWOdMQCOz9PPiNTMpgJFVaO9gg3jpEhJBgJ31rpr3PO
 R9gRH9WLs3AHfmqv+4Lq46hto6euCvXUQoq4eTtU/lc3dGmgimrU1peRt8tcAVi274cJ
 1HmAbBjXH10LLHwtI+/rbd11vasc+9kH7cYZXFpaKWvkoqsXFkmet6OiMX1jdLdlRF4B
 9oDg==
X-Gm-Message-State: AKaTC01yJCe2Yj9N5L47wg8GspI44t11jmVIitY0G0Mc9bjN0CMzP8vxmVsTNEodvZt0Qz5vqqWyENQFg21zPhKB
X-Received: by 10.200.34.108 with SMTP id p41mr5812100qtp.269.1479948305866;
 Wed, 23 Nov 2016 16:45:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.137.220 with HTTP; Wed, 23 Nov 2016 16:45:05 -0800 (PST)
In-Reply-To: <584151479839034@web17g.yandex.ru>
References: <1478311099-6771-1-git-send-email-brendanhiggins@google.com>
 <1478311099-6771-2-git-send-email-brendanhiggins@google.com>
 <28078e6d-f5e4-da59-e226-baa9a60a4b19@kaod.org>
 <584151479839034@web17g.yandex.ru>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Wed, 23 Nov 2016 16:45:05 -0800
Message-ID: <CAFd5g47boqUMcmjPPwYw9aEhof-mjhjVKxA69UDQkC1vbn+xWQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] i2c: aspeed: added driver for Aspeed I2C
To: Kachalov Anton <mouse@mayc.ru>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "mark.rutland@arm.com" <mark.rutland@arm.com>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Nov 2016 00:45:08 -0000

> I would like to add my five cents here. Do not limit the bus_clk with 400kHz (FM) while HighSpeed is above
> 1MHz (above FM+ devices). I've successfully tested FM+ (1Mhz) in a quite big i2c network (a number of
> pca9600, pca9675, pca9848) with at least eight AST2150 SoCs on the common bus.

Interesting point, on one hand I would argue that we should force
people to use either FM or FM+ in a conformant manner. But on the
other hand, I suppose a device may not support FM+'s electrical
characteristics, but could run at a higher clock rate, and it is
better to allow that than forcing FM+. Maybe I should remove any kind
of restriction, and just allow the clock to be set to any conformant
frequency and expose FM+ as a separate option in device tree.
Thoughts?

> BTW. Just a lame question. If the device isn't designed to work on the higher speed (like standard of FM)
> while the bus selected as FM+, would those kind of devices just unoperate or may have undefined behavior
> and disturb the SDA/SCL? Just wondering to dynamically slowdown down to 100Khz (if needed) for the
> specific slave, but keep high rate (FM+) at the normal operation.

I have never tried this myself, but I suspect there may be other
issues with running an FM device on an FM+ bus: FM+ uses a higher
current to make the rise times on the line faster. A bigger problem:
if a master wanted to select a high speed capable slave, it could
write the address at a high speed which might look like a different
address to a low speed slave that is incapable of sampling the address
properly. So I do not think that supporting dynamically slowing down
an I2C bus makes much sense. An interesting idea, though.
