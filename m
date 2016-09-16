Return-Path: <tpearson@raptorengineering.com>
Received: from mail.rptsys.com (mail.rptsys.com [192.119.205.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbRqx6RVGzDsdn
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 06:35:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=raptorengineering.com header.i=@raptorengineering.com
 header.b=IWiwwqoM; dkim-atps=neutral
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 44ECB641142
 for <openbmc@lists.ozlabs.org>; Fri, 16 Sep 2016 15:35:36 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vgsU-wtVleDT; Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C25D46410A3;
 Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.9.2 mail.rptsys.com C25D46410A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
 t=1474058134; bh=ZGhGYlMxZk/XyA9trepHAve6W0Q/keAjMDg0TcOROR8=;
 h=From:To:Subject:Date:Message-Id;
 b=IWiwwqoMDP3lCDLGaW3/tH9S7DsufRdJ8/G5YsTUD26GBsHG5wgfPPiDhDW0EsvGF
 53rvmtBYuljaqvklNjt4gH9LXTw34BFkYhufgTUDhLpgGufT48ovxdYTdD0JhUjccW
 IB30ppuryt8va9L3SvFsMIpttBwRKYG04Hil29T4=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 2JJYtgUboBaf; Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
Received: from apollo.starlink.edu (apollo.starlink.edu [192.168.3.54])
 by mail.rptsys.com (Postfix) with ESMTP id 98C0A6404A3;
 Fri, 16 Sep 2016 15:35:34 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH 00/17] Fix Firestone IPL failure
Date: Fri, 16 Sep 2016 15:35:16 -0500
Message-Id: <1474058133-27363-1-git-send-email-tpearson@raptorengineering.com>
X-Mailer: git-send-email 1.7.9.5
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
X-List-Received-Date: Fri, 16 Sep 2016 20:35:42 -0000

This patch series fixes the Firestone IPL failure.
This is v2 of the patch series sent previously.
It includes the following changes:
 * Remove the unneccessary direct setup of the SCU pinmux.
 * Connect the host serial console to SUART1 instead of the VUART.
   This matches the stock configuration of Firestone, where a
   serial cable can be directly attached to the back of the machine
   for hostboot access.
 * Add commit messages and Signed-Off-By lines that were inadvertently
   overlooked in the first series.

Cyril Bur (1):
  arm/dts: Remove mac hardware checksum from Firestone BMC Board

Gavin Shan (1):
  net/phy: Expose 100base-T capability only

Joel Stanley (1):
  phy/broadcom: Add support for the BCM54210E

Timothy Pearson (14):
  Ensure that the old style MDIO interface is active before registering
        the MDIO bus on Faraday style MACs.  Without this patch the
    hardware     may continue to expect new style commands, yielding
    MDIO timeouts     and general lack of communication with the MII.
  Allow no-hw-checksum override in devicetree outside of NCSI mode.
  mach-aspeed: Add missing Firestone setup method and call
  pinctrl-aspeed-g4: Add definition for GPIO pins J2 and O2
  pinctrl-aspeed-g4: Add missing MDIO1 pingroup
  Add missing LEDs to Firestone DT
  Add missing console UART to Firestone DT
  Add missing UARTs to Firestone DT
  Fix Turismo I2C OCC mapping on Firestone
  Enable I2C hub and connected devices in Firestone DT
  Enable RGMII pin functions in Firestone DT
  Enable vuart in Firestone DT
  Add LED expander mapping to Firestone DT
  Enable FSI buffer on Firestone

 arch/arm/boot/dts/aspeed-bmc-opp-firestone.dts |  134 +++++++++++++++++++++++-
 arch/arm/boot/dts/aspeed-g4.dtsi               |    5 +
 arch/arm/mach-aspeed/aspeed.c                  |   14 +++
 drivers/net/ethernet/faraday/ftgmac100.c       |    9 +-
 drivers/net/ethernet/faraday/ftgmac100.h       |    2 +
 drivers/net/phy/broadcom.c                     |   13 +++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c     |   15 ++-
 include/linux/brcmphy.h                        |    2 +
 8 files changed, 185 insertions(+), 9 deletions(-)

-- 
1.7.9.5
