Return-Path: <austenc@us.ibm.com>
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B52D21A0341
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 22:42:51 +1100 (AEDT)
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 26 Feb 2016 04:42:49 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 26 Feb 2016 04:42:47 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 640E03E40030
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 04:42:47 -0700 (MST)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1QBgldr41484386
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 04:42:47 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1QBgkNJ012702
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 04:42:46 -0700
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1QBgkTY012694
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 04:42:46 -0700
Message-Id: <201602261142.u1QBgkTY012694@d03av04.boulder.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 26 Feb 2016 04:42:46 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 26 Feb 2016 04:42:45 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 26 Feb 2016 11:42:44 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 26 Feb 2016 11:42:41 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016022611424058-145719 ;
 Fri, 26 Feb 2016 11:42:40 +0000 
To: "Cyril Bur" <cyrilbur@gmail.com>
In-Reply-To: <20160226164757.0d9ec071@camb691>
Date: Fri, 26 Feb 2016 11:42:40 +0000
From: "Chris Austen" <austenc@us.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid] Fixing the Duplicate registration for
 NetFn [0x6], Cmd:[0xFF]
Cc: "Ratan K Gupta" <ratagupt@in.ibm.com>, "openbmc"
 <openbmc@lists.ozlabs.org>, "OpenBMC Patches" <openbmc-patches@stwcx.xyz>
Importance: Normal
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.10 Build 201602121005_20 on behalf of device with
 id mdmxxIBM_IOS_ApplFFMQ18K3G5MD,
 type 1600 (iosibm) and description iPhone 6:Apple
 iOS 9.2.1:IBM Traveler/9.3.2.20160208
X-KeepSent: 3E995193:AAF18425-00257F65:004054C3;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 52639
X-TNEFEvaluated: 1
Content-Type: multipart/alternative; 
 boundary="----=_Part_67_1016872092.1456486960707"
x-cbid: 16022611-0017-0000-0000-00001280DA98
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0.136802; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004966; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000148; SDB=6.00665195; UDB=6.00303142; UTC=2016-02-26
 11:42:42
x-cbparentid: 16022611-9588-0000-0000-0000022459A4
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
X-List-Received-Date: Fri, 26 Feb 2016 11:42:52 -0000


------=_Part_67_1016872092.1456486960707
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Removal looks good. =0A   =0A    The wildcard function exists in each of th=
e ipmi .so files.  To remove them would be a decision to be discussed beyon=
d the scope of this piece of work.  =0A    =0A    Signed off by Chris auste=
n. <austenc@us.ibm.com>=0A    Sent from my iPhone using IBM Verse=0A  =0A  =
On Feb 25, 2016, 11:48:22 PM, cyrilbur@gmail.com wrote:=0A  =0A  From: cyri=
lbur@gmail.com=0A  To: openbmc-patches@stwcx.xyz=0A  Cc: ratagupt@in.ibm.co=
m, openbmc@lists.ozlabs.org=0A  Date: Feb 25, 2016 11:48:22 PM=0A  Subject:=
 Re: [PATCH phosphor-host-ipmid] Fixing the Duplicate registration for NetF=
n [0x6], Cmd:[0xFF]=0A  =0A  =0A     On Thu, 25 Feb 2016 07:40:36 -0600=0A =
  OpenBMC Patches  wrote:=0A   > From: Ratan Gupta =0A   > =0A   Hi Ratan,=
=0A   Any reason you're not removing ipmi=5Fglobal=5Fwildcard=5Fhandler() a=
s well. I assume=0A   it's now unused...=0A   Thanks,=0A   Cyril=0A   > ---=
=0A   >  globalhandler.C | 5 +----=0A   >  1 file changed, 1 insertion(+), =
4 deletions(-)=0A   > =0A   > diff --git a/globalhandler.C b/globalhandler.=
C=0A   > index e68ea79..25ae26a 100644=0A   > --- a/globalhandler.C=0A   > =
+++ b/globalhandler.C=0A   > @@ -164,8 +164,5 @@ void register=5Fnetfn=5Fgl=
obal=5Ffunctions()=0A   >      printf("Registering NetFn:[0x%X], Cmd:[0x%X]=
\n",NETFUN=5FAPP, IPMI=5FCMD=5FWARM=5FRESET);=0A   >      ipmi=5Fregister=
=5Fcallback(NETFUN=5FAPP, IPMI=5FCMD=5FWARM=5FRESET, NULL, ipmi=5Fglobal=5F=
warm=5Freset);=0A   >  =0A   > -    printf("Registering NetFn:[0x%X], Cmd:[=
0x%X]\n",NETFUN=5FAPP, IPMI=5FCMD=5FWILDCARD);=0A   > -    ipmi=5Fregister=
=5Fcallback(NETFUN=5FAPP, IPMI=5FCMD=5FWILDCARD, NULL, ipmi=5Fglobal=5Fwild=
card=5Fhandler);=0A   > -=0A   > - return;=0A   > +    return;=0A   >  }=0A=
   =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=0A   =
