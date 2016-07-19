Return-Path: <adamliyi@msn.com>
X-Greylist: delayed 311 seconds by postgrey-1.35 at bilbo;
 Tue, 19 Jul 2016 20:43:00 AEST
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=msn.com header.i=@msn.com header.b=oeo3s1JV; 
 dkim-atps=neutral
Received: from COL004-OMC4S10.hotmail.com (col004-omc4s10.hotmail.com
 [65.55.34.212])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rtxTK02c1zDqMf
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jul 2016 20:43:00 +1000 (AEST)
Received: from APC01-SG2-obe.outbound.protection.outlook.com ([65.55.34.200])
 by COL004-OMC4S10.hotmail.com over TLS secured channel with Microsoft
 SMTPSVC(7.5.7601.23008); Tue, 19 Jul 2016 03:37:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=msn.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=KC6TyPSO70G1nhxPTlyOg/DSjQvs0fVOeNBOlQLuufs=;
 b=oeo3s1JVJwm/jpqctpGN+aip//ol6mnCXdbH8V7sGb4DL1w9gmsQ8W9p5j89tO/1QpgaTEbANcFh7A0r/CveqFX7cHBQaWU7h2oueoIM8RZl2KwtCGwM288HZCDoS4m88G4QgbxOvVznwIPL1dV2GKo1l7uPYcJwjANePkVI2B4KPMDVp5KiXmWaObOdGs4/tfeX53plMxbDoNKNij+Hc+9Rlk6Yx6HlaeOuR/x9N/8Lq1Ea4zh4UHSRexSL+/Hxw2maLED274IqeUwgz/N62B5YXkinR0ljmlEPXjgJRQorlZXcZOFLAZf7GUU/13V002lCY1TCOTfNy8qjLH5PVg==
Received: from PU1APC01FT005.eop-APC01.prod.protection.outlook.com
 (10.152.252.60) by PU1APC01HT064.eop-APC01.prod.protection.outlook.com
 (10.152.253.16) with Microsoft SMTP Server (TLS) id 15.1.523.9; Tue, 19 Jul
 2016 10:37:44 +0000
Received: from PS1PR02MB1546.apcprd02.prod.outlook.com (10.152.252.51) by
 PU1APC01FT005.mail.protection.outlook.com (10.152.252.116) with Microsoft
 SMTP Server (TLS) id 15.1.523.9 via Frontend Transport; Tue, 19 Jul 2016
 10:37:42 +0000
Received: from PS1PR02MB1546.apcprd02.prod.outlook.com ([10.167.48.12]) by
 PS1PR02MB1546.apcprd02.prod.outlook.com ([10.167.48.12]) with mapi id
 15.01.0549.003; Tue, 19 Jul 2016 10:37:42 +0000
From: Yi Li <adamliyi@msn.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: [PATCH]: Add raspberrypi as OpenBMC platform
Thread-Topic: [PATCH]: Add raspberrypi as OpenBMC platform
Thread-Index: AQHR4amUF47g9A4u2UypBwBZbW0A1Q==
Date: Tue, 19 Jul 2016 10:37:42 +0000
Message-ID: <PS1PR02MB1546EF99F61B31954506F3A0D9370@PS1PR02MB1546.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=softfail (sender IP is 25.152.252.51)
 smtp.mailfrom=msn.com; lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=fail action=none header.from=msn.com;
received-spf: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 25.152.252.51 as permitted sender)
x-ms-exchange-messagesentrepresentingtype: 1
x-eopattributedmessage: 0
x-forefront-antispam-report: CIP:25.152.252.51; IPV:NLI; CTRY:GB; EFV:NLI;
 SFV:NSPM; SFS:(10019020)(98900003); DIR:OUT; SFP:1102; SCL:1;
 SRVR:PU1APC01HT064; H:PS1PR02MB1546.apcprd02.prod.outlook.com; FPR:; SPF:None;
 CAT:NONE; LANG:en; CAT:NONE; 
x-microsoft-exchange-diagnostics: 1; PU1APC01HT064;
 6:lBVYJ/mctc7PUz8gHCAgufqLpOAyouuAsbBVqtZbBK1s3wdCtlslWqN8hH9rku0XicL8cLDfhovw9Kyr24TBvVZIAJOMinoshsVLNyTtoqLs5a4sxKvAqrfBWg/wmpDDLFqM7cvJZL75jb11f78qVMizsQqecoDzwidDC50zeiGL9DBM+ruIFa6SeSAFlW4G1L/BLy1dwbGoiXInQ/wt8VhOgu3NcprdaboGSI5zrjdHtryRijUwjTLtTkIY/pYqdMHQKZ73+qsXWePxHP2WTZ53yAhFjfxaasreZhvZEQ9hhWEWcfWT8LDU3Pse+/dKpWRkucWR5kModFSX8MKTlA==;
 5:i8IG4S2AICuv9gukJp30iK3MnQdl4yTlUBocFK5VyETECkybt2Gge1Zaio4syCOXXXKiYNnmDWNwfjibf8AZb0WXynmvKmhxwhkAUsWV2pfD8A1zpFxhtZerBAiF571K64qHJUESvDf+/ETTPNLD7g==;
 24:Xgq3Hckp6K5w15PYnjaKw0jvVOIYKGEjHjjPTxH3nG3eS+lrNJf7mzDa6H4uI/22hGhbnfeiV1CTFQS1d2M6lvdy2H7F/WgbbN32eMcmjrA=;
 7:RC7U60GZOD38mc/0BvVxuhkNs3MAqLyiqSzr6prxXhHcT0gEfmy8SMN7btz3cUPym+9MJuuc6QpK81G9hNLpdmU0GlAK06OsCKEvsyqYfT+l2VDC3hQZDEhUCISE2SCYvlBt8mfqaqGD2ECWzUdjsu3QErMH76GvY0pVVop1hv2zyv9pou2xbtYHsCY/E6G1vb3BudoJirAxrKVzHVI7ednyNFwi5qSSIZRZX9DJeNTx5v2QmWKyNi9aSGjwhyj4
