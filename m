Return-Path: <austenc@us.ibm.com>
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D52CF1A0007
 for <openbmc@lists.ozlabs.org>; Thu, 10 Mar 2016 05:56:40 +1100 (AEDT)
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 9 Mar 2016 11:56:36 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 9 Mar 2016 11:56:35 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 3022D19D8045
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 11:44:30 -0700 (MST)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u29IuYV038862882
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 11:56:34 -0700
Received: from d03av01.boulder.ibm.com (localhost [127.0.0.1])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u29IuYu4031630
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 11:56:34 -0700
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d03av01.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u29IuY2p031585
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 9 Mar 2016 11:56:34 -0700
Message-Id: <201603091856.u29IuY2p031585@d03av01.boulder.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 9 Mar 2016 11:56:34 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Wed, 9 Mar 2016 11:56:33 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Wed, 9 Mar 2016 18:56:30 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 9 Mar 2016 18:56:19 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016030918561778-408442 ;
 Wed, 9 Mar 2016 18:56:17 +0000 
To: "Patrick Williams" <patrick@stwcx.xyz>
In-Reply-To: <20160309170110.GM6601@asimov.pw-on-the.net>
Date: Wed, 9 Mar 2016 18:56:17 +0000
From: "Chris Austen" <austenc@us.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid] ipmi daemon return code modification
Cc: "openbmc" <openbmc@lists.ozlabs.org>, "Tom Joseph2" <tomjoseph@in.ibm.com>,
 "OpenBMC Patches" <openbmc-patches@stwcx.xyz>, "Cyril
 Bur" <cyrilbur@gmail.com>
Importance: Normal
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.10 Build 201602251618_30 on behalf of device with
 id mdmxxIBM_IOS_ApplFFMQ18K3G5MD,
 type 1600 (iosibm) and description iPhone 6:Apple
 iOS 9.2.1:IBM Traveler/9.3.2.20160208
X-KeepSent: 8019B5B0:3645A9D0-00257F71:00680798;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 4535
X-TNEFEvaluated: 1
Content-Type: multipart/alternative; 
 boundary="----=_Part_301_956446978.1457549777662"
x-cbid: 16030918-8236-0000-0000-00001700BD9B
X-IBM-ISS-SpamDetectors: Score=0.449102; BY=0.294032; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.449102; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005016; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000150; SDB=6.00670949; UDB=6.00306573; UTC=2016-03-09
 18:56:21
x-cbparentid: 16030918-0598-0000-0000-000006D0D182
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
X-List-Received-Date: Wed, 09 Mar 2016 18:56:41 -0000


------=_Part_301_956446978.1457549777662
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Patrick is there work needed to fix something here?   If so open an issue =
=0A   =0A    I think the lesson here is we need more integration testing (a=
ka warm hand offs) with Foxconn.  I chose channel 1 without thinking too mu=
ch about it.  Turns out they use channel 8.  =0A    =0A    =0A     =0A     =
  Sent from my iPhone using IBM Verse=0A   =0A   On Mar 9, 2016, 9:09:21 AM=
, patrick@stwcx.xyz wrote:=0A   =0A   From: patrick@stwcx.xyz=0A   To: cyri=
lbur@gmail.com=0A   Cc: openbmc@lists.ozlabs.org, tomjoseph@in.ibm.com, ope=
nbmc-patches@stwcx.xyz=0A   Date: Mar 9, 2016 9:09:21 AM=0A   Subject: Re: =
[PATCH phosphor-host-ipmid] ipmi daemon return code modification=0A   =0A  =
 =0A       I agree with Cyril's comments.  This code should not have been m=
erged in=0A    the current state.=0A    The first line directly contradicts=
 the comments.  Need to update the=0A    comment to explain why '8' is need=
ed now.  And removing an error path is=0A    non-obvious.  Even the commit =
message doesn't really give any details on=0A    what / why this change was=
 made.=0A    On Wed, Mar 09, 2016 at 01:31:23PM +1100, Cyril Bur wrote:=0A =
   > On Tue,  8 Mar 2016 14:10:33 -0600=0A    > OpenBMC Patches  wrote:=0A =
   > =0A    > > From: tomjose =0A    > > =0A    > > ---=0A    > >  apphandl=
