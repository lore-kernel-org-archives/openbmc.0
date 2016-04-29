Return-Path: <austenc@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qxMFT60gSzDqCK
 for <openbmc@lists.ozlabs.org>; Sat, 30 Apr 2016 04:10:53 +1000 (AEST)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 29 Apr 2016 14:10:51 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 29 Apr 2016 14:10:48 -0400
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 5E7FD6E803C
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 14:10:32 -0400 (EDT)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3TIAl6436765708
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 18:10:47 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3TI42wN019514
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 14:04:02 -0400
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u3TI40bc019498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Apr 2016 14:04:01 -0400
Message-Id: <201604291804.u3TI40bc019498@d01av05.pok.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 29 Apr 2016 12:10:46 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 29 Apr 2016 12:10:44 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 29 Apr 2016 18:10:43 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 29 Apr 2016 18:10:41 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016042918104023-358546 ;
 Fri, 29 Apr 2016 18:10:40 +0000 
To: "OpenBMC Patches" <openbmc-patches@stwcx.xyz>
In-Reply-To: <1461951055-23123-2-git-send-email-openbmc-patches@stwcx.xyz>
Date: Fri, 29 Apr 2016 18:10:40 +0000
From: "Chris Austen" <austenc@us.ibm.com>
Subject: Re: [PATCH skeleton] Add BMC Flash dbus object to Palmetto
Cc: "openbmc" <openbmc@lists.ozlabs.org>
Importance: Normal
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.11 Build 201604181250_20 on behalf of device with
 id mdmxxIBM_IOS_ApplFFMQ18K3G5MD,
 type 1600 (iosibm) and description iPhone 6:Apple
 iOS 9.3.1:IBM Traveler/9.3.2.20160208
X-KeepSent: 6F7C2183:626E6267-00257FA4:0063DA8A;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 7755
X-TNEFEvaluated: 1
Content-Type: multipart/alternative; 
 boundary="----=_Part_249_817836223.1461953440090"
x-cbid: 16042918-0041-0000-0000-000004054CAD
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.069297; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005216; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000162; SDB=6.00695090; UDB=6.00320949; UTC=2016-04-29
 18:10:42
x-cbparentid: 16042918-9900-0000-0000-0000077B87CB
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Fri, 29 Apr 2016 18:10:54 -0000


------=_Part_249_817836223.1461953440090
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

This will also be needed f Firestone and garrison.  Is there a concept of a=
 common file?   =0A =0A Sent from my iPhone using IBM Verse=0A =0A On Apr 2=
9, 2016, 12:31:27 PM, openbmc-patches@stwcx.xyz wrote:=0A =0A From: openbmc=
-patches@stwcx.xyz=0A To: openbmc@lists.ozlabs.org=0A Cc: =0A Date: Apr 29,=
 2016 12:31:27 PM=0A Subject: [PATCH skeleton] Add BMC Flash dbus object to=
 Palmetto=0A =0A =0A   From: Adriana Kobylak =0A  Add the BMC Flash dbus ob=
