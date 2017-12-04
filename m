Return-Path: <pombredanne@nexb.com>
Authentication-Results: ozlabs.org; spf=none (mailfrom) smtp.mailfrom=nexb.com
 (client-ip=2a00:1450:400c:c0c::242; helo=mail-wr0-x242.google.com;
 envelope-from=pombredanne@nexb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nexb-com.20150623.gappssmtp.com
 header.i=@nexb-com.20150623.gappssmtp.com header.b="FFsiq1a0"; 
 dkim-atps=neutral
Received: from mail-wr0-x242.google.com (mail-wr0-x242.google.com
 [IPv6:2a00:1450:400c:c0c::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yr4JM3VjCzDrVH
 for <openbmc@lists.ozlabs.org>; Mon,  4 Dec 2017 23:41:53 +1100 (AEDT)
Received: by mail-wr0-x242.google.com with SMTP id x49so17108257wrb.13
 for <openbmc@lists.ozlabs.org>; Mon, 04 Dec 2017 04:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nexb-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=o6FP7DxIyriPhb/1uIGYFtEMB7mbSEGO/6As3i6XWyw=;
 b=FFsiq1a0ew0RKgehjwwwt52YWxPtnTIFsf/H6UanOF7fk+f6vORTDsKJWv1taJkKwI
 2nvwSMQY1dbJLmEx4/jkOkUZR1hiqABgtishVqFjkopoXP0C1dzPLFIl2p95RyS1+sFv
 mnXmS/5FnzsT41GEsySaExlUjGZOtRK1dZoZD/KiJN9/FN842863n8hB56dbhM3xC3gR
 c6zlX0fK8bUAuXwBlOLTZ9VE/Q0IhZ+CTWEPnLTifz/YKC0hYJuY905avxfEIjElLmKv
 QtBp2V+9kR8yIehqh+/QER1IpagLANBGiC//DDdA5754w88VWgXcd0DdKnOKAwlcnUad
 HcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=o6FP7DxIyriPhb/1uIGYFtEMB7mbSEGO/6As3i6XWyw=;
 b=VTVzMKzxk3riKwOTNhM7P/h4WjxMsTSrQlLJK7K89fKvgZsUos6FiQZRlBgA9UApWP
 W4TDe4doF0fVUDRd00xms2PMtkjLHdulGZca2vPQnBjPQ9O+A9R7BR6A9zzhHaESx0dP
 BUxplfunOocLpK9yBGjr6N+KCrS7nUst7s9nNN6s/EYaQi6wsEar2ScEfeZ8rPJnW/Of
 /6dOEO5TOHI1rMyqakR/JlNsqH/+zKQYjIwfkdXrkqFiCGNhiJRIqcMggtUlxQPFgZ09
 7ARprAEext/1MblYuVL5UqXG3BoBMPHp4ByoEssTLpulpLJBdYakKo8RPj2ArPv9ZaDt
 cweA==
X-Gm-Message-State: AJaThX7+3J1zjP6E3+GhkHk2tl8bsPCjMeyCoaRzLim0xz4ow83lWqw2
 vg+ecjRRUIbJZRwIhU8Rkig4kAc8y0hmw82at5/nlA==
X-Google-Smtp-Source: AGs4zMbW6fPwS622uMtmDOtHuP4LbElOeMqoWdKOX9yIss5nYrKcQajxBj+yTsj09o0C5zj/wv9tUww0AQLaOioIqp4=
X-Received: by 10.223.160.111 with SMTP id l44mr13701957wrl.259.1512391309522; 
 Mon, 04 Dec 2017 04:41:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.157.195 with HTTP; Mon, 4 Dec 2017 04:41:08 -0800 (PST)
In-Reply-To: <1512382405-14774-3-git-send-email-oleksandrs@mellanox.com>
References: <1512382405-14774-1-git-send-email-oleksandrs@mellanox.com>
 <1512382405-14774-3-git-send-email-oleksandrs@mellanox.com>
From: Philippe Ombredanne <pombredanne@nexb.com>
Date: Mon, 4 Dec 2017 13:41:08 +0100
Message-ID: <CAOFm3uGYCssRV4D+Ht6NQLxFSijWt0dgsQEucJmVThjLqiD-oA@mail.gmail.com>
Subject: Re: [patch v13 2/4] drivers: jtag: Add Aspeed SoC 24xx and 25xx
 families JTAG master driver
To: Oleksandr Shamray <oleksandrs@mellanox.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 joel@jms.id.au, =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
 Tobias Klauser <tklauser@distanz.ch>, linux-serial@vger.kernel.org,
 vadimp@mellanox.com, 
 system-sw-low-level@mellanox.com, Rob Herring <robh+dt@kernel.org>, 
 openocd-devel-owner@lists.sourceforge.net, linux-api@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri Pirko <jiri@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 05 Dec 2017 11:25:22 +1100
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
X-List-Received-Date: Mon, 04 Dec 2017 12:41:56 -0000

Oleksandr,

On Mon, Dec 4, 2017 at 11:13 AM, Oleksandr Shamray
<oleksandrs@mellanox.com> wrote:
[...]
> v12->v13
> Comments pointed by Philippe Ombredanne <pombredanne@nexb.com>
> - Change jtag-aspeed.c licence type to
>   SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
>   and reorder line with license in description
[...]
> diff --git a/drivers/jtag/jtag-aspeed.c b/drivers/jtag/jtag-aspeed.c
> new file mode 100644
> index 0000000..2ff46b0
> --- /dev/null
> +++ b/drivers/jtag/jtag-aspeed.c
> @@ -0,0 +1,784 @@
> +/* SPDX-License-Identifier: GPL-2.0

Sorry to nit pick on this but the comment style should be // here IMHO
This is what Linus requested, e.g.:

> +// SPDX-License-Identifier: GPL-2.0

For reference, the doc is being written:Thomas (tglx) has already
submitted a first series of doc patches a few weeks ago. And AFAIK he
might be working on posting the updates soon, whenever his real time
clock yields a few cycles away from real time coding work ;)

See also these discussions with Linus [1][2][3], Thomas[4] and Greg[5]
on this and mostly related topics, where you will see Linus rationale
for the C++ comment stylle

[1] https://lkml.org/lkml/2017/11/2/715
[2] https://lkml.org/lkml/2017/11/25/125
[3] https://lkml.org/lkml/2017/11/25/133
[4] https://lkml.org/lkml/2017/11/2/805
[5] https://lkml.org/lkml/2017/10/19/165


-- 
Cordially
Philippe Ombredanne
