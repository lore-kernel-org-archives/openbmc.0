Return-Path: <andrew@aj.id.au>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="EwUxHnJp"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="cLy0HHG9"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zlnSR51sgzF0V8
 for <openbmc@lists.ozlabs.org>; Tue, 20 Feb 2018 15:19:19 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 52B0120D7B;
 Mon, 19 Feb 2018 23:19:17 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
 by compute4.internal (MEProxy); Mon, 19 Feb 2018 23:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :date:from:message-id:subject:to:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=GIbSIhGWKE/2ZiQHsDyipsvXcz1elG+bKYWOsgNUP
 Rs=; b=EwUxHnJpDJfOAg5zzBe5fSP63HCBksRe8uwrN9D1CZcWBosuRt7mukHBY
 ll9IHXMrwSd2szbsEzgAS3xJ4Zp23RpIBKEYbCERBg7vt9crM+atlNpiFAXxK1+3
 EqhWn6vC3EoAZ3hlNFkdIODv7/dILRVlgiDAcqr0so2zt03PskZKzOgtFrDtzH3l
 +2psLRPDeoIpi0ulaqtJLPi66tpi9m6uSqvh3XCODLsOGErl3M3YtCnJkHPmCiNF
 zku+BS2o1Js1E/QWas67cnUpb1lKFfj31honGzqddPitvi2osLC3KOr59wDEY8RP
 a4T4FHPiDhDbhozo2s3lTZ5mQrqig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:message-id:subject:to
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GIbSIhGWKE/2ZiQHs
 DyipsvXcz1elG+bKYWOsgNUPRs=; b=cLy0HHG97KEf4IJXh/8UsRR2g2Tpsu8Tc
 UBlSUkO6GyeFOin36eGUuhZXBnJfCK0T/VCX4/ZlJ84ScHApRawhbYQAu+uO0YtX
 9Ef5tWm4PWehr0reipWJA2E9sN9cPHS9aRXmbWg3axWW6P8Oic5T0GGPyZf5G8RX
 6nJMMnrWMJPAPbPFz/dHaJJVsEV17P6jS2YD0ZagEYqMh+YTbffO/tTmGSedemRp
 n13O+pRiKtW/4Iw0Ws+B2hXkYN8zAtpbN6GouD/ow54A317hd4ApLCDb8yGxnByB
 1AcugabPf8CfH0nIeBan6yXeFgSn8NyOZoL6wbs/S80NlTDncBcVQ==
X-ME-Sender: <xms:xaGLWgAsLbd26JRyb3-Jl_s6Onib2z2JMt0FUCC4wPPpWWwydZisaA>
Received: from dave.aj.id.au (ppp118-210-154-2.bras1.adl6.internode.on.net
 [118.210.154.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 748F27E0DF;
 Mon, 19 Feb 2018 23:19:14 -0500 (EST)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au, jk@ozlabs.org, eajames@linux.vnet.ibm.com,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 00/16] Locking fixes for FSI, SBEFIFO, OCC
Date: Tue, 20 Feb 2018 14:48:28 +1030
Message-Id: <20180220041844.13228-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.14.1
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
X-List-Received-Date: Tue, 20 Feb 2018 04:19:20 -0000

Hello,

This is a forward-port to dev-4.13 of my dev-4.10 series aimed at fixing the
locking and work scheduling for the OCC stack:

Cover Letter: https://lists.ozlabs.org/pipermail/openbmc/2018-February/010793.html
Patch Series: http://patchwork.ozlabs.org/project/openbmc/list/?series=28746&state=%2A&archive=both

The dev-4.13 series adds several new patches:

0001-dts-fsi-Make-OCC-description-match-expected-hierarch.patch

dev-4.13 as it stood failed to get the OCC driver stack up and running due to
broken descriptions in the devicetree with respect to the drivers'
implementations. Patch 1 fixes this by making the devicetree reflect what the
drivers expect, but the fact remains that this is an abuse of the devicetree.
We need to have a discussion about how best to instantiate the hwmon driver and
fix what we're doing here.

0002-hwmon-p9_sbe-Initialise-device-spin-lock.patch

Patch 2 fixes what appears to be an oversight in lock initialisation in the
p9_sbe OCC hwmon implementation.

0011-hwmon-p9_sbe-Add-static-key-to-satisfy-lockdep.patch

Finally, patch 11 shuts up lockdep in the p9_sbe OCC hwmon implementation,
which was whinging due to dynamic mutex allocation. Kernel locking experts
should feel free to chime in as I don't know that this is actually the right
fix.

Beyond that, the series has been lightly tested on a Witherspoon system and
nothing was obviously broken.

Please review!

Cheers,

Andrew

Andrew Jeffery (12):
  dts: fsi: Make OCC description match expected hierarchy
  hwmon (p9_sbe): Initialise device spin lock
  fsi: sbefifo: Rename sbefifo_release_client() for consistency
  fsi: sbefifo: Add tracing of transfers
  fsi: gpio: Trace busy count
  fsi: occ: Add tracepoints
  hwmon (p9_sbe): Rename context variable
  hwmon (p9_sbe): Rename lock member of struct p9_sbe_occ
  hwmon (p9_sbe): Convert client_lock from a spinlock to a mutex
  hwmon (p9_sbe): Add static key to satisfy lockdep
  fsi: sbefifo: Switch list_lock from spinlock to mutex
  fsi: gpio: Remove unused 'id' variable

Eddie James (3):
  fsi: sbefifo: don't delete canceled xfrs in write
  fsi: sbefifo: Avoid using a timer to drive FIFO transfers
  fsi: sbefifo: Switch to mutex in work function

Jeremy Kerr (1):
  fsi: gpio: Use a mutex to protect transfers

 arch/arm/boot/dts/ibm-power9-cfam.dtsi |  12 +++-
 drivers/fsi/fsi-master-gpio.c          |  94 +++++++++++++++++++-------
 drivers/fsi/fsi-occ.c                  |   9 +++
 drivers/fsi/fsi-sbefifo.c              | 119 +++++++++++++++++++++++----------
 drivers/hwmon/occ/p9_sbe.c             |  54 ++++++++-------
 include/trace/events/fsi_master_gpio.h |  16 +++++
 include/trace/events/fsi_occ.h         |  86 ++++++++++++++++++++++++
 include/trace/events/sbefifo.h         |  93 ++++++++++++++++++++++++++
 8 files changed, 394 insertions(+), 89 deletions(-)
 create mode 100644 include/trace/events/fsi_occ.h
 create mode 100644 include/trace/events/sbefifo.h

-- 
2.14.1
