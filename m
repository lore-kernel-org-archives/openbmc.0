Return-Path: <ratagupt@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rWJSS28YhzDqvx
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 21:49:11 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5HBhfTK141606
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 07:49:08 -0400
Received: from e28smtp06.in.ibm.com (e28smtp06.in.ibm.com [125.16.236.6])
 by mx0b-001b2d01.pphosted.com with ESMTP id 23kqthm3k0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 07:49:08 -0400
Received: from localhost
 by e28smtp06.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Fri, 17 Jun 2016 17:19:04 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
 by e28smtp06.in.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 17 Jun 2016 17:19:01 +0530
X-IBM-Helo: d28dlp03.in.ibm.com
X-IBM-MailFrom: ratagupt@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay06.in.ibm.com (d28relay06.in.ibm.com [9.184.220.150])
 by d28dlp03.in.ibm.com (Postfix) with ESMTP id 41E07125805F
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 17:21:33 +0530 (IST)
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d28relay06.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5HBmwR742532944
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jun 2016 17:18:59 +0530
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Fri, 17 Jun 2016 05:48:58 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.75)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Fri, 17 Jun 2016 05:48:55 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: ratagupt@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Fri, 17 Jun 2016 11:48:54 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.98)
 by smtp.notes.na.collabserv.com (10.106.227.123) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 17 Jun 2016 11:48:52 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2016061711485225-215531 ;
 Fri, 17 Jun 2016 11:48:52 +0000 
In-Reply-To: <20160617054706.GA5752@localhost.localdomain>
Subject: Re: [PATCH phosphor-host-ipmid v5] Resolves openbmc/openbmc#267'
From: "Ratan K Gupta" <ratagupt@in.ibm.com>
To: sam@mendozajonas.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Fri, 17 Jun 2016 11:48:52 +0000
Sensitivity: 
MIME-Version: 1.0
References: 
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_06062016_FP3 June 13, 2016
X-LLNOutbound: False
X-Disclaimed: 14615
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16061711-0048-0000-0000-0000029C0C9D
X-IBM-ISS-SpamDetectors: Score=0.397008; BY=0.293673; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.397008; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005395; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00717560; UDB=6.00334515; UTC=2016-06-17
 11:48:53
x-cbparentid: 16061711-9818-0000-0000-000000C0E756
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF1CBD4829.5EAEC0CD-ON00257FD5.0031DAD3-00257FD5.0040E637@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-17_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606170141
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
X-List-Received-Date: Fri, 17 Jun 2016 11:49:12 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" style=3D"font-family:Arial;font-size:10.5=
pt" ><div dir=3D"ltr" >Hi Sam,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks for looking at the code.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Please find the response inline.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><font face=3D"Default Monospace,Courier New,Courier,monos=
pace" size=3D"2" >- What is the purpose of the host=5Fnetwork=5Fconfig stru=
ct, and why is the<br>&nbsp;&nbsp;request parsed into a string before being=
 stored? Why not just store<br>&nbsp;&nbsp;the original request as is?</fon=
t></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><font face=3D"Default Monospace,Courier New,Courier,monos=
pace" size=3D"2" >&nbsp; RG&gt;&gt;&gt;This host config data is configured =
through REST/HOST(IPMI Client),Through REST we are configuring the data in =
human readable string,It is cumbersome for the user to enter the data in co=
rrect format in Hexadecimal through REST.</font></div>
<div dir=3D"ltr" ><br><font face=3D"Default Monospace,Courier New,Courier,m=
onospace" size=3D"2" >- Do you have tests to verify the correctness of the =
hex produced?</font></div>
<div dir=3D"ltr" ><font face=3D"Default Monospace,Courier New,Courier,monos=
pace" size=3D"2" >&nbsp; RG&gt;&gt;I veri</font>fied it in my unit testing =
that it was working fine.I was setting the data through REST and getting it=
 via IPMI and viceversa also.</div>
