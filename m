Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id B19CD1A11A7
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2016 18:26:23 +1100 (AEDT)
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Wed, 6 Jan 2016 17:26:22 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Wed, 6 Jan 2016 17:26:20 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id 4A3242CE8055
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2016 18:26:20 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u067QCPZ61931598
 for <openbmc@lists.ozlabs.org>; Wed, 6 Jan 2016 18:26:20 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u067PmI8020216
 for <openbmc@lists.ozlabs.org>; Wed, 6 Jan 2016 18:25:48 +1100
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u067PjRc019318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 6 Jan 2016 18:25:46 +1100
Message-Id: <201601060725.u067PjRc019318@d23av06.au.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Wed, 6 Jan 2016 00:25:21 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.91)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 6 Jan 2016 00:25:19 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Wed, 6 Jan 2016 07:25:18 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.100)
 by smtp.notes.na.collabserv.com (10.106.227.143) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 6 Jan 2016 07:25:16 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016010607255659-50803 ;
 Wed, 6 Jan 2016 07:25:56 +0000 
Subject: Re: [PATCH phosphor-host-ipmid v4] Add get/set boot option ipmid
 command support with correct DBUS property handling.
In-Reply-To: <20160106175701.196f6a77@camb691>
From: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
To: cyrilbur@gmail.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Wed, 6 Jan 2016 07:25:15 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20160106175701.196f6a77@camb691>,
 <20160106160934.493e446f@camb691><1451956226-19954-1-git-send-email-openbmc-patches@stwcx.xyz><1451956226-19954-2-git-send-email-openbmc-patches@stwcx.xyz><201601060613.u066Dbgg023586@d23av03.au.ibm.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_12072015_FP3 December 17, 2015
X-LLNOutbound: False
X-Disclaimed: 29915
X-TNEFEvaluated: 1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
x-cbid: 16010607-0005-0000-0000-0000030A0386
X-IBM-ISS-SpamDetectors: Score=0.4332; BY=0.041088; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.4332; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004758; HX=3.00000237; KW=3.00000007;
 PH=3.00000004; SC=3.00000130; SDB=6.00641224; UDB=6.00288631; UTC=2016-01-06
 07:25:17
x-cbparentid: 16010607-4778-0000-0000-000001767438
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
X-List-Received-Date: Wed, 06 Jan 2016 07:26:23 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Hey Cyril,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >For the whitespace introduced and the coding style issue,=
 I will try to propose a fix to it, hopefully with minimum coding style cha=
nges.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >For other issues, we can continue discuss it but I believ=
e we can firstly accept this patch and then revisit them if there is really=
 concerns for them.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"fon=
t-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" >GOU, Peng Fei (=E8=8B=
=9F=E9=B9=8F=E9=A3=9E), Ph.D.</div>
<div dir=3D"ltr" >OpenPower Team.</div>
<div dir=3D"ltr" >+86-21-609-28631</div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Cyril Bur &lt;cyri=
lbur@gmail.com&gt;<br>To: Peng Fei BG Gou/China/IBM@IBMCN<br>Cc: openbmc@li=
sts.ozlabs.org, openbmc-patches@stwcx.xyz<br>Subject: Re: [PATCH phosphor-h=
ost-ipmid v4] Add get/set boot option ipmid command support with correct DB=
US property handling.<br>Date: Wed, Jan 6, 2016 3:12 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Wed, 6 Jan 2016 06:13:06 +0000<br>"Peng Fei BG Gou" &lt;shgoupf@cn.=
ibm.com&gt; wrote:<br><br>&gt; Hey Cyril,<br>&gt; &nbsp;<br>&gt; Thanks for=
 your detailed review on this patch.<br>&gt; &nbsp;<br><br>Hi Peng,<br><br>=
&gt; Just want to answer (most of) your questions in batch:<br>&gt; 1) This=
 patch intended to add the functionality of ipmi set/get boot option, with =
dbus property and object mapper used, so I believe all of the contents in t=
his patch should be considered as a whole. We shouldn't split them into mul=
tiple patches.<br><br>The set/get boot option is fine as one patch (or two.=
.. not too fussed really) I<br>agree.<br><br>You do still have whitespace (=
and other) changes which touch code not related<br>to the boot option work,=
 notably in ipmi=5Fchassis=5Fpower=5Fcontrol() and<br>ipmi=5Fchassis=5Fcont=
rol()<br><br>&gt; 2) atoi is an alternative, but I don't see there is any r=
eason why to use it since sscanf/sprintf works fine for now. I don't believ=
e there is too much performance concern there.<br><br>I'm not saying sscanf=
 won't work, I completely agree that it will. I do<br>disagree that there i=
sn't a performance concern, if I'm not mistaken this code<br>will be runnin=
g on an ASPEED2400 which is a single core ARM chip running at<br>400MHz. We=
 have breathing space and we don't need to write absolutely<br>everything t=
o save all the possible cycles but lets not waste the little<br>breathing s=
pace we do have.<br><br>&gt; 3) For those sd=5Fbus method call with signatu=
res ("s", "v", "s{ass}", etc.), I believe the current way I use it is valid=
 since I have tested them already.<br><br>Again, I'm not saying it won't wo=
rk but I'm trying to understand why the<br>complexity in these signatures, =
it doesn't seem like it's being used and<br>pointless complexity doesn't he=
lp anyone.<br><br>However, if there is a good reason for these complicated =
signatures I'm all for<br>it, if you could document them in<br><a href=3D"h=
ttps://github.com/openbmc/docs/blob/master/dbus-interfaces.md" target=3D"=
=5Fblank" >https://github.com/openbmc/docs/blob/master/dbus-interfaces.md</=
a>&nbsp;that would be<br>fantastic.<br><br>Thanks.<br><br>&gt; 4) For the c=
ommented out error handling, I believe it's just a work around, but it did =
works according to my test. So I believe it's OK for this patch to have it =
and we should revisit it later.<br>&gt; 5) For the way how return code is h=
andled, I believe it is working fine.<br>&gt; 6) For the coding style stuff=
, such as spaces between function names and the bracket, I don't think it's=
 a major issue. Maybe it's a minor issue that they are not consistent with =
some piece of code elsewhere. It can be fixed with my auto style tool very =
easily.<br>&gt; &nbsp;<br><br>It isn't a major issue at all but this projec=
t already has enough code style<br>issues as it is, I don't see why patches=
 should be merged that introduce more<br>style problems.<br><br>Perhaps you=
 should run your auto style tool on your patch(es) before submission?<br><b=
r>&gt; In a sum, thanks for your effort on reviewing this, but I believe mo=
st of your current concerns either are invalid or are only minor issues.<br=
>&gt; &nbsp;<br>&gt; GOU, Peng Fei (=E8=8B=9F=E9=B9=8F=E9=A3=9E), Ph.D.<br>=
&gt; OpenPower Team.<br>&gt; +86-21-609-28631<br>&gt; &nbsp;<br>&gt; &nbsp;=
<br>&gt; ----- Original message -----<br>&gt; From: Cyril Bur &lt;cyrilbur@=
gmail.com&gt;<br>&gt; To: OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;=
, Peng Fei BG Gou/China/IBM@IBMCN<br>&gt; Cc: openbmc@lists.ozlabs.org<br>&=
gt; Subject: Re: [PATCH phosphor-host-ipmid v4] Add get/set boot option ipm=
id command support with correct DBUS property handling.<br>&gt; Date: Wed, =
Jan 6, 2016 1:10 PM<br>&gt; &nbsp;<br>&gt; On Mon, &nbsp;4 Jan 2016 19:10:2=
6 -0600<br>&gt; OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; wrote:<br=
>&gt;<br>&gt; &gt; From: shgoupf &lt;shgoupf@cn.ibm.com&gt;<br>&gt; &gt;<br=
>&gt;<br>&gt; Hi again,<br>&gt;<br>&gt; &gt; 1) Add support for IPMI get/se=
t boot option command.<br>&gt; &gt; &nbsp; &nbsp; a) boot options stored in=
 dbus property.<br>&gt; &gt; &nbsp; &nbsp; b) IPMI get boot option command =
