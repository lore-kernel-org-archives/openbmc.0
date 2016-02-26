Return-Path: <austenc@us.ibm.com>
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B8AF21A04B8
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 22:50:50 +1100 (AEDT)
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 26 Feb 2016 04:50:48 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 26 Feb 2016 04:50:38 -0700
X-IBM-Helo: d03dlp02.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 1B8E23E40041
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 04:50:38 -0700 (MST)
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u1QBoce837159152
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 04:50:38 -0700
Received: from d03av02.boulder.ibm.com (localhost [127.0.0.1])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u1QBobGx008421
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 04:50:37 -0700
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d03av02.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u1QBobxv008407
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Fri, 26 Feb 2016 04:50:37 -0700
Message-Id: <201602261150.u1QBobxv008407@d03av02.boulder.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 26 Feb 2016 04:50:37 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.67)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 26 Feb 2016 04:50:34 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Fri, 26 Feb 2016 11:50:34 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.16) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 26 Feb 2016 11:50:32 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016022611503199-151377 ;
 Fri, 26 Feb 2016 11:50:31 +0000 
To: "Chris Austen" <austenc@us.ibm.com>
In-Reply-To: <201602261142.u1QBgkTY012694@d03av04.boulder.ibm.com>
Date: Fri, 26 Feb 2016 11:50:32 +0000
From: "Chris Austen" <austenc@us.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid] Fixing the Duplicate registration for
 NetFn [0x6], Cmd:[0xFF]
Cc: "Ratan K Gupta" <ratagupt@in.ibm.com>, "openbmc"
 <openbmc@lists.ozlabs.org>, "OpenBMC Patches" <openbmc-patches@stwcx.xyz>,
 "Cyril Bur" <cyrilbur@gmail.com>
Importance: Normal
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.10 Build 201602121005_20 on behalf of device with
 id mdmxxIBM_IOS_ApplFFMQ18K3G5MD,
 type 1600 (iosibm) and description iPhone 6:Apple
 iOS 9.2.1:IBM Traveler/9.3.2.20160208
X-KeepSent: 3139B75D:9B4F0A7F-00257F65:00410D2F;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 63851
X-TNEFEvaluated: 1
Content-Type: multipart/alternative; 
 boundary="----=_Part_69_2042067383.1456487432511"
x-cbid: 16022611-0013-0000-0000-00001D3D890A
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0.020276; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004966; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000148; SDB=6.00665198; UDB=6.00303143; UTC=2016-02-26
 11:50:33
x-cbparentid: 16022611-5938-0000-0000-000002337412
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
X-List-Received-Date: Fri, 26 Feb 2016 11:50:51 -0000


------=_Part_69_2042067383.1456487432511
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Ah shoot yes Cyril is correct delete the function =0A =0A Sent from my iPho=
ne using IBM Verse=0A =0A On Feb 26, 2016, 5:43:07 AM, austenc@us.ibm.com w=
rote:=0A =0A From: austenc@us.ibm.com=0A To: cyrilbur@gmail.com=0A Cc: rata=
gupt@in.ibm.com, openbmc@lists.ozlabs.org, openbmc-patches@stwcx.xyz=0A Dat=
e: Feb 26, 2016 5:43:07 AM=0A Subject: Re: [PATCH phosphor-host-ipmid] Fixi=
ng the Duplicate registration for NetFn [0x6], Cmd:[0xFF]=0A =0A =0A      R=
emoval looks good. =0A       =0A          The wildcard function exists in e=
ach of the ipmi .so files.  To remove them would be a decision to be discus=
sed beyond the scope of this piece of work.  =0A          =0A          Sign=
ed off by Chris austen. <austenc@us.ibm.com>=0A          Sent from my iPhon=
e using IBM Verse=0A    =0A    On Feb 25, 2016, 11:48:22 PM, cyrilbur@gmail=
.com wrote:=0A    =0A    From: cyrilbur@gmail.com=0A    To: openbmc-patches=
@stwcx.xyz=0A    Cc: ratagupt@in.ibm.com, openbmc@lists.ozlabs.org=0A    Da=
te: Feb 25, 2016 11:48:22 PM=0A    Subject: Re: [PATCH phosphor-host-ipmid]=
 Fixing the Duplicate registration for NetFn [0x6], Cmd:[0xFF]=0A    =0A   =
 =0A         On Thu, 25 Feb 2016 07:40:36 -0600=0A     OpenBMC Patches  wro=
