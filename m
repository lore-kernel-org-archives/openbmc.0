Return-Path: <miltonm@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qrYFY5MK2zDqhB
 for <openbmc@lists.ozlabs.org>; Fri, 22 Apr 2016 08:24:17 +1000 (AEST)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 21 Apr 2016 18:24:14 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 21 Apr 2016 18:24:13 -0400
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id BFDD86E8041
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 18:23:57 -0400 (EDT)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3LMOCc237421298
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 22:24:12 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3LMOCA1022192
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 18:24:12 -0400
Received: from d50lp33.co.us.ibm.com (d50lp33.boulder.ibm.com [9.17.249.38])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3LMOBSD022137
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 21 Apr 2016 18:24:12 -0400
Message-Id: <201604212224.u3LMOBSD022137@d01av04.pok.ibm.com>
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 21 Apr 2016 16:24:11 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 21 Apr 2016 16:24:09 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 21 Apr 2016 22:24:08 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 21 Apr 2016 22:24:06 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016042122240570-353921 ;
 Thu, 21 Apr 2016 22:24:05 +0000 
Subject: Re: [PATCH openbmc] Build a tftpboot friendly image.
In-Reply-To: <1461273629-24609-2-git-send-email-openbmc-patches@stwcx.xyz>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: bradleyb@fuzziesquirrel.com
Cc: openbmc@lists.ozlabs.org
Date: Thu, 21 Apr 2016 22:24:05 +0000
Sensitivity: 
MIME-Version: 1.0
References: <1461273629-24609-2-git-send-email-openbmc-patches@stwcx.xyz>,
 <1461273629-24609-1-git-send-email-openbmc-patches@stwcx.xyz>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_04042016_FP6 April 15, 2016
X-LLNOutbound: False
X-Disclaimed: 26883
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16042122-0041-0000-0000-000003F12E9D
X-IBM-ISS-SpamDetectors: Score=0.397008; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.397008; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005185; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000160; SDB=6.00691439; UDB=6.00318745; UTC=2016-04-21
 22:24:06
x-cbparentid: 16042122-5938-0000-0000-0000033ACD90
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
X-List-Received-Date: Thu, 21 Apr 2016 22:24:18 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >While we can do this, I wonder if we sho=
uld encourage the use of the (not quite</div>
<div dir=3D"ltr" >documented) loop mount of the squashfs image via initfs.&=
nbsp; This will load a</div>
<div dir=3D"ltr" >compressed squashfs image in ram unpacked on demand into =
the page cache</div>
<div dir=3D"ltr" >instead of loading the whole fs expanded into the page ca=
che via the ramfs</div>
<div dir=3D"ltr" >(or tmpfs, which doesn't matter without swap) root filesy=
stem.&nbsp;&nbsp; File faults will</div>
<div dir=3D"ltr" >be faster but static overhead will be higher.&nbsp; Hard =
to speculate the dynamic</div>
<div dir=3D"ltr" >footprint without measurement.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >As I mentioned on irc, build an initrd with the image-rof=
s file in initrd /, or</div>
<div dir=3D"ltr" >setup ip=3D and either put the url in either a file in th=
e initramfs or in the</div>
<div dir=3D"ltr" >specified u-boot environment variable (both controlled th=
rough the</div>
<div dir=3D"ltr" >obmc-phosphor-initfs init script).</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >milton</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: OpenBMC Patches &l=
t;openbmc-patches@stwcx.xyz&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+m=
iltonm=3Dus.ibm.com@lists.ozlabs.org&gt;<br>To: openbmc@lists.ozlabs.org<br=
>Cc: Brad Bishop &lt;bradleyb@fuzziesquirrel.com&gt;<br>Subject: [PATCH ope=
nbmc] Build a tftpboot friendly image.<br>Date: Thu, Apr 21, 2016 4:20 PM<b=
r>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >From: Brad Bishop &lt;bradleyb@fuzziesquirrel.com&gt;<br><br>Build a r=
ootfs cpio uimage with everything along with the other<br>images.<br>---<br=
>&nbsp;meta-phosphor/conf/machine/include/obmc-bsp-common.inc | 1 +<br>&nbs=
p;1 file changed, 1 insertion(+)<br><br>diff --git a/meta-phosphor/conf/mac=
hine/include/obmc-bsp-common.inc b/meta-phosphor/conf/machine/include/obmc-=
bsp-common.inc<br>index 60ed088..260cc90 100644<br>--- a/meta-phosphor/conf=
/machine/include/obmc-bsp-common.inc<br>+++ b/meta-phosphor/conf/machine/in=
clude/obmc-bsp-common.inc<br>@@ -14,6 +14,7 @@ UBOOT=5FSUFFIX ?=3D "bin"<br=
>&nbsp;MACHINEOVERRIDES =3D. "openbmc:"<br>&nbsp;<br>&nbsp;IMAGE=5FFSTYPES =
+=3D "overlay"<br>+IMAGE=5FFSTYPES +=3D "cpio.${INITRAMFS=5FCTYPE}.u-boot"<=
br>&nbsp;IMAGE=5FINSTALL +=3D "u-boot-fw-utils"<br>&nbsp;<br>&nbsp;IMAGE=5F=
CLASSES +=3D "obmc-phosphor-image=5Ftypes=5Fuboot"<br>--<br>2.8.1<br><br><b=
r>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>op=
enbmc mailing list<br>openbmc@lists.ozlabs.org<br><a href=3D"https://lists.=
ozlabs.org/listinfo/openbmc" target=3D"=5Fblank" >https://lists.ozlabs.org/=
listinfo/openbmc</a></font></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
