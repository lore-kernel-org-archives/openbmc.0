Return-Path: <clg@kaod.org>
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r8S3R63tRzDq5f
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2016 05:25:39 +1000 (AEST)
Received: from localhost
 by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <clg@kaod.org>;
 Tue, 17 May 2016 20:25:35 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
 by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 17 May 2016 20:25:17 +0100
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: clg@kaod.org
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id B9DC21B0804B
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 20:26:12 +0100 (BST)
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com
 [9.149.37.249])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4HJPGIj3342668
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 19:25:16 GMT
Received: from d06av08.portsmouth.uk.ibm.com (localhost [127.0.0.1])
 by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4HJPGm5017142
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2016 13:25:16 -0600
Received: from smtp.lab.toulouse-stg.fr.ibm.com
 (srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
 by d06av08.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4HJPFXt017134; Tue, 17 May 2016 13:25:16 -0600
Received: from hermes.ibm.com (icon-9-164-165-196.megacenter.de.ibm.com
 [9.164.165.196])
 by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 1DFD4220447;
 Tue, 17 May 2016 21:25:15 +0200 (CEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu 0/3] add i2c support 
Date: Tue, 17 May 2016 21:24:59 +0200
Message-Id: <1463513102-14135-1-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16051719-0009-0000-0000-0000181C0A26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Mailman-Approved-At: Wed, 18 May 2016 23:12:54 +1000
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
X-List-Received-Date: Tue, 17 May 2016 19:25:40 -0000

This serie adds an ASPEED I2C crontroller device model to qemu and a
couple of I2C slaves. The device are a little different from the real
hardware so you will have to recompile the palmetto dtb with the right
models.

Patches are also available here :

	https://github.com/legoater/qemu/commits/aspeed

Based on 'aspeed-integration' of https://github.com/amboar/qemu

Thanks,

Cédric Le Goater (3):
  i2c: add aspeed i2c crontroller
  ast2400: add a rtc device on I2C bus 0
  ast2400: add a temp sensor device on I2C bus 3

 hw/arm/ast2400.c            |  21 +++
 hw/i2c/Makefile.objs        |   1 +
 hw/i2c/aspeed_i2c.c         | 448 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/arm/ast2400.h    |   2 +
 include/hw/i2c/aspeed_i2c.h |  62 ++++++
 5 files changed, 534 insertions(+)
 create mode 100644 hw/i2c/aspeed_i2c.c
 create mode 100644 include/hw/i2c/aspeed_i2c.h

-- 
2.1.4