ject to Palmetto.py to expose interfaces=0A  to flash the BMC. Without it, =
there are no interfaces to flash BMC=0A  from REST. This change is already =
in Barreleye, just porting to Palmetto.=0A  ---=0A  bin/Palmetto.py | 6 +++=
+++=0A  1 file changed, 6 insertions(+)=0A  diff --git a/bin/Palmetto.py b/=
bin/Palmetto.py=0A  index 7172364..512a2ca 100755=0A  --- a/bin/Palmetto.py=
=0A  +++ b/bin/Palmetto.py=0A  @@ -123,6 +123,12 @@ APPS =3D {=0A   'monito=
r=5Fprocess' : True,=0A   'process=5Fname'    : 'flash=5Fbios.exe',=0A   },=
=0A  + 'bmc=5Fflash=5Fcontrol' : {=0A  + 'system=5Fstate'    : 'BMC=5FSTART=
ING',=0A  + 'start=5Fprocess'   : True,=0A  + 'monitor=5Fprocess' : True,=
=0A  + 'process=5Fname'    : 'bmc=5Fupdate.py',=0A  + },=0A   'download=5Fm=
anager' : {=0A   'system=5Fstate'    : 'BMC=5FSTARTING',=0A   'start=5Fproc=
ess'   : True,=0A  -- =0A  2.8.1=0A  =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=0A  openbmc mailing list=0A  openbmc@lists.o=
zlabs.org=0A  https://lists.ozlabs.org/listinfo/openbmc

------=_Part_249_817836223.1461953440090
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body><div id=3D"content" contenteditable=3D"true" spellch=
eck=3D"true" autocorrect=3D"true" autocapitalize=3D"true" style=3D"font-fam=
ily: Helvetica;">This will also be needed f Firestone and garrison. &nbsp;I=
s there a concept of a common file? &nbsp;&nbsp;<br><br>Sent from my iPhone=
 using IBM Verse<br><br><hr>On Apr 29, 2016, 12:31:27 PM, openbmc-patches@s=
twcx.xyz wrote:<br><br>From: openbmc-patches@stwcx.xyz<br>To: openbmc@lists=
.ozlabs.org<br>Cc: <br>Date: Apr 29, 2016 12:31:27 PM<br>Subject: [PATCH sk=
eleton] Add BMC Flash dbus object to Palmetto<br><br><div id=3D"MaaS360PIMS=
DKOriginalMessageId">From:&nbsp;Adriana&nbsp;Kobylak&nbsp;<anoo@us.ibm.com>=
<br>Add&nbsp;the&nbsp;BMC&nbsp;Flash&nbsp;dbus&nbsp;object&nbsp;to&nbsp;Pal=
metto.py&nbsp;to&nbsp;expose&nbsp;interfaces<br>to&nbsp;flash&nbsp;the&nbsp=
;BMC.&nbsp;Without&nbsp;it,&nbsp;there&nbsp;are&nbsp;no&nbsp;interfaces&nbs=
p;to&nbsp;flash&nbsp;BMC<br>from&nbsp;REST.&nbsp;This&nbsp;change&nbsp;is&n=
bsp;already&nbsp;in&nbsp;Barreleye,&nbsp;just&nbsp;porting&nbsp;to&nbsp;Pal=
metto.<br>---<br>bin/Palmetto.py&nbsp;|&nbsp;6&nbsp;++++++<br>1&nbsp;file&n=
bsp;changed,&nbsp;6&nbsp;insertions(+)<br>diff&nbsp;--git&nbsp;a/bin/Palmet=
to.py&nbsp;b/bin/Palmetto.py<br>index&nbsp;<a dir=3D"ltr" href=3D"tel:71723=
64" x-apple-data-detectors=3D"true" x-apple-data-detectors-type=3D"telephon=
e" x-apple-data-detectors-result=3D"3">7172364</a>..512a2ca&nbsp;100755<br>=
---&nbsp;a/bin/Palmetto.py<br>+++&nbsp;b/bin/Palmetto.py<br>@@&nbsp;-123,6&=
nbsp;+123,12&nbsp;@@&nbsp;APPS&nbsp;=3D&nbsp;{<br>                'monitor=
=5Fprocess'&nbsp;:&nbsp;True,<br>                'process=5Fname'&nbsp;&nbs=
p;&nbsp;&nbsp;:&nbsp;'flash=5Fbios.exe',<br>        },<br>+        'bmc=5Ff=
lash=5Fcontrol'&nbsp;:&nbsp;{<br>+                'system=5Fstate'&nbsp;&nb=
sp;&nbsp;&nbsp;:&nbsp;'BMC=5FSTARTING',<br>+                'start=5Fproces=
s'&nbsp;&nbsp;&nbsp;:&nbsp;True,<br>+                'monitor=5Fprocess'&nb=
sp;:&nbsp;True,<br>+                'process=5Fname'&nbsp;&nbsp;&nbsp;&nbsp=
;:&nbsp;'bmc=5Fupdate.py',<br>+        },<br>        'download=5Fmanager'&n=
bsp;:&nbsp;{<br>                'system=5Fstate'&nbsp;&nbsp;&nbsp;&nbsp;:&n=
bsp;'BMC=5FSTARTING',<br>                'start=5Fprocess'&nbsp;&nbsp;&nbsp=
;:&nbsp;True,<br>--&nbsp;<br>2.8.1<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc&nbsp;mailing&nbsp;list<br>openbmc=
@lists.ozlabs.org<br>https://lists.ozlabs.org/listinfo/openbmc<br></anoo@us=
.ibm.com></div></div><BR>
</body></html>

------=_Part_249_817836223.1461953440090--
