Return-Path: <a.filippov@yadro.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="W1Knai1A"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4257wJ2tX0zF374
 for <openbmc@lists.ozlabs.org>; Thu,  6 Sep 2018 02:10:40 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 7B595411FB;
 Wed,  5 Sep 2018 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 mime-version:content-transfer-encoding:content-type:content-type
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mta-01; t=1536163836; x=
 1537978237; bh=TeSoTULc4UCgWsOcvQTiJNF4sdWIS+0K3pFoAjSeWpA=; b=W
 1Knai1AWbqgZTQ8u6yvp8D+YshzuwNqzupWCGqzOFm3kA23sEO9d42v7YFI0Ww0M
 zhxwavbhtRNsMF9jQe9mGHuW9ZpxqzKnVPIddHFDOh0aIEX6cb31s5FVLivM63Od
 HuPGRtArKN1VLOk2cgjLsA05AaDMa0iOmjFdu77sE0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k_9p_aJN0wRy; Wed,  5 Sep 2018 19:10:36 +0300 (MSK)
Received: from T-EXCH-01.corp.yadro.com (t-exch-01.corp.yadro.com
 [172.17.10.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 7AF37404D1;
 Wed,  5 Sep 2018 19:10:36 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (172.17.10.102) by
 T-EXCH-01.corp.yadro.com (172.17.10.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 5 Sep 2018 19:10:36 +0300
Received: from T-EXCH-02.corp.yadro.com ([fe80::c0ed:76be:aa75:7895]) by
 T-EXCH-02.corp.yadro.com ([fe80::c0ed:76be:aa75:7895%14]) with mapi id
 15.01.0669.032; Wed, 5 Sep 2018 19:10:36 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Joe MacDonald <joe_macdonald@mentor.com>
CC: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: [sumo][meta-networking][PATCH] split net-snmp-libs into smaller
 packages
Thread-Topic: [sumo][meta-networking][PATCH] split net-snmp-libs into smaller
 packages
Thread-Index: AQHURS2Cm3/Eom2MxkWdTge5Zh1jC6Th2Xy3
Date: Wed, 5 Sep 2018 16:10:35 +0000
Message-ID: <73649570115a4affbe66d8a0b556e572@yadro.com>
References: <20180905153054.11831-1-a.filippov@yadro.com>
In-Reply-To: <20180905153054.11831-1-a.filippov@yadro.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [172.17.15.155]
Content-Type: text/plain; charset="koi8-r"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 05 Sep 2018 16:10:41 -0000

Sorry,=20
The openembedded maillist didn't accept without a subscription,
so I repeat.

________________________________________
=EF=D4: Alexander A. Filippov
=EF=D4=D0=D2=C1=D7=CC=C5=CE=CF: 5 =D3=C5=CE=D4=D1=C2=D2=D1 2018 =C7. 18:30
=EB=CF=CD=D5: openembedded-devel@lists.openembedded.org; Joe MacDonald
=EB=CF=D0=C9=D1: openbmc@lists.ozlabs.org; Alexander A. Filippov
=F4=C5=CD=C1: [sumo][meta-networking][PATCH] split net-snmp-libs into small=
er packages

By default `net-snmp-libs` contains all compiled libs.
This commit splits `net-snmp-libs` into subpackages for each library.

This allows for smaller resulting image due to finer packaging.

Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
---
 .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   | 23 ++++++++++++++++++=
----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b=
/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index faf73a563..4ea0a5915 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -173,17 +173,21 @@ net_snmp_sysroot_preprocess () {
     fi
 }

-PACKAGES +=3D "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client ${PN}-serve=
r-snmpd ${PN}-server-snmptrapd"
+PACKAGES +=3D "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client \
+             ${PN}-server-snmpd ${PN}-server-snmptrapd \
+             ${PN}-lib-netsnmp ${PN}-lib-agent ${PN}-lib-helpers \
+             ${PN}-lib-mibs ${PN}-lib-trapd"

 # perl module
 PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'perl', '${PN}-perl-m=
odules', '', d)}"

 ALLOW_EMPTY_${PN} =3D "1"
 ALLOW_EMPTY_${PN}-server =3D "1"
+ALLOW_EMPTY_${PN}-libs =3D "1"

 FILES_${PN}-perl-modules =3D "${libdir}/perl/*"

-FILES_${PN}-libs =3D "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-libs =3D ""
 FILES_${PN}-mibs =3D "${datadir}/snmp/mibs"
 FILES_${PN}-server-snmpd =3D "${sbindir}/snmpd \
                             ${sysconfdir}/snmp/snmpd.conf \
@@ -196,6 +200,12 @@ FILES_${PN}-server-snmptrapd =3D "${sbindir}/snmptrapd=
 \
                                 ${systemd_unitdir}/system/snmptrapd.servic=
e \
 "

+FILES_${PN}-lib-netsnmp =3D "${libdir}/libnetsnmp${SOLIBS}"
+FILES_${PN}-lib-agent =3D "${libdir}/libnetsnmpagent${SOLIBS}"
+FILES_${PN}-lib-helpers =3D "${libdir}/libnetsnmphelpers${SOLIBS}"
+FILES_${PN}-lib-mibs =3D "${libdir}/libnetsnmpmibs${SOLIBS}"
+FILES_${PN}-lib-trapd =3D "${libdir}/libnetsnmptrapd${SOLIBS}"
+
 FILES_${PN} =3D ""
 FILES_${PN}-client =3D "${bindir}/* ${datadir}/snmp/"
 FILES_${PN}-dbg +=3D "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.debu=
g/"
@@ -219,10 +229,15 @@ SYSTEMD_SERVICE_${PN}-server-snmptrapd =3D  "snmptrap=
d.service"
 RDEPENDS_${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'net-sn=
mp-perl-modules', '', d)}"
 RDEPENDS_${PN} +=3D "net-snmp-client"
 RDEPENDS_${PN}-server-snmpd +=3D "net-snmp-mibs"
-RDEPENDS_${PN}-server-snmptrapd +=3D "net-snmp-server-snmpd"
+RDEPENDS_${PN}-server-snmptrapd +=3D "net-snmp-server-snmpd ${PN}-lib-trap=
d"
 RDEPENDS_${PN}-server +=3D "net-snmp-server-snmpd net-snmp-server-snmptrap=
d"
 RDEPENDS_${PN}-client +=3D "net-snmp-mibs net-snmp-libs"
-RDEPENDS_${PN}-libs +=3D "libpci"
+RDEPENDS_${PN}-libs +=3D "libpci \
+                        ${PN}-lib-netsnmp \
+                        ${PN}-lib-agent \
+                        ${PN}-lib-helpers \
+                        ${PN}-lib-mibs \
+"
 RDEPENDS_${PN}-ptest +=3D "perl \
                          perl-module-test \
                          perl-module-file-basename \
--
2.14.4
