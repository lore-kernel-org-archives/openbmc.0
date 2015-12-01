Return-Path: <vishwanath@in.ibm.com>
Received: from e28smtp07.in.ibm.com (e28smtp07.in.ibm.com [122.248.162.7])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 978891A0B63
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2015 04:18:11 +1100 (AEDT)
Received: from localhost
 by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 1 Dec 2015 22:48:08 +0530
Received: from d28dlp01.in.ibm.com (9.184.220.126)
 by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 1 Dec 2015 22:48:06 +0530
X-IBM-Helo: d28dlp01.in.ibm.com
X-IBM-MailFrom: vishwanath@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay05.in.ibm.com (d28relay05.in.ibm.com [9.184.220.62])
 by d28dlp01.in.ibm.com (Postfix) with ESMTP id 2EAD6E0054
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2015 22:48:47 +0530 (IST)
Received: from d28av03.in.ibm.com (d28av03.in.ibm.com [9.184.220.65])
 by d28relay05.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tB1HI5fF5898622
 for <openbmc@lists.ozlabs.org>; Tue, 1 Dec 2015 22:48:05 +0530
Received: from d28av03.in.ibm.com (localhost [127.0.0.1])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tB1HI5CU020299
 for <openbmc@lists.ozlabs.org>; Tue, 1 Dec 2015 22:48:05 +0530
Received: from d50lp01.ny.us.ibm.com ([146.89.104.207])
 by d28av03.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tB1HI2Se017338
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 1 Dec 2015 22:48:04 +0530
Message-Id: <201512011718.tB1HI2Se017338@d28av03.in.ibm.com>
Received: from /spool/local
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 1 Dec 2015 12:17:13 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 1 Dec 2015 12:17:10 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <vishwanath@in.ibm.com>;
 Tue, 1 Dec 2015 17:17:08 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 1 Dec 2015 17:17:06 -0000
Received: from us1a3-mail58.a3.dal09.isc4sb.com ([10.142.3.114])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2015120117180098-410358 ;
 Tue, 1 Dec 2015 17:18:00 +0000 
In-Reply-To: <1448988621-12834-2-git-send-email-openbmc-patches@stwcx.xyz>
Subject: Re: [PATCH openbmc 1/2] Adding IPMI Parser Library.
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org,
 "OpenBMC Members" <OpenBMC_Members@d28av03.in.ibm.com>
From: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Date: Tue, 1 Dec 2015 22:47:04 +0530
References: <1448988621-12834-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448988621-12834-2-git-send-email-openbmc-patches@stwcx.xyz>
X-KeepSent: 10C54741:9C5CECCA-65257F0E:005EA428;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1 October 14, 2013
X-LLNOutbound: False
X-Disclaimed: 40295
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=EABBF59DDFCD22B88f9e8a93df938690918cEABBF59DDFCD22B8"
x-cbid: 15120117-0025-0000-0000-0000086947DC
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.13251; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004629; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000122; SDB=6.00625067; UDB=6.00278495; UTC=2015-12-01
 17:17:07
x-cbparentid: 15120117-4778-0000-0000-00000110F455
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
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
X-List-Received-Date: Tue, 01 Dec 2015 17:18:12 -0000

--0__=EABBF59DDFCD22B88f9e8a93df938690918cEABBF59DDFCD22B8
Content-type: multipart/alternative; 
	Boundary="1__=EABBF59DDFCD22B88f9e8a93df938690918cEABBF59DDFCD22B8"


--1__=EABBF59DDFCD22B88f9e8a93df938690918cEABBF59DDFCD22B8
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


hey Hari,

.../ipmi-fru-parser/ipmi-fru-parser.bb  : is not needed since
ipmi-fru-parser repo is packaged as :
openbmc/meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb

And hence no change needed for package-group as well.

Thanks

---------------------------------------------------------------------------=
----------

Thanks and Regards,
Vishwanath.
Advisory Software Engineer,
Power Firmware Development,
Systems &Technology Lab,
MK-GF-050 , Manyata Embassy Business Park,
Bangalore , KA , 560045
Ph: +91-80-40256820
E-mail: vishwanath@in.ibm.com
---------------------------------------------------------------------------=
-------



