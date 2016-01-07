Return-Path: <shgoupf@cn.ibm.com>
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EF0C81A00E9
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2016 18:09:17 +1100 (AEDT)
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Thu, 7 Jan 2016 17:09:16 +1000
Received: from d23dlp01.au.ibm.com (202.81.31.203)
 by e23smtp07.au.ibm.com (202.81.31.204) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 7 Jan 2016 17:09:09 +1000
X-IBM-Helo: d23dlp01.au.ibm.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay07.au.ibm.com (d23relay07.au.ibm.com [9.190.26.37])
 by d23dlp01.au.ibm.com (Postfix) with ESMTP id CFAEF2CE8055
 for <openbmc@lists.ozlabs.org>; Thu,  7 Jan 2016 18:09:08 +1100 (EST)
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u077926X14286976
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2016 18:09:10 +1100
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u0778as7013620
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2016 18:08:36 +1100
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u0778YrH013363
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 7 Jan 2016 18:08:35 +1100
Message-Id: <201601070708.u0778YrH013363@d23av06.au.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Thu, 7 Jan 2016 00:08:26 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 7 Jan 2016 00:08:25 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: shgoupf@cn.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <shgoupf@cn.ibm.com>;
 Thu, 7 Jan 2016 07:08:24 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 7 Jan 2016 07:08:23 -0000
Received: from us1a3-mail141.a3.dal06.isc4sb.com ([10.146.38.85])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016010707082199-42853 ;
 Thu, 7 Jan 2016 07:08:21 +0000 
In-Reply-To: <87r3huhr98.fsf@linux.vnet.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid v5] Add get/set boot option ipmid
 command support with correct DBUS property handling.
From: "Peng Fei BG Gou" <shgoupf@cn.ibm.com>
To: stewart@linux.vnet.ibm.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Thu, 7 Jan 2016 07:08:21 +0000
Sensitivity: 
MIME-Version: 1.0
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_12072015_FP3 December 17, 2015
X-LLNOutbound: False
X-Disclaimed: 3379
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16010707-0025-0000-0000-000002B4DF95
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004760; HX=3.00000238; KW=3.00000007;
 PH=3.00000004; SC=3.00000130; SDB=6.00641695; UDB=6.00288911; UTC=2016-01-07
 07:08:24
x-cbparentid: 16010707-5090-0000-0000-0000068AB64B
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
X-List-Received-Date: Thu, 07 Jan 2016 07:09:18 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5=
pt" ><div dir=3D"ltr" >Thanks Stewart for your comments.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Please see my answers starting with &gt;&gt;&gt;&gt; [pen=
gfei]:&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div dir=3D"=
ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div dir=3D"ltr" >GOU, P=
eng Fei (=E8=8B=9F=E9=B9=8F=E9=A3=9E), Ph.D.</div>
<div dir=3D"ltr" >OpenPower Team.</div>
<div dir=3D"ltr" >+86-21-609-28631</div></div></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddi=
ng-left:5px; direction:ltr; margin-right:0px" >----- Original message -----=
<br>From: Stewart Smith &lt;stewart@linux.vnet.ibm.com&gt;<br>To: OpenBMC P=
atches &lt;openbmc-patches@stwcx.xyz&gt;, openbmc@lists.ozlabs.org<br>Cc: P=
eng Fei BG Gou/China/IBM@IBMCN<br>Subject: Re: [PATCH phosphor-host-ipmid v=
5] Add get/set boot option ipmid command support with correct DBUS property=
 handling.<br>Date: Thu, Jan 7, 2016 1:52 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; writes:<br>&gt; From=
: shgoupf &lt;shgoupf@cn.ibm.com&gt;<br>&gt;<br>&gt; 1) Add support for IPM=
I get/set boot option command.<br>&gt; &nbsp; &nbsp; a) boot options stored=
 in dbus property.<br>&gt; &nbsp; &nbsp; b) IPMI get boot option command ge=
