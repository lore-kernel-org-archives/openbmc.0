Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rcXZ55bnyzDqlj
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 10:12:13 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5Q090GN064754
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:11 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23sjueub50-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:11 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 25 Jun 2016 20:12:10 -0400
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 25 Jun 2016 20:12:08 -0400
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 4E59038C8039
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:08 -0400 (EDT)
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5Q0C8S062390326
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 00:12:08 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A297124044
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:08 -0400 (EDT)
Received: from d50lp02.ny.us.ibm.com (unknown [146.89.104.208])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS id 150F412403F
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:08 -0400 (EDT)
Received: from localhost
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 25 Jun 2016 20:12:07 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Sat, 25 Jun 2016 20:12:05 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sun, 26 Jun 2016 00:12:04 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 26 Jun 2016 00:12:02 -0000
X-IBM-Helo: us1a3-smtp01.a3.dal06.isc4sb.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016062600120234-190591 ;
 Sun, 26 Jun 2016 00:12:02 +0000 
In-Reply-To: <1466660106.23740.59.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 11/18] initfs: update: check individual mtd
 partitions for mounts
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Sun, 26 Jun 2016 00:12:01 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1466660106.23740.59.camel@aj.id.au>,
 <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-12-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_06062016_FP3.1 June 14, 2016
X-LLNOutbound: False
X-Disclaimed: 43251
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16062600-0056-0000-0000-0000009F5F24
X-IBM-ISS-SpamDetectors: Score=0.373977; BY=0.256127; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.373977; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005430; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00721549; UDB=6.00336905; UTC=2016-06-26
 00:12:03
x-cbparentid: 16062600-0132-0000-0000-0000003D87EE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF288BB6FD.08E26A12-ON00257FDC.007EE12A-00257FDE.000119E0@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-25_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606260001
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
X-List-Received-Date: Sun, 26 Jun 2016 00:12:14 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br>On 06/23/2016 around 12:35AM in some timezone, Andrew Jeffery wr=
ote:<br>&gt;On Wed, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:<br>&g=
t;&gt; From: "Milton D. Miller II" &lt;<a target=3D"=5Fblank" href=3D"mailt=
o:miltonm@us.ibm.com">miltonm@us.ibm.com</a>&gt;<br>&gt;&gt; <br>&gt;&gt; I=
nstead of checking for any mtd device, only check mtd devices<br>&gt;&gt; t=
hat are to be updated.<br>&gt;<br>&gt;What do you mean by "instead of"? We'=
re not removing any code here,<br>&gt;and<br>&gt;from a quick look we loop =
over the update images in existing checks.<br>&gt;<br><br>The grep for mtd =
anywhere in proc at the top of the script (that you<br>had me move ERROR up=
 to handle) is replaced with ...<br><br>&gt;&gt; &nbsp;&nbsp;Include child =
mtd devices when looking<br>&gt;&gt; for mounted filesystems.<br>&gt;&gt; <=
br>&gt;&gt; If this check is suppressed flash updates are suppressed.<br>&g=
t;&gt; Suppressing the check may be useful to verify a update could<br>&gt;=
&gt; succeed at shutdown.<br>&gt;&gt; <br>&gt;&gt; Signed-off-by: Milton Mi=
ller &lt;<a target=3D"=5Fblank" href=3D"mailto:miltonm@us.ibm.com">miltonm@=
us.ibm.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; &nbsp;.../obmc-phosphor-init=
fs/files/obmc-update.sh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 47<br>&gt;++++=
+++++++++++++++---<br>&gt;&gt; &nbsp;1 file changed, 41 insertions(+), 6 de=
letions(-)<br>&gt;&gt; <br>&gt;&gt; diff --git<br>&gt;a/meta-phosphor/commo=
n/recipes-phosphor/obmc-phosphor-initfs/files/ob<br>&gt;mc-update.sh<br>&gt=
;b/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob<br>&=
gt;mc-update.sh<br>&gt;&gt; index 4442e5b..22c9dcc 100755<br>&gt;&gt; ---<b=
r>&gt;a/meta-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob=
<br>&gt;mc-update.sh<br>&gt;&gt; +++<br>&gt;b/meta-phosphor/common/recipes-=
phosphor/obmc-phosphor-initfs/files/ob<br>&gt;mc-update.sh<br>&gt;&gt; @@ -=
19,11 +19,34 @@ then<br>&gt;&gt; &nbsp;        mount -t devtmpfs dev dev<br=
>&gt;&gt; &nbsp;fi<br>&gt;&gt; &nbsp;<br>&gt;&gt; -if grep mtd /proc/mounts=
<br>&gt;&gt; -then<br>&gt;&gt; -        echo 1&gt;&amp;2 "ERROR: A mtd devi=
ce is mounted."<br>&gt;&gt; -        exit 1<br>&gt;&gt; -fi<br><br>Right he=
re is the "instead of" code that is being removed.<br><br><br>&gt;&gt; +# m=
td number N with mtd name Name can be mounted via mtdN, or<br>&gt;mtd:Name<=
br>&gt;&gt; +# (with a mtd aware fs) or by /dev/mtdblockN (with a mtd or bl=
ock<br>&gt;fs).<br>&gt;&gt; +mtdismounted() {<br>&gt;<br>&gt;I keep reading=
 this as mt-dismounted rather than mtd-is-mounted. Can<br>&gt;we<br>&gt;add=
 some underscores?<br><br>If I do that then I have to add them to all the f=
unctions and then <br>my lines go over 80 characters and then ...<br><br>I =
considered ismtdmounted but that gets back to which is true like<br>checkmt=
dmounted would, so I decided to go with mountedmtd.<br><br>&gt;&gt; &nbsp; =
               shift ;;<br>&gt;&gt; @@ -135,6 +162,14 @@ do<br>&gt;&gt; &nb=
sp;                echo 1&gt;&amp;2 "$E Unable to find mtd partiton for ${f=
##*/}."<br>&gt;&gt; &nbsp;                exit 1<br>&gt;&gt; &nbsp;        =
fi<br>&gt;&gt; +        for s in $m $(childmtds $m)<br>&gt;&gt; +        do=
<br>&gt;&gt; +                if test -n "$checkmount" &amp;&amp; mtdismoun=
ted $s<br>&gt;<br>&gt;$checkmount is invariant with respect to $s, so is it=
 worth hoisting<br>&gt;the check out of the loop? Though it would mean anot=
her indent...<br>&gt;<br><br>Since this also suppresses the call to childmt=
ds I decided to <br>implement this, changing the error to be Device $s for =
${f} is in use.<br><br><br>Unfortunately the file system can be unmounted t=
o where it <br>no longer appears in /proc/mounts but is stlil mounted and i=
n <br>use by the overlay.&nbsp; I don't know how to fix this.&nbsp; Some lo=
ng <br>ideas are add sysfs status to mtd and add a process holding <br>the =
directory open with the systemd "don't kill leave to shutdown <br>script" p=
rocess name (if that can be done from shell).&nbsp; Or copying <br>the .pro=
c/mounts to /run when mounting overlay and checking <br>that too.&nbsp;&nbs=
p; This is to avoid root writing a new image while the <br>file system writ=
es to the flash based on the old image, and<br>several of these options wou=
ld not be detect mounting a device <br>node with a nonstandard name.<br><br=
>milton<br></font><BR>