From:	OpenBMC Patches <openbmc-patches@stwcx.xyz>
To:	openbmc@lists.ozlabs.org
Date:	12/01/2015 10:21 PM
Subject:	[PATCH openbmc 1/2] Adding IPMI Parser Library.
Sent by:	"openbmc" <openbmc-bounces
            +vishwanath=3Din.ibm.com@lists.ozlabs.org>



From: Hariharasubramanian R <hramasub@in.ibm.com>

---
 .../ipmi-fru-parser/ipmi-fru-parser.bb                 | 18 ++++++++++++++
++++
 .../packagegroups/packagegroup-obmc-phosphor-apps.bb   |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644
meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-parser.bb

diff --git
a/meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-parser.bb
b/meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-parser.bb
new file mode 100644
index 0000000..02ff308
--- /dev/null
+++
b/meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-parser.bb
@@ -0,0 +1,18 @@
+SUMMARY =3D "OpenBMC IPMI FRU Parser"
+DESCRIPTION =3D "Parse the common/chassis/board/product areas of the FRU
data into a VPD dictionary table."
+HOMEPAGE =3D "https://github.com/openbmc/ipmi-fru-parser"
+PR =3D "r1"
+
+inherit obmc-phosphor-license
+inherit obmc-phosphor-sdbus-service
+
+SRC=5FURI +=3D "git://github.com/hramasub/ipmi-fru-parser"
+
+SRCREV =3D "e097f0cc58c64564ae059f9b02ecb574e4cbb666"
+
+S =3D "${WORKDIR}/git"
+
+do=5Finstall() {
+        install -m 0755 -d ${D}${libdir}/ipmi
+        install -m 0755 ${S}/*.so ${D}${libdir}/ipmi
+}
diff --git
a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-pho=
sphor-apps.bb

b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-pho=
sphor-apps.bb

index 4dbcdd3..54e5655 100644
---
a/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-pho=
sphor-apps.bb

+++
b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-pho=
sphor-apps.bb

@@ -26,6 +26,7 @@ SUMMARY=5Fpackagegroup-obmc-phosphor-apps-extras =3D "Ext=
ra
features"
 RDEPENDS=5Fpackagegroup-obmc-phosphor-apps-extras =3D " \
         rest-dbus \
         host-ipmid \
+        ipmi-fru-parser \
         "

 SUMMARY=5Fpackagegroup-obmc-phosphor-apps-fan-mgmt =3D "Fan management
support"
--
2.6.3


=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=EABBF59DDFCD22B88f9e8a93df938690918cEABBF59DDFCD22B8
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>hey Hari,<br><br><tt>.../ipmi-fru-parser/ipmi-fru-parser.bb =
</tt> : is not needed since ipmi-fru-parser repo is packaged as : openbmc/m=
eta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid-fru.bb<br><br>An=
d hence no change needed for package-group as well.<br><br>Thanks<br><br>--=
---------------------------------------------------------------------------=
--------<br>Thanks and Regards,<br>Vishwanath.<br>Advisory Software Enginee=
r,<br>Power Firmware Development, <br>Systems &amp;Technology Lab,<br>MK-GF=
-050 , Manyata Embassy Business Park, <br>Bangalore , KA , 560045<br>Ph: +9=
1-80-40256820<br>E-mail: vishwanath@in.ibm.com<br>-------------------------=
---------------------------------------------------------<br><br><img width=
=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3DEABBF59DDFCD22B88f9e8a93df938690=
918cEAB@" border=3D"0" alt=3D"Inactive hide details for OpenBMC Patches ---=
12/01/2015 10:21:03 PM---From: Hariharasubramanian R &lt;hramasub@in.ibm.co=
m&gt; ---"><font color=3D"#424282">OpenBMC Patches ---12/01/2015 10:21:03 P=
M---From: Hariharasubramanian R &lt;hramasub@in.ibm.com&gt; ---</font><br><=
br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">=
OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;</font><br><font size=3D"2=
" color=3D"#5F5F5F">To:        </font><font size=3D"2">openbmc@lists.ozlabs=
.org</font><br><font size=3D"2" color=3D"#5F5F5F">Date:        </font><font=
 size=3D"2">12/01/2015 10:21 PM</font><br><font size=3D"2" color=3D"#5F5F5F=
">Subject:        </font><font size=3D"2">[PATCH openbmc 1/2] Adding IPMI P=
arser Library.</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:       =
 </font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+vishwanath=
=3Din.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" =
align=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt>From: Hari=
harasubramanian R &lt;hramasub@in.ibm.com&gt;<br><br>---<br> .../ipmi-fru-p=
arser/ipmi-fru-parser.bb &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; | 18 ++++++++++++++++++<br> .../packagegroups/packagegroup-obmc-phosp=
hor-apps.bb &nbsp; | &nbsp;1 +<br> 2 files changed, 19 insertions(+)<br> cr=
eate mode 100644 meta-phosphor/common/recipes-phosphor/ipmi-fru-parser/ipmi=
-fru-parser.bb<br><br>diff --git a/meta-phosphor/common/recipes-phosphor/ip=
mi-fru-parser/ipmi-fru-parser.bb b/meta-phosphor/common/recipes-phosphor/ip=
mi-fru-parser/ipmi-fru-parser.bb<br>new file mode 100644<br>index 0000000..=
02ff308<br>--- /dev/null<br>+++ b/meta-phosphor/common/recipes-phosphor/ipm=
i-fru-parser/ipmi-fru-parser.bb<br>@@ -0,0 +1,18 @@<br>+SUMMARY =3D &quot;O=
penBMC IPMI FRU Parser&quot;<br>+DESCRIPTION =3D &quot;Parse the common/cha=
ssis/board/product areas of the FRU data into a VPD dictionary table.&quot;=
<br>+HOMEPAGE =3D &quot;</tt><tt><a href=3D"https://github.com/openbmc/ipmi=
-fru-parser">https://github.com/openbmc/ipmi-fru-parser</a></tt><tt>&quot;<=
br>+PR =3D &quot;r1&quot;<br>+<br>+inherit obmc-phosphor-license<br>+inheri=
t obmc-phosphor-sdbus-service<br>+<br>+SRC=5FURI +=3D &quot;git://github.co=
m/hramasub/ipmi-fru-parser&quot;<br>+<br>+SRCREV =3D &quot;e097f0cc58c64564=
ae059f9b02ecb574e4cbb666&quot;<br>+<br>+S =3D &quot;${WORKDIR}/git&quot;<br=
>+<br>+do=5Finstall() {<br>+ &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 -d =
${D}${libdir}/ipmi<br>+ &nbsp; &nbsp; &nbsp; &nbsp;install -m 0755 ${S}/*.s=
o ${D}${libdir}/ipmi<br>+}<br>diff --git a/meta-phosphor/common/recipes-pho=
sphor/packagegroups/packagegroup-obmc-phosphor-apps.bb b/meta-phosphor/comm=
on/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb<br>ind=
ex 4dbcdd3..54e5655 100644<br>--- a/meta-phosphor/common/recipes-phosphor/p=
ackagegroups/packagegroup-obmc-phosphor-apps.bb<br>+++ b/meta-phosphor/comm=
on/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.bb<br>@@ =
-26,6 +26,7 @@ SUMMARY=5Fpackagegroup-obmc-phosphor-apps-extras =3D &quot;E=
xtra features&quot;<br> RDEPENDS=5Fpackagegroup-obmc-phosphor-apps-extras =
=3D &quot; \<br> &nbsp; &nbsp; &nbsp; &nbsp; rest-dbus \<br> &nbsp; &nbsp; =
&nbsp; &nbsp; host-ipmid \<br>+ &nbsp; &nbsp; &nbsp; &nbsp;ipmi-fru-parser =
\<br> &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br> <br> SUMMARY=5Fpackagegroup-ob=
mc-phosphor-apps-fan-mgmt =3D &quot;Fan management support&quot;<br>-- <br>=
2.6.3<br><br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br></tt><tt><=
a href=3D"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.o=
rg/listinfo/openbmc</a></tt><tt><br></tt><br><BR>
</body></html>

--1__=EABBF59DDFCD22B88f9e8a93df938690918cEABBF59DDFCD22B8--


--0__=EABBF59DDFCD22B88f9e8a93df938690918cEABBF59DDFCD22B8
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=EABBF59DDFCD22B88f9e8a93df938690918cEAB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=EABBF59DDFCD22B88f9e8a93df938690918cEABBF59DDFCD22B8--
