Return-Path: <andrew@aj.id.au>
Received: from homiemail-a20.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 3qPwp204FTzDq5f
 for <openbmc@lists.ozlabs.org>; Wed, 16 Mar 2016 13:45:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=WtQ8wlu+; 
 dkim-atps=neutral
Received: from homiemail-a20.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTP id 9E4AA7EC063;
 Tue, 15 Mar 2016 19:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=from:to:cc
 :subject:date:message-id:mime-version:content-type:
 content-transfer-encoding; s=aj.id.au; bh=of0fAeR5lTehgrkRkuhdFG
 nA7Oc=; b=WtQ8wlu+YFQ3IKdgCMS+n+Di30ycggT7MB2ifqkGZzpr/IGSzKACnI
 dANmCyZAUf7jHCHfbhZESeR2szV8hDdfnSQu9D5Z4ukhDohbS3BtHH8x/8+5Y2fQ
 pIqgvHuqK9UVvj70xMrhdItLsYmlRR6w2CrXUUNuc6lFfxx8KL+04=
Received: from keelia.au.ibm.com (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a20.g.dreamhost.com (Postfix) with ESMTPSA id D17D17EC061;
 Tue, 15 Mar 2016 19:45:26 -0700 (PDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Jeremy Kerr <jk@ozlabs.org>,
 Dmitry Osipenko <digetx@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: [PATCH v5 0/4] Add ASPEED AST2400 SoC and Palmetto BMC machine
Date: Wed, 16 Mar 2016 13:15:13 +1030
Message-Id: <1458096317-25223-1-git-send-email-andrew@aj.id.au>
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
X-List-Received-Date: Wed, 16 Mar 2016 02:45:31 -0000

This patch series models enough of the ASPEED AST2400 ARM9 SoC[0] to boot=
 an
aspeed_defconfig Linux kernel[1][2]. Specifically, the series implements =
the
ASPEED timer and VIC devices, integrates them into an AST2400 SoC and exp=
oses
it all through a new palmetto-bmc machine. The device model patches only
partially implement the hardware features of the timer and VIC, again mos=
tly
just enough to boot Linux.

Unfortunately the datasheet describing the devices is not generally avail=
able,
but I'll try to add comments to any unclear areas.

The addition of the AST2400 to QEMU is motivated by use of the SoC as a B=
MC in
OpenPOWER[2][3] machines and the ongoing development of OpenBMC[4]. The
presence of a machine model utilising the AST2400 will help with developm=
ent
and testing of the OpenBMC stack.

Cheers,

Andrew

[0] http://www.aspeedtech.com/products.php?fPath=3D20&rId=3D376
[1] https://github.com/openbmc/linux/tree/dev-4.3
[2] git fetch git@github.com:openbmc/linux.git dev-4.3
[3] http://openpowerfoundation.org/
[4] https://github.com/open-power/
[5] https://github.com/openbmc/openbmc

Changes since v4:

  * Switch approach to modelling a specific machine type (palmetto-bmc)
    rather than something generic that may have no corresponding hardware
    implementation
  * Address review comments from Jeremy Kerr, C=C3=A9dric Le Goater, Dmit=
ry Osipenko

Changes since v3:

  Address comments from Peter Maydell, splitting the machine model from
  hw/arm/ast2400.c into hw/arm/opbmc2400.c amongst other minor cleanups t=
o the
  timer and VIC.

Changes since v2:

  This re-roll is a reasonable rework of the patches in the series, which=
 may
  make it difficult to compare v1 to v2.

  Addressed reviews/comments from:
  * Peter Maydell
  * Alexey Kardashevskiy
  * Joel Stanley

Changes since v1:

  Addressed reviews/comments from:
  * C=C3=A9dric Le Goater

Andrew Jeffery (4):
  hw/timer: Add ASPEED timer device model
  hw/intc: Add (new) ASPEED VIC device model
  hw/arm: Add ASPEED AST2400 SoC model
  hw/arm: Add palmetto-bmc machine

 default-configs/arm-softmmu.mak |   1 +
 hw/arm/Makefile.objs            |   1 +
 hw/arm/ast2400.c                | 137 ++++++++++++
 hw/arm/palmetto-bmc.c           |  65 ++++++
 hw/intc/Makefile.objs           |   1 +
 hw/intc/aspeed_vic.c            | 339 ++++++++++++++++++++++++++++++
 hw/timer/Makefile.objs          |   1 +
 hw/timer/aspeed_timer.c         | 449 ++++++++++++++++++++++++++++++++++=
++++++
 include/hw/arm/ast2400.h        |  35 ++++
 include/hw/intc/aspeed_vic.h    |  48 +++++
 include/hw/timer/aspeed_timer.h |  59 ++++++
 trace-events                    |  16 ++
 12 files changed, 1152 insertions(+)
 create mode 100644 hw/arm/ast2400.c
 create mode 100644 hw/arm/palmetto-bmc.c
 create mode 100644 hw/intc/aspeed_vic.c
 create mode 100644 hw/timer/aspeed_timer.c
 create mode 100644 include/hw/arm/ast2400.h
 create mode 100644 include/hw/intc/aspeed_vic.h
 create mode 100644 include/hw/timer/aspeed_timer.h

--=20
2.5.0
