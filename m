Return-Path: <austenc@us.ibm.com>
Received: from e39.co.us.ibm.com (e39.co.us.ibm.com [32.97.110.160])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D01C1A03D4
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 07:18:18 +1100 (AEDT)
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 2 Nov 2015 13:18:16 -0700
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e39.co.us.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 2 Nov 2015 13:18:14 -0700
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 38DE5C90048
 for <openbmc@lists.ozlabs.org>; Mon,  2 Nov 2015 15:06:24 -0500 (EST)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tA2KIDYm64684072
 for <openbmc@lists.ozlabs.org>; Mon, 2 Nov 2015 20:18:13 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tA2KIDdW014771
 for <openbmc@lists.ozlabs.org>; Mon, 2 Nov 2015 15:18:13 -0500
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tA2KIC3a014724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Mon, 2 Nov 2015 15:18:12 -0500
Message-Id: <201511022018.tA2KIC3a014724@d01av03.pok.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 2 Nov 2015 15:18:12 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 2 Nov 2015 15:18:10 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 2 Nov 2015 20:18:09 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 2 Nov 2015 20:18:07 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2015110220182450-521934 ;
 Mon, 2 Nov 2015 20:18:24 +0000 
Subject: Re: [PATCH openbmc] stop the build break for btbridge on qemu
In-Reply-To: <20151102144330.GQ31364@asimov.austin.ibm.com>
From: "Chris Austen" <austenc@us.ibm.com>
To: patrick@stwcx.xyz
Cc: openbmc@lists.ozlabs.org, patches@stwcx.xyz
Date: Mon, 2 Nov 2015 20:18:06 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20151102144330.GQ31364@asimov.austin.ibm.com>,
 <1446469915-23163-1-git-send-email-patches@stwcx.xyz>
 <1446469915-23163-2-git-send-email-patches@stwcx.xyz>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_10192015_FP1 October 21, 2015
X-LLNOutbound: False
X-Disclaimed: 53775
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 15110220-0033-0000-0000-000006AD662C
X-IBM-ISS-SpamDetectors: Score=0.397008; BY=0.020757; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.397008; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004561; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000120; SDB=6.00611736; UDB=6.00270279; UTC=2015-11-02
 20:18:08
x-cbparentid: 15110220-7792-0000-0000-000000B4C117
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
X-List-Received-Date: Mon, 02 Nov 2015 20:18:18 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >for the sample.inc files yes.&nbsp; Barr=
eleye and Palmetto do not use sample.inc
<div>&nbsp;</div>
<div>&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" style=3D"border-left:solid =
#aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-right=
:0px" contenteditable=3D"false" >----- Original message -----<br>From: Patr=
ick Williams &lt;patrick@stwcx.xyz&gt;<br>Sent by: "openbmc" &lt;openbmc-bo=
unces+austenc=3Dus.ibm.com@lists.ozlabs.org&gt;<br>To: OpenBMC Patches &lt;=
patches@stwcx.xyz&gt;<br>Cc: openbmc@lists.ozlabs.org<br>Subject: Re: [PATC=
H openbmc] stop the build break for btbridge on qemu<br>Date: Mon, Nov 2, 2=
015 8:43 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Mon, Nov 02, 2015 at 07:11:55AM -0600, OpenBMC Patches wrote:<br>&g=
t; From: Chris Austen &lt;austenc@us.ibm.com&gt;<br>&gt;<br>&gt; btbridge i=
s not even part of the qemu image<br>&gt; ---<br>&gt; &nbsp;meta-phosphor/c=
onf/machine/include/sample.inc | 3 +--<br>&gt; &nbsp;1 file changed, 1 inse=
rtion(+), 2 deletions(-)<br>&gt;<br>&gt; diff --git a/meta-phosphor/conf/ma=
chine/include/sample.inc b/meta-phosphor/conf/machine/include/sample.inc<br=
>&gt; index 2b8f986..e71b85f 100644<br>&gt; --- a/meta-phosphor/conf/machin=
e/include/sample.inc<br>&gt; +++ b/meta-phosphor/conf/machine/include/sampl=
e.inc<br>&gt; @@ -20,8 +20,7 @@ VIRTUAL-RUNTIME=5Fobmc-phosphor-flash-ctl =
=3D " \<br>&gt; &nbsp;VIRTUAL-RUNTIME=5Fobmc-phosphor-ipmi-parsers =3D " \<=
br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;host-ipmid-oem \<br>&gt; &nbsp; &=
nbsp; &nbsp; &nbsp; "<br>&gt; -<br>&gt; -PREFERRED=5FPROVIDER=5Fvirtual/obm=
c-phosphor-host-ipmi-hw ?=3D "host-ipmi-hw-example"<br>&gt; +PREFERRED=5FPR=
OVIDER=5Fvirtual/obmc-phosphor-host-ipmi-hw =3D "host-ipmi-hw-example"<br>&=
gt; &nbsp;PREFERRED=5FPROVIDER=5Fvirtual/obmc-phosphor-chassis-mgmt =3D "ob=
mc-phosphor-chassisd"<br>&gt; &nbsp;PREFERRED=5FPROVIDER=5Fvirtual/obmc-pho=
sphor-event-mgmt =3D "obmc-phosphor-eventd"<br>&gt; &nbsp;PREFERRED=5FPROVI=
DER=5Fvirtual/obmc-phosphor-fan-mgmt =3D "obmc-phosphor-fand"<br>&gt; --<br=
>&gt; 2.6.0<br>&gt;<br>&gt;<br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; openbmc@li=
sts.ozlabs.org<br>&gt; <a href=3D"https://lists.ozlabs.org/listinfo/openbmc=
" target=3D"=5Fblank" >https://lists.ozlabs.org/listinfo/openbmc</a><br><br=
>Brad,<br><br>Can you confirm this? &nbsp;It doesn't look correct to me.<br=
><br>The qemu system doesn't have the BT hardware, so we shouldn't be<br>in=
stalling the 'btbridge' application. &nbsp;I think we were going to use the=
<br>test application (host-ipmi-hw-example?).<br><br>This change is implyin=
g to me that we should use host-ipmi-hw-example<br>everywhere which is cert=
ainly not correct.<br><br>--<br>Patrick Williams</font></div>
<div id=3D"MIMEAttachInfoDiv" style=3D"display:none" title=3D"pgp-signature=
|signature.asc" >&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br=
>openbmc mailing list<br>openbmc@lists.ozlabs.org<br><a href=3D"https://lis=
ts.ozlabs.org/listinfo/openbmc" target=3D"=5Fblank" >https://lists.ozlabs.o=
rg/listinfo/openbmc</a></font></div></blockquote></div></div></div></div><B=
R>