te:=0A     > From: Ratan Gupta =0A     > =0A     Hi Ratan,=0A     Any reaso=
n you're not removing ipmi=5Fglobal=5Fwildcard=5Fhandler() as well. I assum=
e=0A     it's now unused...=0A     Thanks,=0A     Cyril=0A     > ---=0A    =
 >  globalhandler.C | 5 +----=0A     >  1 file changed, 1 insertion(+), 4 d=
eletions(-)=0A     > =0A     > diff --git a/globalhandler.C b/globalhandler=
.C=0A     > index e68ea79..25ae26a 100644=0A     > --- a/globalhandler.C=0A=
     > +++ b/globalhandler.C=0A     > @@ -164,8 +164,5 @@ void register=5Fn=
etfn=5Fglobal=5Ffunctions()=0A     >      printf("Registering NetFn:[0x%X],=
 Cmd:[0x%X]\n",NETFUN=5FAPP, IPMI=5FCMD=5FWARM=5FRESET);=0A     >      ipmi=
=5Fregister=5Fcallback(NETFUN=5FAPP, IPMI=5FCMD=5FWARM=5FRESET, NULL, ipmi=
=5Fglobal=5Fwarm=5Freset);=0A     >  =0A     > -    printf("Registering Net=
Fn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FAPP, IPMI=5FCMD=5FWILDCARD);=0A     > -  =
  ipmi=5Fregister=5Fcallback(NETFUN=5FAPP, IPMI=5FCMD=5FWILDCARD, NULL, ipm=
i=5Fglobal=5Fwildcard=5Fhandler);=0A     > -=0A     > - return;=0A     > + =
   return;=0A     >  }=0A     =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=0A     openbmc mailing list=0A     openbmc@lists.ozla=
bs.org=0A     https://lists.ozlabs.org/listinfo/openbmc

------=_Part_69_2042067383.1456487432511
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body><div id=3D"content" contenteditable=3D"true" spellch=
eck=3D"true" autocorrect=3D"true" autocapitalize=3D"true" style=3D"font-fam=
ily: Helvetica;">Ah shoot yes Cyril is correct delete the function&nbsp;<br=
><br>Sent from my iPhone using IBM Verse<br><br><hr>On Feb 26, 2016, 5:43:0=
7 AM, austenc@us.ibm.com wrote:<br><br>From: austenc@us.ibm.com<br>To: cyri=
lbur@gmail.com<br>Cc: ratagupt@in.ibm.com, openbmc@lists.ozlabs.org, openbm=
c-patches@stwcx.xyz<br>Date: Feb 26, 2016 5:43:07 AM<br>Subject: Re: [PATCH=
 phosphor-host-ipmid] Fixing the Duplicate registration for NetFn [0x6], Cm=