<div dir=3D"ltr" >&nbsp;&nbsp;&nbsp;</div>
<div dir=3D"ltr" >&nbsp;&nbsp;&nbsp;&nbsp; Is there a path where you think =
that Hex will not be correct? Please let me know so that I can look into it=
.</div>
<div dir=3D"ltr" >&nbsp;&nbsp;&nbsp;&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;&nbsp; Regards</div>
<div dir=3D"ltr" >&nbsp;&nbsp; Ratan Gupta</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Samuel Mendoza-Jon=
as &lt;sam@mendozajonas.com&gt;<br>To: OpenBMC Patches &lt;openbmc-patches@=
stwcx.xyz&gt;<br>Cc: openbmc@lists.ozlabs.org, Ratan K Gupta/India/IBM@IBMI=
N<br>Subject: Re: [PATCH phosphor-host-ipmid v5] Resolves openbmc/openbmc#2=
67'<br>Date: Fri, Jun 17, 2016 11:17 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Hi Ratan,<br><br>I have some notes below, but mainly I have these two =
questions:<br><br>- What is the purpose of the host=5Fnetwork=5Fconfig stru=
ct, and why is the<br>&nbsp;&nbsp;request parsed into a string before being=
 stored? Why not just store<br>&nbsp;&nbsp;the original request as is?<br>-=
 Do you have tests to verify the correctness of the hex produced?<br><br>Ch=
eers,<br>Sam<br><br>On Thu, Jun 16, 2016 at 09:50:40AM -0500, OpenBMC Patch=
es wrote:<br>&gt; From: ratagupt &lt;ratagupt@in.ibm.com&gt;<br>&gt;<br>&gt=
; ---<br>&gt; &nbsp;chassishandler.C | 212 ++++++++++++++++++++++++++++++++=
+++++++++++++++++++----<br>&gt; &nbsp;1 file changed, 200 insertions(+), 12=
 deletions(-)<br>&gt;<br>&gt; diff --git a/chassishandler.C b/chassishandle=
r.C<br>&gt; index d5b3404..2cc0895 100644<br>&gt; --- a/chassishandler.C<br=
>&gt; +++ b/chassishandler.C<br>&gt; @@ -1,17 +1,25 @@<br>&gt; &nbsp;#inclu=
de "chassishandler.h"<br>&gt; &nbsp;#include "ipmid-api.h"<br>&gt; &nbsp;#i=
nclude &lt;stdio.h&gt;<br>&gt; +#include &lt;stdlib.h&gt;<br>&gt; &nbsp;#in=
clude &lt;string.h&gt;<br>&gt; &nbsp;#include &lt;stdint.h&gt;<br>&gt; -<br=
>&gt; -<br>&gt; +#include &lt;arpa/inet.h&gt;<br>&gt; +#include &lt;netinet=
/in.h&gt;<br>&gt; +#include &lt;string&gt;<br>&gt; +#include &lt;sstream&gt=
;<br>&gt; +#include &lt;array&gt;<br>&gt; +using namespace std;<br>&gt; &nb=
sp;//Defines<br>&gt; -#define SET=5FPARM=5FVERSION 1<br>&gt; -#define SET=
=5FPARM=5FBOOT=5FFLAGS=5FPERMANENT 0x40 //boot flags data1 7th bit on<br>&g=
t; +#define SET=5FPARM=5FVERSION &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; 0x01<br>&gt; +#define SET=5FPARM=5FBOOT=5FFLAGS=
=5FPERMANENT &nbsp; &nbsp; &nbsp; &nbsp;0x40 //boot flags data1 7th bit on<=
br>&gt; &nbsp;#define SET=5FPARM=5FBOOT=5FFLAGS=5FVALID=5FONE=5FTIME &nbsp;=
 0x80 //boot flags data1 8th bit on<br>&gt; &nbsp;#define SET=5FPARM=5FBOOT=
