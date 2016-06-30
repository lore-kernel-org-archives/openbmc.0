Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rgRsg5wcfzDrGS
 for <openbmc@lists.ozlabs.org>; Fri,  1 Jul 2016 03:50:47 +1000 (AEST)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1467309042766553.5762149069875;
 Thu, 30 Jun 2016 10:50:42 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Cc: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: [PATCH openbmc 5/6] Add independent recipes for skeleton applications
Date: Thu, 30 Jun 2016 12:50:32 -0500
Message-Id: <20160630175033.5212-6-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160630175033.5212-1-openbmc-patches@stwcx.xyz>
References: <20160630175033.5212-1-openbmc-patches@stwcx.xyz>
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
X-List-Received-Date: Thu, 30 Jun 2016 17:50:48 -0000

From: Brad Bishop <bradleyb@fuzziesquirrel.com>

This will enable more fine-grained control over what parts
of skeleton satisfy the different openbmc build requirements,
further enabling things like alternate implementations.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 .../obmc-phosphor-chassis/obmc-button-power.bb     |  7 ++++++
 .../obmc-phosphor-chassis/obmc-button-reset.bb     |  6 +++++
 .../obmc-phosphor-chassis/obmc-control-chassis.bb  | 14 +++++++++++
 .../obmc-phosphor-chassis/obmc-hostcheckstop.bb    |  8 +++++++
 .../obmc-phosphor-chassis/obmc-mgr-inventory.bb    | 18 +++++++++++++++
 .../obmc-phosphor-chassis/obmc-op-control-power.bb |  7 ++++++
 .../obmc-phosphor-chassis/obmc-pcie-detect.bb      |  7 ++++++
 .../obmc-phosphor-chassis/obmc-watchdog.bb         |  7 ++++++
 .../obmc-phosphor-devtools/obmc-pydevtools.bb      | 17 ++++++++++++++
 .../obmc-phosphor-fan/obmc-control-fan.bb          | 12 ++++++++++
 .../obmc-phosphor-flash/obmc-flash-bios.bb         |  9 ++++++++
 .../obmc-phosphor-flash/obmc-flash-bmc.bb          | 15 ++++++++++++
 .../obmc-phosphor-flash/obmc-mgr-download.bb       | 17 ++++++++++++++
 .../obmc-phosphor-flash/obmc-op-flasher.bb         | 11 +++++++++
 .../obmc-phosphor-host/obmc-op-control-host.bb     |  7 ++++++
 .../obmc-phosphor-led/obmc-control-led.bb          | 10 ++++++++
 .../obmc-phosphor-libobmc/obmc-libobmc-intf.bb     | 16 +++++++++++++
 .../obmc-phosphor-sensor/obmc-hwmon.bb             | 18 +++++++++++++++
 .../obmc-phosphor-sensor/obmc-mgr-sensor.bb        | 17 ++++++++++++++
 .../obmc-phosphor-sys/obmc-control-bmc.bb          |  8 +++++++
 .../obmc-phosphor-sys/obmc-mgr-state.bb            | 16 +++++++++++++
 .../obmc-phosphor-sys/obmc-mgr-system.bb           | 27 ++++++++++++++++++++++
 .../obmc-mgr-system/obmc-mgr-system.service        | 11 +++++++++
 23 files changed, 285 insertions(+)
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
 create mode 100644 meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-mgr-system/obmc-mgr-system.service

diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-button-power.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-button-power.bb
new file mode 100644
index 0000000..7adda51
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-button-power.bb
@@ -0,0 +1,7 @@
+SUMMARY = "OpenBMC org.openbmc.Button example implementation"
+DESCRIPTION = "A sample implementation for a button controlling a power domain."
+PR = "r1"
+
+inherit skeleton-gdbus
+
+SKELETON_DIR = "pwrbutton"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-button-reset.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-button-reset.bb
new file mode 100644
index 0000000..ba83a26
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-button-reset.bb
@@ -0,0 +1,6 @@
+SUMMARY = "OpenBMC org.openbmc.Button example implementation"
+DESCRIPTION = "A sample implementation for a reset button."
+PR = "r1"
+
+inherit skeleton-gdbus
+SKELETON_DIR = "rstbutton"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-control-chassis.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-control-chassis.bb
new file mode 100644
index 0000000..ca80715
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-control-chassis.bb
@@ -0,0 +1,14 @@
+SUMMARY = "OpenBMC org.openbmc.control.Chassis example implementation"
+DESCRIPTION = "An example implementation of the org.openbmc.control.Chassis DBUS API."
+PR = "r1"
+
+inherit skeleton-python
+
+RDEPENDS_${PN} += "\
+        python-dbus \
+        python-pygobject \
+        python-netclient \
+        pyphosphor \
+        "
+
+SKELETON_DIR = "pychassisctl"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-hostcheckstop.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-hostcheckstop.bb
new file mode 100644
index 0000000..d054694
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-hostcheckstop.bb
@@ -0,0 +1,8 @@
+SUMMARY = "OpenBMC checkstop monitor."
+DESCRIPTION = "The checkstop monitor watches a GPIO for a checkstop signal \
+and reboots a server."
+PR = "r1"
+
+inherit skeleton-gdbus
+
+SKELETON_DIR = "hostcheckstop"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-mgr-inventory.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-mgr-inventory.bb
new file mode 100644
index 0000000..8c1a309
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-mgr-inventory.bb
@@ -0,0 +1,18 @@
+SUMMARY = "OpenBMC inventory manager"
+DESCRIPTION = "OpenBMC inventory manager."
+PR = "r1"
+
+inherit skeleton-python
+
+VIRTUAL-RUNTIME_skeleton_workbook ?= ""
+
+RDEPENDS_${PN} += "\
+        python-dbus \
+        python-json \
+        python-pickle \
+        python-pygobject \
+        pyphosphor \
+        ${VIRTUAL-RUNTIME_skeleton_workbook} \
+        "
+
+SKELETON_DIR = "pyinventorymgr"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-op-control-power.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-op-control-power.bb
new file mode 100644
index 0000000..e724472
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-op-control-power.bb
@@ -0,0 +1,7 @@
+SUMMARY = "org.openbmc.control.Power implemention for OpenPOWER"
+DESCRIPTION = "A power control implementation suitable for OpenPOWER systems."
+PR = "r1"
+
+inherit skeleton-gdbus
+
+SKELETON_DIR = "op-pwrctl"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-pcie-detect.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-pcie-detect.bb
new file mode 100644
index 0000000..e134cf0
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-pcie-detect.bb
@@ -0,0 +1,7 @@
+SUMMARY = "OpenBMC PCIE slot detection utility"
+DESCRIPTION = "OpenBMC PCIE slot detection utility."
+PR = "r1"
+
+inherit skeleton-gdbus
+
+SKELETON_DIR = "pciedetect"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-watchdog.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-watchdog.bb
new file mode 100644
index 0000000..821b7f0
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-chassis/obmc-watchdog.bb
@@ -0,0 +1,7 @@
+SUMMARY = "OpenBMC org.openbmc.Watchdog example implementation"
+DESCRIPTION = "A sample implementation for the org.openbmc.Watchdog DBUS API."
+PR = "r1"
+
+inherit skeleton-gdbus
+
+SKELETON_DIR = "hostwatchdog"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-devtools/obmc-pydevtools.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-devtools/obmc-pydevtools.bb
new file mode 100644
index 0000000..296a399
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-devtools/obmc-pydevtools.bb
@@ -0,0 +1,17 @@
+SUMMARY = "OpenBMC python devtools"
+DESCRIPTION = "Shortcut scripts for developers."
+PR = "r1"
+
+inherit skeleton-python
+
+VIRTUAL-RUNTIME_skeleton_workbook ?= ""
+
+RDEPENDS_${PN} += "\
+        python-dbus \
+        python-json \
+        python-xml \
+        python-pygobject \
+        ${VIRTUAL-RUNTIME_skeleton_workbook} \
+	"
+
+SKELETON_DIR = "pytools"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-fan/obmc-control-fan.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-fan/obmc-control-fan.bb
new file mode 100644
index 0000000..a4bd005
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-fan/obmc-control-fan.bb
@@ -0,0 +1,12 @@
+SUMMARY = "OpenBMC fan control"
+DESCRIPTION = "OpenBMC fan control."
+PR = "r1"
+
+inherit skeleton-python
+
+RDEPENDS_${PN} += "\
+        python-dbus \
+        python-pygobject \
+        pyphosphor \
+        "
+SKELETON_DIR = "pyfanctl"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bios.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bios.bb
new file mode 100644
index 0000000..8f7b766
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bios.bb
@@ -0,0 +1,9 @@
+SUMMARY = "OpenBMC org.openbmc.Flash example implementation"
+DESCRIPTION = "A sample implementation for the org.openbmc.Flash DBUS API. \
+org.openbmc.Flash provides APIs for functions like BIOS flash access control \
+and updating."
+PR = "r1"
+
+inherit skeleton-gdbus
+
+SKELETON_DIR = "flashbios"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bmc.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bmc.bb
new file mode 100644
index 0000000..80bd1bf
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-flash-bmc.bb
@@ -0,0 +1,15 @@
+SUMMARY = "OpenBMC BMC update utility"
+DESCRIPTION = "OpenBMC BMC update utility."
+PR = "r1"
+
+inherit skeleton-python
+
+RDEPENDS_${PN} += "\
+        python-dbus \
+        python-compression \
+        python-shell \
+        python-pygobject \
+        pyphosphor \
+        "
+
+SKELETON_DIR = "pyflashbmc"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-mgr-download.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-mgr-download.bb
new file mode 100644
index 0000000..d3a5ecd
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-mgr-download.bb
@@ -0,0 +1,17 @@
+SUMMARY = "OpenBMC org.openbmc.managers.Download example implementation"
+DESCRIPTION = "An example implementation for the org.openbmc.managers.Download DBUS API."
+PR = "r1"
+
+inherit skeleton-python
+
+VIRTUAL-RUNTIME_skeleton_workbook ?= ""
+
+RDEPENDS_${PN} += "\
+        python-dbus \
+        python-pygobject \
+        python-subprocess \
+        pyphosphor \
+        ${VIRTUAL-RUNTIME_skeleton_workbook} \
+        "
+
+SKELETON_DIR = "pydownloadmgr"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-op-flasher.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-op-flasher.bb
new file mode 100644
index 0000000..9908500
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-flash/obmc-op-flasher.bb
@@ -0,0 +1,11 @@
+SUMMARY = "OpenPOWER flashing utility."
+DESCRIPTION = "A BMC/BIOS flashing utility for use on OpenPOWER system."
+PR = "r1"
+
+inherit skeleton-gdbus
+
+# DEPEND,RDEPEND on pflash if the openpower-pflash machine feature is set.
+PACKAGECONFIG ??= "${@bb.utils.contains('MACHINE_FEATURES', 'openpower-pflash', 'openpower-pflash', '', d)}"
+PACKAGECONFIG[openpower-pflash] = ",,pflash,pflash"
+
+SKELETON_DIR = "op-flasher"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-host/obmc-op-control-host.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-host/obmc-op-control-host.bb
new file mode 100644
index 0000000..b301101
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-host/obmc-op-control-host.bb
@@ -0,0 +1,7 @@
+SUMMARY = "org.openbmc.control.Host implementation for OpenPOWER"
+DESCRIPTION = "A host control implementation suitable for OpenPOWER systems."
+PR = "r1"
+
+inherit skeleton-gdbus
+
+SKELETON_DIR = "op-hostctl"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-led/obmc-control-led.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-led/obmc-control-led.bb
new file mode 100644
index 0000000..94fa7cb
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-led/obmc-control-led.bb
@@ -0,0 +1,10 @@
+SUMMARY = "OpenBMC org.openbmc.Led example implementation"
+DESCRIPTION = "A sample implementation for the org.openbmc.Led DBUS API. \
+The org.openbmc.Led provides APIs for controlling LEDs."
+PR = "r1"
+
+inherit skeleton-sdbus
+
+RDEPENDS_${PN} += "libsystemd"
+
+SKELETON_DIR = "ledctl"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-libobmc/obmc-libobmc-intf.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-libobmc/obmc-libobmc-intf.bb
new file mode 100644
index 0000000..a53deba
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-libobmc/obmc-libobmc-intf.bb
@@ -0,0 +1,16 @@
+SUMMARY = "OpenBMC gdbus library"
+DESCRIPTION = "libopenbmc_intf provides a set of gpio access \
+methods and the GDBUS skeleton code for the org.openbmc DBUS API."
+PR = "r1"
+
+inherit skeleton
+
+DEPENDS += "glib-2.0"
+
+SKELETON_DIR = "libopenbmc_intf"
+
+do_install() {
+        oe_runmake install DESTDIR=${D}
+}
+
+BBCLASSEXTEND = "nativesdk"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sensor/obmc-hwmon.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sensor/obmc-hwmon.bb
new file mode 100644
index 0000000..78442b8
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sensor/obmc-hwmon.bb
@@ -0,0 +1,18 @@
+SUMMARY = "OpenBMC hwmon poller"
+DESCRIPTION = "OpenBMC hwmon poller."
+PR = "r1"
+
+inherit skeleton-python
+
+VIRTUAL-RUNTIME_skeleton_workbook ?= ""
+
+RDEPENDS_${PN} += "\
+        python-dbus \
+        python-json \
+        python-shell \
+        python-pygobject \
+        pyphosphor \
+        ${VIRTUAL-RUNTIME_skeleton_workbook} \
+        "
+
+SKELETON_DIR = "pyhwmon"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sensor/obmc-mgr-sensor.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sensor/obmc-mgr-sensor.bb
new file mode 100644
index 0000000..ca90c43
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sensor/obmc-mgr-sensor.bb
@@ -0,0 +1,17 @@
+SUMMARY = "OpenBMC sensor manager"
+DESCRIPTION = "OpenBMC sensor manager."
+PR = "r1"
+
+inherit skeleton-python
+
+VIRTUAL-RUNTIME_skeleton_workbook ?= ""
+
+RDEPENDS_${PN} += "\
+        python-dbus \
+        python-json \
+        python-pygobject\
+        pyphosphor \
+        ${VIRTUAL-RUNTIME_skeleton_workbook} \
+        "
+
+SKELETON_DIR = "pysensormgr"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-control-bmc.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-control-bmc.bb
new file mode 100644
index 0000000..bfc3326
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-control-bmc.bb
@@ -0,0 +1,8 @@
+SUMMARY = "OpenBMC org.openbmc.control.Bmc example implementation"
+DESCRIPTION = "A sample implementation for the org.openbmc.control.Bmc DBUS API. \
+org.openbmc.control.Bmc provides APIs for functions like resetting the BMC."
+PR = "r1"
+
+inherit skeleton-gdbus
+
+SKELETON_DIR = "bmcctl"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-mgr-state.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-mgr-state.bb
new file mode 100644
index 0000000..125fd65
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-mgr-state.bb
@@ -0,0 +1,16 @@
+SUMMARY = "OpenBMC state manager"
+DESCRIPTION = "OpenBMC state manager."
+PR = "r1"
+
+inherit skeleton-python
+
+VIRTUAL-RUNTIME_skeleton_workbook ?= ""
+
+RDEPENDS_${PN} += "\
+        python-dbus \
+        python-json \
+        python-subprocess \
+        python-pygobject \
+        "
+
+SKELETON_DIR = "pystatemgr"
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-mgr-system.bb b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-mgr-system.bb
new file mode 100644
index 0000000..accd7da
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-mgr-system.bb
@@ -0,0 +1,27 @@
+SUMMARY = "OpenBMC system manager"
+DESCRIPTION = "OpenBMC system manager."
+PR = "r1"
+
+inherit skeleton-python
+inherit obmc-phosphor-systemd
+
+VIRTUAL-RUNTIME_skeleton_workbook ?= ""
+
+RDEPENDS_${PN} += "\
+        python-dbus \
+        python-json \
+        python-subprocess \
+        python-pygobject \
+        pyphosphor \
+        ${VIRTUAL-RUNTIME_skeleton_workbook} \
+        "
+
+SKELETON_DIR = "pysystemmgr"
+
+do_compile_append() {
+	oe_runmake -C ../hacks
+}
+
+do_install_append() {
+	oe_runmake -C ../hacks install DESTDIR=${D}
+}
diff --git a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-mgr-system/obmc-mgr-system.service b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-mgr-system/obmc-mgr-system.service
new file mode 100644
index 0000000..9cb04cf
--- /dev/null
+++ b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-sys/obmc-mgr-system/obmc-mgr-system.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=OpenBMC system manager
+Requires=obmc-mapper.service
+After=obmc-mapper.service
+
+[Service]
+Restart=always
+ExecStart=/usr/sbin/system_manager.py
+
+[Install]
+WantedBy=multi-user.target
-- 
2.9.0
