Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3ynddP0FnhzDrpt
 for <openbmc@lists.ozlabs.org>; Fri,  1 Dec 2017 00:33:12 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Message-ID: <1512048774.13581.85.camel@fuzziesquirrel.com>
Subject: Re: Create new platform for arm system
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Chen.KenYY" =?UTF-8?Q?=E9=99=B3=E6=B0=B8=E7=87=9F?= TAO
 <Chen.KenYY@inventec.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Date: Thu, 30 Nov 2017 08:32:54 -0500
In-Reply-To: <39E6480C5A587146BAA4D885C7BCF7EEC6AA69BA@IEC1-EX2010-MX4.iec.inventec>
References: <39E6480C5A587146BAA4D885C7BCF7EEC6AA69BA@IEC1-EX2010-MX4.iec.inventec>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Nov 2017 13:33:13 -0000

On Thu, 2017-11-09 at 05:53 +0000, Chen.KenYY =E9=99=B3=E6=B0=B8=E7=87=9F=
 TAO wrote:
> Hi all,
> =20
> I have a platform which is arm system.
> My customer want to update the platform code to openBMC.
> For now, the code structure as below.
> meta-arm/
> =E2=94=9C=E2=94=80=E2=94=80 common
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 recipes-phosphor
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 dbus
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 openpower-dbus-=
interfaces.bb
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 openpower-dbus-=
interfaces-mapper-config-native.bb
> =E2=94=82       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 phosphor-mapper=
-config-native%.bbappend
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 debug
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 openpower-debug=
-collector
> =E2=94=82       =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 ope=
npower-debug-collector-checkstop@.service
> =E2=94=82       =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 ope=
npower-debug-collector-watchdog@.service
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 openpower-debug=
-collector.bb
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 openpower-debug=
-collector-error-native.bb
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 openpower-debug=
-collector.inc
> =E2=94=82       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 phosphor-loggin=
g-error-logs-native.bbappend
> =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 ipmi
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 hostboot-invent=
ory-config
> =E2=94=82       =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 con=
fig.yaml
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 hostboot-invent=
ory-config-native.bb
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 openpower-ipmi-=
oem.bb
> =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 openpower-ipmi-=
oem-whitelist
> =E2=94=82       =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 ope=
npower-ipmi-oem-whitelist-native.conf
> =E2=94=82       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 openpower-ipmi-=
oem-whitelist-native.bb
> =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 packagegroups
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80 packagegroup-obmc-apps.=
bbappend
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80 packagegroup-obmc-ipmid=
-providers.bbappend
> =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80 packagegroup-obmc-phosp=
hor-debugtools.bbappend
> =E2=94=82           =E2=94=94=E2=94=80=E2=94=80 packagegroup-op-apps.bb
> =E2=94=9C=E2=94=80=E2=94=80 conf
> =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 layer.conf
> =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 machine
> =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 include
> =E2=94=82           =E2=94=94=E2=94=80=E2=94=80 arm.inc
> =E2=94=9C=E2=94=80=E2=94=80 COPYING.apache-2.0
> =E2=94=9C=E2=94=80=E2=94=80 COPYING.MIT
> =E2=94=9C=E2=94=80=E2=94=80 LICENSE
> =E2=94=94=E2=94=80=E2=94=80 meta-qualcomm
>     =E2=94=9C=E2=94=80=E2=94=80 conf
>     =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 layer.conf
>     =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 machine
>     =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 include
>     =E2=94=82           =E2=94=94=E2=94=80=E2=94=80 qualcomm.inc
>     =E2=94=9C=E2=94=80=E2=94=80 meta-2400-rep
>     =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 conf
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bblayers.conf.s=
ample
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 conf-notes.txt
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 layer.conf
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 local.conf.samp=
le
>     =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 machine
>     =E2=94=82   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 2400-rep.co=
nf
>     =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 recipes-bsp
>     =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 u-boot
>     =E2=94=82   =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 u-boot
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=
 0001-Centriq2400-REP-platform-board-initial-