get boot option from the dbus<br>&gt; &gt; &nbsp; &nbsp; property.<br>&gt; =
&gt; &nbsp; &nbsp; c) IPMI set boot option coomand set boot option to the d=
bus<br>&gt; &gt; &nbsp; &nbsp; property.<br>&gt; &gt; 2) Two methods to han=
dle the dbus property set and get:<br>&gt; &gt; &nbsp; &nbsp; a) dbus=5Fset=
=5Fproperty()<br>&gt; &gt; &nbsp; &nbsp; b) dbus=5Fget=5Fproperty()<br>&gt;=
 &gt; 3) The property is stored as a 10 character strings which representsd=
 5-byte information.<br>&gt; &gt; 4) ipmid set method is registered and imp=
lemented since petitboot will use it to clear the boot options.<br>&gt; &gt=
; 5) Get service name via object mapper<br>&gt; &gt; &nbsp; &nbsp; a) The c=
onnection name is got via objectmapper.<br>&gt; &gt; &nbsp; &nbsp; b) The m=
ethod used to get the connection name is object=5Fmapper=5Fget=5Fconnection=
().<br>&gt; &gt; &nbsp; &nbsp; c) dbus=5Fget=5Fproperty/dbus=5Fset=5Fproper=
ty will get the connection name via the above method instead of hard coding=
.<br>&gt; &gt; 6) Error code are properly handled.<br>&gt; &gt; 7) Use spri=
nf/sscanf for int/string conversion.<br>&gt; &gt; &nbsp; &nbsp; a) Instead =
of reinventing the wheel by defining methods converting int to string, use =
sprintf/sscanf should be a more clean and robust way.<br>&gt;<br>&gt; Plus =
1 for not reinventing the wheel but perhaps consider using the best tool<br=
>&gt; for the job, sscanf can and does do what you want however atoi, atol,=
 atoll,<br>&gt; strtol, strtoll, strtoq functions are all designed for this=
 exact purpose. They<br>&gt; will perform much better than sscanf, also the=
 str* versions give great control<br>&gt; and error detection capabilities.=
<br>&gt;<br>&gt;<br>&gt; &gt; 8) Fix issues addressed by the community.<br>=
&gt; &gt; &nbsp; &nbsp; a) change malloc heap to stack local variable.<br>&=
gt; &gt; &nbsp; &nbsp; b) Fix multi line comment style from "//" to "/**/".=
<br>&gt; &gt; &nbsp; &nbsp; c) Add defines for return codes.<br>&gt; &gt; &=
nbsp; &nbsp; d) Add more comments.<br>&gt;<br>&gt; It looks like you're add=
ing more and more into this same patch. A single patch<br>&gt; should be on=
e clearly defined piece of work. So you're implementing some new<br>&gt; fu=
nctionality, that should be its own patch. You're also adding some error<br=
>&gt; handling paths - also, its own patch. You've changed some whitespace =
(some of<br>&gt; which was a bad thing) but the good whitespace changes sho=
uld also be their own<br>&gt; patch.<br>&gt;<br>&gt; &gt; &nbsp;chassishand=
ler.C | 492 +++++++++++++++++++++++++++++++++++++++++++++----------<br>&gt;=
 &gt; &nbsp;chassishandler.h | &nbsp;18 ++<br>&gt; &gt; &nbsp;2 files chang=
ed, 423 insertions(+), 87 deletions(-)<br>&gt; &gt;<br>&gt; &gt; diff --git=
 a/chassishandler.C b/chassishandler.C<br>&gt; &gt; index 1389db9..4d941e8 =
100644<br>&gt; &gt; --- a/chassishandler.C<br>&gt; &gt; +++ b/chassishandle=
r.C<br>&gt; &gt; @@ -5,11 +5,235 @@<br>&gt; &gt; &nbsp;#include &lt;stdint.=
h&gt;<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;// OpenBMC Chassis Manager dbu=
s framework<br>&gt; &gt; -const char &nbsp;*chassis=5Fbus=5Fname &nbsp; &nb=
sp; &nbsp;=3D &nbsp;"org.openbmc.control.Chassis";<br>&gt; &gt; -const char=
 &nbsp;*chassis=5Fobject=5Fname &nbsp; =3D &nbsp;"/org/openbmc/control/chas=
sis0";<br>&gt; &gt; -const char &nbsp;*chassis=5Fintf=5Fname &nbsp; &nbsp; =
=3D &nbsp;"org.openbmc.control.Chassis";<br>&gt; &gt; +const char * chassis=
=5Fbus=5Fname &nbsp; &nbsp; &nbsp;=3D &nbsp;"org.openbmc.control.Chassis";<=
br>&gt; &gt; +const char * chassis=5Fobject=5Fname &nbsp; =3D &nbsp;"/org/o=
penbmc/control/chassis0";<br>&gt; &gt; +const char * chassis=5Fintf=5Fname =
&nbsp; &nbsp; =3D &nbsp;"org.openbmc.control.Chassis";<br>&gt; &gt; &nbsp;<=
br>&gt;<br>&gt; Not necessary, if anything you should remove the double spa=
ce but what you've<br>&gt; done doesn't look good.<br>&gt;<br>&gt; &gt; -vo=
id register=5Fnetfn=5Fchassis=5Ffunctions() =5F=5Fattribute=5F=5F((construc=
tor));<br>&gt; &gt; +// Host settings in dbus<br>&gt; &gt; +// Service name=
 should be referenced by connection name got via object mapper<br>&gt; &gt;=
 +const char * settings=5Fobject=5Fname &nbsp;=3D &nbsp;"/org/openbmc/setti=
