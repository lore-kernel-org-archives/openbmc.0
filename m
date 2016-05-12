Return-Path: <austenc@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r5KdN3Wd7zDqCK
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2016 03:25:44 +1000 (AEST)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 12 May 2016 13:25:41 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 12 May 2016 13:25:40 -0400
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id 922CC6E8040
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 13:25:23 -0400 (EDT)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u4CHPda743778230
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 17:25:39 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u4CHPdaS012696
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 13:25:39 -0400
Received: from d50lp32.co.us.ibm.com (d50lp32.boulder.ibm.com [9.17.249.36])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u4CHPaWR012589
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2016 13:25:38 -0400
Message-Id: <201605121725.u4CHPaWR012589@d01av03.pok.ibm.com>
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 12 May 2016 11:25:36 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.90)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 12 May 2016 11:25:35 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Thu, 12 May 2016 17:25:34 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 12 May 2016 17:25:33 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016051217253241-400300 ;
 Thu, 12 May 2016 17:25:32 +0000 
Subject: Re: [PATCH 6/6] net/phy: Expose 100base-T capability only
In-Reply-To: <201605091951.u49Jp5Qm023020@d03av04.boulder.ibm.com>
From: "Chris Austen" <austenc@us.ibm.com>
To: "Sertac Cakici" <cakici@us.ibm.com>
Cc: benh@ozlabs.au.ibm.com, cyrilbur@gmail.com, gwshan@linux.vnet.ibm.com,
 openbmc@lists.ozlabs.org, "Raguraman Tumaati-Krishnan" <ragu@us.ibm.com>
Date: Thu, 12 May 2016 17:25:32 +0000
Sensitivity: 
MIME-Version: 1.0
References: <201605091951.u49Jp5Qm023020@d03av04.boulder.ibm.com>,
 <1462411636-7225-1-git-send-email-cyrilbur@gmail.com>
 <1462411636-7225-7-git-send-email-cyrilbur@gmail.com>
 <CACPK8XcK3PN01EiNOx8+v5x6f=UOf7A4QnMAZ8D3bnX+vqAuzg@mail.gmail.com>
 <1462496402.20290.49.camel@au1.ibm.com> <20160506113218.4adf5db7@camb691>
 <1462578052.20290.61.camel@au1.ibm.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_04252016_FP3 May 03, 2016
X-LLNOutbound: False
X-Disclaimed: 17627
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16051217-0041-0000-0000-0000041D45B2
X-IBM-ISS-SpamDetectors: Score=0.397008; BY=0.034715; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.397008; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005273; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000166; SDB=6.00701175; UDB=6.00324606; UTC=2016-05-12
 17:25:34
x-cbparentid: 16051217-7792-0000-0000-0000038018E9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
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
X-List-Received-Date: Thu, 12 May 2016 17:25:46 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Before they wake up for the day can you =
make sure it has remote power control.&nbsp; Hard to AC cycle from Australi=
a.
<div>&nbsp;</div>
<div>&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote data-history-content-modified=3D"1" style=3D"border-left:solid =
#aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-right=
:0px" >----- Original message -----<br>From: Sertac Cakici/Austin/IBM@IBMUS=
<br>Sent by: "openbmc" &lt;openbmc-bounces+austenc=3Dus.ibm.com@lists.ozlab=
s.org&gt;<br>To: benh@ozlabs.au.ibm.com, Raguraman Tumaati-Krishnan/Austin/=
Contr/IBM@IBMUS<br>Cc: OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;, C=
yril Bur &lt;cyrilbur@gmail.com&gt;, Gavin Shan &lt;gwshan@linux.vnet.ibm.c=
om&gt;<br>Subject: Re: [PATCH 6/6] net/phy: Expose 100base-T capability onl=
y<br>Date: Thu, May 12, 2016 10:51 AM<br>&nbsp;<br><font face=3D"sans-serif=
" size=3D"2" >Ragu has let us borrow his system. It's GA level HW.</font><b=
r><br><font face=3D"sans-serif" size=3D"2" >BMC: fr999.aus.stglabs.ibm.com<=
/font><br><font face=3D"sans-serif" size=3D"2" >Ubuntu: fr999p01.aus.stglab=
s.ibm.com</font><br><br><font face=3D"sans-serif" size=3D"2" >Serta=C3=A7<b=
r>=E5=8F=B2=E5=A1=94=E5=A5=87</font><br><br><br><br><br><font face=3D"sans-=
serif" color=3D"#5f5f5f" size=3D"1" >From: &nbsp; &nbsp; &nbsp; &nbsp;</fon=
t><font face=3D"sans-serif" size=3D"1" >Benjamin Herrenschmidt &lt;benh@au1=
.ibm.com&gt;</font><br><font face=3D"sans-serif" color=3D"#5f5f5f" size=3D"=
1" >To: &nbsp; &nbsp; &nbsp; &nbsp;</font><font face=3D"sans-serif" size=3D=
"1" >Cyril Bur &lt;cyrilbur@gmail.com&gt;</font><br><font face=3D"sans-seri=
f" color=3D"#5f5f5f" size=3D"1" >Cc: &nbsp; &nbsp; &nbsp; &nbsp;</font><fon=
t face=3D"sans-serif" size=3D"1" >Joel Stanley &lt;joel@jms.id.au&gt;, Open=
BMC Maillist &lt;openbmc@lists.ozlabs.org&gt;, Gavin Shan &lt;gwshan@linux.=
vnet.ibm.com&gt;, Sertac Cakici/Austin/IBM@IBMUS</font><br><font face=3D"sa=
ns-serif" color=3D"#5f5f5f" size=3D"1" >Date: &nbsp; &nbsp; &nbsp; &nbsp;</=
font><font face=3D"sans-serif" size=3D"1" >05/06/2016 06:42 PM</font><br><f=
ont face=3D"sans-serif" color=3D"#5f5f5f" size=3D"1" >Subject: &nbsp; &nbsp=
; &nbsp; &nbsp;</font><font face=3D"sans-serif" size=3D"1" >Re: [PATCH 6/6]=
 net/phy: Expose 100base-T capability only</font>
<hr noshade=3D"noshade" ><br><br><br><tt><font face=3D"" size=3D"3" >On Fri=
, 2016-05-06 at 11:32 +1000, Cyril Bur wrote:<br>&gt;&nbsp;<br>&gt; This is=
 something I'm trying to confirm. The firestones I and Gavin<br>&gt; have a=
ccess to appear to be prerelease, so anythings possible.<br>&gt;<br>&gt; I =
am struggling to get access to a release firestone, when I do I'll<br>&gt; =
check if Gavins patch is necessary there. If so, then we'll have to<br>&gt;=
 start asking those sorts of questions.<br><br>So I talked to Sertac and he=
'll get you access to a GA level Firestone<br>next week. It should be wired=
 as proper RGMII, ie, it shoul work...<br><br>Cheers,<br>Ben.</font></tt><b=
r><br><br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br=
>openbmc mailing list<br>openbmc@lists.ozlabs.org<br><a href=3D"https://lis=
ts.ozlabs.org/listinfo/openbmc" target=3D"=5Fblank" >https://lists.ozlabs.o=
rg/listinfo/openbmc</a></font></div></blockquote></div></div></div></div><B=
R>
