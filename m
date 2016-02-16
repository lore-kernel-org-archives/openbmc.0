Return-Path: <andrew@aj.id.au>
Received: from homiemail-a20.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 8A3031A001B
 for <openbmc@lists.ozlabs.org>; Tue, 16 Feb 2016 22:35:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=cieRhMY4; 
 dkim-atps=neutral
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id 8D7897EC078;
 Tue, 16 Feb 2016 03:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:mime-version:content-type:
 content-transfer-encoding; s=aj.id.au; bh=/uCdNw8FLFoqz51bIAaXL4
 oVG+8=; b=cieRhMY4NsommbKRp8DBFOTOOdZ98Y4crrRjwIEur/HH8F/yku9n93
 PMZGdmMGKZR8BHEqKE9WVbsdWBdp2Pr+zjs9BzCFQRLwPYR62YWztbd3oRJg5jCa
 C7aZz6APWf7zBMXxT8H/z1CWzSNvHXn2tvOpnTOLaaFDLJFwBxOMA=
Received: from keelia.au.ibm.com (ppp203-122-213-247.static.internode.on.net
 [203.122.213.247])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id 917257EC060;
 Tue, 16 Feb 2016 03:35:05 -0800 (PST)
From: Andrew Jeffery <andrew@aj.id.au>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/3] Add ASPEED AST2400 machine model
Date: Tue, 16 Feb 2016 22:04:54 +1030
Message-Id: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
X-List-Received-Date: Tue, 16 Feb 2016 11:35:12 -0000

Hi all,

This is the first time I've implemented QEMU device models so no doubt th=
e
patches contain misunderstandings and/or oversights - happy to hear any
feedback!=20

This patch series implements enough of the ASPEED AST2400 (ARMv5 SoC) mac=
hine
model to boot an aspeed_defconfig Linux kernel[1]. The device model patch=
es in
turn only partially implement the hardware features of the timer and AVIC=
,
again mostly just enough to boot Linux.

The addition of the AST2400 to QEMU is motivated by use of the SoC as a B=
MC in
OpenPOWER[2][3] machines and the ongoing development of OpenBMC[4]. The
presence of a machine model for the AST2400 will help with development an=
d
testing of the OpenBMC stack.

I posted an initial revision to the OpenBMC mailing list (CC'ed) for revi=
ew,
hence the v2.

Cheers,

Andrew

[1] git fetch git@github.com:openbmc/linux.git dev-4.3
[2] http://openpowerfoundation.org/
[3] https://github.com/open-power/
[4] https://github.com/openbmc/openbmc

=3D=3D=3D

Since v1:

  Address comments from C=C3=A9dric Le Goater:

  General:
  * Use tracing infrastructure instead of internal DPRINTF
  * Enforce access size constraints and alignment in MemoryRegionOps

  hw/timer/aspeed_timer.c:
  * Refactor initialisation of and respect requested clock rates (APB/Ext=
ernal)
  * Simplify some index calculations

=3D=3D=3D

Andrew Jeffery (3):
  hw/timer: Add ASPEED AST2400 timer device model
  hw/intc: Add (new) ASPEED AST2400 AVIC device model
  hw/arm: Add ASPEED AST2400 machine type

 default-configs/arm-softmmu.mak |   2 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/ast2400.c                | 139 ++++++++++++++++++
 hw/intc/Makefile.objs           |   1 +
 hw/intc/aspeed_vic.c            | 256 +++++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   2 +
 hw/timer/aspeed_timer.c         | 308 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/intc/aspeed_vic.h    |  40 ++++++
 include/hw/timer/aspeed_timer.h |  55 +++++++
 trace-events                    |  22 +++
 10 files changed, 826 insertions(+)
 create mode 100644 hw/arm/ast2400.c
 create mode 100644 hw/intc/aspeed_vic.c
 create mode 100644 hw/timer/aspeed_timer.c
 create mode 100644 include/hw/intc/aspeed_vic.h
 create mode 100644 include/hw/timer/aspeed_timer.h

--=20
2.5.0
