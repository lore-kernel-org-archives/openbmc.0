Return-Path: <austenc@us.ibm.com>
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id CF2A71A003D
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 16:44:54 +1100 (AEDT)
Received: from localhost
 by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 11 Feb 2016 00:44:52 -0500
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 11 Feb 2016 00:44:49 -0500
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id DBBD16E803F
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 00:31:40 -0500 (EST)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1B5imud28770402
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 05:44:48 GMT
Received: from d01av05.pok.ibm.com (localhost [127.0.0.1])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1B5fVlg017737
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 00:41:31 -0500
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d01av05.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1B5fVPc017732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 00:41:31 -0500
Message-Id: <201602110541.u1B5fVPc017732@d01av05.pok.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 11 Feb 2016 00:44:48 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 11 Feb 2016 00:44:46 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 11 Feb 2016 05:44:44 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 11 Feb 2016 05:44:43 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016021105444275-38776 ;
 Thu, 11 Feb 2016 05:44:42 +0000 
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
In-Reply-To: <87io1vq04t.fsf@linux.vnet.ibm.com>
From: "Chris Austen" <austenc@us.ibm.com>
To: stewart@linux.vnet.ibm.com
Cc: andrew@aj.id.au, openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Thu, 11 Feb 2016 05:44:42 +0000
Sensitivity: 
MIME-Version: 1.0
References: <87io1vq04t.fsf@linux.vnet.ibm.com>,
 <1455140430-32605-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455140430-32605-2-git-send-email-openbmc-patches@stwcx.xyz>
 <1455152677.3153.81.camel@aj.id.au>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_02012016_FP2 February 05, 2016
X-LLNOutbound: False
X-Disclaimed: 35739
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16021105-0045-0000-0000-0000034D041F
X-IBM-ISS-SpamDetectors: Score=0.397008; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.397008; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004904; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000143; SDB=6.00658247; UDB=6.00298833; UTC=2016-02-11
 05:44:44
x-cbparentid: 16021105-4778-0000-0000-000001F25EFD
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
X-List-Received-Date: Thu, 11 Feb 2016 05:44:55 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Open an issue to migrate to inet=5Fpton.
<div>&nbsp;</div>
<div>&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" style=3D"border-left:solid =
#aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-right=
:0px" >----- Original message -----<br>From: Stewart Smith &lt;stewart@linu=
x.vnet.ibm.com&gt;<br>Sent by: "openbmc" &lt;openbmc-bounces+austenc=3Dus.i=
bm.com@lists.ozlabs.org&gt;<br>To: andrew@aj.id.au, OpenBMC Patches &lt;ope=
nbmc-patches@stwcx.xyz&gt;, openbmc@lists.ozlabs.org<br>Cc:<br>Subject: Re:=
 [PATCH phosphor-host-ipmid v2] IPMI Get IP Support<br>Date: Wed, Feb 10, 2=
016 11:37 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Andrew Jeffery &lt;andrew@aj.id.au&gt; writes:<br>&gt; I realise this =
has already been merged, but I feel like I should point<br>&gt; out some is=
sues below for future improvements.<br><br>Perhaps unreviewed code shouldn'=
t be merged. Especially considering that<br>there's been so many comments o=
n so many patches in this project.<br><br>--<br>Stewart Smith<br>OPAL Archi=
tect, IBM.<br><br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br><a href=3D=
"https://lists.ozlabs.org/listinfo/openbmc" target=3D"=5Fblank" >https://li=
sts.ozlabs.org/listinfo/openbmc</a></font></div></blockquote></div></div></=
div></div><BR>