x-ms-office365-filtering-correlation-id: f4716977-cbb2-41fd-bd18-08d3afc0b5a6
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
 RULEID:(1601124038)(5061506196)(5061507196)(1603103041)(1603101184)(1601125047);
 SRVR:PU1APC01HT064; 
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0; RULEID:(432015012)(82015046);
 SRVR:PU1APC01HT064; BCL:0; PCL:0; RULEID:; SRVR:PU1APC01HT064; 
x-forefront-prvs: 000800954F
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C8A71505D8AC2A41B3565379F0A3C297@apcprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2016 10:37:42.6614 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT064
X-OriginalArrivalTime: 19 Jul 2016 10:37:45.0488 (UTC)
 FILETIME=[96205900:01D1E1A9]
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
X-List-Received-Date: Tue, 19 Jul 2016 10:43:02 -0000

Hi,

I created an initial patch to Add raspberrypi as OpenBMC platform for revie=
w.
I can build obmc images, but I don't have a raspberrypi HW to boot and test=
.
So this patch does not include the full meta-raspberrypi layer.
There is a README included for testing.

Please have a look and if this patch can be tested on HW I will submit a fo=
rmal patch.

Thanks,
-Yi

Signed-off-by: Yi Li <adamliyi@msn.com>

diff --git a/README_raspberrypi_obmc.txt b/README_raspberrypi_obmc.txt
new file mode 100644
index 0000000..45b0cbc
--- /dev/null
+++ b/README_raspberrypi_obmc.txt
@@ -0,0 +1,16 @@
+1. Under openbmc directory, checkout meta-raspberrrypi layer:
+# git://git.yoctoproject.org/meta-raspberrypi
+
+2. Apply meta-raspberrypi_obmc.patch
+# cd meta-raspberrypi/conf
+# patch < meta-raspberrypi_obmc.patch
+
+3. Build obmc:
+# rm -fr build/conf
+# export TEMPLATECONF=3Dmeta-raspberrypi/conf
+#  . oe-init-build-env
+# bitbake obmc-phosphor-image
+
+4. Remaining issues:
+a. No raspberrypi HW, so image not tested
+b. u-boot-fw-utils build failed. Removed the package.=20
diff --git a/conf/bblayers.conf.sample b/conf/bblayers.conf.sample
new file mode 100644
index 0000000..f3c8f37
--- /dev/null
+++ b/conf/bblayers.conf.sample
@@ -0,0 +1,18 @@
+# LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
+# changes incompatibly
+LCONF_VERSION =3D "6"
+
+BBPATH =3D "${TOPDIR}"
+BBFILES ?=3D ""
+
+BBLAYERS ?=3D " \
+  ##OEROOT##/meta \
+  ##OEROOT##/meta-yocto \
+  ##OEROOT##/meta-phosphor \
+  ##OEROOT##/meta-raspberrypi \
+  "
+BBLAYERS_NON_REMOVABLE ?=3D " \
+  ##OEROOT##/meta \
+  ##OEROOT##/meta-yocto \
+  ##OEROOT##/meta-raspberrypi \
+  "
diff --git a/conf/conf-notes.txt b/conf/conf-notes.txt
new file mode 100644
index 0000000..9b3c01a
--- /dev/null
+++ b/conf/conf-notes.txt
@@ -0,0 +1,2 @@
+Common targets are:
+     obmc-phosphor-image
diff --git a/conf/local.conf.sample b/conf/local.conf.sample
new file mode 100644
index 0000000..8c767ab
--- /dev/null
+++ b/conf/local.conf.sample
@@ -0,0 +1,27 @@
+MACHINE ??=3D "raspberrypi"
+DISTRO ?=3D "openbmc-phosphor"
+PACKAGE_CLASSES ?=3D "package_rpm"
+SANITY_TESTED_DISTROS_append ?=3D " *"
+EXTRA_IMAGE_FEATURES =3D "debug-tweaks"
+USER_CLASSES ?=3D "buildstats image-mklibs image-prelink"
+PATCHRESOLVE =3D "noop"
+BB_DISKMON_DIRS =3D "\
+    STOPTASKS,${TMPDIR},1G,100K \
+    STOPTASKS,${DL_DIR},1G,100K \
+    STOPTASKS,${SSTATE_DIR},1G,100K \
+    STOPTASKS,/tmp,100M,100K \
+    ABORT,${TMPDIR},100M,1K \
+    ABORT,${DL_DIR},100M,1K \
+    ABORT,${SSTATE_DIR},100M,1K \
+    ABORT,/tmp,10M,1K"
+CONF_VERSION =3D "1"
+INHERIT +=3D "extrausers"
+EXTRA_USERS_PARAMS =3D " \
+  usermod -p '\$1\$UGMqyqdG\$FZiylVFmRRfl9Z0Ue8G7e/' root; \
+  "
+PREFERRED_PROVIDER_u-boot ?=3D "u-boot-rpi_git"
+UBOOT_SUFFIX_raspberrypi =3D "img"
+OBMC_IMAGE_EXTRA_INSTALL_remove_raspberrypi =3D "u-boot-fw-utils"
+
+require conf/machine/include/obmc-bsp-common.inc
+require conf/machine/include/sample.inc