ngs/host0";<br>&gt; &gt; +const char * settings=5Fintf=5Fname &nbsp; &nbsp;=
=3D &nbsp;"org.freedesktop.DBus.Properties";<br>&gt; &gt; +<br>&gt; &gt; +c=
onst char * objmapper=5Fservice=5Fname =3D &nbsp;"org.openbmc.objectmapper"=
;<br>&gt; &gt; +const char * objmapper=5Fobject=5Fname &nbsp;=3D &nbsp;"/or=
g/openbmc/objectmapper/objectmapper";<br>&gt; &gt; +const char * objmapper=
=5Fintf=5Fname &nbsp; &nbsp;=3D &nbsp;"org.openbmc.objectmapper.ObjectMappe=
r";<br>&gt; &gt; +<br>&gt;<br>&gt; We probably want to try to keep a consis=
tent style. I looked at ipmid.C and<br>&gt; that file isn't consistent but =
it seems to be mostly "type *name;" and that's<br>&gt; the most common way =
everywhere else with C code.<br>&gt;<br>&gt; &gt; +int object=5Fmapper=5Fge=
t=5Fconnection (char ** buf, const char * obj=5Fpath)<br>&gt; &gt; +{<br>&g=
t; &gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;<=
br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage * m =3D NULL;<br>&gt; &gt; +=
 &nbsp; &nbsp;sd=5Fbus * bus =3D NULL;<br>&gt; &gt; + &nbsp; &nbsp;char * t=
emp=5Fbuf =3D NULL, *intf =3D NULL;<br>&gt; &gt; + &nbsp; &nbsp;size=5Ft bu=
f=5Fsize =3D 0;<br>&gt; &gt; + &nbsp; &nbsp;int r;<br>&gt; &gt; +<br>&gt; &=
gt; + &nbsp; &nbsp;// Open the system bus where most system services are pr=
ovided.<br>&gt; &gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fopen=5Fsystem (&amp;bu=
s);<br>&gt; &gt; +<br>&gt;<br>&gt; As an added stylistic note, again for co=
nsistency, ipmid.C, you should avoid<br>&gt; having a space between the fun=
ction name and the parameters<br>&gt;<br>&gt; &gt; + &nbsp; &nbsp;if (r &lt=
; 0) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Failed t=
o connect to system bus: %s\n", strerror (-r));<br>&gt; &gt; + &nbsp; &nbsp=
; &nbsp; &nbsp;goto finish;<br>&gt; &gt; + &nbsp; &nbsp;}<br>&gt; &gt; +<br=
>&gt; &gt; + &nbsp; &nbsp;/*<br>&gt; &gt; + &nbsp; &nbsp; * Bus, service, o=
bject path, interface and method are provided to call<br>&gt; &gt; + &nbsp;=
 &nbsp; * the method.<br>&gt; &gt; + &nbsp; &nbsp; * Signatures and input a=
rguments are provided by the arguments at the<br>&gt; &gt; + &nbsp; &nbsp; =
* end.<br>&gt; &gt; + &nbsp; &nbsp; */<br>&gt; &gt; + &nbsp; &nbsp;r =3D sd=
=5Fbus=5Fcall=5Fmethod (bus,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;objmapper=
=5Fservice=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;/* service to contact */<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;objmapper=5Fobject=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object path */<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;objmapper=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* interface name */<br>&=
gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"GetObject", &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; /* method name */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;error, =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* object to retur=
n error in */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;m, &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* return message on=
 success */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"s", &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* input signature */<br>&gt; &=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;obj=5Fpath &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; /* first argument */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; );<br>&g=
t; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;fprintf (stderr, "Failed to issue method call: %s\n", =
error.message);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&=
gt; &gt; + &nbsp; &nbsp;}<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;// Get=
 the key, aka, the connection name<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Fm=
essage=5Fread (m, "a{sas}", 1, &amp;temp=5Fbuf, 1, &amp;intf);<br>&gt; &gt;=
 +<br>&gt;<br>&gt; This seems very roundabout, could you explain this metho=
d call. What are you<br>&gt; expecting to receive? From the looks of what y=
ou're using it for wouldn't it<br>&gt; make more sense to just sd=5Fbus=5Fm=
essage=5Fread a "s"?<br>&gt;<br>&gt; &gt; + &nbsp; &nbsp;/*<br>&gt; &gt; + =
&nbsp; &nbsp; * TODO: check the return code. Currently for no reason the me=
ssage<br>&gt; &gt; + &nbsp; &nbsp; * parsing of object mapper is always com=
plaining about<br>&gt; &gt; + &nbsp; &nbsp; * "Device or resource busy", bu=
t the result seems OK for now. Need<br>&gt; &gt; + &nbsp; &nbsp; * further =
checks.<br>&gt;<br>&gt; If sd=5Fbus=5Fmessage=5Fread returns a negative val=
ue, something definitely went<br>&gt; wrong, I highly highly doubt you can =
use the result if it turns a negative.<br>&gt;<br>&gt; &gt; + &nbsp; &nbsp;=
 * TODO: The following code is preserved in the comments so that it can be<=
br>&gt; &gt; + &nbsp; &nbsp; * resumed after the problem aforementioned is =
resolved.<br>&gt; &gt; + &nbsp; &nbsp; *r =3D sd=5Fbus=5Fmessage=5Fread(m, =
"a{sas}", 1, &amp;temp=5Fbuf, 1, &amp;intf);<br>&gt; &gt; + &nbsp; &nbsp; *=
if (r &lt; 0) {<br>&gt; &gt; + &nbsp; &nbsp; * &nbsp; &nbsp;fprintf(stderr,=
 "Failed to parse response message: %s\n", strerror(-r));<br>&gt; &gt; + &n=
bsp; &nbsp; * &nbsp; &nbsp;goto finish;<br>&gt; &gt; + &nbsp; &nbsp; *}<br>=
&gt;<br>&gt; The code is in git, it is saved there, delete it now and when =
someone wants to<br>&gt; add it back they can look in the git history for w=
hat was deleted. Having said<br>&gt; that, the error check should be there,=
 if you're hitting it, you should figure<br>&gt; out why.<br>&gt;<br>&gt; &=
gt; + &nbsp; &nbsp; */<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;buf=5Fsiz=
e =3D strlen (temp=5Fbuf) + 1;<br>&gt; &gt; + &nbsp; &nbsp;printf ("IPMID c=
onnection name: %s\n", temp=5Fbuf);<br>&gt; &gt; + &nbsp; &nbsp;*buf =3D (c=
har *)malloc (buf=5Fsize);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;if (*=
buf =3D=3D NULL) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stder=
r, "Malloc failed for get=5Fsys=5Fboot=5Foptions");<br>&gt; &gt; + &nbsp; &=
nbsp; &nbsp; &nbsp;r =3D -1;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto=
 finish;<br>&gt; &gt; + &nbsp; &nbsp;}<br>&gt; &gt; +<br>&gt;<br>&gt; I don=
't mind using malloc but these are strings no? Couldn't strndup be used,<br=
>&gt; might make life easier? Not a big concern.<br>&gt;<br>&gt; &gt; + &nb=
sp; &nbsp;memcpy (*buf, temp=5Fbuf, buf=5Fsize);<br>&gt; &gt; +<br>&gt; &gt=
; +finish:<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree (&amp;error)=
;<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref (m);<br>&gt; &gt; =
+ &nbsp; &nbsp;sd=5Fbus=5Funref (bus);<br>&gt; &gt; +<br>&gt;<br>&gt; Space=
s between name and params<br>&gt;<br>&gt; &gt; + &nbsp; &nbsp;return r;<br>=
&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +int dbus=5Fget=5Fproperty (char *=
 buf)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror error =
=3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage=
 * m =3D NULL;<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus * bus =3D NULL;<br>&gt;=
 &gt; + &nbsp; &nbsp;char * temp=5Fbuf =3D NULL;<br>&gt; &gt; + &nbsp; &nbs=
p;uint8=5Ft * get=5Fvalue =3D NULL;<br>&gt; &gt; + &nbsp; &nbsp;char * conn=
ection =3D NULL;<br>&gt; &gt; + &nbsp; &nbsp;int r, i;<br>&gt; &gt; +<br>&g=
t; &gt; + &nbsp; &nbsp;r =3D object=5Fmapper=5Fget=5Fconnection (&amp;conne=
ction, settings=5Fobject=5Fname);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbs=
p;if (r &lt; 0) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr=
, "Failed to get connection, return value: %d.\n", r);<br>&gt; &gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; &gt; + &nbsp; &nbsp;}<br>&gt; &g=
t; +<br>&gt; &gt; + &nbsp; &nbsp;printf ("connection: %s\n", connection);<b=
r>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;// Open the system bus where most=
 system services are provided.<br>&gt; &gt; + &nbsp; &nbsp;r =3D sd=5Fbus=