t boot option from the dbus<br>&gt; &nbsp; &nbsp; property.<br>&gt; &nbsp; =
&nbsp; c) IPMI set boot option coomand set boot option to the dbus<br>&gt; =
&nbsp; &nbsp; property.<br>&gt; 2) Two methods to handle the dbus property =
set and get:<br>&gt; &nbsp; &nbsp; a) dbus=5Fset=5Fproperty()<br>&gt; &nbsp=
; &nbsp; b) dbus=5Fget=5Fproperty()<br>&gt; 3) The property is stored as a =
10 character strings which representsd 5-byte information.<br>&gt; 4) ipmid=
 set method is registered and implemented since petitboot will use it to cl=
ear the boot options.<br>&gt; 5) Get service name via object mapper<br>&gt;=
 &nbsp; &nbsp; a) The connection name is got via objectmapper.<br>&gt; &nbs=
p; &nbsp; b) The method used to get the connection name is object=5Fmapper=
=5Fget=5Fconnection().<br>&gt; &nbsp; &nbsp; c) dbus=5Fget=5Fproperty/dbus=
=5Fset=5Fproperty will get the connection name via the above method instead=
 of hard coding.<br>&gt; 6) Error code are properly handled.<br>&gt; 7) Use=
 sprinf/sscanf for int/string conversion.<br>&gt; &nbsp; &nbsp; a) Instead =
of reinventing the wheel by defining methods converting int to string, use =
sprintf/sscanf should be a more clean and robust way.<br>&gt; 8) Fix issues=
 addressed by the community.<br>&gt; &nbsp; &nbsp; a) change malloc heap to=
 stack local variable.<br>&gt; &nbsp; &nbsp; b) Fix multi line comment styl=
