Return-Path: <austenc@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xkR5B1Fn7zDqh9
 for <openbmc@lists.ozlabs.org>; Sat,  2 Sep 2017 03:27:25 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v81HNgbo019456
 for <openbmc@lists.ozlabs.org>; Fri, 1 Sep 2017 13:27:21 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.81])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2cq9ww01dw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 01 Sep 2017 13:27:21 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 1 Sep 2017 17:27:20 -0000
Received: from us1a3-smtp06.a3.dal06.isc4sb.com (10.146.103.243)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 1 Sep 2017 17:27:19 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp06.a3.dal06.isc4sb.com
 with ESMTP id 2017090117271874-703811 ;
 Fri, 1 Sep 2017 17:27:18 +0000 
MIME-Version: 1.0
Subject: layers and adding a new system
To: openbmc@lists.ozlabs.org
From: "Chris Austen" <austenc@us.ibm.com>
Date: Fri, 1 Sep 2017 12:27:17 -0500
X-KeepSent: 2D430B1C:0ECB52AA-86258177:0076016C;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1EXT SHF766 December 14, 2016
X-LLNOutbound: False
X-Disclaimed: 50599
X-TNEFEvaluated: 1
Content-type: multipart/alternative; 
 Boundary="0__=09BB0BE4DFE587FC8f9e8a93df938690918c09BB0BE4DFE587FC"
Content-Disposition: inline
x-cbid: 17090117-7093-0000-0000-000003330D6B
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.380009; ST=0; TS=0; UL=0; ISC=; MB=0.252151
X-IBM-SpamModules-Versions: BY=3.00007647; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000226; SDB=6.00910778; UDB=6.00456917; IPR=6.00691059; 
 BA=6.00005563; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016963; XFM=3.00000015;
 UTC=2017-09-01 17:27:19
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-09-01 16:46:21 - 6.00007266
x-cbparentid: 17090117-7094-0000-0000-00000FAC1E25
Message-Id: <OF2D430B1C.0ECB52AA-ON86258177.0076016C-8625818E.005FE1ED@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-01_04:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2017 17:27:26 -0000


--0__=09BB0BE4DFE587FC8f9e8a93df938690918c09BB0BE4DFE587FC
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII




As the popularity of OpenBMC grows the project will hopefully find itself
with additional pull requests to support more systems.  As I did when I
first started out you could easily be allured to simply copy/past the
entire contents of a similar system under meta-openbmc-machines/... and
call it your own.  However scale that to anything greater then a few
machines and the shier volume of duplicate code will become bulky and
unmanageable.   Yocto recognized this as an issue and has provided support
to reduce.  I would like to build a list of recommendations on how to add
new hardware in to the OpenBMC Project.


For hardware based on a similar design this is...

Not good
=3D=3D=3D=3D=3D=3D=3D=3D
meta-mfg/meta-redfish/
meta-mfg/meta-bluefish/
meta-mfg/meta-yellowfish/
meta-mfg/meta-greenfish/


Good
=3D=3D=3D=3D=3D=3D=3D=3D
meta-mfg/meta-fish/


So how can you do that?  With a single variable in your local.conf...
MACHINE.  You change the MACHINE variable per system type but let default
and use the base platform for common items.

    MACHINE =3D "bluefish"

A bbappend that are specific to the bluefish system you append the
=5Fbluefish

    FILESEXTRAPATHS=5Fprepend=5Fbluefish :=3D "${THISDIR}/${PN}:"
    SRC=5FURI=5Fappend=5Fbluefish =3D " file://0001-blueworms.patch"

A bbappend that make a common change to all of the fish type.  This means
anyone adding the meta-fish layer gets this bbappend and the rainbowworms.

    FILESEXTRAPATHS=5Fprepend :=3D "${THISDIR}/${PN}:"
    SRC=5FURI=5Fappend =3D " file://0001-rainbowworms.patch"

Machine and default are all good until If you use a bluefish system but you
have a company policy use the MACHINEOVERRIDES variable

    FILESEXTRAPATHS=5Fprepend=5ForgXfis :=3D "${THISDIR}/${PN}:"
    SRC=5FURI=5Fappend=5ForgXfis =3D " file://0001-blueXworms.patch"

Note yocto matches and runs every hit.  That means if you add a default,
machine and machine override in the same bbappend, you get all three files.
So use with caution...

    FILESEXTRAPATHS=5Fprepend=5ForgXfis :=3D "${THISDIR}/${PN}:"
    SRC=5FURI=5Fappend=5ForgXfis =3D " file://0001-blueXworms.patch"
    SRC=5FURI=5Fappend =3D " file://0001-rainbowworms.patch"
    SRC=5FURI=5Fappend=5Fbluefish =3D " file://0001-blueworms.patch"

    $ ls
    0001-blueXworms.patch
    0001-rainbowworms.patch
    0001-blueworms.patch


TBD.. need to add example of something being added, replaced and kernel
device tree needs.


Thoughts?



Chris Austen

--0__=09BB0BE4DFE587FC8f9e8a93df938690918c09BB0BE4DFE587FC
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p><font size=3D"2">As the popularity of OpenBMC grows the proj=
ect will hopefully find itself with additional pull requests to support mor=
e systems.  As I did when I first started out you could easily be allured t=
o simply copy/past the entire contents of a similar system under meta-openb=
mc-machines/... and call it your own.  However scale that to anything great=
er then a few machines and the shier volume of duplicate code will become b=
ulky and unmanageable.   Yocto recognized this as an issue and has provided=
 support to reduce.  I would like to build a list of recommendations on how=
 to add new hardware in to the OpenBMC Project.</font><br><br><br><font siz=
