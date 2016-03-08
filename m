Return-Path: <austenc@us.ibm.com>
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A83861A00BC
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 04:34:06 +1100 (AEDT)
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 8 Mar 2016 10:34:02 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 Mar 2016 10:33:59 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 60E5319D8040
 for <openbmc@lists.ozlabs.org>; Tue,  8 Mar 2016 10:21:54 -0700 (MST)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u28HXw3d23658514
 for <openbmc@lists.ozlabs.org>; Tue, 8 Mar 2016 17:33:58 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u28HTVNh000703
 for <openbmc@lists.ozlabs.org>; Tue, 8 Mar 2016 12:29:31 -0500
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u28HTT3E000677
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 8 Mar 2016 12:29:30 -0500
Message-Id: <201603081729.u28HTT3E000677@d01av05.pok.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 8 Mar 2016 10:33:56 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 8 Mar 2016 10:33:53 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 8 Mar 2016 17:33:49 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 8 Mar 2016 17:33:47 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016030817334646-364890 ;
 Tue, 8 Mar 2016 17:33:46 +0000 
Subject: Re: [PATCH phosphor-host-ipmid v2] DCMI GET_POWER_LEVEL bad return
 code
In-Reply-To: <1457453438-9977-2-git-send-email-openbmc-patches@stwcx.xyz>
From: "Chris Austen" <austenc@us.ibm.com>
To: openbmc-patches@stwcx.xyz
Cc: nkskjames@gmail.com, openbmc@lists.ozlabs.org
Date: Tue, 8 Mar 2016 17:33:46 +0000
Sensitivity: 
MIME-Version: 1.0
References: <1457453438-9977-2-git-send-email-openbmc-patches@stwcx.xyz>,
 <1457453438-9977-1-git-send-email-openbmc-patches@stwcx.xyz>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_02222016_FP4 March 02, 2016
X-LLNOutbound: False
X-Disclaimed: 14707
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16030817-0029-0000-0000-0000114975F5
X-IBM-ISS-SpamDetectors: Score=0.4332; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.4332; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005011; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000150; SDB=6.00670462; UDB=6.00306292; UTC=2016-03-08
 17:33:48
x-cbparentid: 16030817-9900-0000-0000-000006870ADB
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
X-List-Received-Date: Tue, 08 Mar 2016 17:34:07 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >if you make this a success (which really=
 should be IPMI=5FOK=5FCC) are there other response bytes that are expected=
 to be valid?
<div>&nbsp;</div>
<div><a href=3D"http://www.intel.com/content/dam/www/public/us/en/documents=
/technical-specifications/dcmi-v1-5-rev-spec.pdf" >http://www.intel.com/con=
tent/dam/www/public/us/en/documents/technical-specifications/dcmi-v1-5-rev-=
spec.pdf</a>&nbsp;&nbsp; page 43&nbsp; shows a lot of bytes that need a val=
ue now that you returned success.&nbsp; Don't drop the code until you added=
 those response bytes

<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" style=3D"border-left:solid =
#aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-right=
:0px" >----- Original message -----<br>From: OpenBMC Patches &lt;openbmc-pa=
tches@stwcx.xyz&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+austenc=3Dus.=
ibm.com@lists.ozlabs.org&gt;<br>To: openbmc@lists.ozlabs.org<br>Cc: Norman =
James &lt;nkskjames@gmail.com&gt;<br>Subject: [PATCH phosphor-host-ipmid v2=
] DCMI GET=5FPOWER=5FLEVEL bad return code<br>Date: Tue, Mar 8, 2016 11:02 =
AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >From: Norman James &lt;njames@us.ibm.com&gt;<br><br>This function uses=
 static data and should always<br>return a good return code. &nbsp;This was=
 causing OCC<br>not to start.<br><br>Signed-off-by: Norman James &lt;nkskja=
mes@gmail.com&gt;<br>---<br>&nbsp;dcmihandler.C | 3 +--<br>&nbsp;1 file cha=
nged, 1 insertion(+), 2 deletions(-)<br><br>diff --git a/dcmihandler.C b/dc=
mihandler.C<br>index fafebdc..5e7d879 100644<br>--- a/dcmihandler.C<br>+++ =
b/dcmihandler.C<br>@@ -11,7 +11,7 @@ ipmi=5Fret=5Ft ipmi=5Fdcmi=5Fget=5Fpow=
er=5Flimit(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&nbsp;&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response=
,<br>&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipmi=5Fdata=5Flen=5Ft data=5Flen, =
ipmi=5Fcontext=5Ft context)<br>&nbsp;{<br>- &nbsp; &nbsp;ipmi=5Fret=5Ft rc =
=3D IPMI=5FDCMI=5FCC=5FNO=5FACTIVE=5FPOWER=5FLIMIT;<br>+ &nbsp; &nbsp;ipmi=
=5Fret=5Ft rc =3D 0;<br>&nbsp;<br>&nbsp;&nbsp; &nbsp; // dcmi-v1-5-rev-spec=
.pdf 6.6.2. &nbsp;<br>&nbsp;&nbsp; &nbsp; // This is good enough for OpenBM=
C support for OpenPOWER based systems<br>@@ -37,4 +37,3 @@ void register=5F=
netfn=5Fdcmi=5Ffunctions()<br>&nbsp;&nbsp; &nbsp; ipmi=5Fregister=5Fcallbac=
k(NETFUN=5FGRPEXT, IPMI=5FCMD=5FDCMI=5FGET=5FPOWER, NULL, ipmi=5Fdcmi=5Fget=
=5Fpower=5Flimit);<br>&nbsp;&nbsp; &nbsp; return;<br>&nbsp;}<br>-// 956379<=
br>\ No newline at end of file<br>--<br>2.7.1<br><br><br>=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br=
>openbmc@lists.ozlabs.org<br><a href=3D"https://lists.ozlabs.org/listinfo/o=
penbmc" target=3D"=5Fblank" >https://lists.ozlabs.org/listinfo/openbmc</a><=
/font></div></blockquote></div></div></div></div><BR>