e from "//" to "/**/".<br>&gt; &nbsp; &nbsp; c) Add defines for return code=
s.<br>&gt; &nbsp; &nbsp; d) Add more comments.<br><br>A commit message shou=
ld describe the change/feature being implemented<br>and provide additional =
explanation, this reads like the story of how you<br>got to this point rath=
er than describing what's going on.</font><br>&nbsp;</div>
<div>&gt;&gt;&gt;&gt; [pengfei]: Good point. I will cleanup the comments&nb=
sp;in my next update.</div>
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >&gt; diff --git a/chassishandler.C b/chassishandler.C<br>&gt; inde=
x 1389db9..8d516de 100644<br>&gt; --- a/chassishandler.C<br>&gt; +++ b/chas=
sishandler.C<br>&gt; @@ -5,9 +5,233 @@<br>&lt;snip&gt;<br>&gt; - &nbsp; &nb=
sp;if (reqptr-&gt;parameter =3D=3D 5) // Parameter #5<br>&gt; - &nbsp; &nbs=
p;{<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;uint8=5Ft buf[] =3D {0x1,0x5,80,0,=
0,0,0};<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D sizeof(buf);<b=
r>&gt; - &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, &amp;buf, *data=5Flen)=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Dbus get property failed fo=
r get=5Fsys=5Fboot=5Foptions.\n");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;return IPMI=5FOUT=5FOF=5FSPACE;<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;uint64=5Ft return=5Fv=
alue;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;sscanf(buf, "%llX", &amp;return=
=5Fvalue);<br><br>should this be PRIx64 ?</font></div>
<div>&nbsp;</div>
<div><div>&gt;&gt;&gt;&gt; [pengfei]: Good point. I will fix in my next upd=
ate.<br><br><font face=3D"Default Monospace,Courier New,Courier,monospace" =
size=3D"2" >&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D NUM=
=5FRETURN=5FBYTES=5FOF=5FGET;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;/*<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; * TODO: last 3 bytes<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp; *(NUM=5FRETURN=5FBYTES=5FOF=5FGET - NUM=5FRETURN=5FBYTES=
=5FOF=5FGET=5FUSED) is meanlingless<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; *=
/<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, (uint8=5Ft *)(&amp;=
return=5Fvalue), *data=5Flen);<br>&gt; + &nbsp; &nbsp;} else {<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;*data=5Flen =3D NUM=5FRETURN=5FBYTES=5FOF=5FGET;<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;// Parameter not supported<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;buf[0] =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, buf, *data=5Flen);<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Unsupported parameter 0x%x=
\n", reqptr-&gt;parameter);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return IPM=
I=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; - &n=
bsp; &nbsp;else<br>&gt; - &nbsp; &nbsp;{<br>&gt; +<br>&gt; + &nbsp; &nbsp;r=
eturn rc;<br>&gt; +}<br>&gt; +<br>&gt; +ipmi=5Fret=5Ft ipmi=5Fchassis=5Fset=
=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=
=5Ft response,<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft d=
ata=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;ip=
mi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf=
("IPMI SET=5FSYS=5FBOOT=5FOPTIONS\n");<br>&gt; + &nbsp; &nbsp;printf("IPMID=
 set command required return bytes: %i\n",<br>&gt; *data=5Flen);<br><br>the=
se look like debugging printouts? Is there any plan to move to<br>something=
 better than printing to stdout?</font></div>
<div>&nbsp;</div>
<div>&gt;&gt;&gt;&gt; [pengfei]: I cannot figure out a better way to do thi=
s given the current framework. So I will delete these printf in my next upd=
ate.</div>
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >&gt; +<br>&gt; + &nbsp; &nbsp;set=5Fsys=5Fboot=5Foptions=5Ft * req=
ptr =3D (set=5Fsys=5Fboot=5Foptions=5Ft *) request;<br>&gt; +<br>&gt; + &nb=
sp; &nbsp;char output=5Fbuf[NUM=5FRETURN=5FBYTES=5FOF=5FSET] =3D {0};<br>&g=
t; +<br>&gt; + &nbsp; &nbsp;/*<br>&gt; + &nbsp; &nbsp; * Parameter #5 means=
 boot flags. Please refer to 28.13 of ipmi doc.<br>&gt; + &nbsp; &nbsp; * T=
his is the only parameter used by petitboot.<br>&gt; + &nbsp; &nbsp; */<br>=
&gt; + &nbsp; &nbsp;if (reqptr-&gt;parameter =3D=3D 5) {<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp;/*<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; * To represent =
a hex in string, e.g., "A0A0", which represents two bytes<br>&gt; + &nbsp; =
&nbsp; &nbsp; &nbsp; * in the hex, but requires 5 bytes to store it as stri=
ng, i.e., 4<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; * characters to store the=
 "A0A0" and 1 additional space for "\0".<br>&gt; + &nbsp; &nbsp; &nbsp; &nb=
sp; * Thereby we have 2 * &lt;number of bytes&gt; + 1 for the string buffer=
.<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; */<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp;char input=5Fbuf[NUM=5FINPUT=5FBYTES=5FOF=5FSET * 2 + 1];<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp;sprintf(input=5Fbuf, "%llX", reqptr-&gt;data.data6=
4);<br><br>snprintf is better as it can be more obviously correct, or rathe=
r, more<br>obvious to see that it's not an outright buffer overflow.<br><br=
>You also want to use C99 PRIx64 as otherwise this is incorrect on some<br>=
platforms and will emit a warning.</font></div>
<div>&nbsp;</div>
<div><div>&gt;&gt;&gt;&gt; [pengfei]: Good point. I will fix in my next upd=
ate.</div>
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;int r =3D dbus=5Fset=
=5Fproperty(input=5Fbuf);<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if=
 (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(st=
derr, "Dbus set property failed for set=5Fsys=5Fboot=5Foptions.\n");<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FOUT=5FOF=5FSPACE=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;*data=5Flen =3D NUM=5FRETURN=5FBYTES=5FOF=5FSET;<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp;// Return code OK.<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp;output=5Fbuf[0] =3D IPMI=5FOK;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;me=
mcpy(response, output=5Fbuf, *data=5Flen);<br>&gt; + &nbsp; &nbsp;} else {<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;// Parameter not supported<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;output=5Fbuf[0] =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPP=
ORTED;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy(response, output=5Fbuf, =
*data=5Flen);<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Un=
supported parameter 0x%x\n", reqptr-&gt;parameter);<br>&gt; - &nbsp; &nbsp;=
 &nbsp; &nbsp;return IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED; &nbsp; &nbsp; &nbs=
p; &nbsp;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return IPMI=5FCC=5FPARM=5FNO=
T=5FSUPPORTED;<br><br>Keep whitespace fixes in a separate patch.</font></di=
v>
<div>&nbsp;</div>
<div><div>&gt;&gt;&gt;&gt; [pengfei]: Good point. I will fix in my next upd=
ate.</div>
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &n=
bsp;return rc;<br>&gt; @@ -135,12 +449,16 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=
=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<b=
r>&gt; &nbsp;<br>&gt; &nbsp;void register=5Fnetfn=5Fchassis=5Ffunctions()<b=
r>&gt; &nbsp;{<br>&gt; - &nbsp; &nbsp;printf("Registering NetFn:[0x%X], Cmd=
:[0x%X]\n",NETFUN=5FCHASSIS, IPMI=5FCMD=5FWILDCARD);<br>&gt; + &nbsp; &nbsp=
;printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FCHASSIS,<br>&gt;=
 &nbsp;IPMI=5FCMD=5FWILDCARD);<br><br>same here, separate patch for pure wh=
itespace fix.</font></div>
<div>&nbsp;</div>
<div><div>&gt;&gt;&gt;&gt; [pengfei]: Good point. I will fix in my next upd=
ate.</div>
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(NETFUN=5FCHASS=
IS, IPMI=5FCMD=5FWILDCARD, NULL, ipmi=5Fchassis=5Fwildcard);<br>&gt; &nbsp;=
<br>&gt; - &nbsp; &nbsp;printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NET=
FUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS);<br>&gt; + &nbsp; &=
nbsp;printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FCHASSIS, IPM=
I=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTIONS);<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fr=
egister=5Fcallback(NETFUN=5FCHASSIS, IPMI=5FCMD=5FGET=5FSYS=5FBOOT=5FOPTION=
S, NULL, ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions);<br>&gt; &nbsp;<br>&g=
t; - &nbsp; &nbsp;printf("Registering NetFn:[0x%X], Cmd:[0x%X]\n",NETFUN=5F=
CHASSIS, IPMI=5FCMD=5FCHASSIS=5FCONTROL);<br>&gt; + &nbsp; &nbsp;printf("Re=
gistering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FCHASSIS, IPMI=5FCMD=5FSET=
=5FSYS=5FBOOT=5FOPTIONS);<br>&gt; + &nbsp; &nbsp;ipmi=5Fregister=5Fcallback=
(NETFUN=5FCHASSIS, IPMI=5FCMD=5FSET=5FSYS=5FBOOT=5FOPTIONS, NULL, ipmi=5Fch=
assis=5Fset=5Fsys=5Fboot=5Foptions);<br>&gt; +<br>&gt; + &nbsp; &nbsp;print=
f("Registering NetFn:[0x%X], Cmd:[0x%X]\n", NETFUN=5FCHASSIS, IPMI=5FCMD=5F=
CHASSIS=5FCONTROL);<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fregister=5Fcallback(=
NETFUN=5FCHASSIS, IPMI=5FCMD=5FCHASSIS=5FCONTROL,<br>&gt; NULL, ipmi=5Fchas=
sis=5Fcontrol);<br><br>and teh same for these.</font></div>
<div>&nbsp;</div>
<div><div>&gt;&gt;&gt;&gt; [pengfei]: Good point. I will fix in my next upd=
ate.</div>
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >&gt; &nbsp;}<br>&gt; +<br>&gt; diff --git a/chassishandler.h b/cha=
ssishandler.h<br>&gt; index 1a26411..a310741 100644<br>&gt; --- a/chassisha=
ndler.h<br>&gt; +++ b/chassishandler.h<br>&gt; @@ -3,21 +3,39 @@<br>&gt; &n=
bsp;<br>&gt; &nbsp;#include &lt;stdint.h&gt;<br>&gt; &nbsp;<br>&gt; +// TOD=
O: Petitboot requires 8 bytes of response<br>&gt; +// however only 5 of the=
m are used. The remaining<br>&gt; +// 3 bytes are not used in petitboot and=
 the value<br>&gt; +// of them are all zero.<br><br>where? why? why will it=
 never change?</font></div>
<div>&nbsp;</div>
<div><div>&gt;&gt;&gt;&gt; [pengfei]: Currently the target of this patch is=
 to add support for what the current petitboot requires, so I don't believe=
 we need to do things beyond that with this patch.</div><font face=3D"Defau=
lt Monospace,Courier New,Courier,monospace" size=3D"2" >--<br>Stewart Smith=
<br>OPAL Architect, IBM.</font></div></div></div></div></div></div></blockq=
uote>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>