e=3D"2">For hardware based on a similar design this is...</font><br><br><fo=
nt size=3D"2">Not good</font><br><font size=3D"2">=3D=3D=3D=3D=3D=3D=3D=3D<=
/font><br><font size=3D"2">meta-mfg/meta-redfish/</font><br><font size=3D"2=
">meta-mfg/meta-bluefish/</font><br><font size=3D"2">meta-mfg/meta-yellowfi=
sh/</font><br><font size=3D"2">meta-mfg/meta-greenfish/</font><br><br><br><=
font size=3D"2">Good</font><br><font size=3D"2">=3D=3D=3D=3D=3D=3D=3D=3D</f=
ont><br><font size=3D"2">meta-mfg/meta-fish/</font><br><font size=3D"2"><br=
></font><br><font size=3D"2">So how can you do that?  With a single variabl=
e in your local.conf...  MACHINE.  You change the MACHINE variable per syst=
em type but let default and use the base platform for common items.  </font=
><br><br><font size=3D"2">    MACHINE =3D &quot;bluefish&quot;</font><br><b=
r><font size=3D"2">A bbappend that are specific to the bluefish system you =
append the =5Fbluefish</font><br><br><font size=3D"2">    FILESEXTRAPATHS=
=5Fprepend=5Fbluefish :=3D &quot;${THISDIR}/${PN}:&quot;</font><br><font si=
ze=3D"2">    SRC=5FURI=5Fappend=5Fbluefish =3D &quot; </font><a href=3D"fil=
e://0001-board-aspeed-Add-reset=5Fphy-for-Zaius.patchch/"><font size=3D"2">=
file://0001-blueworms.patch&quot;</font></a><font size=3D"2"> </font><br><b=
r><font size=3D"2">A bbappend that make a common change to all of the fish =
type.  This means anyone adding the meta-fish layer gets this bbappend and =
the rainbowworms.  </font><br><br><font size=3D"2">    FILESEXTRAPATHS=5Fpr=
epend :=3D &quot;${THISDIR}/${PN}:&quot;</font><br><font size=3D"2">    SRC=
=5FURI=5Fappend =3D &quot; </font><a href=3D"file://0001-board-aspeed-Add-r=
eset=5Fphy-for-Zaius.patchch/"><font size=3D"2">file://0001-rainbowworms.pa=
tch&quot;</font></a><font size=3D"2"> </font><br><br><font size=3D"2">Machi=
ne and default are all good until If you use a bluefish system but you have=
 a company policy use the MACHINEOVERRIDES variable</font><br><br><font siz=
e=3D"2">    FILESEXTRAPATHS=5Fprepend=5ForgXfis :=3D &quot;${THISDIR}/${PN}=
:&quot;</font><br><font size=3D"2">    SRC=5FURI=5Fappend=5ForgXfis =3D &qu=
ot; </font><a href=3D"file://0001-board-aspeed-Add-reset=5Fphy-for-Zaius.pa=
tchch/"><font size=3D"2">file://0001-blueXworms.patch&quot;</font></a><font=
 size=3D"2"> </font><br><br><font size=3D"2">Note yocto matches and runs ev=
ery hit.  That means if you add a default, machine and machine override in =
the same bbappend, you get all three files.  So use with caution...</font><=
br><br><font size=3D"2">    FILESEXTRAPATHS=5Fprepend=5ForgXfis :=3D &quot;=
${THISDIR}/${PN}:&quot;</font><br><font size=3D"2">    SRC=5FURI=5Fappend=
=5ForgXfis =3D &quot; </font><a href=3D"file://0001-board-aspeed-Add-reset=
=5Fphy-for-Zaius.patchch/"><font size=3D"2">file://0001-blueXworms.patch&qu=
ot;</font></a><font size=3D"2"> </font><br><font size=3D"2">    SRC=5FURI=
=5Fappend =3D &quot; </font><a href=3D"file://0001-board-aspeed-Add-reset=
=5Fphy-for-Zaius.patchch/"><font size=3D"2">file://0001-rainbowworms.patch&=
quot;</font></a><font size=3D"2"> </font><br><font size=3D"2">    SRC=5FURI=
=5Fappend=5Fbluefish =3D &quot; </font><a href=3D"file://0001-board-aspeed-=
Add-reset=5Fphy-for-Zaius.patchch/"><font size=3D"2">file://0001-blueworms.=
patch&quot;</font></a><font size=3D"2"> </font><br><font size=3D"2"> </font=
><br><font size=3D"2">    $ ls</font><br><font size=3D"2" color=3D"#0000FF"=
>    0001-blueXworms.patch</font><br><font size=3D"2" color=3D"#0000FF">   =
 0001-rainbowworms.patch</font><font size=3D"2"> </font><br><font size=3D"2=
" color=3D"#0000FF">    0001-blueworms.patch</font><font size=3D"2"> </font=
><br><br><br><font size=3D"2">TBD.. need to add example of something being =
added, replaced and kernel device tree needs.</font><br><br><br><font size=
=3D"2">Thoughts?</font><br><br><br><br><font size=3D"2">Chris Austen<br></f=
ont><BR>
</body></html>

--0__=09BB0BE4DFE587FC8f9e8a93df938690918c09BB0BE4DFE587FC--
