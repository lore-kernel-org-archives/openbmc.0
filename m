Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 596 seconds by postgrey-1.35 at bilbo;
 Wed, 10 Aug 2016 23:35:01 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b=TYLxYYwg; dkim-atps=neutral
Received: from forwardcorp1o.cmail.yandex.net (forwardcorp1o.cmail.yandex.net
 [IPv6:2a02:6b8:0:1a72::290])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3s8XFd1G6pzDqCb
 for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2016 23:35:01 +1000 (AEST)
Received: from mxbackcorp1h.mail.yandex.net (mxbackcorp1h.mail.yandex.net
 [IPv6:2a02:6b8:0:f05::301])
 by forwardcorp1o.cmail.yandex.net (Yandex) with ESMTP id 319EF206E7;
 Wed, 10 Aug 2016 16:24:58 +0300 (MSK)
Received: from webcorp02g.yandex-team.ru (webcorp02g.yandex-team.ru
 [87.250.230.45])
 by mxbackcorp1h.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 oC2yFCNbdF-OvTulRbc; Wed, 10 Aug 2016 16:24:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1470835498; bh=MBqvn3HdfAd7RO6T/RoVD59tvsdr0RSPu2+vnSJlWUk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
 b=TYLxYYwginqP4db/h95L8QaZ1X2g8+vRZ3yYNB2wBV7FLyLFxQD83iomWfPiz2YHd
 JqmVQbAjig5q49UDzuv9v5bkbF6FxVLTzlGwlB5bVZK/02dtuIQFnyJyPz2dkR45gi
 GfrNsgWSwiLXaALQyyiB67nl9NcJUCoENzK8+mNU=
Authentication-Results: mxbackcorp1h.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp02g.yandex-team.ru with HTTP;
 Wed, 10 Aug 2016 16:24:57 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <CACPK8XdAFqTXGRtoYLgM-PWu-Y7kB1=5cs6MKkAmQMz7u3sJeA@mail.gmail.com>
References: <97341470823017@webcorp01g.yandex-team.ru>
 <CACPK8XdAFqTXGRtoYLgM-PWu-Y7kB1=5cs6MKkAmQMz7u3sJeA@mail.gmail.com>
Subject: Re: OpenBMC on the OpenWRT
MIME-Version: 1.0
Message-Id: <148281470835497@webcorp02g.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Wed, 10 Aug 2016 16:24:57 +0300
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
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
X-List-Received-Date: Wed, 10 Aug 2016 13:35:02 -0000

Hi, Joel.

10.08.2016, 14:06, "Joel Stanley" <joel@jms.id.au>:
> Hey Anton,
>
> On Wed, Aug 10, 2016 at 7:26 PM, Anton D. Kachalov <mouse@yandex-team.ru> wrote:
>>  Hello everybody.
>>
>>  I'm working on a separate project for rack solution which utilize many portions of OpenBMC:
>>
>>     https://github.com/ya-mouse/openbmc-target
>
> Nice! I came across your repository the other day.
>
>>  As a system base we choose OpenWRT (flexible kernel-style configurations, package manager,
>>  wide and experienced support for embedded systems with limited resources).
>
> I'm not too familiar with OpenWRT aside from using it on my WiFi
> router at home. I do have experience with buildroot, which uses
> Kconfig and does a good job at creating small, configurable images.
>
> Have you been happy with OpenWRT as a build system?

Yep, we happy with it. We rebase other project from micro ubuntu system
(handcrafted files' lists to keep system as small as 4M + additional app packs) to the
OpenWRT on x86 in our HW load testing and servers' pre-deployment environment.
Of course, there are several tricks that needed to be learned :)

>>  We still use old u-boot that came from OpenSource release of AMI SDK.
>>  Have plans to move to the OpenBMC's version to start using of DTS.
>
> Great! Let me know how you go. I'm happy to apply patches in order to
> support your configuration. Our goal is to upstream our patches to
> remove the need to fork it all together.

I'll try to rebase our current code to the latest OpenBMC (pwmfan, pinctrl, i2c slave).

>>  And a few modifications over OpenBMC kernel tree:
>>
>>  1. I2C slave support for the aspeed adapter (it is ugly a bit).
>
> Did you see the slave patch that Brendan submitted? Would it work for
> your requirements?
>
>   https://github.com/openbmc/linux/commit/090cb02e01906e7a7cf9c210237c4899972a9770

It's good! I'll try it. Next thing that we should think is a buffer mode additional to the byte mode transfer.
It's good for big transactions to offload byte ACKing to HW but requires some changes in, for instance,
i2c slave support design. I've started such discussion in kernel's i2c maillist:

    http://www.spinics.net/lists/linux-i2c/msg25656.html

> Thanks for sharing your results. How does nginx go with memory usage?

It is twice more than uhttpd, but still has a little memory footprint (3-4MB).

I would like to start a little discussion around board setup process in arch/arm/mach-aspeed/aspeed.c.
For most cases this process is "flat": just modifying regs one-by-one. Sometimes with applying mask.
I have an idea to add an array of "instructions" to the Device Tree in the following manner
(I hope dtc's preprocess via cpp resolve ORed macro in the correct way):

==========
#include <dt-bindings/soc/aspeed.h>

/ {
    model = "Our HW";
    compatible = "aspeed,ast2400";
    board-setup = <WR, AST_BASE_LPC | 0x9c, 0x02010023, 0>,
                           <WR, AST_BASE_SCU, SCU_PASSWORD, 0>,
                           <WR, AST_BASE_SCU | 0x80, 0xcb000000, 0>,
                           ...
                            /* write(read() | 0x1000) */
                           <OR, AST_BASE_SCU | 0x2c, 0x00001000, 0>,

                           /* write((read() &~ 0x2000) | 0x1000) */
                           <OR, AST_BASE_SCU | 0x2c, 0x00001000, 0x2000>;
==========

or in less talkative way:

==========
                            /* write((read() &~ 0) | 0xcb000000) */
                           <AST_BASE_SCU | 0x80, 0xcb000000, 0>,
                           ...
                            /* write((read() &~ 0x1000) | 0x1000) */
                           <AST_BASE_SCU | 0x2c, 0x00001000, 0x1000>,
==========

to completely eliminate board-specific init functions.

-- 
Anton D. Kachalov