d:[0xFF]<br><br><div id=3D"MaaS360PIMSDKOriginalMessageId"><div id=3D"conte=
nt" spellcheck=3D"true" autocorrect=3D"true" autocapitalize=3D"true" style=
=3D"font-family: Helvetica;">Removal looks good.&nbsp;<div><br></div><div>T=
he wildcard function exists in each of the ipmi .so files. &nbsp;To remove =
them would be a decision to be discussed beyond the scope of this piece of =
work. &nbsp;</div><div><br></div><div>Signed off by Chris austen. &lt;auste=
nc@us.ibm.com&gt;</div><div><br>Sent from my iPhone using IBM Verse<br><br>=
<hr>On Feb 25, 2016, 11:48:22 PM, cyrilbur@gmail.com wrote:<br><br>From: cy=
rilbur@gmail.com<br>To: openbmc-patches@stwcx.xyz<br>Cc: ratagupt@in.ibm.co=
m, openbmc@lists.ozlabs.org<br>Date: Feb 25, 2016 11:48:22 PM<br>Subject: R=
e: [PATCH phosphor-host-ipmid] Fixing the Duplicate registration for NetFn =
[0x6], Cmd:[0xFF]<br><br><div id=3D"MaaS360PIMSDKOriginalMessageId">On&nbsp=
;Thu,&nbsp;25&nbsp;Feb&nbsp;2016&nbsp;07:40:36&nbsp;-0600<br>OpenBMC&nbsp;P=
atches&nbsp;<openbmc-patches@stwcx.xyz>&nbsp;wrote:<br>&gt;&nbsp;From:&nbsp=
;Ratan&nbsp;Gupta&nbsp;<ratagupt@in.ibm.com><br>&gt;&nbsp;<br>Hi&nbsp;Ratan=
,<br>Any&nbsp;reason&nbsp;you're&nbsp;not&nbsp;removing&nbsp;ipmi=5Fglobal=
=5Fwildcard=5Fhandler()&nbsp;as&nbsp;well.&nbsp;I&nbsp;assume<br>it's&nbsp;=
now&nbsp;unused...<br>Thanks,<br>Cyril<br>&gt;&nbsp;---<br>&gt;&nbsp;&nbsp;=
globalhandler.C&nbsp;|&nbsp;5&nbsp;+----<br>&gt;&nbsp;&nbsp;1&nbsp;file&nbs=
p;changed,&nbsp;1&nbsp;insertion(+),&nbsp;4&nbsp;deletions(-)<br>&gt;&nbsp;=
<br>&gt;&nbsp;diff&nbsp;--git&nbsp;a/globalhandler.C&nbsp;b/globalhandler.C=
<br>&gt;&nbsp;index&nbsp;e68ea79..25ae26a&nbsp;100644<br>&gt;&nbsp;---&nbsp=
;a/globalhandler.C<br>&gt;&nbsp;+++&nbsp;b/globalhandler.C<br>&gt;&nbsp;@@&=
nbsp;-164,8&nbsp;+164,5&nbsp;@@&nbsp;void&nbsp;register=5Fnetfn=5Fglobal=5F=
functions()<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;printf("Registering&=
nbsp;NetFn:[0x%X],&nbsp;Cmd:[0x%X]\n",NETFUN=5FAPP,&nbsp;IPMI=5FCMD=5FWARM=
=5FRESET);<br>&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ipmi=5Fregister=5Fcal=
lback(NETFUN=5FAPP,&nbsp;IPMI=5FCMD=5FWARM=5FRESET,&nbsp;NULL,&nbsp;ipmi=5F=
global=5Fwarm=5Freset);<br>&gt;&nbsp;&nbsp;<br>&gt;&nbsp;-&nbsp;&nbsp;&nbsp=
;&nbsp;printf("Registering&nbsp;NetFn:[0x%X],&nbsp;Cmd:[0x%X]\n",NETFUN=5FA=
PP,&nbsp;IPMI=5FCMD=5FWILDCARD);<br>&gt;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;ipmi=
=5Fregister=5Fcallback(NETFUN=5FAPP,&nbsp;IPMI=5FCMD=5FWILDCARD,&nbsp;NULL,=
&nbsp;ipmi=5Fglobal=5Fwildcard=5Fhandler);<br>&gt;&nbsp;-<br>&gt;&nbsp;-   =
     return;<br>&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;return;<br>&gt;&nbsp;&nb=
sp;}<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
<br>openbmc&nbsp;mailing&nbsp;list<br>openbmc@lists.ozlabs.org<br>https://l=
ists.ozlabs.org/listinfo/openbmc<br></ratagupt@in.ibm.com></openbmc-patches=
@stwcx.xyz></div></div></div><br><br><br></div></div><BR>
</body></html>

------=_Part_69_2042067383.1456487432511--
