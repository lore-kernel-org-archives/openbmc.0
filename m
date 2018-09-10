Return-Path: <a.filippov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="AHu7NW5R"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 427zBt194zzF346
 for <openbmc@lists.ozlabs.org>; Mon, 10 Sep 2018 16:48:05 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id BEEAC41900;
 Mon, 10 Sep 2018 06:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:mime-version:x-mailer:message-id:date
 :date:subject:subject:from:from:received:received:received; s=
 mta-01; t=1536562079; x=1538376480; bh=UrzeZgBL1ShCIOAYHk+utC98j
 jB5Astp4NwU2Pd0nkw=; b=AHu7NW5RoQdjVjsOaceUxuw+TwPgV057zgvmfq78Y
 YVW/tgy3jS/LvA1YuGR3UuqU/1Ydxni+iDMYHkpXKXW9LWThgUJbP3N5E1FkVpmt
 3CnsfO0hYWIUvc2KqGlTianuwQOz0eWTuLmIqVIR+9cG06O4xzkKnPV0eap9KSXm
 RE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShDnRcnKpYSj; Mon, 10 Sep 2018 09:47:59 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 5B550411FB;
 Mon, 10 Sep 2018 09:47:59 +0300 (MSK)
Received: from bbwork.com (172.17.15.155) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 10
 Sep 2018 09:47:58 +0300
From: Alexander Filippov <a.filippov@yadro.com>
To: <openembedded-devel@lists.openembedded.org>, Joe MacDonald
 <joe_macdonald@mentor.com>
CC: <openbmc@lists.ozlabs.org>, Alexander Filippov <a.filippov@yadro.com>
Subject: [meta-networking][PATCH] split net-snmp-libs into smaller packages
Date: Mon, 10 Sep 2018 09:47:35 +0300
Message-ID: <20180910064735.12760-1-a.filippov@yadro.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.17.15.155]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Sep 2018 06:48:07 -0000

By default `net-snmp-libs` contains all compiled libs.
This commit splits `net-snmp-libs` into subpackages for each library.

This allows for smaller resulting image due to finer packaging.

Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
---
 .../recipes-protocols/net-snmp/net-snmp_5.8.bb     | 23 ++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 779e5cd2d..a32d09d77 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -168,17 +168,21 @@ net_snmp_sysroot_preprocess () {
     fi
 }
 
-PACKAGES += "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd"
+PACKAGES += "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client \
+             ${PN}-server-snmpd ${PN}-server-snmptrapd \
+             ${PN}-lib-netsnmp ${PN}-lib-agent ${PN}-lib-helpers \
+             ${PN}-lib-mibs ${PN}-lib-trapd"
 
 # perl module
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'perl', '${PN}-perl-modules', '', d)}"
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-server = "1"
+ALLOW_EMPTY_${PN}-libs = "1"
 
 FILES_${PN}-perl-modules = "${libdir}/perl/*"
 
-FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-libs = ""
 FILES_${PN}-mibs = "${datadir}/snmp/mibs"
 FILES_${PN}-server-snmpd = "${sbindir}/snmpd \
                             ${sysconfdir}/snmp/snmpd.conf \
@@ -191,6 +195,12 @@ FILES_${PN}-server-snmptrapd = "${sbindir}/snmptrapd \
                                 ${systemd_unitdir}/system/snmptrapd.service \
 "
 
+FILES_${PN}-lib-netsnmp = "${libdir}/libnetsnmp${SOLIBS}"
+FILES_${PN}-lib-agent = "${libdir}/libnetsnmpagent${SOLIBS}"
+FILES_${PN}-lib-helpers = "${libdir}/libnetsnmphelpers${SOLIBS}"
+FILES_${PN}-lib-mibs = "${libdir}/libnetsnmpmibs${SOLIBS}"
+FILES_${PN}-lib-trapd = "${libdir}/libnetsnmptrapd${SOLIBS}"
+
 FILES_${PN} = ""
 FILES_${PN}-client = "${bindir}/* ${datadir}/snmp/"
 FILES_${PN}-dbg += "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.debug/"
@@ -214,10 +224,15 @@ SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
 RDEPENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'net-snmp-perl-modules', '', d)}"
 RDEPENDS_${PN} += "net-snmp-client"
 RDEPENDS_${PN}-server-snmpd += "net-snmp-mibs"
-RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd"
+RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd ${PN}-lib-trapd"
 RDEPENDS_${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
 RDEPENDS_${PN}-client += "net-snmp-mibs net-snmp-libs"
-RDEPENDS_${PN}-libs += "libpci"
+RDEPENDS_${PN}-libs += "libpci \
+                        ${PN}-lib-netsnmp \
+                        ${PN}-lib-agent \
+                        ${PN}-lib-helpers \
+                        ${PN}-lib-mibs \
+"
 RDEPENDS_${PN}-ptest += "perl \
                          perl-module-test \
                          perl-module-file-basename \
-- 
2.14.4