> Ethernet-Phy-reset.patch
>     =E2=94=82   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 u-boot_%.bb=
append
>     =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 recipes-kernel
>     =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 linux
>     =E2=94=82   =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 linux-obmc
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 0001-2400REP-Add-GPIOC7-config-for-host-spi-
> rom-init.patch
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 0001-Add-driver-for-PCA9641-Arbitration.patch
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 0001-Driver-Add-DS1100-driver-for-PMBUS.patch
>    =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 =
0001-driver-add-IR38613-driver.patch
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 0001-Driver-Modify-fan-driver.patch
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 0001-Enabling-temp-monitoring-by-default-on-
> adm1278.patch
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 0001-Migrate-the-JTAG-driver-from-the-BSP-
> from-Aspeed.patch
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 0001-PMBUS-modify-pmbus.patch
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 0001-spi-add-aspeed-spi-generic-driver.patch
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 0001-spi-Add-centriq-2400-spi-hwmon-
> driver.patch
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 0002-driver-add-PXM1310-driver.patch
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 0002-PMBUS-modify-pmbus.patch
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 0003-thermal-sensor-NVT210.patch
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 2400rep.cfg
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80=
 aspeed-bmc-arm-2400-rep.dts
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=
 v3-0001-Add-SSIF-driver-for-I2C-slave-
> device.patch
>     =E2=94=82   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 linux-obmc_=
%.bbappend
>     =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 recipes-phosphor
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 bootmodeutil
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 boo=
tmodeutil.bb
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 fil=
es
>     =E2=94=82   =E2=94=82   =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80=
 BOOTMODEFILE
>     =E2=94=82   =E2=94=82   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80=
 bootmodeutil.c
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 chassis
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 ir3=
8163-workaround
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 ir38163_workaround.sh
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 ir-add@.service
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 ir-remove@.service
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 ir3=
8163-workaround.bb
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 console
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 obm=
c-console
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 obmc-console.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 obm=
c-console.bbappend
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 cpld
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 cpl=
d-fwupdate
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 ast-jtag.c
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 ast-jtag.h
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 lattice.c
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 lattice.h
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 main.c
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 cpl=
d-fwupdate.bb
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 cpl=
d-version
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 cpld-version.service
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 cpld_version.sh
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 cpl=
d-version.bb
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 gpioinit
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 fil=
es
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 gpioinit.c
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 gpioinit.service
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 gpi=
oinit.bb
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 ipmi
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 240=
0-rep-ipmi-inventory-map
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 config.yaml
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 240=
0-rep-ipmi-inventory-map-native.bb
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 ope=
npower-ipmi-oem
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 0001-Add-detection-of-broad-and-node-
> command.patch
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 0001-Add-Get-BMC-Vendor-ID-command.patch
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 0001-Add-Get-pcie-slot-status-command.patch
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 0001-Add-Send-Soc-MAC-from-host.patch
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 ope=
npower-ipmi-oem.bbappend
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pho=
sphor-ipmi-bt
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 0001-btbrigde-to-ssif-slave.patch
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 0001-Modify-btbridged-device-link.patch
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pho=
sphor-ipmi-bt.bbappend
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pho=
sphor-ipmi-fru-properties%
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 extra-properties.yaml
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pho=
sphor-ipmi-fru-properties%.bbappend
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pho=
sphor-ipmi-sensor-inventory%
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 config.yaml
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 pho=
sphor-ipmi-sensor-inventory%.bbappend
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 leds
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 240=
0-rep-led-manager-config
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 led.yaml
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 240=
0-rep-led-manager-config-native.bb
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 macsetup
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 fil=
es
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 macsetup.c
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 macsetup.service
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 mac=
setup.bb
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 qspitest
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 fil=
es
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 qspi_test.c
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 qspi_test.h
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 qsp=
itest.bb
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 sensors
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pho=
sphor-hwmon%
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 0001-phosphor-hwmon-fixed-open-system-file-
> timeout.patch
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 obmc
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82       =E2=94=94=E2=94=
=80=E2=94=80 hwmon
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82           =E2=94=94=E2=
=94=80=E2=94=80 ahb
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82               =E2=94=9C=
=E2=94=80=E2=94=80 1e631000.flash-controller
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82               =E2=94=82=
   =E2=94=94=E2=94=80=E2=94=80 spi2@0
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82               =E2=94=82=
       =E2=94=94=E2=94=80=E2=94=80 centriq2400-spi-hwmon@0.c