er.C | 2 +-=0A    > >  ipmid.C      | 1 -=0A    > >  2 files changed, 1 ins=
ertion(+), 2 deletions(-)=0A    > > =0A    > > diff --git a/apphandler.C b/=
apphandler.C=0A    > > index a921643..fc6c811 100644=0A    > > --- a/apphan=
dler.C=0A    > > +++ b/apphandler.C=0A    > > @@ -358,7 +358,7 @@ ipmi=5Fre=
t=5Ft ipmi=5Fapp=5Fchannel=5Finfo(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cm=
d,=0A    > >      printf("IPMI APP GET CHANNEL INFO\n");=0A    > >  =0A    =
> >      // I"m only supporting channel 1.  0xE is the 'default channel'=0A=
    > > -    if (*p =3D=3D 0xe || *p =3D=3D 1) {=0A    > > +    if (*p =3D=
=3D 0xe || *p =3D=3D 1 || *p =3D=3D 8) {=0A    > >  =0A    > =0A    > So I =
take it that the comment is no longer valid? Can we take a break on magic=
=0A    > numbers or at least quote and link the spec nearby?=0A    > =0A   =
 > >          *data=5Flen =3D sizeof(resp);=0A    > >          memcpy(respo=
nse, resp, *data=5Flen);=0A    > > diff --git a/ipmid.C b/ipmid.C=0A    > >=
 index 6726a27..728ba0b 100644=0A    > > --- a/ipmid.C=0A    > > +++ b/ipmi=
d.C=0A    > > @@ -267,7 +267,6 @@ static int handle=5Fipmi=5Fcommand(sd=5Fb=
us=5Fmessage *m, void *user=5Fdata, sd=5Fbus=5Ferror=0A    > >      if(r !=
=3D 0)=0A    > >      {=0A    > >          fprintf(stderr,"ERROR:[0x%X] han=
dling NetFn:[0x%X], Cmd:[0x%X]\n",r, netfn, cmd);=0A    > > -        return=
 -1;=0A    > >      }=0A    > =0A    > Was this change intended?=0A    > =
=0A    > >  =0A    > >      fprintf(ipmiio, "IPMI Response:\n");=0A    > =
=0A    > =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=0A    > openbmc mailing list=0A    > openbmc@lists.ozlabs.org=0A    > http=
s://lists.ozlabs.org/listinfo/openbmc=0A    -- =0A    Patrick Williams=0A  =
  =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=0A   =
 openbmc mailing list=0A    openbmc@lists.ozlabs.org=0A    https://lists.oz=
labs.org/listinfo/openbmc

------=_Part_301_956446978.1457549777662
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body><div id=3D"content" contenteditable=3D"true" spellch=
eck=3D"true" autocorrect=3D"true" autocapitalize=3D"true" style=3D"font-fam=
ily: Helvetica;">Patrick is there work needed to fix something here? &nbsp;=
 If so open an issue&nbsp;<div><br></div><div>I think the lesson here is we=
 need more integration testing (aka warm hand offs) with Foxconn. &nbsp;I c=
hose channel 1 without thinking too much about it. &nbsp;Turns out they use=
 channel 8. &nbsp;</div><div><br></div><div><br><div><br></div><div><br>Sen=
t from my iPhone using IBM Verse<br><br><hr>On Mar 9, 2016, 9:09:21 AM, pat=
rick@stwcx.xyz wrote:<br><br>From: patrick@stwcx.xyz<br>To: cyrilbur@gmail.=
com<br>Cc: openbmc@lists.ozlabs.org, tomjoseph@in.ibm.com, openbmc-patches@=
stwcx.xyz<br>Date: Mar 9, 2016 9:09:21 AM<br>Subject: Re: [PATCH phosphor-h=
ost-ipmid] ipmi daemon return code modification<br><br><div id=3D"MaaS360PI=
MSDKOriginalMessageId">I&nbsp;agree&nbsp;with&nbsp;Cyril's&nbsp;comments.&n=
bsp;&nbsp;This&nbsp;code&nbsp;should&nbsp;not&nbsp;have&nbsp;been&nbsp;merg=
ed&nbsp;in<br>the&nbsp;current&nbsp;state.<br>The&nbsp;first&nbsp;line&nbsp=
;directly&nbsp;contradicts&nbsp;the&nbsp;comments.&nbsp;&nbsp;Need&nbsp;to&=
nbsp;update&nbsp;the<br>comment&nbsp;to&nbsp;explain&nbsp;why&nbsp;'8'&nbsp=
;is&nbsp;needed&nbsp;now.&nbsp;&nbsp;And&nbsp;removing&nbsp;an&nbsp;error&n=
bsp;path&nbsp;is<br>non-obvious.&nbsp;&nbsp;Even&nbsp;the&nbsp;commit&nbsp;=
message&nbsp;doesn't&nbsp;really&nbsp;give&nbsp;any&nbsp;details&nbsp;on<br=
>what&nbsp;/&nbsp;why&nbsp;this&nbsp;change&nbsp;was&nbsp;made.<br>On&nbsp;=
Wed,&nbsp;Mar&nbsp;09,&nbsp;2016&nbsp;at&nbsp;01:31:23PM&nbsp;+1100,&nbsp;C=
yril&nbsp;Bur&nbsp;wrote:<br>&gt;&nbsp;On&nbsp;Tue,&nbsp;&nbsp;8&nbsp;Mar&n=
bsp;2016&nbsp;14:10:33&nbsp;-0600<br>&gt;&nbsp;OpenBMC&nbsp;Patches&nbsp;<o=
penbmc-patches@stwcx.xyz>&nbsp;wrote:<br>&gt;&nbsp;<br>&gt;&nbsp;&gt;&nbsp;=
From:&nbsp;tomjose&nbsp;<tomjoseph@in.ibm.com><br>&gt;&nbsp;&gt;&nbsp;<br>&=
gt;&nbsp;&gt;&nbsp;---<br>&gt;&nbsp;&gt;&nbsp;&nbsp;apphandler.C&nbsp;|&nbs=
p;2&nbsp;+-<br>&gt;&nbsp;&gt;&nbsp;&nbsp;ipmid.C&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;|&nbsp;1&nbsp;-<br>&gt;&nbsp;&gt;&nbsp;&nbsp;2&nbsp;files&nbsp;cha=
nged,&nbsp;1&nbsp;insertion(+),&nbsp;2&nbsp;deletions(-)<br>&gt;&nbsp;&gt;&=
nbsp;<br>&gt;&nbsp;&gt;&nbsp;diff&nbsp;--git&nbsp;a/apphandler.C&nbsp;b/app=
handler.C<br>&gt;&nbsp;&gt;&nbsp;index&nbsp;a921643..fc6c811&nbsp;100644<br=
>&gt;&nbsp;&gt;&nbsp;---&nbsp;a/apphandler.C<br>&gt;&nbsp;&gt;&nbsp;+++&nbs=
p;b/apphandler.C<br>&gt;&nbsp;&gt;&nbsp;@@&nbsp;-358,7&nbsp;+358,7&nbsp;@@&=
nbsp;ipmi=5Fret=5Ft&nbsp;ipmi=5Fapp=5Fchannel=5Finfo(ipmi=5Fnetfn=5Ft&nbsp;=
netfn,&nbsp;ipmi=5Fcmd=5Ft&nbsp;cmd,<br>&gt;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;printf("IPMI&nbsp;APP&nbsp;GET&nbsp;CHANNEL&nbsp;INFO\n");<b=
r>&gt;&nbsp;&gt;&nbsp;&nbsp;<br>&gt;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;//&nbsp;I"m&nbsp;only&nbsp;supporting&nbsp;channel&nbsp;1.&nbsp;&nbs=
p;0xE&nbsp;is&nbsp;the&nbsp;'default&nbsp;channel'<br>&gt;&nbsp;&gt;&nbsp;-=
&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(*p&nbsp;=3D=3D&nbsp;0xe&nbsp;||&nbsp;*p&nb=
sp;=3D=3D&nbsp;1)&nbsp;{<br>&gt;&nbsp;&gt;&nbsp;+&nbsp;&nbsp;&nbsp;&nbsp;if=
&nbsp;(*p&nbsp;=3D=3D&nbsp;0xe&nbsp;||&nbsp;*p&nbsp;=3D=3D&nbsp;1&nbsp;||&n=
bsp;*p&nbsp;=3D=3D&nbsp;8)&nbsp;{<br>&gt;&nbsp;&gt;&nbsp;&nbsp;<br>&gt;&nbs=
p;<br>&gt;&nbsp;So&nbsp;I&nbsp;take&nbsp;it&nbsp;that&nbsp;the&nbsp;comment=
&nbsp;is&nbsp;no&nbsp;longer&nbsp;valid?&nbsp;Can&nbsp;we&nbsp;take&nbsp;a&=
nbsp;break&nbsp;on&nbsp;magic<br>&gt;&nbsp;numbers&nbsp;or&nbsp;at&nbsp;lea=
st&nbsp;quote&nbsp;and&nbsp;link&nbsp;the&nbsp;spec&nbsp;nearby?<br>&gt;&nb=
sp;<br>&gt;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;*data=5Flen&nbsp;=3D&nbsp;sizeof(resp);<br>&gt;&nbsp;&gt;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;memcpy(response,&nbsp;resp,=
&nbsp;*data=5Flen);<br>&gt;&nbsp;&gt;&nbsp;diff&nbsp;--git&nbsp;a/ipmid.C&n=
bsp;b/ipmid.C<br>&gt;&nbsp;&gt;&nbsp;index&nbsp;6726a27..728ba0b&nbsp;10064=
4<br>&gt;&nbsp;&gt;&nbsp;---&nbsp;a/ipmid.C<br>&gt;&nbsp;&gt;&nbsp;+++&nbsp=
;b/ipmid.C<br>&gt;&nbsp;&gt;&nbsp;@@&nbsp;-267,7&nbsp;+267,6&nbsp;@@&nbsp;s=
tatic&nbsp;int&nbsp;handle=5Fipmi=5Fcommand(sd=5Fbus=5Fmessage&nbsp;*m,&nbs=
p;void&nbsp;*user=5Fdata,&nbsp;sd=5Fbus=5Ferror<br>&gt;&nbsp;&gt;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;if(r&nbsp;!=3D&nbsp;0)<br>&gt;&nbsp;&gt;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;{<br>&gt;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fprintf(stderr,"ERROR:[0x%X]&nbsp;handling&n=
bsp;NetFn:[0x%X],&nbsp;Cmd:[0x%X]\n",r,&nbsp;netfn,&nbsp;cmd);<br>&gt;&nbsp=
;&gt;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;-1;=
<br>&gt;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br>&gt;&nbsp;<br>&g=
t;&nbsp;Was&nbsp;this&nbsp;change&nbsp;intended?<br>&gt;&nbsp;<br>&gt;&nbsp=
;&gt;&nbsp;&nbsp;<br>&gt;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;fpri=
ntf(ipmiio,&nbsp;"IPMI&nbsp;Response:\n");<br>&gt;&nbsp;<br>&gt;&nbsp;=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt;&nbs=
p;openbmc&nbsp;mailing&nbsp;list<br>&gt;&nbsp;openbmc@lists.ozlabs.org<br>&=
gt;&nbsp;https://lists.ozlabs.org/listinfo/openbmc<br>--&nbsp;<br>Patrick&n=
bsp;Williams<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F<br>openbmc&nbsp;mailing&nbsp;list<br>openbmc@lists.ozlabs.org<br>=
https://lists.ozlabs.org/listinfo/openbmc<br></tomjoseph@in.ibm.com></openb=
mc-patches@stwcx.xyz></div></div></div></div><BR>
</body></html>

------=_Part_301_956446978.1457549777662--
