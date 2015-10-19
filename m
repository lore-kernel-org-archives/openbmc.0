Return-Path: <patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D01061A08A3
 for <openbmc@lists.ozlabs.org>; Mon, 19 Oct 2015 23:56:50 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1445259406548761.3665637245005;
 Mon, 19 Oct 2015 05:56:46 -0700 (PDT)
From: OpenBMC Patches <patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/9] Add IPMI to build
Date: Mon, 19 Oct 2015 07:56:36 -0500
Message-Id: <1445259405-10312-1-git-send-email-patches@stwcx.xyz>
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
X-List-Received-Date: Mon, 19 Oct 2015 12:56:52 -0000

https://github.com/openbmc/openbmc/pull/21

Brad Bishop (9):
  Rename host-ipmid/files to host-ipmid/host-ipmid
  Remove S and SRC_URI from python daemon class
  Remove S and SRC_URI from c daemon class
  Start host-ipmid on boot
  Add PROVIDES to all provider classes
  Add host IPMI DBUS to hw provider class
  Add recipe for host IPMI DBUS to BT
  Add recipe for host IPMI DBUS to hw example
  Make host-ipmid pull in host IPMI to hw package

 .../meta-ibm/meta-palmetto/conf/machine/palmetto.conf  |  2 ++
 meta-phosphor/classes/obmc-phosphor-c-daemon.bbclass   | 10 ++++------
 .../classes/obmc-phosphor-chassis-mgmt.bbclass         |  1 +
 meta-phosphor/classes/obmc-phosphor-event-mgmt.bbclass |  1 +
 meta-phosphor/classes/obmc-phosphor-fan-mgmt.bbclass   |  1 +
 meta-phosphor/classes/obmc-phosphor-flash-mgmt.bbclass |  1 +
 .../classes/obmc-phosphor-host-ipmi-hw.bbclass         |  4 ++++
 .../classes/obmc-phosphor-policy-mgmt.bbclass          |  1 +
 meta-phosphor/classes/obmc-phosphor-py-daemon.bbclass  |  8 +++-----
 .../classes/obmc-phosphor-sensor-mgmt.bbclass          |  1 +
 .../classes/obmc-phosphor-system-mgmt.bbclass          |  1 +
 .../host-ipmid/files/host-ipmid.service                |  8 --------
 .../common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb | 17 +++++++++++++++++
 .../host-ipmid/host-ipmi-bt/host-ipmi-bt.service       |  8 ++++++++
 .../host-ipmid/host-ipmi-hw-example.bb                 | 18 ++++++++++++++++++
 .../host-ipmi-hw-example/host-ipmi-hw-example.service  |  8 ++++++++
 .../host-ipmid/host-ipmi-hw-example/systembus.patch    | 11 +++++++++++
 .../common/recipes-phosphor/host-ipmid/host-ipmid.bb   |  7 ++++---
 .../host-ipmid/host-ipmid/host-ipmid.service           |  8 ++++++++
 .../obmc-phosphor-chassis/obmc-phosphor-chassisd.bb    |  3 +++
 .../obmc-phosphor-event/obmc-phosphor-eventd.bb        |  3 +++
 .../obmc-phosphor-example-pydbus.bb                    |  4 +++-
 .../obmc-phosphor-example-sdbus.bb                     |  4 ++++
 .../obmc-phosphor-fan/obmc-phosphor-fand.bb            |  5 +++++
 .../obmc-phosphor-flash/obmc-phosphor-flashd.bb        |  3 +++
 .../obmc-phosphor-policy/obmc-phosphor-policyd.bb      |  3 +++
 .../obmc-phosphor-sensor/obmc-phosphor-sensord.bb      |  3 +++
 .../obmc-phosphor-sys/obmc-phosphor-sysd.bb            |  3 +++
 meta-phosphor/conf/machine/include/sample.inc          |  2 ++
 29 files changed, 126 insertions(+), 23 deletions(-)
 create mode 100644 meta-phosphor/classes/obmc-phosphor-host-ipmi-hw.bbclass
 delete mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/files/host-ipmid.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-bt/host-ipmi-bt.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/host-ipmi-hw-example.service
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmi-hw-example/systembus.patch
 create mode 100644 meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid/host-ipmid.service

-- 
2.6.0
