Return-Path: <cyrilbur@gmail.com>
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r0ckz5bMfzDqB3
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 11:29:15 +1000 (AEST)
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cyrilbur@gmail.com>;
 Thu, 5 May 2016 11:29:15 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 5 May 2016 11:29:13 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: cyrilbur@gmail.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id BC7BF2CE8046
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2016 11:29:09 +1000 (EST)
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u451T0VG721280
 for <openbmc@lists.ozlabs.org>; Thu, 5 May 2016 11:29:08 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u451SaNA026472
 for <openbmc@lists.ozlabs.org>; Thu, 5 May 2016 11:28:36 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u451SZgd025872; Thu, 5 May 2016 11:28:36 +1000
Received: from camb691.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EEFF6A023F;
 Thu,  5 May 2016 11:27:39 +1000 (AEST)
From: Cyril Bur <cyrilbur@gmail.com>
To: openbmc@lists.ozlabs.org
Cc: gwshan@linux.vnet.ibm.com
Subject: [PATCH 0/6] Firestone patches
Date: Thu,  5 May 2016 11:27:10 +1000
Message-Id: <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
X-Mailer: git-send-email 2.8.2
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16050501-0021-0000-0000-000009738F09
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
X-List-Received-Date: Thu, 05 May 2016 01:29:15 -0000

Did some work getting openbmc running on a Firestone. These should
also work for a Garrison, the firestone.dts is probably good for that
too.

Thanks very much to Gavin for getting networking going.

These patches are the outcome based on dev-4.4.

Cyril Bur (2):
  arm/dts: Set I2C_TEN_BIT_ADDRESS in Firestone BMC board i2c addresses
  arm/dts: Remove mac hardware checksum from Firestone BMC Board

Gavin Shan (1):
  net/phy: Expose 100base-T capability only

Joel Stanley (3):
  phy/broadcom: Add support for the BCM54210E
  arm/dts/aspeed: Move mac nsci properties
  arm/dts: Add Firestone BMC board

 arch/arm/boot/dts/aspeed-bmc-opp-barreleye.dts |   5 +
 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts | 136 +++++++++++++++++++++++++
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts  |   5 +
 arch/arm/boot/dts/ast2400.dtsi                 |   6 +-
 drivers/net/phy/broadcom.c                     |  13 +++
 include/linux/brcmphy.h                        |   2 +
 6 files changed, 165 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts

-- 
2.8.2