=5Fopen=5Fsystem (&amp;bus);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;if =
(r &lt; 0) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Fa=
iled to connect to system bus: %s\n", strerror (-r));<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; &gt; + &nbsp; &nbsp;}<br>&gt; &gt=
; +<br>&gt; &gt; + &nbsp; &nbsp;/*<br>&gt; &gt; + &nbsp; &nbsp; * Bus, serv=
ice, object path, interface and method are provided to call<br>&gt; &gt; + =
&nbsp; &nbsp; * the method.<br>&gt; &gt; + &nbsp; &nbsp; * Signatures and i=
nput arguments are provided by the arguments at the<br>&gt; &gt; + &nbsp; &=
nbsp; * end.<br>&gt; &gt; + &nbsp; &nbsp; */<br>&gt; &gt; + &nbsp; &nbsp;r =
=3D sd=5Fbus=5Fcall=5Fmethod (bus,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;con=
nection, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* service to contact */<br>&=
gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp;settings=5Fobject=5Fname, &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object path=
 */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;settings=5Fintf=5Fname, &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /=
* interface name */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"Get", &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* method name */<br>&gt; &gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;&amp;error, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; /* object to return error in */<br>&gt; &gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;&amp;m, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; /* return message on success */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
"ss", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* input si=
gnature */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;settings=5Fintf=5Fname, &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; /* first argument */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"boot=5Ffla=
gs"); &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* second argument */<br>&gt; &gt; +<br>=
&gt; &gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp=
; &nbsp;fprintf (stderr, "Failed to issue method call: %s\n", error.message=
);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; &gt; + &n=
bsp; &nbsp;}<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;/*<br>&gt; &gt; + &=
nbsp; &nbsp; * The output should be parsed exactly the same as the output f=
ormatting<br>&gt; &gt; + &nbsp; &nbsp; * specified.<br>&gt; &gt; + &nbsp; &=
nbsp; */<br>&gt; &gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fmessage=5Fread (m, "v=
", "s", &amp;temp=5Fbuf);<br>&gt; &gt; +<br>&gt;<br>&gt; Why not just read =
a "s"?<br>&gt;<br>&gt; &gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Failed to parse response messag=
e: %s\n", strerror (-r));<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto fi=
nish;<br>&gt; &gt; + &nbsp; &nbsp;}<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &n=
bsp;printf ("IPMID boot option property get: {%s}.\n", (char *) temp=5Fbuf)=
;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;/*<br>&gt; &gt; + &nbsp; &nbsp=
; * To represent a hex in string, e.g., "A0A0", which represents two bytes<=
br>&gt; &gt; + &nbsp; &nbsp; * in the hex, but requires 5 bytes to store it=
 as string, i.e., 4<br>&gt; &gt; + &nbsp; &nbsp; * characters to store the =
"A0A0" and 1 additional space for "\0".<br>&gt; &gt; + &nbsp; &nbsp; * Ther=
eby we have 2 * &lt;number of bytes&gt; + 1 for the string buffer.<br>&gt; =
&gt; + &nbsp; &nbsp; */<br>&gt;<br>&gt; So why don't you have #define NUM=
=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED 11 ?<br>&gt;<br>&gt; This question is o=
ut of scope of this patch but why are we passing around<br>&gt; numbers as =
strings? dbus handles other types...<br>&gt;<br>&gt; &gt; + &nbsp; &nbsp;me=
mcpy (buf, temp=5Fbuf, 2 * NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED + 1);<br>=
&gt; &gt; +<br>&gt; &gt; +finish:<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Fer=
ror=5Ffree (&amp;error);<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Fu=
nref (m);<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Funref (bus);<br>&gt; &gt; =
+ &nbsp; &nbsp;free (connection);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbs=
p;return r;<br>&gt; &gt; +}<br>&gt; &gt; +<br>&gt; &gt; +int dbus=5Fset=5Fp=
roperty (const char * buf)<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; &nbsp;sd=
=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; &gt; + &nbsp; &nb=
sp;sd=5Fbus=5Fmessage * m =3D NULL;<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus * =
bus =3D NULL;<br>&gt; &gt; + &nbsp; &nbsp;char * connection =3D NULL;<br>&g=
t; &gt; + &nbsp; &nbsp;int r;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;r =
=3D object=5Fmapper=5Fget=5Fconnection (&amp;connection, settings=5Fobject=
=5Fname);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt=
; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Failed to get connect=
ion, return value: %d.\n", r);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;go=
to finish;<br>&gt; &gt; + &nbsp; &nbsp;}<br>&gt; &gt; +<br>&gt; &gt; + &nbs=
p; &nbsp;printf ("connection: %s\n", connection);<br>&gt; &gt; +<br>&gt; &g=
t; + &nbsp; &nbsp;// Open the system bus where most system services are pro=
vided.<br>&gt; &gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fopen=5Fsystem (&amp;bus=
);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Failed to connect to system =
bus: %s\n", strerror (-r));<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto =
finish;<br>&gt; &gt; + &nbsp; &nbsp;}<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; =
&nbsp;/*<br>&gt; &gt; + &nbsp; &nbsp; * Bus, service, object path, interfac=
e and method are provided to call<br>&gt; &gt; + &nbsp; &nbsp; * the method=
.<br>&gt; &gt; + &nbsp; &nbsp; * Signatures and input arguments are provide=
d by the arguments at the<br>&gt; &gt; + &nbsp; &nbsp; * end.<br>&gt; &gt; =
+ &nbsp; &nbsp; */<br>&gt; &gt; + &nbsp; &nbsp;r =3D sd=5Fbus=5Fcall=5Fmeth=
od (bus,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;connection, &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; /* service to contact */<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;settings=5Fobject=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object path */<br>&gt; &gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;settings=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* interface name */<br>&gt=
; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;"Set", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;/* method name */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
&amp;error, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* object to=
 return error in */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&amp;m, &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* return message on=
 success */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"ssv", &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* input signature */<br>&gt; &gt; + =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;settings=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* first argument */=
<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"boot=5Fflags", &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; /* second argument */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;"s", &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* third argu=
ment */<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;buf); &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* fourth argument */<br>&gt; &gt; +<br>&=
gt;<br>&gt; Are we documenting these interfaces at all, I don't understand =
why "ssv" and<br>&gt; then a hardcoded "s", why not "sss"?<br>&gt;<br>&gt; =
&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nb=
sp;fprintf (stderr, "Failed to issue method call: %s\n", error.message);<br=
>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;goto finish;<br>&gt; &gt; + &nbsp; =
&nbsp;}<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;printf ("IPMID boot opti=
on property set: {%s}.\n", buf);<br>&gt; &gt; +<br>&gt; &gt; +finish:<br>&g=
t; &gt; + &nbsp; &nbsp;sd=5Fbus=5Ferror=5Ffree (&amp;error);<br>&gt; &gt; +=
 &nbsp; &nbsp;sd=5Fbus=5Fmessage=5Funref (m);<br>&gt; &gt; + &nbsp; &nbsp;s=
d=5Fbus=5Funref (bus);<br>&gt; &gt; + &nbsp; &nbsp;free (connection);<br>&g=
t; &gt; +<br>&gt; &gt; + &amp;nbsp; &nbsp;return r;<br>&gt; &gt; +}<br>&gt;=
 &gt; +<br>&gt; &gt; +void register=5Fnetfn=5Fchassis=5Ffunctions () =5F=5F=
