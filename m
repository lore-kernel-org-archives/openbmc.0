Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgRsW50YvzDqtP
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 03:50:39 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 146730903472157.74747228035699;
 Thu, 30 Jun 2016 10:50:34 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 0/6] Skeleton recipe split
Date: Thu, 30 Jun 2016 12:50:27 -0500
Message-Id: <20160630175033.5212-1-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
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
X-List-Received-Date: Thu, 30 Jun 2016 17:50:40 -0000
X-List-Received-Date: Thu, 30 Jun 2016 17:50:40 -0000

This patchset splits the skeleton recipe into a number of smaller recipes - first step towards facilitating smaller granularity reuse of skeleton applications across platforms.

<!-- Reviewable:start -->
---
This change is [<img src="https://reviewable.io/review_button.svg" height="35" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/openbmc/openbmc/449)
<!-- Reviewable:end -->


https://github.com/openbmc/openbmc/pull/449

Brad Bishop (6):
  Fix invalid layer paths in non-removable
  Add mapper dependency to skeleton
  Add skeleton classes
  host-ipmi-hw-example: use skeleton class
  Add independent recipes for skeleton applications
  Switch to per-application skeleton recipes

 .../meta-firestone/conf/bblayers.conf.sample       | 10 ++--
 .../meta-garrison/conf/bblayers.conf.sample        | 10 ++--
 .../meta-palmetto/conf/bblayers.conf.sample        | 10 ++--
 .../meta-witherspoon/conf/bblayers.conf.sample     | 10 ++--
 .../meta-barreleye/conf/bblayers.conf.sample       | 10 ++--
 meta-phosphor/classes/skeleton-gdbus.bbclass       |  7 +++
 meta-phosphor/classes/skeleton-python.bbclass      |  5 ++
 meta-phosphor/classes/skeleton-sdbus.bbclass       |  7 +++
 meta-phosphor/classes/skeleton.bbclass             |  7 +++
 .../host-ipmid/host-ipmi-hw-example.bb             | 11 ++--
 .../obmc-phosphor-chassis/obmc-button-power.bb     |  7 +++
 .../obmc-phosphor-chassis/obmc-button-reset.bb     |  6 +++
 .../obmc-phosphor-chassis/obmc-control-chassis.bb  | 14 +++++
 .../obmc-phosphor-chassis/obmc-hostcheckstop.bb    |  8 +++
 .../obmc-phosphor-chassis/obmc-mgr-inventory.bb    | 18 +++++++
 .../obmc-phosphor-chassis/obmc-op-control-power.bb |  7 +++
 .../obmc-phosphor-chassis/obmc-pcie-detect.bb      |  7 +++
 .../obmc-phosphor-chassis/obmc-watchdog.bb         |  7 +++
 .../obmc-phosphor-devtools/obmc-pydevtools.bb      | 17 ++++++
 .../obmc-phosphor-fan/obmc-control-fan.bb          | 12 +++++
 .../obmc-phosphor-flash/obmc-flash-bios.bb         |  9 ++++
 .../obmc-phosphor-flash/obmc-flash-bmc.bb          | 15 ++++++
 .../obmc-phosphor-flash/obmc-mgr-download.bb       | 17 ++++++
 .../obmc-phosphor-flash/obmc-op-flasher.bb         | 11 ++++
 .../obmc-phosphor-host/obmc-op-control-host.bb     |  7 +++
 .../obmc-phosphor-led/obmc-control-led.bb          | 10 ++++
 .../obmc-phosphor-libobmc/obmc-libobmc-intf.bb     | 16 ++++++
 .../obmc-phosphor-sensor/obmc-hwmon.bb             | 18 +++++++
 .../obmc-phosphor-sensor/obmc-mgr-sensor.bb        | 17 ++++++
 .../obmc-phosphor-sys/obmc-control-bmc.bb          |  8 +++
 .../obmc-phosphor-sys/obmc-mgr-state.bb            | 16 ++++++
 .../obmc-phosphor-sys/obmc-mgr-system.bb           | 27 ++++++++++
 .../obmc-mgr-system/obmc-mgr-system.service}       |  5 +-
 .../common/recipes-phosphor/skeleton/skeleton.bb   | 61 +++++++++-------------
 34 files changed, 356 insertions(+), 71 deletions(-)
 create mode 100644 meta-phosphor/classes/skeleton-gdbus.bbclass
 create mode 100644 meta-phosphor/classes/skeleton-python.bbclass
 create mode 100644 meta-phosphor/classes/skeleton-sdbus.bbclass
 create mode 100644 meta-phosphor/classes/skeleton.bbclass
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-button-power.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-button-reset.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-control-chassis.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-hostcheckstop.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-mgr-inventory.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-op-control-power.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-pcie-detect.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-watchdog.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-devtools/obmc-pydevtools.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-fan/obmc-control-fan.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bios.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bmc.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-mgr-download.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-op-flasher.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-host/obmc-op-control-host.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-led/obmc-control-led.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-libobmc/obmc-libobmc-intf.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-sensor/obmc-hwmon.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-sensor/obmc-mgr-sensor.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-control-bmc.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-mgr-state.bb
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-mgr-system.bb
 rename meta-phosphor/common/recipes-phosphor/{skeleton/skeleton/skeleton.service => obmc-phosphor-sys/obmc-mgr-system/obmc-mgr-system.service} (54%)

-- 
2.9.0
