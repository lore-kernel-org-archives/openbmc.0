Return-Path: <hramasub@in.ibm.com>
Received: from e28smtp05.in.ibm.com (e28smtp05.in.ibm.com [122.248.162.5])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7FA1A0B63
 for <openbmc@lists.ozlabs.org>; Wed,  2 Dec 2015 04:25:04 +1100 (AEDT)
Received: from localhost
 by e28smtp05.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Tue, 1 Dec 2015 22:55:01 +0530
Received: from d28dlp02.in.ibm.com (9.184.220.127)
 by e28smtp05.in.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 1 Dec 2015 22:54:55 +0530
X-IBM-Helo: d28dlp02.in.ibm.com
X-IBM-MailFrom: hramasub@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
 by d28dlp02.in.ibm.com (Postfix) with ESMTP id 737893940057
 for <openbmc@lists.ozlabs.org>; Tue,  1 Dec 2015 22:54:55 +0530 (IST)
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
 by d28relay01.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tB1HOtMw41025648
 for <openbmc@lists.ozlabs.org>; Tue, 1 Dec 2015 22:54:55 +0530
Received: from d28av05.in.ibm.com (localhost [127.0.0.1])
 by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tB1HOsSf008824
 for <openbmc@lists.ozlabs.org>; Tue, 1 Dec 2015 22:54:54 +0530
Received: from d50lp02.ny.us.ibm.com ([146.89.104.208])
 by d28av05.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tB1HOpY4004540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 1 Dec 2015 22:54:53 +0530
Message-Id: <201512011724.tB1HOpY4004540@d28av05.in.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Tue, 1 Dec 2015 12:23:59 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 1 Dec 2015 12:23:57 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <hramasub@in.ibm.com>;
 Tue, 1 Dec 2015 17:23:55 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 1 Dec 2015 17:23:49 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2015120117234646-413312 ;
 Tue, 1 Dec 2015 17:23:46 +0000 
In-Reply-To: <OF10C54741.9C5CECCA-ON65257F0E.005EA428-65257F0E.005EF243@LocalDomain>
Subject: Re: [PATCH openbmc 1/2] Adding IPMI Parser Library.
To: "Vishwanatha Subbanna" <vishwanath@in.ibm.com>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org,
 "OpenBMC Members" <OpenBMC_Members@d28av05.in.ibm.com>
From: "Hariharasubramanian Ramasubramanian" <hramasub@in.ibm.com>
Date: Tue, 1 Dec 2015 22:53:45 +0530
References: <1448988621-12834-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1448988621-12834-2-git-send-email-openbmc-patches@stwcx.xyz>
 <OF10C54741.9C5CECCA-ON65257F0E.005EA428-65257F0E.005EF243@LocalDomain>
X-KeepSent: 338AE86A:6872FC71-00257F0E:005F52AC;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1SHF211 December 19, 2013
X-LLNOutbound: False
X-Disclaimed: 27883
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=8FBBF59DDFCCD43C8f9e8a93df938690918c8FBBF59DDFCCD43C"
x-cbid: 15120117-0017-0000-0000-000008BF158D
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.132513; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004629; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000122; SDB=6.00625069; UDB=6.00278497; UTC=2015-12-01
 17:23:52
x-cbparentid: 15120117-5090-0000-0000-00000610F0CA
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
X-List-Received-Date: Tue, 01 Dec 2015 17:25:04 -0000

--0__=8FBBF59DDFCCD43C8f9e8a93df938690918c8FBBF59DDFCCD43C
Content-type: multipart/alternative; 
	Boundary="1__=8FBBF59DDFCCD43C8f9e8a93df938690918c8FBBF59DDFCCD43C"


--1__=8FBBF59DDFCCD43C8f9e8a93df938690918c8FBBF59DDFCCD43C
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Hi Vishwa,

It appears that I have not done a clean git push on my earlier pull request
for the IPMI parser library. Those 2 IPMI files in this pull request are
remains of the earlier pull request.

For the systemd/networkd dbus support, the 2 changes are :
1) systemd=5F225.bb
2) 0100=5Fsystemd=5Fnetworkd=5Fdbus=5Fsetattr.patch


regards,
rhari!

Hariharasubramanian R.
Power Firmware Development
IBM India Systems & Technology Lab, Bangalore, India
Phone:  +91 80 4025 6950



From:	Vishwanatha Subbanna/India/IBM
To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc:	openbmc@lists.ozlabs.org, OpenBMC Members@WWPDL
Date:	12/01/2015 10:47 PM
Subject:	Re: [PATCH openbmc 1/2] Adding IPMI Parser Library.


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