attribute=5F=5F ((constructor));<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;str=
uct get=5Fsys=5Fboot=5Foptions=5Ft {<br>&gt; &gt; &nbsp; &nbsp; &nbsp;uint8=
=5Ft parameter;<br>&gt; &gt; @@ -17,11 +241,28 @@ struct get=5Fsys=5Fboot=
=5Foptions=5Ft {<br>&gt; &gt; &nbsp; &nbsp; &nbsp;uint8=5Ft block;<br>&gt; =
&gt; &nbsp;} &nbsp;=5F=5Fattribute=5F=5F ((packed));<br>&gt; &gt; &nbsp;<br=
>&gt; &gt; -ipmi=5Fret=5Ft ipmi=5Fchassis=5Fwildcard(ipmi=5Fnetfn=5Ft netfn=
, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fre=
quest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; &gt; - &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft cont=
ext)<br>&gt; &gt; +struct set=5Fsys=5Fboot=5Foptions=5Ft {<br>&gt; &gt; + &=
nbsp; &nbsp;uint8=5Ft parameter;<br>&gt; &gt; + &nbsp; &nbsp;union {<br>&gt=
; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;struct {<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft d1;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;uint8=5Ft d2;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;uint8=5Ft d3;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;uint8=5Ft d4;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;uint8=5Ft d5;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;uint8=5Ft d6;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint=
8=5Ft d7;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft=
 d8;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;} data8;<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;uint64=5Ft data64;<br>&gt; &gt; + &nbsp; &nbsp;} dat=
a;<br>&gt; &gt; +} &nbsp;=5F=5Fattribute=5F=5F ((packed));<br>&gt; &gt; +<b=
r>&gt; &gt; +ipmi=5Fret=5Ft ipmi=5Fchassis=5Fwildcard (ipmi=5Fnetfn=5Ft net=
fn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; &g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=
=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; &gt; &nbsp;{<br>&gt; &gt; - &nb=
sp; &nbsp;printf("Handling CHASSIS WILDCARD Netfn:[0x%X], Cmd:[0x%X]\n",net=
fn, cmd);<br>&gt; &gt; + &nbsp; &nbsp;printf ("Handling CHASSIS WILDCARD Ne=
tfn:[0x%X], Cmd:[0x%X]\n", netfn, cmd);<br>&gt;<br>&gt; Be careful with cha=
nges like this, you didn't change this code...<br>&gt;<br>&gt; &gt; &nbsp; =
&nbsp; &nbsp;// Status code.<br>&gt; &gt; &nbsp; &nbsp; &nbsp;ipmi=5Fret=5F=
t rc =3D IPMI=5FCC=5FOK;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0=
;<br>&gt; &gt; @@ -31,116 +272,193 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fwildc=
ard(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; &nbsp;//------=
------------------------------------------------------<br>&gt; &gt; &nbsp;/=
/ Calls into Chassis Control Dbus object to do the power off<br>&gt; &gt; &=
nbsp;//------------------------------------------------------------<br>&gt;=
 &gt; -int ipmi=5Fchassis=5Fpower=5Fcontrol(const char *method)<br>&gt; &gt=
; +int ipmi=5Fchassis=5Fpower=5Fcontrol (const char * method)<br>&gt; &gt; =
&nbsp;{<br>&gt; &gt; - // sd=5Fbus error<br>&gt; &gt; - int rc =3D 0;<br>&g=
t; &gt; + &nbsp; &nbsp;// sd=5Fbus error<br>&gt; &gt; + &nbsp; &nbsp;int rc=
 =3D 0;<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;// SD Bus erro=
r report mechanism.<br>&gt; &gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror bus=
=5Ferror =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; &gt; &nbsp;<br>&gt; &gt; - //=
 Response from the call. Although there is no response for this call,<br>&g=
t; &gt; - // obligated to mention this to make compiler happy.<br>&gt; &gt;=
 - sd=5Fbus=5Fmessage *response =3D NULL;<br>&gt; &gt; -<br>&gt; &gt; - // =
Gets a hook onto either a SYSTEM or SESSION bus<br>&gt; &gt; - sd=5Fbus *bu=
s=5Ftype =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection();<br>&gt; &gt; -<br>&gt; =
&gt; - rc =3D sd=5Fbus=5Fcall=5Fmethod(bus=5Ftype, &nbsp; &nbsp; &nbsp; &nb=
sp; // On the System Bus<br>&gt; &gt; - chassis=5Fbus=5Fname, &nbsp; &nbsp;=
 &nbsp; &nbsp;// Service to contact<br>&gt; &gt; - chassis=5Fobject=5Fname,=
 &nbsp; &nbsp; // Object path<br>&gt; &gt; - chassis=5Fintf=5Fname, &nbsp; =
&nbsp; &nbsp; // Interface name<br>&gt; &gt; - method, &nbsp; &nbsp; &nbsp;=
 // Method to be called<br>&gt; &gt; - &amp;bus=5Ferror, &nbsp; &nbsp; &nbs=
p; // object to return error<br>&gt; &gt; - &amp;response, // Response buff=
er if any<br>&gt; &gt; - NULL); // No input arguments<br>&gt; &gt; - if(rc =
&lt; 0)<br>&gt; &gt; - {<br>&gt; &gt; - fprintf(stderr,"ERROR initiating Po=
wer Off:[%s]\n",bus=5Ferror.message);<br>&gt; &gt; - }<br>&gt; &gt; - else<=
br>&gt; &gt; - {<br>&gt; &gt; - printf("Chassis Power Off initiated success=
fully\n");<br>&gt; &gt; - }<br>&gt; &gt; -<br>&gt; &gt; - &nbsp; &nbsp;sd=
=5Fbus=5Ferror=5Ffree(&amp;bus=5Ferror);<br>&gt; &gt; - &nbsp; &nbsp;sd=5Fb=
us=5Fmessage=5Funref(response);<br>&gt; &gt; -<br>&gt; &gt; - return rc;<br=
>&gt; &gt; + &nbsp; &nbsp;/*<br>&gt; &gt; + &nbsp; &nbsp; * Response from t=
he call. Although there is no response for this call,<br>&gt; &gt; + &nbsp;=
 &nbsp; * obligated to mention this to make compiler happy.<br>&gt; &gt; + =
&nbsp; &nbsp; */<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus=5Fmessage * response =
=3D NULL;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;// Gets a hook onto ei=
ther a SYSTEM or SESSION bus<br>&gt; &gt; + &nbsp; &nbsp;sd=5Fbus * bus=5Ft=
ype =3D ipmid=5Fget=5Fsd=5Fbus=5Fconnection ();<br>&gt; &gt; +<br>&gt; &gt;=
 + &nbsp; &nbsp;rc =3D sd=5Fbus=5Fcall=5Fmethod (bus=5Ftype, &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* On the System Bus*/<br>&gt; &gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; chassis=5Fbus=5Fname, &nbsp; &nbsp; &nbsp; &nbsp=
;/* Service to contact*/<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; chassis=5Fob=
ject=5Fname, &nbsp; &nbsp; /* Object path*/<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; chassis=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; /* Interface name*/<br>&=
gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; method, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;/* Method to be called*/<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &amp;bus=5Ferror, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;/* object to return error*/<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
amp;response, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* Response =
buffer if any*/<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NULL); &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* No input arguments*/<br=
>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;if (rc &lt; 0) {<br>&gt; &gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "ERROR initiating Power Off:[%s]\=
n", bus=5Ferror.message);<br>&gt; &gt; + &nbsp; &nbsp;} else {<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp;printf ("Chassis Power Off initiated successf=
ully\n");<br>&gt; &gt; + &nbsp; &nbsp;}<br>&gt; &gt; +<br>&gt; &gt; + &nbsp=
; &nbsp;sd=5Fbus=5Ferror=5Ffree (&amp;bus=5Ferror);<br>&gt; &gt; + &nbsp; &=
nbsp;sd=5Fbus=5Fmessage=5Funref (response);<br>&gt; &gt; +<br>&gt; &gt; + &=
nbsp; &nbsp;return rc;<br>&gt;<br>&gt; Cleanups are great but please send t=
hem as a separate patch, this helps people<br>&gt; a lot when reviewing pat=
ches, if it is just a cleanup then people can focus on<br>&gt; checking tha=
t you didn't change behaviour OR if you're sending a functional<br>&gt; cha=
nge patch people can focus on checking that you're achieving what you set<b=
r>&gt; out to do.<br>&gt;<br>&gt; &gt; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; =
&gt; &nbsp;<br>&gt; &gt; &nbsp;//------------------------------------------=
----------------------------<br>&gt; &gt; &nbsp;// Chassis Control commands=
<br>&gt; &gt; &nbsp;//-----------------------------------------------------=
-----------------<br>&gt; &gt; -ipmi=5Fret=5Ft ipmi=5Fchassis=5Fcontrol(ipm=
i=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; - &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequ=
est=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; &gt; - &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=
=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; &gt; +ipm=
i=5Fret=5Ft ipmi=5Fchassis=5Fcontrol (ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5F=
t cmd,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ipmi=5Frequest=
=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; &gt; + &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=
=5Ft context)<br>&gt; &gt; &nbsp;{<br>&gt; &gt; - // Error from power off.<=
br>&gt; &gt; - int rc =3D 0;<br>&gt; &gt; + &nbsp; &nbsp;// Error from powe=
r off.<br>&gt; &gt; + &nbsp; &nbsp;int rc =3D 0;<br>&gt; &gt; &nbsp;<br>&gt=
; &gt; - // No response for this command.<br>&gt; &gt; + &nbsp; &nbsp;// No=
 response for this command.<br>&gt; &gt; &nbsp; &nbsp; &nbsp;*data=5Flen =
=3D 0;<br>&gt; &gt; &nbsp;<br>&gt; &gt; - // Catch the actual operaton by p=
eeking into request buffer<br>&gt; &gt; - uint8=5Ft chassis=5Fctrl=5Fcmd =
=3D *(uint8=5Ft *)request;<br>&gt; &gt; - printf("Chassis Control Command: =
Operation:[0x%X]\n",chassis=5Fctrl=5Fcmd);<br>&gt; &gt; -<br>&gt; &gt; - sw=
itch(chassis=5Fctrl=5Fcmd)<br>&gt; &gt; - {<br>&gt; &gt; - case CMD=5FPOWER=
=5FOFF:<br>&gt; &gt; - rc =3D ipmi=5Fchassis=5Fpower=5Fcontrol("powerOff");=
<br>&gt; &gt; - break;<br>&gt; &gt; - case CMD=5FHARD=5FRESET:<br>&gt; &gt;=
 - rc =3D ipmi=5Fchassis=5Fpower=5Fcontrol("reboot");<br>&gt; &gt; - break;=
<br>&gt; &gt; - default:<br>&gt; &gt; - {<br>&gt; &gt; - fprintf(stderr, "I=
nvalid Chassis Control command:[0x%X] received\n",chassis=5Fctrl=5Fcmd);<br=
>&gt; &gt; - rc =3D -1;<br>&gt; &gt; - }<br>&gt; &gt; - }<br>&gt; &gt; -<br=
>&gt; &gt; - return ( (rc &lt; 0) ? IPMI=5FCC=5FINVALID : IPMI=5FCC=5FOK);<=
br>&gt; &gt; + &nbsp; &nbsp;// Catch the actual operaton by peeking into re=
quest buffer<br>&gt; &gt; + &nbsp; &nbsp;uint8=5Ft chassis=5Fctrl=5Fcmd =3D=
 * (uint8=5Ft *)request;<br>&gt; &gt; + &nbsp; &nbsp;printf ("Chassis Contr=
ol Command: Operation:[0x%X]\n", chassis=5Fctrl=5Fcmd);<br>&gt; &gt; +<br>&=
gt; &gt; + &nbsp; &nbsp;switch (chassis=5Fctrl=5Fcmd) {<br>&gt; &gt; + &nbs=
p; &nbsp;case CMD=5FPOWER=5FOFF:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
rc =3D ipmi=5Fchassis=5Fpower=5Fcontrol ("powerOff");<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;break;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;case=
 CMD=5FHARD=5FRESET:<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;rc =3D ipmi=
=5Fchassis=5Fpower=5Fcontrol ("reboot");<br>&gt; &gt; + &nbsp; &nbsp; &nbsp=
; &nbsp;break;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;default: {<br>&gt=
; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Invalid Chassis Contr=
ol command:[0x%X] received\n", chassis=5Fctrl=5Fcmd);<br>&gt; &gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;rc =3D -1;<br>&gt; &gt; + &nbsp; &nbsp;}<br>&gt; &gt; =
+ &nbsp; &nbsp;}<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;return ((rc &lt=
; 0) ? IPMI=5FCC=5FINVALID : IPMI=5FCC=5FOK);<br>&gt; &gt; &nbsp;}<br>&gt; =
&gt; &nbsp;<br>&gt; &gt; -ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=5Fboot=
=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt; - &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft res=
ponse,<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft da=
ta=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; &gt; +ipmi=5Fret=5Ft ipmi=5Fc=
hassis=5Fget=5Fsys=5Fboot=5Foptions (ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft=
 cmd,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request,=
 ipmi=5Fresponse=5Ft response,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;ip=
mi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; &gt; &n=
bsp;{<br>&gt; &gt; &nbsp; &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK=
;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt; &gt; &nbsp;<b=
r>&gt; &gt; - &nbsp; &nbsp;printf("IPMI GET=5FSYS=5FBOOT=5FOPTIONS\n");<br>=
&gt; &gt; + &nbsp; &nbsp;printf ("IPMI GET=5FSYS=5FBOOT=5FOPTIONS\n");<br>&=
gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;get=5Fsys=5Fboot=5Foptions=5Ft * req=
ptr =3D (get=5Fsys=5Fboot=5Foptions=5Ft *) request;<br>&gt; &gt; +<br>&gt; =
&gt; + &nbsp; &nbsp;/*<br>&gt; &gt; + &nbsp; &nbsp; * To represent a hex in=
 string, e.g., "A0A0", which represents two bytes<br>&gt; &gt; + &nbsp; &nb=
sp; * in the hex, but requires 5 bytes to store it as string, i.e., 4<br>&g=
t; &gt; + &nbsp; &nbsp; * characters to store the "A0A0" and 1 additional s=
pace for "\0".<br>&gt; &gt; + &nbsp; &nbsp; * Thereby we have 2 * &lt;numbe=
r of bytes&gt; + 1 for the string buffer.<br>&gt; &gt; + &nbsp; &nbsp; */<b=
r>&gt; &gt; + &nbsp; &nbsp;char buf[NUM=5FRETURN=5FBYTES=5FOF=5FGET * 2 + 1=
] =3D {0};<br>&gt;<br>&gt; Once again, why not #define NUM=5FRETURN=5FBYTES=
=5FOF=5FGET 11<br>&gt;<br>&gt; &gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp;get=
=5Fsys=5Fboot=5Foptions=5Ft *reqptr =3D (get=5Fsys=5Fboot=5Foptions=5Ft*) r=
equest;<br>&gt; &gt; + &nbsp; &nbsp;/*<br>&gt; &gt; + &nbsp; &nbsp; * Param=
eter #5 means boot flags. Please refer to 28.13 of ipmi doc.<br>&gt; &gt; +=
 &nbsp; &nbsp; * This is the only parameter used by petitboot.<br>&gt; &gt;=
 + &nbsp; &nbsp; */<br>&gt; &gt; + &nbsp; &nbsp;if (reqptr-&gt;parameter =
=3D=3D 5) {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;int r =3D dbus=5Fget=
=5Fproperty (buf);<br>&gt; &gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp;// TODO =
Return default values to OPAL until dbus interface is available<br>&gt; &gt=
; + &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Dbus get property failed for =
get=5Fsys=5Fboot=5Foptions.\n");<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;return IPMI=5FOUT=5FOF=5FSPACE;<br>&gt; &gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp;if (reqptr-&=
gt;parameter =3D=3D 5) // Parameter #5<br>&gt; &gt; - &nbsp; &nbsp;{<br>&gt=
; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft buf[] =3D {0x1,0x5,80,0,0,0,0=
};<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D sizeof(buf);<b=
r>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, &amp;buf, *data=
=5Flen);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;uint64=5Ft return=5Fvalu=
e;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;sscanf (buf, "%llX", &amp;retu=
rn=5Fvalue);<br>&gt;<br>&gt; See my comment at the top about the best tool =
for the job.<br>&gt;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nb=
sp;*data=5Flen =3D NUM=5FRETURN=5FBYTES=5FOF=5FGET;<br>&gt; &gt; + &nbsp; &=
nbsp; &nbsp; &nbsp;/*<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; * TODO: la=
st 3 bytes<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; *(NUM=5FRETURN=5FBYTE=
S=5FOF=5FGET - NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED) is meanlingless<br>&=
gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; */<br>&gt; &gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;memcpy (response, (uint8=5Ft *) (&amp;return=5Fvalue), *data=5Flen=
);<br>&gt;<br>&gt; So this interests me, does whoever is going to be readin=
g response know to read<br>&gt; it as a uint64=5Ft on success but as an arr=
ay of chars on failure, also, rather<br>&gt; than #defineing, wouldn't:<br>=
&gt;<br>&gt; *data=5Flen =3D sizeof(return=5Fvalue);<br>&gt;<br>&gt; be bet=
ter?<br>&gt;<br>&gt;<br>&gt; I've done some looking around in ipmid.C and I=
 don't think what you've done<br>&gt; will work,<br>&gt; <a href=3D"https:/=
/github.com/openbmc/phosphor-host-ipmid/blob/master/ipmid.C#L276" target=3D=
"=5Fblank" >https://github.com/openbmc/phosphor-host-ipmid/blob/master/ipmi=
d.C#L276</a><br>&gt; appears to use the first byte of response as the compl=
etion code but you've<br>&gt; just written whatever the first byte of your =
uint64=5Ft is into response[0]...<br>&gt;<br>&gt; Also, 28.13 in the IPMI s=
pec doesn't seem to match up with whats going on here,<br>&gt; am I missing=
 something?<br>&gt;<br>&gt; &gt; + &nbsp; &nbsp;} else {<br>&gt; &gt; + &nb=
sp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D NUM=5FRETURN=5FBYTES=5FOF=5FGET;<br=
>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;// Parameter not supported<br>&gt; =
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;buf[0] =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPPO=
RTED;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy (response, buf, *dat=
a=5Flen);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Unsup=
ported parameter 0x%x\n", reqptr-&gt;parameter);<br>&gt; &gt; + &nbsp; &nbs=
p; &nbsp; &nbsp;return IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; &gt; &nb=
sp; &nbsp; &nbsp;}<br>&gt; &gt; - &nbsp; &nbsp;else<br>&gt; &gt; - &nbsp; &=
nbsp;{<br>&gt; &gt; - &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Unsupport=
ed parameter 0x%x\n", reqptr-&gt;parameter);<br>&gt; &gt; - &nbsp; &nbsp; &=
nbsp; &nbsp;return IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED; &nbsp; &nbsp; &nbsp;=
 &nbsp;<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;return rc;<br>&gt; &gt; =
+}<br>&gt; &gt; +<br>&gt; &gt; +ipmi=5Fret=5Ft ipmi=5Fchassis=5Fset=5Fsys=
=5Fboot=5Foptions (ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=
=5Ft response,<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=
=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; &gt; +{<br>&gt; &gt; +=
 &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;<br>&gt; &gt; +<br>&gt; =
&gt; + &nbsp; &nbsp;printf ("IPMI SET=5FSYS=5FBOOT=5FOPTIONS\n");<br>&gt; &=
gt; + &nbsp; &nbsp;printf ("IPMID set command required return bytes: %i\n",=
 *data=5Flen);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;set=5Fsys=5Fboot=
=5Foptions=5Ft * reqptr =3D (set=5Fsys=5Fboot=5Foptions=5Ft *) request;<br>=
&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;char output=5Fbuf[NUM=5FRETURN=5FBY=
TES=5FOF=5FSET] =3D {0};<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;/*<br>&=
gt; &gt; + &nbsp; &nbsp; * Parameter #5 means boot flags. Please refer to 2=
8.13 of ipmi doc.<br>&gt; &gt; + &nbsp; &nbsp; * This is the only parameter=
 used by petitboot.<br>&gt; &gt; + &nbsp; &nbsp; */<br>&gt; &gt; + &nbsp; &=
nbsp;if (reqptr-&gt;parameter =3D=3D 5) {<br>&gt; &gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;/*<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; * To represent a hex=
 in string, e.g., "A0A0", which represents two bytes<br>&gt; &gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; * in the hex, but requires 5 bytes to store it as stri=
ng, i.e., 4<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; * characters to stor=
e the "A0A0" and 1 additional space for "\0".<br>&gt; &gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; * Thereby we have 2 * &lt;number of bytes&gt; + 1 for the str=
ing buffer.<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; */<br>&gt; &gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;char input=5Fbuf[NUM=5FINPUT=5FBYTES=5FOF=5FSET * =
2 + 1];<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;sprintf (input=5Fbuf, "%l=
lX", reqptr-&gt;data.data64);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;int r =3D dbus=5Fset=5Fproperty (input=5Fbuf);<br>&gt; &gt; +<b=
r>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &gt; + &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf (stderr, "Dbus set property f=
ailed for set=5Fsys=5Fboot=5Foptions.\n");<br>&gt; &gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;return IPMI=5FOUT=5FOF=5FSPACE;<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;}<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp;*data=5Flen =3D NUM=5FRETURN=5FBYTES=5FOF=5FSET;<br>&gt; &gt; + &nbs=
p; &nbsp; &nbsp; &nbsp;// Return code OK.<br>&gt; &gt; + &nbsp; &nbsp; &nbs=
p; &nbsp;output=5Fbuf[0] =3D IPMI=5FOK;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp;memcpy (response, output=5Fbuf, *data=5Flen);<br>&gt; &gt; + &nbsp; =
&nbsp;} else {<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;// Parameter not s=
upported<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;output=5Fbuf[0] =3D IPMI=
=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;m=
emcpy (response, output=5Fbuf, *data=5Flen);<br>&gt; &gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;fprintf (stderr, "Unsupported parameter 0x%x\n", reqptr-&gt;par=
ameter);<br>&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FPARM=
=5FNOT=5FSUPPORTED;<br>&gt;<br>&gt; As far as I can see you're simply using=
 output=5Fbuf to assign the first byte of<br>&gt; response to either IPMI=
=5FOK or IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED and you're using<br>&gt; memcpy=
.<br>&gt;<br>&gt; Wouldn't it be nicer to<br>&gt; memset(response, 0, *data=
=5Flen);<br>&gt; (or not even memset since NUM=5FRETURN=5FBYTES=5FOF=5FSET =
is 1) and<br>&gt; *response =3D IPMI=5FOK;<br>&gt; or<br>&gt; *response =3D=
 IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; and avoid having output=5Fbuf =
at all?<br>&gt;<br>&gt; Which makes me wonder why response is actually a vo=
id *, is this a good idea?<br>&gt;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;}<br>&g=
t; &gt; &nbsp;<br>&gt; &gt; &nbsp; &nbsp; &nbsp;return rc;<br>&gt; &gt; &nb=
sp;}<br>&gt; &gt; &nbsp;<br>&gt; &gt; -void register=5Fnetfn=5Fchassis=5Ffu=
nctions()<br>&gt; &gt; +void register=5Fnetfn=5Fchassis=5Ffunctions ()<br>&=
gt; &gt; &nbsp;{<br>&gt; &gt; - &nbsp; &nbsp;printf("Registering NetFn:[0x%=
X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCMD=5FWILDCARD);<br>&gt; &gt; - =
&nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS, IPMI=5FCMD=5FWILD=
CARD, NULL, ipmi=5Fchassis=5Fwildcard);<br>&gt; &gt; + &nbsp; &nbsp;printf =
("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FCHASSIS, IPMI=5FCMD=5FW=
ILDCARD);<br>&gt; &gt; + &nbsp; &nbsp;ipmi=5Fregister=5Fcallback (NETFUN=5F=
CHASSIS, IPMI=5FCMD=5FWILDCARD, NULL, ipmi=5Fchassis=5Fwildcard);<br>&gt; &=
gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp;printf("Registering NetFn:[0x%X], Cm=
d:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS);<br>=
&gt; &gt; - &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FCHASSIS, IPMI=
=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS, NULL, ipmi=5Fchassis=5Fget=5Fsys=5Fboo=
t=5Foptions);<br>&gt; &gt; + &nbsp; &nbsp;printf ("Registering NetFn:[0x%X]=
, Cmd:[0x%X]\n", NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS)=
;<br>&gt; &gt; + &nbsp; &nbsp;ipmi=5Fregister=5Fcallback (NETFUN=5FCHASSIS,=
 IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS, NULL, ipmi=5Fchassis=5Fget=5Fsys=
=5Fboot=5Foptions);<br>&gt; &gt; &nbsp;<br>&gt; &gt; - &nbsp; &nbsp;printf(=
"Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCMD=5FCHA=
SSIS=5FCONTROL);<br>&gt; &gt; - &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NET=
FUN=5FCHASSIS, IPMI=5FCMD=5FCHASSIS=5FCONTROL, NULL, ipmi=5Fchassis=5Fcontr=
ol);<br>&gt; &gt; + &nbsp; &nbsp;printf ("Registering NetFn:[0x%X], Cmd:[0x=
%X]\n", NETFUN=5FCHASSIS, IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS);<br>&gt;=
 &gt; + &nbsp; &nbsp;ipmi=5Fregister=5Fcallback (NETFUN=5FCHASSIS, IPMI=5FC=
MD=5FSET=5FSYS=5FBOOT=5FOPTIONS, NULL, ipmi=5Fchassis=5Fset=5Fsys=5Fboot=5F=
options);<br>&gt; &gt; +<br>&gt; &gt; + &nbsp; &nbsp;printf ("Registering N=
etFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FCHASSIS, IPMI=5FCMD=5FCHASSIS=5FCONTRO=
L);<br>&gt; &gt; + &nbsp; &nbsp;ipmi=5Fregister=5Fcallback (NETFUN=5FCHASSI=
S, IPMI=5FCMD=5FCHASSIS=5FCONTROL, NULL, ipmi=5Fchassis=5Fcontrol);<br>&gt;=
 &gt; &nbsp;}<br>&gt; &gt; +<br>&gt; &gt; diff --git a/chassishandler.h b/c=
hassishandler.h<br>&gt; &gt; index 1a26411..a310741 100644<br>&gt; &gt; ---=
 a/chassishandler.h<br>&gt; &gt; +++ b/chassishandler.h<br>&gt; &gt; @@ -3,=
21 +3,39 @@<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;#include &lt;stdint.h&gt=
;<br>&gt; &gt; &nbsp;<br>&gt; &gt; +// TODO: Petitboot requires 8 bytes of =
response<br>&gt; &gt; +// however only 5 of them are used. The remaining<br=
>&gt; &gt; +// 3 bytes are not used in petitboot and the value<br>&gt; &gt;=
 +// of them are all zero.<br>&gt; &gt; +#define NUM=5FRETURN=5FBYTES=5FOF=
=5FGET 8<br>&gt; &gt; +#define NUM=5FRETURN=5FBYTES=5FOF=5FGET=5FUSED 5<br>=
&gt; &gt; +#define NUM=5FRETURN=5FBYTES=5FOF=5FSET 1<br>&gt; &gt; +#define =
NUM=5FINPUT=5FBYTES=5FOF=5FSET 5<br>&gt; &gt; +<br>&gt; &gt; &nbsp;// IPMI =
commands for Chassis net functions.<br>&gt; &gt; &nbsp;enum ipmi=5Fnetfn=5F=
app=5Fcmds<br>&gt; &gt; &nbsp;{<br>&gt; &gt; &nbsp; // Chassis Control<br>&=
gt; &gt; &nbsp; IPMI=5FCMD=5FCHASSIS=5FCONTROL &nbsp;=3D 0x02,<br>&gt; &gt;=
 &nbsp; &nbsp; &nbsp;// Get capability bits<br>&gt; &gt; + &nbsp; &nbsp;IPM=
I=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS =3D 0x08,<br>&gt; &gt; &nbsp; &nbsp; &=
nbsp;IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS =3D 0x09,<br>&gt; &gt; &nbsp;}=
;<br>&gt; &gt; &nbsp;<br>&gt; &gt; &nbsp;// Command specific completion cod=
es<br>&gt; &gt; &nbsp;enum ipmi=5Fchassis=5Freturn=5Fcodes<br>&gt; &gt; &nb=
sp;{<br>&gt; &gt; + &nbsp; &nbsp;IPMI=5FOK =3D 0x0,<br>&gt; &gt; &nbsp; &nb=
sp; &nbsp;IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED =3D 0x80,<br>&gt; &gt; &nbsp;}=
;<br>&gt; &gt; &nbsp;<br>&gt; &gt; +// Generic completion codes,<br>&gt; &g=
t; +// see IPMI doc section 5.2<br>&gt; &gt; +enum ipmi=5Fgeneric=5Freturn=
=5Fcodes<br>&gt; &gt; +{<br>&gt; &gt; + &nbsp; &nbsp;IPMI=5FOUT=5FOF=5FSPAC=
E =3D 0xC4,<br>&gt; &gt; +};<br>&gt; &gt; +<br>&gt; &gt; &nbsp;// Various C=
hassis operations under a single command.<br>&gt; &gt; &nbsp;enum ipmi=5Fch=
assis=5Fcontrol=5Fcmds : uint8=5Ft<br>&gt; &gt; &nbsp;{<br>&gt; &nbsp;<br>&=
gt; &nbsp;<br>&gt;<br>&gt; </font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
