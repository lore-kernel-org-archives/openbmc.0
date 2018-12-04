Return-Path: <sam@mendozajonas.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=mendozajonas.com
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=sam@mendozajonas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=mendozajonas.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=mendozajonas.com header.i=@mendozajonas.com
 header.b="ZluWXgiQ"; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="oyYdZq8H"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4388lr0r57zDqT9;
 Tue,  4 Dec 2018 15:59:03 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 094861331;
 Mon,  3 Dec 2018 23:59:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 03 Dec 2018 23:59:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 mendozajonas.com; h=message-id:subject:from:to:cc:date
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 lhFWqM2up4ssaW1z64Fz2p/47nzitu8Szm8wj2lq59Q=; b=ZluWXgiQ4h/EUjHk
 ZywpcdYUno7Dgd8gxRHj1K1E3Syzu0jkIheobEOeFGjCxt/e0EbBXdw1tYsVEBYz
 4y1NR2FRmIA8HPlFmZuc40OShjMmaLSojf884iyrgjVX99OfkXikP16BQj0zrjTX
 SEHcIQktShvepOdmB091uYAxAi55fU0fw2SxSF5+dOSNX2C8Cz0dyVw1pT9T/xCk
 HakHE0ZnHxovaZ7qI/2H+y8ICVg7S8yJKGYJRnFHMthZABC1XeicEXEPfmXS0R0U
 cGv+V/6STG8LKYOKMvP5WkM3KRvSYEynxAZZ6sH1rgCXdS38Hv/HfH7PBlU0wPiZ
 D+AmtQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lhFWqM
 2up4ssaW1z64Fz2p/47nzitu8Szm8wj2lq59Q=; b=oyYdZq8HcJg7yPs8wU4ovG
 aTAuRUBrPzi34n1P9EZIPtHmviplEuIB+ATHP7BjA/vY6YkhbpO7by0BmL9lPqoD
 uXofkAh2qdzNBuJ2FdyER2ari/FaksRumJG7LVQqJjvKlQmfeNznwXqA9wXEfc1J
 RwFky2J3ygi1Z885I/o91hdQf4BPbl2CvpbtHLFvyrtIJpg/rIiXTbk5mE3p0NCp
 q7FRfx8lXJSwkGoS9ZtjyFc8EDf7lfTATomTgJ4/GIWUuDKYnRDP3b+v4plmLSuz
 7W62aWD+kdzktPPVm+bzNEcHBBXUHQdkP5PQ3I+qu/Q2qrck8GXxODKfgxGgd4Tg
 ==
X-ME-Sender: <xms:lAkGXC2-lNdknjbNbJ7swnhvZ404Hm362rYilhkYuVEYIcjvr6pI9A>
X-ME-Proxy: <xmx:lAkGXHIevM2_pWscJs82xEwr4o_ji5GoWsMNUmwveximY8irAw7pxg>
 <xmx:lAkGXDBtNqSyBxE_nopg-acwHLebJzZo66HniLUcwZrqEUu47KcdOQ>
 <xmx:lAkGXPH8OM1cA1TJfzAje0JMGUAXyG2CvdR92je7oOtxCaz-sh7xYw>
 <xmx:lAkGXILAAdVkNuYDBiMIGtKUMX6ZT9b8El9QaV6QnQb49xbUnfxJ5Q>
 <xmx:lAkGXGoBElg4xTHy-VMVKDnySA6ZhX7eQuCVNvvDHCFmm3rQuZT0rw>
 <xmx:lAkGXOBaWH2IVmUhy6UW0EuMZDaX4P8hW1e4rN7Fsvw7Wbfad4xmMQ>
Received: from v4 (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 99AA810381;
 Mon,  3 Dec 2018 23:58:58 -0500 (EST)
Message-ID: <c063fd2e633fc837d556fcd1afd4c59823b06708.camel@mendozajonas.com>
Subject: IPMI Boot Initiator Mailbox feature
From: Samuel Mendoza-Jonas <sam@mendozajonas.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Cc: Alexander Amelkin <a.amelkin@yadro.com>, 
 openpower-firmware@lists.ozlabs.org
Date: Tue, 04 Dec 2018 15:58:54 +1100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Dec 2018 04:59:08 -0000

Hi All,

The IPMI Set/Get System Boot Options commands are currently used to
implement boot device overrides via parameter 5 (boot flags) in
Petitboot, and OpenBMC already supports these.
However as Alexander points out (here: 
https://github.com/open-power/petitboot/issues/45), the spec also
describes the use of parameter 7, the "boot initiator mailbox", the
format of which is largely up to the user.

Extending Petitboot support for this is relatively straightforward and I
have a set of patches which allow a user to set the contents of the
mailbox in the format of the Petitboot "bootdevs" configuration parameter
which allows us to set arbitrary boot orders remotely, much more fine
grained than the existing boot device overrides:
http://patchwork.ozlabs.org/project/petitboot/list/?series=79302

I've tested this locally on machines with BMCs that support parameter 7
(eg. with AMI BMCs) but this would be a great feature to include in
OpenBMC. Is there interest in adding this feature? How flexible is the
current IPMI implementation in order to add this?

My patchset includes a small script which can get and set the mailbox for
a given BMC which makes the format a bit easier to understand:
http://patchwork.ozlabs.org/patch/1006633/

Cheers,
Sam
