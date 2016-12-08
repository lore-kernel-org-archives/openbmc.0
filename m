Return-Path: <mouse@yandex-team.ru>
X-Greylist: delayed 438 seconds by postgrey-1.36 at bilbo;
 Fri, 09 Dec 2016 03:14:21 AEDT
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yandex-team.ru header.i=@yandex-team.ru
 header.b="AZWejGsd"; dkim-atps=neutral
Received: from forwardcorp1o.cmail.yandex.net (forwardcorp1o.cmail.yandex.net
 [37.9.109.47])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tZL651lrNzDw4H
 for <openbmc@lists.ozlabs.org>; Fri,  9 Dec 2016 03:14:21 +1100 (AEDT)
Received: from mxbackcorp1h.mail.yandex.net (mxbackcorp1h.mail.yandex.net
 [IPv6:2a02:6b8:0:f05::301])
 by forwardcorp1o.cmail.yandex.net (Yandex) with ESMTP id 3CE1020C86;
 Thu,  8 Dec 2016 19:06:55 +0300 (MSK)
Received: from webcorp01f.yandex-team.ru (webcorp01f.yandex-team.ru
 [77.88.31.45])
 by mxbackcorp1h.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 kz4CiHAM1G-6spStNuT; Thu, 08 Dec 2016 19:06:55 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1481213215; bh=DdR1FqVv88d5fpbmJUmMmMPvLSrh/kaaanUD8Z2KJdA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date;
 b=AZWejGsdhAYip4k0t+S/1f67QyT+6XSuIROlYEl+m0B4/yHs2Vyj0FiY0HqFmeIbG
 JvXIL4pRfO0blJTBwHDJwlOdrQFcZd47tO34ioSUyVO5TaxK5c87Zjbg+Rhibaua1v
 1XpY7sOF065ZIGLYqXOi6tlgPv5DOnkSREJ1jhuI=
Authentication-Results: mxbackcorp1h.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000001030
Received: by webcorp01f.yandex-team.ru with HTTP;
 Thu, 08 Dec 2016 19:06:54 +0300
From: Anton D. Kachalov <mouse@yandex-team.ru>
To: Joel Stanley <joel@jms.id.au>, Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
In-Reply-To: <CACPK8XcKAiTxALun5YiTW-wnQ9BzH0itoqKOqgzxux5ywKXTzw@mail.gmail.com>
References: <8d6aac0e-9d92-3ad9-67ea-f9cbf9032377@linux.vnet.ibm.com>
 <CACPK8XcKAiTxALun5YiTW-wnQ9BzH0itoqKOqgzxux5ywKXTzw@mail.gmail.com>
Subject: Re: Supporting different temp sensors at same I2C location
MIME-Version: 1.0
Message-Id: <645351481213214@webcorp01f.yandex-team.ru>
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Thu, 08 Dec 2016 19:06:54 +0300
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
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
X-List-Received-Date: Thu, 08 Dec 2016 16:14:24 -0000

Hello Matt,

08.12.2016, 01:55, "Joel Stanley" <joel@jms.id.au>:
> Hi Matt,
>
>
> We can keep both drivers around without issue. It takes a few KB of
> extra flash space, but we are still a long way from overflowing the
> space set aside for the kernel.
>
> The harder bit is the device tree. We would need to update the device
> tree depending on which piece of hardware is attached. I'm not sure
> the best way to handle that.
>

We use device tree overlay support ported from Raspberry Pi kernel tree and user space:

    https://github.com/raspberrypi/linux/tree/rpi-4.9.y/arch/arm/boot/dts/overlays
    https://github.com/raspberrypi/userland/tree/master/host_applications/linux/apps/

our patchset (100-103):

    https://github.com/ya-mouse/meta-openbmc-yandex/tree/master/meta-yandex/meta-openrack/meta-shaosi/recipes-kernel/linux/linux-obmc

and userspace ported to OpenBMC:

   https://github.com/ya-mouse/meta-openbmc-yandex/tree/master/meta-yandex/meta-openrack/meta-shaosi/recipes-phosphor/dtoverlay

and sample usage during init stage to detect proper board and load specific overlay:

   https://github.com/ya-mouse/meta-openbmc-yandex/blob/master/meta-yandex/meta-openrack/meta-shaosi/recipes-kernel/linux/linux-obmc/overlays/shaosi-CB.dts
   https://github.com/ya-mouse/meta-openbmc-yandex/blob/master/meta-yandex/meta-openrack/meta-shaosi/recipes-phosphor/initfs/files/obmc-init.sh#L413-L417

Current limitation of overlays is that __symbols__ only created within main DTB, it is not updated by further overlays, so we cannot just populate another tree with e.g. i2c-switch and then, depending on presence pin, add or remove computing node's overlays. As workaround it's possible to create complete base DTB and then using overlays enable or disable some part of tree.
Another limitation, overlays is a kind of stack. To remove some intermediate overlay, the kernel will remove all precedent overlays and the re-apply remaining.

-- 
Anton D. Kachalov