> onf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82               =E2=94=94=
=E2=94=80=E2=94=80 apb
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                   =E2=
=94=94=E2=94=80=E2=94=80 i2c@1e78a000
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=9C=E2=94=80=E2=94=80 i2c-bus@180
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 ir38163@12.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 ir38163@42.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 ir38163@44.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 ir38163@46.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 ir38163@48.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pxm1310@02.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 pxm1310@04.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=9C=E2=94=80=E2=94=80 i2c-bus@1c0
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 nvt210@4c.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 tmp421@1d.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 tmp421@1f.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 tmp421@4d.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 tmp421@4f.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=9C=E2=94=80=E2=94=80 i2c-bus@300
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 adm1278@10.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 adm1278@11.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=9C=E2=94=80=E2=94=80 i2c-bus@340
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 pca9641@70
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 i2c-arb
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80 adm1278@12.co
> nf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80 ds1100@58.con
> f
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80 max31790@20.c
> onf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82           =E2=94=9C=E2=94=80=E2=94=80 max31790@23.c
> onf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=82           =E2=94=94=E2=94=80=E2=94=80 tmp421@1d.con
> f
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
 =E2=94=94=E2=94=80=E2=94=80 i2c-bus@80
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
     =E2=94=9C=E2=94=80=E2=94=80 tmp421@1c.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
     =E2=94=9C=E2=94=80=E2=94=80 tmp421@1e.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
     =E2=94=9C=E2=94=80=E2=94=80 tmp421@2a.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82                      =
     =E2=94=94=E2=94=80=E2=94=80 tmp421@4e.conf
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 pho=
sphor-hwmon%.bbappend
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 settings
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 pho=
sphor-settings
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 powerpolicy-default-
> ALWAYS_POWER_ON.override.yml
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 timeowner-default-BOTH.override.yml
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 pho=
sphor-settings.bbappend
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 spitest
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 fil=
es
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 spitest.c
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 spi=
test.bb
>     =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 thermalutil
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 fil=
es
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 thermal_control.sh
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 thermal-start@.service
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=9C=E2=94=80=E2=
=94=80 thermal-stop@.service
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=
=94=80 thermalutil.c
>     =E2=94=82   =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 the=
rmalutil.bb
>     =E2=94=82   =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 workbook
>     =E2=94=82   =E2=94=82       =E2=94=9C=E2=94=80=E2=94=80 2400-rep-co=
nfig
>     =E2=94=82   =E2=94=82       =E2=94=82   =E2=94=94=E2=94=80=E2=94=80=
 2400-rep.py
>     =E2=94=82   =E2=94=82       =E2=94=94=E2=94=80=E2=94=80 2400-rep-co=
nfig.bb
>     =E2=94=82   =E2=94=94=E2=94=80=E2=94=80 recipes.txt
>     =E2=94=94=E2=94=80=E2=94=80 skeleton
>         =E2=94=94=E2=94=80=E2=94=80 skeleton.tar.gz
> =20
> Could anyone help to review this structure and tell me how to
> separate this code will be good to reviewer?
> As I know, the kernel patch should not in machine file.
> =20
> If any other question, please feel free to me. Thanks.
> =20
> Best Regards,
> Ken
> =20
> =20

Hi Ken

I was just curious if you had gotten enough feedback to get started.

Another data point could be the quanta-q711 or witherspoon machines.=20
If you have a look at the commit history (git log -p) and search for
these machines (start the search from the beginning of time and search
forward) these machines were added in a review-friendly way for the
most part.

To begin with, I'd focus more on adding a board layer that allows you
to build an image and boot to a shell, and tackle the arm-host aspects
(i.e. the userspace) of this system after that.  That piece might be
more involved given that this is the first arm system.

thx - brad
