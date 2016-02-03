Return-Path: <andrew@aj.id.au>
Received: from homiemail-a23.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 153821A0206
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 16:46:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=emsXi1wy; 
 dkim-atps=neutral
Received: from homiemail-a23.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTP id 688684B0063
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 21:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to
 :subject:date:message-id; s=aj.id.au; bh=OMbsAb2xAf8NdKJkd/ZfPE6
 hgco=; b=emsXi1wyWG85M7Avnhdex09zdar1U3FS4uyBk4OnzQfOwqigzq2SA+T
 n6TB62EUd1Xn5J3GLRcTqYe4JECgXlG76KNVHfv/AfVE0yX/i5kIYCj2PI99vto5
 lTVMNvlYBeV2IEpAV4zsQs7ZQihrqvxyCzRrIsttJDiQk2Q4FhP8=
Received: from localhost.localdomain (unknown [138.44.251.155])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a23.g.dreamhost.com (Postfix) with ESMTPSA id 147754B0062
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 21:46:44 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 0/3] QEMU: Add ASPEED AST2400 machine model
Date: Wed,  3 Feb 2016 16:46:30 +1100
Message-Id: <1454478393-11973-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Feb 2016 05:46:48 -0000

Hi all,

This patchset for QEMU implements enough of the AST2400 machine model to boot a
aspeed_defconfig kernel. This mostly boils down to wiring together the ASPEED
timer and AVIC, and hooking up a UART. The device model patches in turn only
partially implement the hardware features of the timer and AVIC, again just
enough to boot the kernel.

This is the first time I've implemented QEMU device models so no doubt the
patches contain misunderstandings and/or oversights - happy to hear any
feedback! 

Cheers,

Andrew

Andrew Jeffery (3):
  timers: Add ASPEED AST2400 timer device model
  intc: Add (new) ASPEED AST2400 AVIC device model
  ast2400: Add ASPEED AST2400 machine type

 default-configs/arm-softmmu.mak |   2 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/ast2400.c                | 126 +++++++++++++++++
 hw/intc/Makefile.objs           |   1 +
 hw/intc/aspeed_vic.c            | 288 ++++++++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   2 +
 hw/timer/aspeed_timer.c         | 301 ++++++++++++++++++++++++++++++++++++++++
 include/hw/intc/aspeed_vic.h    |  42 ++++++
 include/hw/timer/aspeed_timer.h |  52 +++++++
 9 files changed, 815 insertions(+)
 create mode 100644 hw/arm/ast2400.c
 create mode 100644 hw/intc/aspeed_vic.c
 create mode 100644 hw/timer/aspeed_timer.c
 create mode 100644 include/hw/intc/aspeed_vic.h
 create mode 100644 include/hw/timer/aspeed_timer.h

-- 
2.5.0