=5FFLAGS=5FVALID=5FPERMANENT &nbsp;0xC0 //boot flags data1 7 &amp; 8 bit on=
<br>&gt; &nbsp;<br>&gt; -<br>&gt; +#define SIZE=5FMAC &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; 18<br>&gt; +#define SIZE=5FHOST=5FNETWORK=5FDATA &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; 26<br><br>How did you decide on the size for SIZE=
=5FHOST=5FNETWORK=5FDATA?<br><br>&gt; +#define SIZE=5FBOOT=5FOPTION &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SIZE=5FHOST=
=5FNETWORK=5FDATA<br>&gt; +#define SIZE=5FPREFIX &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;7<br>&gt; &=
nbsp;<br>&gt; &nbsp;// OpenBMC Chassis Manager dbus framework<br>&gt; &nbsp=
;const char &nbsp;*chassis=5Fbus=5Fname &nbsp; &nbsp; &nbsp;=3D &nbsp;"org.=
openbmc.control.Chassis";<br>&gt; @@ -233,14 +241,174 @@ struct get=5Fsys=
=5Fboot=5Foptions=5Ft {<br>&gt; &nbsp;struct get=5Fsys=5Fboot=5Foptions=5Fr=
esponse=5Ft {<br>&gt; &nbsp; &nbsp; &nbsp;uint8=5Ft version;<br>&gt; &nbsp;=
 &nbsp; &nbsp;uint8=5Ft parm;<br>&gt; - &nbsp; &nbsp;uint8=5Ft data[5];<br>=
&gt; + &nbsp; &nbsp;uint8=5Ft data[SIZE=5FBOOT=5FOPTION];<br>&gt; &nbsp;} &=
nbsp;=5F=5Fattribute=5F=5F ((packed));<br>&gt; &nbsp;<br>&gt; &nbsp;struct =
set=5Fsys=5Fboot=5Foptions=5Ft {<br>&gt; &nbsp; &nbsp; &nbsp;uint8=5Ft para=
meter;<br>&gt; - &nbsp; &nbsp;uint8=5Ft data[8];<br>&gt; + &nbsp; &nbsp;uin=
t8=5Ft data[SIZE=5FBOOT=5FOPTION];<br>&gt; &nbsp;} &nbsp;=5F=5Fattribute=5F=
=5F ((packed));<br>&gt; &nbsp;<br>&gt; +struct host=5Fnetwork=5Fconfig=5Ft =
{<br>&gt; + &nbsp; &nbsp; string ipaddress;<br>&gt; + &nbsp; &nbsp; string =
prefix;<br>&gt; + &nbsp; &nbsp; string gateway;<br>&gt; + &nbsp; &nbsp; str=
ing macaddress;<br>&gt; + &nbsp; &nbsp; string isDHCP;<br><br>Is there a ne=
ed to have these all as strings?<br><br>&gt; +<br>&gt; + &nbsp; &nbsp; host=
=5Fnetwork=5Fconfig=5Ft():ipaddress(),prefix(),gateway(),macaddress() {}<br=
>&gt; +};<br>&gt; +<br>&gt; +uint8=5Ft getHostNetworkData(get=5Fsys=5Fboot=
=5Foptions=5Fresponse=5Ft *respptr)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;char =
*prop =3D NULL;<br>&gt; +<br>&gt; + &nbsp; &nbsp;std::array&lt;uint8=5Ft, S=
IZE=5FBOOT=5FOPTION&gt; respData{0x80,0x21, 0x70 ,0x62 ,0x21,0x00 ,0x01 ,0x=
06 ,0x04};<br><br>The "0x21, 0x70 ,0x62 ,0x21" cookie is a magic value that=
 Petitboot uses<br>to recognise an override message it can read. Using it u=
nconditionally<br>here means that openbmc would be hard-coded to only suppo=
rt Petitboot,<br>is that what we, or other users would expect?<br><br>&gt; =
+<br>&gt; + &nbsp; &nbsp;int rc =3D dbus=5Fget=5Fproperty("network=5Fconfig=
",&amp;prop);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (rc &lt; 0) {<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Dbus get property(boot=5Fflags) =
failed for get=5Fsys=5Fboot=5Foptions.\n");<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp;return rc;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;=
/* network=5Fconfig property Value would be in the form of<br>&gt; + &nbsp;=
 &nbsp; * ipaddress=3D1.1.1.1,prefix=3D16,gateway=3D2.2.2.2,mac=3D11:22:33:=
44:55:66,dhcp=3D0<br>&gt; + &nbsp; &nbsp; */<br>&gt; +<br>&gt; + &nbsp; &nb=
sp;/* Parsing the string and fill the hostconfig structure with the<br>&gt;=
 + &nbsp; &nbsp; * values */<br><br>If I'm reading this right the host=5Fco=
nfig structure is filled in<br>according to the "network=5Fconfig" string, =
and then each field is copied<br>into respData - would it be simpler to ski=
p the structure and just<br>fill in respData?<br><br>&gt; +<br>&gt; + &nbsp=
; &nbsp;host=5Fnetwork=5Fconfig=5Ft host=5Fconfig;<br>&gt; + &nbsp; &nbsp;s=
tring delimiter =3D ",";<br>&gt; +<br>&gt; + &nbsp; &nbsp;size=5Ft pos =3D =
0;<br>&gt; + &nbsp; &nbsp;string token,name,value;<br>&gt; + &nbsp; &nbsp;s=
tring conf=5Fstr(prop);<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;prin=
tf ("Configuration String[%s]\n ",conf=5Fstr.c=5Fstr());<br><br>Should we p=
rint this all the time, or just on debug?<br><br>&gt; +<br>&gt; + &nbsp; &n=
bsp;while ( conf=5Fstr.length() &gt; 0) {<br>&gt; +<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;pos =3D conf=5Fstr.find(delimiter);<br>&gt; +<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;//This condition is to extract the last<br>&gt; + &nb=
sp; &nbsp; &nbsp; &nbsp;//Substring as we will not be having the delimeter<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;//at end. std::string::npos is -1<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (=
 pos =3D=3D std::string::npos )<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pos =3D conf=5Fstr.length();<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;toke=
n =3D conf=5Fstr.substr(0, pos);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;int p=
os1 =3D token.find("=3D");<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;n=
ame =3D token.substr(0,pos1);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;value =
=3D token.substr(pos1+1,pos);<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;if ( name =3D=3D "ipaddress" )<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp;host=5Fconfig.ipaddress =3D value;<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp;else if ( name =3D=3D "prefix")<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;host=5Fconfig.prefix =3D value;<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp;else if ( name =3D=3D "gateway" )<br>&gt; + &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;host=5Fconfig.gateway =3D value;<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;else if ( name =3D=3D "mac" )<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;host=5Fconfig.macaddress =3D value;<br>&gt; + &nbsp; &nb=
sp; &nbsp; &nbsp;else if ( name =3D=3D "dhcp" )<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;host=5Fconfig.isDHCP =3D value;<br>&gt; + &nbsp; &n=
bsp; &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;conf=5Fstr.erase(0,=
 pos + delimiter.length());<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &n=
bsp; &nbsp;//Starting from index 9 as 9 bytes are prefilled.<br>&gt; +<br>&=
gt; + &nbsp; &nbsp;pos =3D 0;<br>&gt; + &nbsp; &nbsp;delimiter =3D ":";<br>=
&gt; + &nbsp; &nbsp;uint8=5Ft resp=5Fbyte =3D 0;<br>&gt; + &nbsp; &nbsp;uin=
t8=5Ft index =3D 9;<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;while ((=
pos =3D host=5Fconfig.macaddress.find(delimiter)) !=3D std::string::npos) {=
<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;token =3D host=5Fconfig.mac=
address.substr(0, pos);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;resp=5Fbyte =
=3D strtoul(token.c=5Fstr(), NULL, 16);<br><br>Would be a good idea to chec=
k strtoul for errors<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;memcpy((void*=
)&amp;respData[index], &amp;resp=5Fbyte, 1);<br><br>Don't need to cast to (=
void*)<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;host=5Fconfig.macaddress.er=
ase(0, pos + delimiter.length());<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;inde=
x++;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;resp=5Fbyte =
=3D strtoul(host=5Fconfig.macaddress.c=5Fstr(), NULL, 16);<br>&gt; + &nbsp;=
 &nbsp;memcpy((void*)&amp;respData[index++], &amp;resp=5Fbyte, 1);<br><br>S=
ame<br><br>&gt; +<br>&gt; + &nbsp; &nbsp;//Conevrt the dhcp,ipaddress,mask =
and gateway as hex number<br><br>Typo, Conevrt/Convert<br><br>&gt; + &nbsp;=
 &nbsp;respData[index++]=3D0x00;<br>&gt; + &nbsp; &nbsp;sscanf(host=5Fconfi=
g.isDHCP.c=5Fstr(),"%02X",&amp;respData[index++]);<br>&gt; +<br>&gt; + &nbs=
p; &nbsp;inet=5Fpton(AF=5FINET,host=5Fconfig.ipaddress.c=5Fstr(),(void *)&a=
mp;respData[index]);<br>&gt; + &nbsp; &nbsp;index+=3D4;<br>&gt; +<br>&gt; +=
 &nbsp; &nbsp;sscanf(host=5Fconfig.prefix.c=5Fstr(),"%02d",&amp;respData[in=
dex++]);<br>&gt; + &nbsp; &nbsp;inet=5Fpton(AF=5FINET,host=5Fconfig.gateway=
.c=5Fstr(),(void *)&amp;respData[index]);<br>&gt; + &nbsp; &nbsp;index+=3D4=
;<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;printf ("\n=3D=3D=3DPrinti=
ng the IPMI Formatted Data=3D=3D=3D=3D=3D=3D=3D=3D\n");<br><br>As above, de=
bug message?<br><br>&gt; +<br>&gt; + &nbsp; &nbsp;for (int j =3D 0;j&lt;ind=
ex;j++)<br><br>Spacing it out like this is easier to read:<br><br>&nbsp;&nb=
sp; &nbsp;for (int j =3D 0; j &lt; index; j++)<br><br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp;printf("%02x ", respData[j]);<br>&gt; +<br>&gt; + &nbsp; &nbsp=
;memcpy(respptr-&gt;data,respData.data(),SIZE=5FBOOT=5FOPTION);<br>&gt; + &=
nbsp; &nbsp;return 0;<br>&gt; +}<br>&gt; +<br>&gt; +uint8=5Ft setHostNetwor=
kData(set=5Fsys=5Fboot=5Foptions=5Ft * reqptr)<br>&gt; +{<br>&gt; + &nbsp; =
&nbsp;string host=5Fnetwork=5Fconfig;<br>&gt; + &nbsp; &nbsp;char mac[SIZE=
=5FMAC] =3D {0};<br>&gt; + &nbsp; &nbsp;char ipAddress[INET=5FADDRSTRLEN] =
=3D {0};<br>&gt; + &nbsp; &nbsp;char gateway[INET=5FADDRSTRLEN] =3D {0};<br=
>&gt; + &nbsp; &nbsp;char dhcp[SIZE=5FPREFIX] =3D {0};<br>&gt; + &nbsp; &nb=
sp;char prefix[SIZE=5FPREFIX] =3D {0};<br>&gt; + &nbsp; &nbsp;uint32=5Ft co=
okie =3D 0;<br>&gt; +<br>&gt; + &nbsp; &nbsp;memcpy(&amp;cookie,(char *)&am=
p;(reqptr-&gt;data[1]),sizeof(cookie));<br>&gt; + &nbsp; &nbsp;<br>&gt; + &=
nbsp; &nbsp;uint8=5Ft index =3D 9; &nbsp;<br>&gt; +<br>&gt; + &nbsp; &nbsp;=
if ( cookie) {<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;snprintf(mac, SIZE=5FMAC, "%02x:%02x:%02x:%02x:%02x:%02x",<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[index],<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[index+1],=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[index+2=
],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[index=
+3],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[ind=
ex+4],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[i=
ndex+5]);<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;snpr=
intf(dhcp,SIZE=5FPREFIX, "%d", reqptr-&gt;data[index+7]);<br><br>*If* this =
is following the format used by Petitboot, is the order of<br>fields here c=
orrect? It looks like the size fields have been skipped.<br><br>&gt; +<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp;snprintf(ipAddress, INET=5FADDRSTRLEN, "%d=
.%d.%d.%d",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;d=
ata[index+8], reqptr-&gt;data[index+9], reqptr-&gt;data[index+10], reqptr-&=
gt;data[index+11]);<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;snprintf=
(prefix,SIZE=5FPREFIX,"%d", reqptr-&gt;data[index+12]);<br><br>What is the =
prefix? Is it meant to be the subnet mask?<br><br>&gt; +<br>&gt; + &nbsp; &=
nbsp; &nbsp; &nbsp;snprintf(gateway, INET=5FADDRSTRLEN, "%d.%d.%d.%d",<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;reqptr-&gt;data[index+13], r=
eqptr-&gt;data[index+14], reqptr-&gt;data[index+15], reqptr-&gt;data[index+=
16]);<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;host=5Fnetw=
ork=5Fconfig +=3D "ipaddress=3D"+string(ipAddress)+",prefix=3D"+ \<br>&gt; =
+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; string(prefix)+",gateway=3D"+string(gateway)+\<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ",mac=3D"+st=
ring(mac)+",dhcp=3D"+string(dhcp);<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf =
("Network configuration changed: %s\n",host=5Fnetwork=5Fconfig.c=5Fstr());<=
br>&gt; +<br>&gt; + &nbsp; &nbsp;int r =3D dbus=5Fset=5Fproperty("network=
=5Fconfig",host=5Fnetwork=5Fconfig.c=5Fstr());<br>&gt; +<br>&gt; + &nbsp; &=
nbsp;if (r &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "=
Dbus set property(network=5Fconfig) failed for set=5Fsys=5Fboot=5Foptions.\=
n");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =3D IPMI=5FCC=5FUNSPECIFIED=5FE=
RROR;<br>&gt; + &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;return r;<br>&gt; +}<=
br>&gt; +<br>&gt; &nbsp;ipmi=5Fret=5Ft ipmi=5Fchassis=5Fwildcard(ipmi=5Fnet=
fn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;ipmi=5Frequest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcont=
ext=5Ft context)<br>&gt; @@ -446,7 +614,18 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=
=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<b=
r>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbsp;<br=
>&gt; - &nbsp; &nbsp;} else {<br>&gt; + &nbsp; &nbsp;} else if ( reqptr-&gt=
;parameter =3D=3D 0x61 ) {<br>&gt; + &nbsp; &nbsp; &nbsp; resp-&gt;parm &nb=
sp; &nbsp; &nbsp;=3D 0x61;<br>&gt; + &nbsp; &nbsp; &nbsp; int ret =3D getHo=
stNetworkData(resp);<br>&gt; + &nbsp; &nbsp; &nbsp; if (ret &lt; 0) {<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fprintf(stderr, "getHostNetworkData=
 failed for get=5Fsys=5Fboot=5Foptions.\n");<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; rc =3D IPMI=5FCC=5FUNSPECIFIED=5FERROR;<br>&gt; +<br>&gt; + =
&nbsp; &nbsp; &nbsp; }else<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =
=3D IPMI=5FCC=5FOK;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nb=
sp;else {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Unsupp=
orted parameter 0x%x\n", reqptr-&gt;parameter);<br>&gt; &nbsp; &nbsp; &nbsp=
;}<br>&gt; &nbsp;<br>&gt; @@ -464,11 +643,10 @@ ipmi=5Fret=5Ft ipmi=5Fchass=
is=5Fset=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,=
<br>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FC=
C=5FOK;<br>&gt; &nbsp; &nbsp; &nbsp;char *s;<br>&gt; -<br>&gt; - &nbsp; &nb=
sp;printf("IPMI SET=5FSYS=5FBOOT=5FOPTIONS\n");<br>&gt; -<br>&gt; &nbsp; &n=
bsp; &nbsp;set=5Fsys=5Fboot=5Foptions=5Ft *reqptr =3D (set=5Fsys=5Fboot=5Fo=
ptions=5Ft *) request;<br>&gt; &nbsp;<br>&gt; + &nbsp; &nbsp;printf("IPMI S=
ET=5FSYS=5FBOOT=5FOPTIONS reqptr-&gt;parameter =3D[%d]\n",reqptr-&gt;parame=
ter);<br>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp;// This IPMI command does not h=
ave any resposne data<br>&gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt=
; &nbsp;<br>&gt; @@ -476,6 +654,7 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fset=5F=
sys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &n=
bsp; &nbsp; &nbsp; * Parameter #5 means boot flags. Please refer to 28.13 o=
f ipmi doc.<br>&gt; &nbsp; &nbsp; &nbsp; * This is the only parameter used =
by petitboot.<br>&gt; &nbsp; &nbsp; &nbsp; */<br>&gt; +<br><br>Extra line<b=
r><br>&gt; &nbsp; &nbsp; &nbsp;if (reqptr-&gt;parameter =3D=3D 5) {<br>&gt;=
 &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;s =3D get=5Fboot=5Foption=
=5Fby=5Fipmi(((reqptr-&gt;data[1] &amp; 0x3C) &gt;&gt; 2));<br>&gt; @@ -507=
,7 +686,16 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions(ip=
mi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FUNSPECIFIED=5FERROR;<br>&gt; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;} els=
e {<br>&gt; + &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;else if ( reqptr-&gt;pa=
rameter =3D=3D 0x61 ) {<br>&gt; + &nbsp; &nbsp; &nbsp; printf("IPMI SET=5FS=
YS=5FBOOT=5FOPTIONS reqptr-&gt;parameter =3D[%d]\n",reqptr-&gt;parameter);<=
br>&gt; + &nbsp; &nbsp; &nbsp; int ret =3D setHostNetworkData(reqptr);<br>&=
gt; + &nbsp; &nbsp; &nbsp; if (ret &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; fprintf(stderr, "setHostNetworkData failed for set=5Fsys=5Fb=
oot=5Foptions.\n");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D IPM=
I=5FCC=5FUNSPECIFIED=5FERROR;<br>&gt; + &nbsp; &nbsp; &nbsp; }<br>&gt; + &n=
bsp; &nbsp;} &nbsp; &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;else {<br>&gt; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Unsupported parameter 0x%x\=
n", reqptr-&gt;parameter);<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D=
 IPMI=5FCC=5FPARM=5FNOT=5FSUPPORTED;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; =
--<br>&gt; 2.8.4<br>&gt;<br>&gt;<br>&gt; =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>&gt; openbmc mailing list<br>&gt; open=
bmc@lists.ozlabs.org<br>&gt; <a href=3D"https://lists.ozlabs.org/listinfo/o=
penbmc" target=3D"=5Fblank" >https://lists.ozlabs.org/listinfo/openbmc</a><=
/font></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div></div><BR>