openbmc mailing list=0A   openbmc@lists.ozlabs.org=0A   https://lists.ozlab=
s.org/listinfo/openbmc

------=_Part_67_1016872092.1456486960707
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body><div id=3D"content" contenteditable=3D"true" spellch=
eck=3D"true" autocorrect=3D"true" autocapitalize=3D"true" style=3D"font-fam=
ily: Helvetica;">Removal looks good.&nbsp;<div><br></div><div>The wildcard =
function exists in each of the ipmi .so files. &nbsp;To remove them would b=
e a decision to be discussed beyond the scope of this piece of work. &nbsp;=
</div><div><br></div><div>Signed off by Chris austen. &lt;austenc@us.ibm.co=
m&gt;</div><div><br>Sent from my iPhone using IBM Verse<br><br><hr>On Feb 2=
5, 2016, 11:48:22 PM, cyrilbur@gmail.com wrote:<br><br>From: cyrilbur@gmail=
.com<br>To: openbmc-patches@stwcx.xyz<br>Cc: ratagupt@in.ibm.com, openbmc@l=
ists.ozlabs.org<br>Date: Feb 25, 2016 11:48:22 PM<br>Subject: Re: [PATCH ph=
osphor-host-ipmid] Fixing the Duplicate registration for NetFn [0x6], Cmd:[=
0xFF]<br><br><div id=3D"MaaS360PIMSDKOriginalMessageId">On&nbsp;Thu,&nbsp;2=
5&nbsp;Feb&nbsp;2016&nbsp;07:40:36&nbsp;-0600<br>OpenBMC&nbsp;Patches&nbsp;=
<openbmc-patches@stwcx.xyz>&nbsp;wrote:<br>&gt;&nbsp;From:&nbsp;Ratan&nbsp;=
Gupta&nbsp;<ratagupt@in.ibm.com><br>&gt;&nbsp;<br>Hi&nbsp;Ratan,<br>Any&nbs=
p;reason&nbsp;you're&nbsp;not&nbsp;removing&nbsp;ipmi=5Fglobal=5Fwildcard=
=5Fhandler()&nbsp;as&nbsp;well.&nbsp;I&nbsp;assume<br>it's&nbsp;now&nbsp;un=
used...<br>Thanks,<br>Cyril<br>&gt;&nbsp;---<br>&gt;&nbsp;&nbsp;globalhandl=
er.C&nbsp;|&nbsp;5&nbsp;+----<br>&gt;&nbsp;&nbsp;1&nbsp;file&nbsp;changed,&=
nbsp;1&nbsp;insertion(+),&nbsp;4&nbsp;deletions(-)<br>&gt;&nbsp;<br>&gt;&nb=
sp;diff&nbsp;--git&nbsp;a/globalhandler.C&nbsp;b/globalhandler.C<br>&gt;&nb=
sp;index&nbsp;e68ea79..25ae26a&nbsp;100644<br>&gt;&nbsp;---&nbsp;a/globalha=
ndler.C<br>&gt;&nbsp;+++&nbsp;b/globalhandler.C<br>&gt;&nbsp;@@&nbsp;-164,8=
&nbsp;+164,5&nbsp;@@&nbsp;void&nbsp;register=5Fnetfn=5Fglobal=5Ffunctions()=
<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("Registering&nbsp;NetFn:=
[0x%X],&nbsp;Cmd:[0x%X]\n",NETFUN=5FAPP,&nbsp;IPMI=5FCMD=5FWARM=5FRESET);<b=
r>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fregister=5Fcallback(NETFUN=
=5FAPP,&nbsp;IPMI=5FCMD=5FWARM=5FRESET,&nbsp;NULL,&nbsp;ipmi=5Fglobal=5Fwar=
m=5Freset);<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;print=
f("Registering&nbsp;NetFn:[0x%X],&nbsp;Cmd:[0x%X]\n",NETFUN=5FAPP,&nbsp;IPM=
I=5FCMD=5FWILDCARD);<br>&gt;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fregister=
=5Fcallback(NETFUN=5FAPP,&nbsp;IPMI=5FCMD=5FWILDCARD,&nbsp;NULL,&nbsp;ipmi=
=5Fglobal=5Fwildcard=5Fhandler);<br>&gt;&nbsp;-<br>&gt;&nbsp;-        retur=
n;<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;return;<br>&gt;&nbsp;&nbsp;}<br>=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openb=
mc&nbsp;mailing&nbsp;list<br>openbmc@lists.ozlabs.org<br>https://lists.ozla=
bs.org/listinfo/openbmc<br></ratagupt@in.ibm.com></openbmc-patches@stwcx.xy=
z></div></div></div><BR>
</body></html>

------=_Part_67_1016872092.1456486960707--
