Return-Path: <ratagupt@in.ibm.com>
Received: from mx0b-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rP7BW5V5mzDqGL
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 20:30:43 +1000 (AEST)
Received: from pps.filterd (m0075771.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u57ASmGs043369
 for <openbmc@lists.ozlabs.org>; Tue, 7 Jun 2016 06:30:40 -0400
Received: from e28smtp07.in.ibm.com (e28smtp07.in.ibm.com [125.16.236.7])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23dnh5u8rk-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2016 06:30:34 -0400
Received: from localhost
 by e28smtp07.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Tue, 7 Jun 2016 15:49:44 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
 by e28smtp07.in.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 7 Jun 2016 15:49:35 +0530
X-IBM-Helo: d28dlp03.in.ibm.com
X-IBM-MailFrom: ratagupt@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay06.in.ibm.com (d28relay06.in.ibm.com [9.184.220.150])
 by d28dlp03.in.ibm.com (Postfix) with ESMTP id 3BC8F1258065
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jun 2016 15:51:59 +0530 (IST)
Received: from d50lp01.ny.us.ibm.com (d50lp01.pok.ibm.com [146.89.104.207])
 by d28relay06.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u57AJTVx51118292
 for <openbmc@lists.ozlabs.org>; Tue, 7 Jun 2016 15:49:32 +0530
Received: from localhost
 by d50lp01.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Tue, 7 Jun 2016 06:18:22 -0400
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp01.ny.us.ibm.com (158.87.18.20) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 7 Jun 2016 06:18:20 -0400
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: ratagupt@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Tue, 7 Jun 2016 10:18:19 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 7 Jun 2016 10:18:18 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016060710181686-168667 ;
 Tue, 7 Jun 2016 10:18:16 +0000 
In-Reply-To: <20160607112957.7fc13fe0@camb691>
Subject: Re: [PATCH phosphor-host-ipmid] Implement Network Override
From: "Ratan K Gupta" <ratagupt@in.ibm.com>
To: cyrilbur@gmail.com
Cc: openbmc@lists.ozlabs.org
Date: Tue, 7 Jun 2016 10:18:16 +0000
Sensitivity: 
MIME-Version: 1.0
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_05162016_FP4 June 02, 2016
X-LLNOutbound: False
X-Disclaimed: 29855
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16060710-0052-0000-0000-00000270BB8C
X-IBM-ISS-SpamDetectors: Score=0.4332; BY=0.291881; FL=0; FP=0; FZ=0; HX=0;
 KW=0; PH=0; SC=0.4332; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005349; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000168; SDB=6.00713145; UDB=6.00331828; UTC=2016-06-07
 10:18:19
x-cbparentid: 16060710-4536-0000-0000-0000080EB9C5
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF95926C77.EC120831-ON00257FCB.002E3C4C-00257FCB.00389AF0@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-07_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=8
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606070121
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
X-List-Received-Date: Tue, 07 Jun 2016 10:30:44 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5=
pt" ><div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5pt" ><div di=
r=3D"ltr" ><div>Hi Cyrl,</div>
<div>&nbsp;</div>
<div>Thanks for reviewing the code.</div>
<div>&nbsp;</div>
<div>I spoke to the maintainer of the host-ipmid module and was told that w=
e can use C++/C interchangeably based on the use cases.</div>
<div>&nbsp;</div>
<div>I also noticed that we are using the g++ compiler in the makefile of h=
ost-ipmid module so thought we an use c++.</div>&nbsp;

<div>Please find my comments inline.</div>
<div>&nbsp;</div>&nbsp;

<div>Regards</div>
<div>Ratan</div></div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddi=
ng-left:5px; direction:ltr; margin-right:0px" >----- Original message -----=
<br>From: Cyril Bur &lt;cyrilbur@gmail.com&gt;<br>To: Ratan K Gupta/India/I=
BM@IBMIN<br>Cc: openbmc@lists.ozlabs.org<br>Subject: Re: [PATCH phosphor-ho=
st-ipmid] Implement Network Override<br>Date: Tue, Jun 7, 2016 7:00 AM<br>&=
nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Mon, &nbsp;6 Jun 2016 13:00:44 -0500<br>OpenBMC Patches &lt;openbmc=
-patches@stwcx.xyz&gt; wrote:<br><br>&gt; From: ratagupt &lt;ratagupt@in.ib=
m.com&gt;<br>&gt;<br><br>Please see: <a href=3D"https://lists.ozlabs.org/pi=
permail/openbmc/2016-May/003240.html" target=3D"=5Fblank" >https://lists.oz=
labs.org/pipermail/openbmc/2016-May/003240.html</a>&nbsp;I'm<br>not going t=
o bother explaining (some) things, if I'm not clear it's because you<br>did=
n't read that email and associated links<br><br>&gt; ---<br>&gt; &nbsp;chas=
sishandler.C | 228 +++++++++++++++++++++++++++++++++++++++++++++++++++++--<=
br>&gt; &nbsp;1 file changed, 220 insertions(+), 8 deletions(-)<br>&gt;<br>=
&gt; diff --git a/chassishandler.C b/chassishandler.C<br>&gt; index d5b3404=
..e21d6da 100644<br>&gt; --- a/chassishandler.C<br>&gt; +++ b/chassishandle=
r.C<br>&gt; @@ -3,15 +3,19 @@<br>&gt; &nbsp;#include &lt;stdio.h&gt;<br>&gt=
; &nbsp;#include &lt;string.h&gt;<br>&gt; &nbsp;#include &lt;stdint.h&gt;<b=
r>&gt; -<br>&gt; -<br>&gt; +#include &lt;arpa/inet.h&gt;<br>&gt; +#include =
&lt;netinet/in.h&gt;<br>&gt; +#include &lt;string&gt;<br>&gt; +using namesp=
ace std;<br>&gt; &nbsp;//Defines<br>&gt; &nbsp;#define SET=5FPARM=5FVERSION=
 1<br>&gt; &nbsp;#define SET=5FPARM=5FBOOT=5FFLAGS=5FPERMANENT 0x40 //boot =
flags data1 7th bit on<br>&gt; &nbsp;#define SET=5FPARM=5FBOOT=5FFLAGS=5FVA=
LID=5FONE=5FTIME &nbsp; 0x80 //boot flags data1 8th bit on<br>&gt; &nbsp;#d=
efine SET=5FPARM=5FBOOT=5FFLAGS=5FVALID=5FPERMANENT &nbsp;0xC0 //boot flags=
 data1 7 &amp; 8 bit on<br>&gt; -<br>&gt; -<br>&gt; +#define SIZE=5FMAC 18<=
br>&gt; +#define SIZE=5FHOST=5FNETWORK=5FDATA 26<br>&gt; +#define SIZE=5FBO=
OT=5FOPTION SIZE=5FHOST=5FNETWORK=5FDATA<br>&gt; +//#define INET=5FADDRSTRL=
EN 15<br>&gt; &nbsp;<br>&gt; &nbsp;// OpenBMC Chassis Manager dbus framewor=
k<br>&gt; &nbsp;const char &nbsp;*chassis=5Fbus=5Fname &nbsp; &nbsp; &nbsp;=
=3D &nbsp;"org.openbmc.control.Chassis";<br>&gt; @@ -233,14 +237,197 @@ str=
uct get=5Fsys=5Fboot=5Foptions=5Ft {<br>&gt; &nbsp;struct get=5Fsys=5Fboot=
=5Foptions=5Fresponse=5Ft {<br>&gt; &nbsp; &nbsp; &nbsp;uint8=5Ft version;<=
br>&gt; &nbsp; &nbsp; &nbsp;uint8=5Ft parm;<br>&gt; - &nbsp; &nbsp;uint8=5F=
t data[5];<br>&gt; + &nbsp; &nbsp;uint8=5Ft data[SIZE=5FBOOT=5FOPTION];<br>=
&gt; &nbsp;} &nbsp;=5F=5Fattribute=5F=5F ((packed));<br><br>This is a packe=
d struct, so, this means it could represent a structure in<br>memory or a f=
ile, I can't see how big SIZE=5FBOOT=5FOPTION is but is it 5? Later<br>you =
use it for a data field that had size 8, so if you ever want to memcpy for<=
br>sizeof(struct get=5Fsys=5Fboot=5Foptions=5Fresponse=5Ft) or sizeof(struc=
t<br>set=5Fsys=5Fboot=5Foptions=5Ft) will this work?<br><br>Picture this sc=
enario; process A (which you have no control over) writes a<br>struct get=
=5Fsys=5Fboot=5Foptions=5Fresponse=5Ft to a file and it had data[5], proces=
s<br>B (you) now try to read that file and cast your buffer to a struct<br>=
get=5Fsys=5Fboot=5Foptions=5Fresponse=5Ft but you used data[SIZE=5FBOOT=5FO=
PTION] and you<br>walk through 'for (i =3D 0; i &lt; SIZE=5FBOOT=5FOPTION; =
i++)' completely correct from<br>your point of view, your structure should =
be big enough, but what was written<br>to file wasn't big enough for you to=
 do that... what happens? Now imagine the<br>file was mmaped... what happen=
s?</font><br>&nbsp;</div>
<div>RG&gt;&gt;Here Before my fix the SetSystem boot option response data w=
as 8 byte long and the getSystemBootOption Data was 5 Byte long.It is all a=
bout the IPMI protocol how much byte needs to be send or is it to be receiv=
ed.&nbsp;</div></blockquote>
<div>&nbsp;&nbsp; RG&gt;&gt;Now with the fix I have modified both(getSystem=
BootOption/SetSystem boot option Data)&nbsp; to 26 bytes long.Now if the ot=
her process sends me the 20byte/5byte.Our code is taking care.if the other =
process sends more then 26 byte,we are ignoring that data as it is not as p=
er the protocol.</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<blockquote class=3D"history-quote-1465287871325" data-history-content-modi=
fied=3D"1" data-history-expanded=3D"1" dir=3D"ltr" style=3D"border-left:sol=
id #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; margin-ri=
ght:0px" ><div>&nbsp;</div>
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >&gt; &nbsp;<br>&gt; &nbsp;struct set=5Fsys=5Fboot=5Foptions=5Ft {<=
br>&gt; &nbsp; &nbsp; &nbsp;uint8=5Ft parameter;<br>&gt; - &nbsp; &nbsp;uin=
t8=5Ft data[8];<br>&gt; + &nbsp; &nbsp;uint8=5Ft data[SIZE=5FBOOT=5FOPTION]=
;<br>&gt; &nbsp;} &nbsp;=5F=5Fattribute=5F=5F ((packed));<br>&gt; &nbsp;<br=
>&gt; +struct host=5Fnetwork=5Fconfig=5Ft {<br>&gt; + &nbsp; &nbsp; string =
ipaddress;<br>&gt; + &nbsp; &nbsp; string prefix;<br>&gt; + &nbsp; &nbsp; s=
tring gateway;<br>&gt; + &nbsp; &nbsp; string macaddress;<br>&gt; + &nbsp; =
&nbsp; string isDHCP;<br>&gt; +<br>&gt; + &nbsp; &nbsp; host=5Fnetwork=5Fco=
nfig=5Ft()<br>&gt; + &nbsp; &nbsp; {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; =
ipaddress =3D "";<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; prefix =3D "";<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; gateway =3D "";<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp; macaddress =3D "";<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; isDHC=
P =3D "";<br>&gt; + &nbsp; &nbsp; }<br><br>Admittedly I don't do c++, is th=
is c++? Do c++ programmers recommend this?</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" ><strong>RG&gt;&gt;&gt;&gt;&gt;In C++ it is valid contruct.</strong><br=
><br>&gt; +};<br>&gt; +<br>&gt; +uint8=5Ft getHostNetworkData(get=5Fsys=5Fb=
oot=5Foptions=5Fresponse=5Ft* respptr)<br><br>Style<br><br>&gt; +{<br>&gt; =
+<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf ("Inside getHostNetworkData");<br=
><br>Style, also that looks a lot like a debug printf...?<br><br>&gt; + &nb=
sp; &nbsp;char * prop =3D NULL;<br><br>Style<br><br>&gt; +<br>&gt; + &nbsp;=
 &nbsp;uint8=5Ft data[SIZE=5FBOOT=5FOPTION]=3D{0x80,0x21, 0x70 ,0x62 ,0x21,=
0x00 ,0x01 ,0x06 ,0x04};<br><br>uint8=5Ft data[SIZE=5FBOOT=5FOPTION] =3D {0=
x80, 0x21, 0x70, 0x62, 0x21, 0x00, 0x01,<br>0x06, 0x04};<br><br>&gt; +<br>&=
gt; + &nbsp; &nbsp;//As first 9 bytes are prefilled so in rest of the bytes=
 we are assigning 0<br>&gt; +<br>&gt; + &nbsp; &nbsp;memset( data+9 ,0,(SIZ=
E=5FBOOT=5FOPTION-9) );<br><br>"All array elements that are not initialized=
 explicitly are initialized<br>implicitly the same way as objects that have=
 static storage duration."<br><br><a href=3D"http://en.cppreference.com/w/c=
/language/array=5Finitialization" target=3D"=5Fblank" >http://en.cppreferen=
ce.com/w/c/language/array=5Finitialization</a>&nbsp;<br><br>so what you've =
done is pointless...</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" ><strong>RG&gt;&gt;Accepted</strong><br><br>&gt; +<br>&gt; + &nbsp; &nb=
sp;int rc =3D dbus=5Fget=5Fproperty("network=5Fconfig",&amp;prop);<br><br>i=
nt rc =3D dbus=5Fget=5Fproperty("network=5Fconfig", &amp;prop);<br><br>&gt;=
 +<br>&gt; + &nbsp; &nbsp;if (rc &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp;fprintf(stderr, "Dbus get property(boot=5Fflags) failed for get=5Fsys=
=5Fboot=5Foptions.\n");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;return rc;<br>=
&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;/* network=5Fconfig =
property Value would be in the form of<br>&gt; + &nbsp; &nbsp; * ipaddress=
=3D1.1.1.1,prefix=3D16,gateway=3D2.2.2.2,mac=3D11:22:33:44:55:66,dhcp=3D0<b=
r>&gt; + &nbsp; &nbsp; */<br>&gt; +<br>&gt; + &nbsp; &nbsp;/* Parsing the s=
tring and fill the hostconfig structure with the<br>&gt; + &nbsp; &nbsp; * =
values */<br>&gt; +<br>&gt; + &nbsp; &nbsp;host=5Fnetwork=5Fconfig=5Ft host=
=5Fconfig;<br>&gt; + &nbsp; &nbsp;string delimiter =3D ",";<br>&gt; +<br>&g=
t; + &nbsp; &nbsp;int pos =3D 0;<br>&gt; + &nbsp; &nbsp;string token,name,v=
alue;<br>&gt; + &nbsp; &nbsp;string conf=5Fstr(prop);<br>&gt; + &nbsp; &nbs=
p;<br>&gt; + &nbsp; &nbsp;printf ("Configuration String[%s]\n ",conf=5Fstr.=
c=5Fstr());<br>&gt; +<br>&gt; + &nbsp; &nbsp;while ((pos =3D conf=5Fstr.fin=
d(delimiter)) !=3D std::string::npos) {<br>&gt; +<br>&gt; + &nbsp; &nbsp; &=
nbsp; &nbsp;token =3D conf=5Fstr.substr(0, pos);<br>&gt; + &nbsp; &nbsp; &n=
bsp; &nbsp;int pos1 =3D token.find("=3D");<br>&gt; +<br>&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp;name =3D token.substr(0,pos1);<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp;value =3D token.substr(pos1+1,pos);<br>&gt; +<br>&gt; + &nbsp; &nbs=
p; &nbsp; &nbsp;if ( name =3D=3D "ipaddress" )<br><br>There needs to be som=
e kind of consistency as to what language we're writing in<br>because that =
line can't persist. I understand that in c++ this will do what you<br>want,=
 however, to a C programmer screams alarm bells, this compares pointers<br>=
which is almost never what you want to do.<br><br>In fairness this problem =
started long before this patch but that's no reason to<br>continue it. I'm =
flexible, I like to think I'm actually not that strongly<br>opinionated (at=
 least on this issue), please pick one!<br><br>Looking at the language brea=
kdown that github seems to think this project is<br>written in:<br>C 97.2% =
Makefile 1.6% Other 1.2%<br><br>How about we go exclusively with C?</font><=
/div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" ><strong>RG&gt;&gt;&gt;This needs to be discussed with the stakeholders=
.</strong><br><br>Maintainers: Can we try to enforce this at a Makefile lev=
el?<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;host=5Fconfig.ip=
address =3D value;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;else if ( name =3D=
=3D "prefix")<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;host=5Fcon=
fig.prefix =3D value;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;else if ( name =
=3D=3D "gateway" )<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;host=
=5Fconfig.gateway =3D value;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;else if (=
 name =3D=3D "mac" )<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;hos=
t=5Fconfig.macaddress =3D value;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;else =
if ( name =3D=3D "dhcp" )<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;host=5Fconfig.isDHCP =3D value;<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp;conf=5Fstr.erase(0, pos + delimiter.length());<br>&gt; + &nbsp; &nbsp=
; &nbsp; &nbsp;printf ("Name=3D[%s],Value=3D[%s],position=3D[%d]\n",name.c=
=5Fstr(),value.c=5Fstr(),pos);<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; +=
 &nbsp; &nbsp;//Converting the mac address as number//<br>&gt; + &nbsp; &nb=
sp;//If there as an error in converting the mac as number we are not throwi=
ng<br>&gt; + &nbsp; &nbsp;//error we would be sending 0's for the mac.<br>&=
gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;char *tokptr =3D NULL;<br>&gt; +=
 &nbsp; &nbsp;char* digit =3D strtok=5Fr((char *)host=5Fconfig.macaddress.c=
=5Fstr(), ":", &amp;tokptr);<br>&gt; + &nbsp; &nbsp;if (digit =3D=3D NULL)<=
br>&gt; + &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stder=
r, "Unexpected MAC format: %s", host=5Fconfig.macaddress.c=5Fstr());<br>&gt=
; + &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;//As 9 by=
tes are pre filled so staring from index 9.If there is a failure<br>&gt; + =
&nbsp; &nbsp;//in the strtok=5Fr then digit will be null then we don't need=
 to do<br>&gt; + &nbsp; &nbsp;//anything as data is prefilled with 0<br>&gt=
; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;uint8=5Ft index=3D9;<br>&gt; +<br>=
&gt; + &nbsp; &nbsp;while (digit !=3D NULL)<br>&gt; + &nbsp; &nbsp;{<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp;int resp=5Fbyte =3D strtoul(digit, NULL, 16)=
;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy((void*)&amp;data[index], &amp=
;resp=5Fbyte, 1);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;index++;<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;digit =3D strtok=5Fr(NULL, ":", &amp;tokptr);<br>=
&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;//Conevrt the dhcp,i=
paddress,mask and gateway as hex number<br>&gt; + &nbsp; &nbsp;data[index++=
]=3D0x00;<br>&gt; + &nbsp; &nbsp;sscanf(host=5Fconfig.isDHCP.c=5Fstr(),"%02=
X",&amp;data[index++]);<br>&gt; +<br>&gt; + &nbsp; &nbsp;inet=5Fpton(AF=5FI=
NET,host=5Fconfig.ipaddress.c=5Fstr(),(void *)&amp;data[index]);<br>&gt; + =
&nbsp; &nbsp;index+=3D4;<br>&gt; + &nbsp; &nbsp;sscanf(host=5Fconfig.prefix=
.c=5Fstr(),"%02X",&amp;data[index++]);<br>&gt; + &nbsp; &nbsp;inet=5Fpton(A=
F=5FINET,host=5Fconfig.gateway.c=5Fstr(),(void *)&amp;data[index]);<br>&gt;=
 + &nbsp; &nbsp;index+=3D4;<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf ("\n=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DPrinting the Network Conf=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");<br>&gt; +<br>&gt; + &nbs=
p; &nbsp;for (int j =3D 0;j&lt;index;j++)<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp;printf("%02x ", data[j]);<br>&gt; +<br>&gt; + &nbsp; &nbsp;memcpy(respp=
tr-&gt;data,data,SIZE=5FBOOT=5FOPTION);<br>&gt; + &nbsp; &nbsp;return 0;<br=
>&gt; +<br>&gt; +}<br>&gt; +<br>&gt; +uint8=5Ft setHostNetworkData(set=5Fsy=
s=5Fboot=5Foptions=5Ft * reqptr)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;printf (=
"\n Inside setHostNetworkData***********");<br>&gt; + &nbsp; &nbsp;string h=
ost=5Fnetwork=5Fconfig;<br>&gt; + &nbsp; &nbsp;char mac[SIZE=5FMAC];<br>&gt=
; + &nbsp; &nbsp;char ipAddress[INET=5FADDRSTRLEN];<br>&gt; + &nbsp; &nbsp;=
char gateway[INET=5FADDRSTRLEN];<br>&gt; + &nbsp; &nbsp;char prefix[1];<br>=
&gt; + &nbsp; &nbsp;char dhcp[2];<br>&gt; + &nbsp; &nbsp;uint32=5Ft cookie =
=3D 0;<br>&gt; +<br>&gt; +<br>&gt; + &nbsp; &nbsp;memset( mac ,0,SIZE=5FMAC=
 );<br>&gt; + &nbsp; &nbsp;memset(ipAddress,0,INET=5FADDRSTRLEN);<br>&gt; +=
 &nbsp; &nbsp;memset(gateway,0,INET=5FADDRSTRLEN);<br>&gt; + &nbsp; &nbsp;m=
emset(prefix,0,1);<br>&gt; + &nbsp; &nbsp;memset(dhcp,0,2);<br>&gt; +<br>&g=
t; + &nbsp; &nbsp;uint8=5Ft index =3D 9; &nbsp;<br>&gt; + &nbsp; &nbsp;ssca=
nf((char *)&amp;(reqptr-&gt;data[1]),"%02X",&amp;cookie);<br>&gt; +<br>&gt;=
 + &nbsp; &nbsp;if ( !cookie) {<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp; snprintf(mac, SIZE=5FMAC, "%02x:%02x:%02x:%02x:%02x:%02x=
",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[index=
],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[index=
+1],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[ind=
ex+2],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[i=
ndex+3],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data=
[index+4],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;da=
ta[index+5]);<br>&gt; +<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;snpr=
intf(dhcp,2, "%d", reqptr-&gt;data[index+6]);<br>&gt; +<br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp;snprintf(ipAddress, INET=5FADDRSTRLEN, "%d.%d.%d.%d",<br>=
&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[index+8], r=
eqptr-&gt;data[index+9], reqptr-&gt;data[index+10], reqptr-&gt;data[index+1=
1]);<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;snprintf(prefix, INET=
=5FADDRSTRLEN, "%d", reqptr-&gt;data[index+12]);<br>&gt; +<br>&gt; +<br>&gt=
; + &nbsp; &nbsp; &nbsp; &nbsp;snprintf(gateway, INET=5FADDRSTRLEN, "%d.%d.=
%d.%d",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[=
index+13], reqptr-&gt;data[index+14], reqptr-&gt;data[index+15], reqptr-&gt=
;data[index+16]);<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp=
;host=5Fnetwork=5Fconfig +=3D "ipaddress=3D"+string(ipAddress)+",prefix=3D"=
+ \<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; string(prefix)+",gateway=3D"+string(gateway)+\<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
",mac=3D"+string(mac)+",dhcp=3D"+string(dhcp);<br>&gt; +<br>&gt; +<br>&gt; =
+ &nbsp; &nbsp;printf ("Host Config Str=3D %s\n",host=5Fnetwork=5Fconfig.c=
=5Fstr());<br>&gt; +<br>&gt; + &nbsp; &nbsp;int r =3D dbus=5Fset=5Fproperty=
("network=5Fconfig",host=5Fnetwork=5Fconfig.c=5Fstr());<br>&gt; +<br>&gt; +=
 &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(=
stderr, "Dbus set property(network=5Fconfig) failed for set=5Fsys=5Fboot=5F=
options.\n");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =3D IPMI=5FCC=5FUNSPEC=
IFIED=5FERROR;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;re=
turn r;<br>&gt; +<br>&gt; +}<br>&gt; +<br>&gt; &nbsp;ipmi=5Fret=5Ft ipmi=5F=
chassis=5Fwildcard(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=
=5Ft response,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Fle=
n=5Ft data=5Flen, ipmi=5Fcontext=5Ft context)<br>&gt; @@ -446,7 +633,18 @@ =
ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft=
 netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>=
&gt; &nbsp;<br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;} else {<br>&gt; + &nbsp;=
 &nbsp;} else if ( reqptr-&gt;parameter =3D=3D 0x61 ) {<br>&gt; + &nbsp; &n=
bsp; &nbsp; resp-&gt;parm &nbsp; &nbsp; &nbsp;=3D 0x61;<br>&gt; + &nbsp; &n=
bsp; &nbsp; int ret =3D getHostNetworkData(resp);<br>&gt; + &nbsp; &nbsp; &=
nbsp; if (ret &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fprint=
f(stderr, "getHostNetworkData failed for get=5Fsys=5Fboot=5Foptions.\n");<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D IPMI=5FCC=5FUNSPECIFIED=
=5FERROR;<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; }else<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FOK;<br>&gt; + &nbsp; &nbsp;}<b=
r>&gt; +<br>&gt; + &nbsp; &nbsp;else {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr-&gt;parameter)=
;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; @@ -476,6 +674,9 @@ =
ipmi=5Fret=5Ft ipmi=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft=
 netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp; * Parameter #5 mea=
ns boot flags. Please refer to 28.13 of ipmi doc.<br>&gt; &nbsp; &nbsp; &nb=
sp; * This is the only parameter used by petitboot.<br>&gt; &nbsp; &nbsp; &=
nbsp; */<br>&gt; +<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf("IPMI SET=5FSYS=
=5FBOOT=5FOPTIONS reqptr-&gt;parameter =3D[%d]\n",reqptr-&gt;parameter);<br=
>&gt; &nbsp; &nbsp; &nbsp;if (reqptr-&gt;parameter =3D=3D 5) {<br>&gt; &nbs=
p;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s =3D get=5Fboot=5Foption=5Fby=
=5Fipmi(((reqptr-&gt;data[1] &amp; 0x3C) &gt;&gt; 2));<br>&gt; @@ -507,7 +7=
08,18 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions(ipmi=5F=
netfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FUNSPECIFIED=5FERROR;<br>&gt; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;} else {<b=
r>&gt; + &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;else if ( reqptr-&gt;paramet=
er =3D=3D 0x61 ) {<br>&gt; + &nbsp; &nbsp; &nbsp; printf("IPMI SET=5FSYS=5F=
BOOT=5FOPTIONS reqptr-&gt;parameter =3D[%d]\n",reqptr-&gt;parameter);<br>&g=
t; + &nbsp; &nbsp; &nbsp; int ret =3D setHostNetworkData(reqptr);<br>&gt; +=
 &nbsp; &nbsp; &nbsp; if (ret &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; fprintf(stderr, "setHostNetworkData failed for set=5Fsys=5Fboot=
=5Foptions.\n");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D IPMI=
=5FCC=5FUNSPECIFIED=5FERROR;<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; }<br>=
&gt; + &nbsp; &nbsp;} &nbsp; &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;<br>&gt; =
+ &nbsp; &nbsp;else {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(std=
err, "Unsupported parameter 0x%x\n", reqptr-&gt;parameter);<br>&gt; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&g=
t; &nbsp; &nbsp; &nbsp;}</font></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div></div></div><BR>
