Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1C3BB1A06C1
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2015 06:20:02 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445368799601642.4306970099148;
 Tue, 20 Oct 2015 12:19:59 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 00/20] Adding IPMI Parser Library.
Date: Tue, 20 Oct 2015 14:19:38 -0500
Message-Id: <1445368798-31274-1-git-send-email-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.0
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
X-List-Received-Date: Tue, 20 Oct 2015 19:20:03 -0000

https://github.com/openbmc/openbmc/pull/25

Adriana Kobylak (1):
  Add skeleton recipe

Brad Bishop (18):
  Rename host-ipmid/files to host-ipmid/host-ipmid
  Remove S and SRC_URI from python daemon class
  Remove S and SRC_URI from c daemon class
  Start host-ipmid on boot
  Add PROVIDES to all provider classes
  Add host IPMI DBUS to hw provider class
  Add recipe for host IPMI DBUS to BT
  Add recipe for host IPMI DBUS to hw example
  Make host-ipmid pull in host IPMI to hw package
  Move palmetto configuration to openpower layer
  Add palmetto recipes-bsp description
  Add stubbed barreleye/foxconn layers
  Skeleton makefile updates for OE build
  Add skeleton to phosphor image
  Add recipe for https://github.com/msoulier/tftpy
  Remove tftpy from skeleton package
  Move host-ipmi-bt from palmetto to common include
  Bump skeleton revision

Hariharasubramanian R (1):
  Adding IPMI Parser Library.