--1__=8FBBF59DDFCCD43C8f9e8a93df938690918c8FBBF59DDFCCD43C
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Hi Vishwa,<br><br>It appears that I have not done a clean gi=
t push on my earlier pull request for the IPMI parser library. Those 2 IPMI=
 files in this pull request are remains of the earlier pull request.<br><br=
>For the systemd/networkd dbus support, the 2 changes are :<br>1) systemd=
=5F225.bb <br>2) 0100=5Fsystemd=5Fnetworkd=5Fdbus=5Fsetattr.patch <br><br><=
br>regards,<br>rhari!<br><br>Hariharasubramanian R.<br>Power Firmware Devel=
opment<br>IBM India Systems &amp; Technology Lab, Bangalore, India<br>Phone=
:  +91 80 4025 6950   <br><br><img width=3D"16" height=3D"16" src=3D"cid:1=
=5F=5F=3D8FBBF59DDFCCD43C8f9e8a93df938690918c8FB@" border=3D"0" alt=3D"Inac=
tive hide details for Vishwanatha Subbanna---12/01/2015 10:47:07 PM---hey H=
ari, .../ipmi-fru-parser/ipmi-fru-parser.bb  : i"><font color=3D"#424282">V=
ishwanatha Subbanna---12/01/2015 10:47:07 PM---hey Hari, .../ipmi-fru-parse=
r/ipmi-fru-parser.bb  : is not needed since ipmi-fru-parser repo is pack</f=
ont><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font si=
ze=3D"2">Vishwanatha Subbanna/India/IBM</font><br><font size=3D"2" color=3D=
"#5F5F5F">To:        </font><font size=3D"2">OpenBMC Patches &lt;openbmc-pa=
tches@stwcx.xyz&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Cc:       =
 </font><font size=3D"2">openbmc@lists.ozlabs.org, OpenBMC Members@WWPDL</f=
ont><br><font size=3D"2" color=3D"#5F5F5F">Date:        </font><font size=
=3D"2">12/01/2015 10:47 PM</font><br><font size=3D"2" color=3D"#5F5F5F">Sub=
ject:        </font><font size=3D"2">Re: [PATCH openbmc 1/2] Adding IPMI Pa=
rser Library.</font><br><hr width=3D"100%" size=3D"2" align=3D"left" noshad=
e style=3D"color:#8091A5; "><br><br>hey Hari,<br><br><tt>.../ipmi-fru-parse=
r/ipmi-fru-parser.bb </tt> : is not needed since ipmi-fru-parser repo is pa=
ckaged as : openbmc/meta-phosphor/common/recipes-phosphor/host-ipmid/host-i=
pmid-fru.bb<br><br>And hence no change needed for package-group as well.<br=
><br>Thanks<br><br>--------------------------------------------------------=
-----------------------------<br>Thanks and Regards,<br>Vishwanath.<br>Advi=
sory Software Engineer,<br>Power Firmware Development, <br>Systems &amp;Tec=
hnology Lab,<br>MK-GF-050 , Manyata Embassy Business Park, <br>Bangalore , =
KA , 560045<br>Ph: +91-80-40256820<br>E-mail: vishwanath@in.ibm.com<br>----=
---------------------------------------------------------------------------=
---<br><br><br><img width=3D"16" height=3D"16" src=3D"cid:1=5F=5F=3D8FBBF59=
DDFCCD43C8f9e8a93df938690918c8FB@" border=3D"0" alt=3D"Inactive hide detail=
s for OpenBMC Patches ---12/01/2015 10:21:03 PM---From: Hariharasubramanian=
 R &lt;hramasub@in.ibm.com&gt; ---"><font color=3D"#424282">OpenBMC Patches=
 ---12/01/2015 10:21:03 PM---From: Hariharasubramanian R &lt;hramasub@in.ib=
m.com&gt; ---</font><br><br><font size=3D"2" color=3D"#5F5F5F">From:       =
 </font><font size=3D"2">OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;<=
/font><br><font size=3D"2" color=3D"#5F5F5F">To:        </font><font size=
=3D"2">openbmc@lists.ozlabs.org</font><br><font size=3D"2" color=3D"#5F5F5F=
">Date:        </font><font size=3D"2">12/01/2015 10:21 PM</font><br><font =
size=3D"2" color=3D"#5F5F5F">Subject:        </font><font size=3D"2">[PATCH=
 openbmc 1/2] Adding IPMI Parser Library.</font><br><font size=3D"2" color=
