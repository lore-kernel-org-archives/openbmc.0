Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rcXZR2CXZzDqmM
 for <openbmc@lists.ozlabs.org>; Sun, 26 Jun 2016 10:12:31 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5Q08vlh141276
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:28 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23snxsfyq9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 20:12:28 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 25 Jun 2016 18:12:28 -0600
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Sat, 25 Jun 2016 18:12:26 -0600
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id C2B513E4003E
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 18:12:25 -0600 (MDT)
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5Q0CPJu51707908
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 17:12:25 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D3A7136046
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 18:12:25 -0600 (MDT)
Received: from d50lp33.co.us.ibm.com (unknown [9.17.249.38])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS id 8795313603C
 for <openbmc@lists.ozlabs.org>; Sat, 25 Jun 2016 18:12:25 -0600 (MDT)
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sat, 25 Jun 2016 18:12:25 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Sat, 25 Jun 2016 18:12:23 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Sun, 26 Jun 2016 00:12:22 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Sun, 26 Jun 2016 00:12:20 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016062600121972-190642 ;
 Sun, 26 Jun 2016 00:12:19 +0000 
In-Reply-To: <1466662295.23740.79.camel@aj.id.au>
Subject: Re: [PATCH openbmc v6 16/18] initfs: update: handle no images to
 update
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Sun, 26 Jun 2016 00:12:19 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1466662295.23740.79.camel@aj.id.au>,
 <20160623003038.2361-1-openbmc-patches@stwcx.xyz>
 <20160623003038.2361-17-openbmc-patches@stwcx.xyz>
X-Mailer: Lotus Domino Web Server Build V851SAAS_06062016_FP3.1 June 14, 2016
X-LLNOutbound: False
X-Disclaimed: 63887
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16062600-0012-0000-0000-0000100646DE
X-IBM-ISS-SpamDetectors: Score=0.373977; BY=0.034711; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.373977; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005430; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00721549; UDB=6.00336905; UTC=2016-06-26
 00:12:20
x-cbparentid: 16062600-7792-0000-0000-0000043F86C4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFB254FE20.F4AE1E82-ON00257FDC.007FC408-00257FDE.000120E1@notes.na.collabserv.com>
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
X-List-Received-Date: Sun, 26 Jun 2016 00:12:31 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br>On 06/23/2016 01:11AM Andrew Jeffery wrote:<br>&gt;<br>&gt;On We=
d, 2016-06-22 at 19:30 -0500, OpenBMC Patches wrote:<br>&gt;&gt; From: Milt=
on Miller &lt;<a target=3D"=5Fblank" href=3D"mailto:miltonm@us.ibm.com">mil=
tonm@us.ibm.com</a>&gt;<br>&gt;&gt; <br>&gt;&gt; Notify the user if image w=
ildcard expansion fails instead of<br>&gt;printing<br>&gt;&gt; message abou=
t failing to find partition to flash.<br>&gt;&gt; <br>&gt;<br>&gt;This kind=
 of problem is why I have reservations about our early/late<br>&gt;shell sc=
ripts. I wonder how many more of these issues are lurking...<br>&gt;<br>&gt=
;&gt; The update script errors with the message that it can't figure out<br=
>&gt;what<br>&gt;&gt; partition to flash for /run/initramfs/image-* if ther=
e are no<br>&gt;images<br>&gt;&gt; pending.<br>&gt;&gt; <br>&gt;&gt; Signed=
-off-by: Milton Miller &lt;<a target=3D"=5Fblank" href=3D"mailto:miltonm@us=
.ibm.com">miltonm@us.ibm.com</a>&gt;<br>&gt;&gt; ---<br>&gt;&gt; &nbsp;.../=
obmc-phosphor-initfs/files/obmc-update.sh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 13<br>&gt;+++++++=
++++--<br>&gt;&gt; &nbsp;1 file changed, 11 insertions(+), 2 deletions(-)<b=
r>&gt;&gt; <br>&gt;&gt; diff --git<br>&gt;a/meta-phosphor/common/recipes-ph=
osphor/obmc-phosphor-initfs/files/ob<br>&gt;mc-update.sh<br>&gt;b/meta-phos=
phor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob<br>&gt;mc-update=
.sh<br>&gt;&gt; index 1dbf65f..7120a18 100755<br>&gt;&gt; ---<br>&gt;a/meta=
-phosphor/common/recipes-phosphor/obmc-phosphor-initfs/files/ob<br>&gt;mc-u=
pdate.sh<br>&gt;&gt; +++<br>&gt;b/meta-phosphor/common/recipes-phosphor/obm=
c-phosphor-initfs/files/ob<br>&gt;mc-update.sh<br>&gt;&gt; @@ -99,6 +99,7 @=
@ checkmount=3Dy<br>&gt;&gt; &nbsp;whitelist=3D/run/initramfs/whitelist<br>=
&gt;&gt; &nbsp;image=3D/run/initramfs/image-<br>&gt;&gt; &nbsp;E=3D"ERROR:"=
<br>&gt;&gt; +imglist=3D<br>&gt;&gt; &nbsp;<br>&gt;&gt; &nbsp;while test "$=
1" !=3D "${1#-}"<br>&gt;&gt; &nbsp;do<br>&gt;&gt; @@ -184,7 +185,15 @@ then=
<br>&gt;&gt; &nbsp;        fi<br>&gt;&gt; &nbsp;fi<br>&gt;&gt; &nbsp;<br>&g=
t;&gt; -for f in $image*<br>&gt;&gt; +imglist=3D$(echo $image*)<br>&gt;<br>=
&gt;If there are no wildcard matches doesn't this expand to the string<br>&=
gt;"/run/initramfs/image-*"? Why are we using echo in a subshell?<br>&gt;<b=
r><br>Because that causes path expansion to be performed before<br>assignin=
g the output to the parameter.<br><br>&gt;&gt; +if test "$imglist" =3D "$im=
age*" -a ! -e "$imglist"<br>&gt;<br>&gt;What's the idea behind the first co=
ndition ("imglist" =3D "$image*")?<br>&gt;Won't they always be the same?<br=
>&gt;<br><br>No, because parameter splitting and path expansion are<br>supp=
ressed by the double quotes here but path expansion<br>occurred in the echo=
 above.<br><br>One could argue the image name * should not be used and<br>s=
uppress the second condition.<br><br>&gt;&gt; +then<br>&gt;&gt; +        # =
shell didn't expand the wildcard, so no files exist<br>&gt;&gt; +        ec=
ho "No images found to update."<br>&gt;<br>&gt;Is this worthy of the ERROR:=
 prefix?<br>&gt;<br><br>I decided ERROR only gets used for error level to s=
tderr,<br>while this is a warning or just a notice to stdout.<br><br>&gt;&g=
t; +        imglist=3D<br><br>If * is not expanded the imglist variable is =
cleared here.<br><br>&gt;&gt; +fi<br>&gt;&gt; +<br>&gt;&gt; +for f in $imgl=
ist<br>&gt;<br>&gt;If imglist is empty don't we run into the same issue wit=
h findmtd,<br>&gt;just<br>&gt;that we have printed the warning above? Shoul=
d we exit?<br>&gt;<br><br>No because it got cleared in the the clause above=
.&nbsp; I am<br>adding this feature so in the future I don't have to touch<=
br>an image-name (creating an empty file and getting that<br>notice instead=
) to get to the restore and copy files phase<br>in a future update to init =
(see the clean-rwfs-filesystem<br>section there), but feel its more user-fr=
iendly overall.<br><br>Hope this helps,<br>milton<br></font><BR>