=3D"#5F5F5F">Sent by:        </font><font size=3D"2">&quot;openbmc&quot; &l=
t;openbmc-bounces+vishwanath=3Din.ibm.com@lists.ozlabs.org&gt;</font><br><h=
r width=3D"100%" size=3D"2" align=3D"left" noshade style=3D"color:#8091A5; =
"><br><br><br><tt>From: Hariharasubramanian R &lt;hramasub@in.ibm.com&gt;<b=
r><br>---<br> .../ipmi-fru-parser/ipmi-fru-parser.bb &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 18 ++++++++++++++++++<br> .../packagegr=
oups/packagegroup-obmc-phosphor-apps.bb &nbsp; | &nbsp;1 +<br> 2 files chan=
ged, 19 insertions(+)<br> create mode 100644 meta-phosphor/common/recipes-p=
hosphor/ipmi-fru-parser/ipmi-fru-parser.bb<br><br>diff --git a/meta-phospho=
r/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-parser.bb b/meta-phospho=
r/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-parser.bb<br>new file mo=
de 100644<br>index 0000000..02ff308<br>--- /dev/null<br>+++ b/meta-phosphor=
/common/recipes-phosphor/ipmi-fru-parser/ipmi-fru-parser.bb<br>@@ -0,0 +1,1=
8 @@<br>+SUMMARY =3D &quot;OpenBMC IPMI FRU Parser&quot;<br>+DESCRIPTION =
=3D &quot;Parse the common/chassis/board/product areas of the FRU data into=
 a VPD dictionary table.&quot;<br>+HOMEPAGE =3D &quot;</tt><tt><a href=3D"h=
ttps://github.com/openbmc/ipmi-fru-parser">https://github.com/openbmc/ipmi-=
fru-parser</a></tt><tt>&quot;<br>+PR =3D &quot;r1&quot;<br>+<br>+inherit ob=
mc-phosphor-license<br>+inherit obmc-phosphor-sdbus-service<br>+<br>+SRC=5F=
URI +=3D &quot;git://github.com/hramasub/ipmi-fru-parser&quot;<br>+<br>+SRC=
REV =3D &quot;e097f0cc58c64564ae059f9b02ecb574e4cbb666&quot;<br>+<br>+S =3D=
 &quot;${WORKDIR}/git&quot;<br>+<br>+do=5Finstall() {<br>+ &nbsp; &nbsp; &n=
bsp; &nbsp;install -m 0755 -d ${D}${libdir}/ipmi<br>+ &nbsp; &nbsp; &nbsp; =
&nbsp;install -m 0755 ${S}/*.so ${D}${libdir}/ipmi<br>+}<br>diff --git a/me=
ta-phosphor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phospho=
r-apps.bb b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegrou=
p-obmc-phosphor-apps.bb<br>index 4dbcdd3..54e5655 100644<br>--- a/meta-phos=
phor/common/recipes-phosphor/packagegroups/packagegroup-obmc-phosphor-apps.=
bb<br>+++ b/meta-phosphor/common/recipes-phosphor/packagegroups/packagegrou=
p-obmc-phosphor-apps.bb<br>@@ -26,6 +26,7 @@ SUMMARY=5Fpackagegroup-obmc-ph=
osphor-apps-extras =3D &quot;Extra features&quot;<br> RDEPENDS=5Fpackagegro=
up-obmc-phosphor-apps-extras =3D &quot; \<br> &nbsp; &nbsp; &nbsp; &nbsp; r=
est-dbus \<br> &nbsp; &nbsp; &nbsp; &nbsp; host-ipmid \<br>+ &nbsp; &nbsp; =
&nbsp; &nbsp;ipmi-fru-parser \<br> &nbsp; &nbsp; &nbsp; &nbsp; &quot;<br> <=
br> SUMMARY=5Fpackagegroup-obmc-phosphor-apps-fan-mgmt =3D &quot;Fan manage=
ment support&quot;<br>-- <br>2.6.3<br><br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@=
lists.ozlabs.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/o=
penbmc">https://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br>=
<BR>
</body></html>

--1__=8FBBF59DDFCCD43C8f9e8a93df938690918c8FBBF59DDFCCD43C--


--0__=8FBBF59DDFCCD43C8f9e8a93df938690918c8FBBF59DDFCCD43C
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=8FBBF59DDFCCD43C8f9e8a93df938690918c8FB@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=8FBBF59DDFCCD43C8f9e8a93df938690918c8FBBF59DDFCCD43C--
