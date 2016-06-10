Return-Path: <ratagupt@in.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rQmv81yTVzDq5s
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 12:53:07 +1000 (AEST)
Received: from pps.filterd (m0075771.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u5A2n5jr028767
 for <openbmc@lists.ozlabs.org>; Thu, 9 Jun 2016 22:53:03 -0400
Received: from e28smtp03.in.ibm.com (e28smtp03.in.ibm.com [125.16.236.3])
 by mx0a-001b2d01.pphosted.com with ESMTP id 23fbn92xpm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 09 Jun 2016 22:53:03 -0400
Received: from localhost
 by e28smtp03.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Fri, 10 Jun 2016 08:22:59 +0530
Received: from d28dlp03.in.ibm.com (9.184.220.128)
 by e28smtp03.in.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 10 Jun 2016 08:22:59 +0530
X-IBM-Helo: d28dlp03.in.ibm.com
X-IBM-MailFrom: ratagupt@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d28relay01.in.ibm.com (d28relay01.in.ibm.com [9.184.220.58])
 by d28dlp03.in.ibm.com (Postfix) with ESMTP id 7F423125804F
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 08:25:26 +0530 (IST)
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d28relay01.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u5A2quZP61866118
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2016 08:22:57 +0530
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Thu, 9 Jun 2016 20:52:56 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.74)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Thu, 9 Jun 2016 20:52:53 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: ratagupt@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Fri, 10 Jun 2016 02:52:52 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.92) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 10 Jun 2016 02:52:50 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016061002524972-9079 ;
 Fri, 10 Jun 2016 02:52:49 +0000 
Subject: Re: [PATCH phosphor-host-ipmid v2] Implement Network Override
In-Reply-To: <20160610082453.4981195a@camb691>
From: "Ratan K Gupta" <ratagupt@in.ibm.com>
To: cyrilbur@gmail.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Fri, 10 Jun 2016 02:52:49 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20160610082453.4981195a@camb691>,
 <20160608175040.18764-1-openbmc-patches@stwcx.xyz><20160608175040.18764-2-openbmc-patches@stwcx.xyz>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_05232016_FP5 June 02, 2016
X-LLNOutbound: False
X-Disclaimed: 27663
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16061002-0008-0000-0000-000002B8765F
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0.256376; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005360; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000170; SDB=6.00714224; UDB=6.00332469; UTC=2016-06-10
 02:52:50
x-cbparentid: 16061002-5920-0000-0000-0000081537F0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OFF4E2B2C4.1A9B100D-ON00257FCE.000FCE0D-00257FCE.000FD2BA@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-06-10_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1606100031
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
X-List-Received-Date: Fri, 10 Jun 2016 02:53:08 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Hi Cyril,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >This patch was checked in before the Patrick response..I =
am checking in new one.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Regards</div>
<div dir=3D"ltr" >Ratan Gupta</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Cyril Bur &lt;cyri=
lbur@gmail.com&gt;<br>To: OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;=
<br>Cc: openbmc@lists.ozlabs.org, Ratan K Gupta/India/IBM@IBMIN<br>Subject:=
 Re: [PATCH phosphor-host-ipmid v2] Implement Network Override<br>Date: Fri=
, Jun 10, 2016 3:55 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Wed, &nbsp;8 Jun 2016 12:50:40 -0500<br>OpenBMC Patches &lt;openbmc=
-patches@stwcx.xyz&gt; wrote:<br><br>&gt; From: ratagupt &lt;ratagupt@in.ib=
m.com&gt;<br>&gt;<br><br>Still no. Please read the style guide also please =
see Patricks response about<br>your interesting use of c++ or rather c/c++ =
mess.<br><br>&gt; ---<br>&gt; &nbsp;chassishandler.C | 223 ++++++++++++++++=
++++++++++++++++++++++++++++++++++++---<br>&gt; &nbsp;1 file changed, 211 i=
nsertions(+), 12 deletions(-)<br>&gt;<br>&gt; diff --git a/chassishandler.C=
 b/chassishandler.C<br>&gt; index d5b3404..af213b0 100644<br>&gt; --- a/cha=
ssishandler.C<br>&gt; +++ b/chassishandler.C<br>&gt; @@ -3,15 +3,19 @@<br>&=
gt; &nbsp;#include &lt;stdio.h&gt;<br>&gt; &nbsp;#include &lt;string.h&gt;<=
br>&gt; &nbsp;#include &lt;stdint.h&gt;<br>&gt; -<br>&gt; -<br>&gt; +#inclu=
de &lt;arpa/inet.h&gt;<br>&gt; +#include &lt;netinet/in.h&gt;<br>&gt; +#inc=
lude &lt;string&gt;<br>&gt; +using namespace std;<br>&gt; &nbsp;//Defines<b=
r>&gt; -#define SET=5FPARM=5FVERSION 1<br>&gt; -#define SET=5FPARM=5FBOOT=
=5FFLAGS=5FPERMANENT 0x40 //boot flags data1 7th bit on<br>&gt; +#define SE=
T=5FPARM=5FVERSION &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; 0x01<br>&gt; +#define SET=5FPARM=5FBOOT=5FFLAGS=5FPERMANENT &=
nbsp; &nbsp; &nbsp; &nbsp;0x40 //boot flags data1 7th bit on<br>&gt; &nbsp;=
#define SET=5FPARM=5FBOOT=5FFLAGS=5FVALID=5FONE=5FTIME &nbsp; 0x80 //boot f=
lags data1 8th bit on<br>&gt; &nbsp;#define SET=5FPARM=5FBOOT=5FFLAGS=5FVAL=
ID=5FPERMANENT &nbsp;0xC0 //boot flags data1 7 &amp; 8 bit on<br>&gt; &nbsp=
;<br>&gt; -<br>&gt; +#define SIZE=5FMAC &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 18<br>&gt; +=
#define SIZE=5FHOST=5FNETWORK=5FDATA &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; 26<br>&gt; +#define SIZE=5FBOOT=5FOPTION &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; SIZE=5FHOST=5FNETWORK=5FDATA=
<br>&gt; &nbsp;<br>&gt; &nbsp;// OpenBMC Chassis Manager dbus framework<br>=
&gt; &nbsp;const char &nbsp;*chassis=5Fbus=5Fname &nbsp; &nbsp; &nbsp;=3D &=
nbsp;"org.openbmc.control.Chassis";<br>&gt; @@ -233,14 +237,189 @@ struct g=
et=5Fsys=5Fboot=5Foptions=5Ft {<br>&gt; &nbsp;struct get=5Fsys=5Fboot=5Fopt=
ions=5Fresponse=5Ft {<br>&gt; &nbsp; &nbsp; &nbsp;uint8=5Ft version;<br>&gt=
; &nbsp; &nbsp; &nbsp;uint8=5Ft parm;<br>&gt; - &nbsp; &nbsp;uint8=5Ft data=
[5];<br>&gt; + &nbsp; &nbsp;uint8=5Ft data[SIZE=5FBOOT=5FOPTION];<br>&gt; &=
nbsp;} &nbsp;=5F=5Fattribute=5F=5F ((packed));<br>&gt; &nbsp;<br>&gt; &nbsp=
;struct set=5Fsys=5Fboot=5Foptions=5Ft {<br>&gt; &nbsp; &nbsp; &nbsp;uint8=
=5Ft parameter;<br>&gt; - &nbsp; &nbsp;uint8=5Ft data[8];<br>&gt; + &nbsp; =
&nbsp;uint8=5Ft data[SIZE=5FBOOT=5FOPTION];<br>&gt; &nbsp;} &nbsp;=5F=5Fatt=
ribute=5F=5F ((packed));<br>&gt; &nbsp;<br>&gt; +struct host=5Fnetwork=5Fco=
nfig=5Ft {<br>&gt; + &nbsp; &nbsp; string ipaddress;<br>&gt; + &nbsp; &nbsp=
; string prefix;<br>&gt; + &nbsp; &nbsp; string gateway;<br>&gt; + &nbsp; &=
nbsp; string macaddress;<br>&gt; + &nbsp; &nbsp; string isDHCP;<br>&gt; +<b=
r>&gt; + &nbsp; &nbsp; host=5Fnetwork=5Fconfig=5Ft()<br>&gt; + &nbsp; &nbsp=
; {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; ipaddress =3D "";<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp; prefix =3D "";<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;=
 gateway =3D "";<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; macaddress =3D "";<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; isDHCP =3D "";<br>&gt; + &nbsp; &nbsp;=
 }<br>&gt; +};<br>&gt; +<br>&gt; +uint8=5Ft getHostNetworkData(get=5Fsys=5F=
boot=5Foptions=5Fresponse=5Ft *respptr)<br>&gt; +{<br>&gt; + &nbsp; &nbsp;c=
har *prop =3D NULL;<br>&gt; +<br>&gt; + &nbsp; &nbsp;uint8=5Ft data[SIZE=5F=
BOOT=5FOPTION]=3D{0x80,0x21, 0x70 ,0x62 ,0x21,0x00 ,0x01 ,0x06 ,0x04};<br>&=
gt; +<br>&gt; + &nbsp; &nbsp;int rc =3D dbus=5Fget=5Fproperty("network=5Fco=
nfig",&amp;prop);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (rc &lt; 0) {<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Dbus get property(boot=5Ffla=
gs) failed for get=5Fsys=5Fboot=5Foptions.\n");<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp;return rc;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &n=
bsp;/* network=5Fconfig property Value would be in the form of<br>&gt; + &n=
bsp; &nbsp; * ipaddress=3D1.1.1.1,prefix=3D16,gateway=3D2.2.2.2,mac=3D11:22=
:33:44:55:66,dhcp=3D0<br>&gt; + &nbsp; &nbsp; */<br>&gt; +<br>&gt; + &nbsp;=
 &nbsp;/* Parsing the string and fill the hostconfig structure with the<br>=
&gt; + &nbsp; &nbsp; * values */<br>&gt; +<br>&gt; + &nbsp; &nbsp;host=5Fne=
twork=5Fconfig=5Ft host=5Fconfig;<br>&gt; + &nbsp; &nbsp;string delimiter =
=3D ",";<br>&gt; +<br>&gt; + &nbsp; &nbsp;int pos =3D 0;<br>&gt; + &nbsp; &=
nbsp;string token,name,value;<br>&gt; + &nbsp; &nbsp;string conf=5Fstr(prop=
);<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;printf ("Configuration St=
ring[%s]\n ",conf=5Fstr.c=5Fstr());<br>&gt; +<br>&gt; + &nbsp; &nbsp;while =
((pos =3D conf=5Fstr.find(delimiter)) !=3D std::string::npos) {<br>&gt; +<b=
r>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;token =3D conf=5Fstr.substr(0, pos);<br=
>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;int pos1 =3D token.find("=3D");<br>&gt; =
+<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;name =3D token.substr(0,pos1);<br>&g=
t; + &nbsp; &nbsp; &nbsp; &nbsp;value =3D token.substr(pos1+1,pos);<br>&gt;=
 +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if ( name =3D=3D "ipaddress" )<br>&=
gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;host=5Fconfig.ipaddress =3D =
value;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;else if ( name =3D=3D "prefix")=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;host=5Fconfig.prefix =
=3D value;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;else if ( name =3D=3D "gate=
way" )<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;host=5Fconfig.gat=
eway =3D value;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;else if ( name =3D=3D =
"mac" )<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;host=5Fconfig.ma=
caddress =3D value;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;else if ( name =3D=
=3D "dhcp" )<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;host=5Fconf=
ig.isDHCP =3D value;<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;conf=5F=
str.erase(0, pos + delimiter.length());<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<=
br>&gt; + &nbsp; &nbsp;//Converting the mac address as number//<br>&gt; + &=
nbsp; &nbsp;//If there as an error in converting the mac as number we are n=
ot throwing<br>&gt; + &nbsp; &nbsp;//error we would be sending 0's for the =
mac.<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;char *tokptr =3D NULL;<=
br>&gt; + &nbsp; &nbsp;char* digit =3D strtok=5Fr((char *)host=5Fconfig.mac=
address.c=5Fstr(), ":", &amp;tokptr);<br>&gt; + &nbsp; &nbsp;if (digit =3D=
=3D NULL)<br>&gt; + &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;fpr=
intf(stderr, "Unexpected MAC format: %s", host=5Fconfig.macaddress.c=5Fstr(=
));<br>&gt; + &nbsp; &nbsp;}<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp=
;//As 9 bytes are pre filled so staring from index 9.If there is a failure<=
br>&gt; + &nbsp; &nbsp;//in the strtok=5Fr then digit will be null then we =
don't need to do<br>&gt; + &nbsp; &nbsp;//anything as data is prefilled wit=
h 0<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;uint8=5Ft index=3D9;<br>=
&gt; + &nbsp; &nbsp;int resp=5Fbyte =3D 0;<br>&gt; + &nbsp; &nbsp;while (di=
git !=3D NULL)<br>&gt; + &nbsp; &nbsp;{<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;resp=5Fbyte =3D strtoul(digit, NULL, 16);<br>&gt; + &nbsp; &nbsp; &nbsp; =
&nbsp;memcpy((void*)&amp;data[index], &amp;resp=5Fbyte, 1);<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;index++;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;digit =
=3D strtok=5Fr(NULL, ":", &amp;tokptr);<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<=
br>&gt; + &nbsp; &nbsp;//Conevrt the dhcp,ipaddress,mask and gateway as hex=
 number<br>&gt; + &nbsp; &nbsp;data[index++]=3D0x00;<br>&gt; + &nbsp; &nbsp=
;sscanf(host=5Fconfig.isDHCP.c=5Fstr(),"%02X",&amp;data[index++]);<br>&gt; =
+<br>&gt; + &nbsp; &nbsp;inet=5Fpton(AF=5FINET,host=5Fconfig.ipaddress.c=5F=
str(),(void *)&amp;data[index]);<br>&gt; + &nbsp; &nbsp;index+=3D4;<br>&gt;=
 + &nbsp; &nbsp;sscanf(host=5Fconfig.prefix.c=5Fstr(),"%02X",&amp;data[inde=
x++]);<br>&gt; + &nbsp; &nbsp;inet=5Fpton(AF=5FINET,host=5Fconfig.gateway.c=
=5Fstr(),(void *)&amp;data[index]);<br>&gt; + &nbsp; &nbsp;index+=3D4;<br>&=
gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp;printf (=
"\n=3D=3D=3DPrinting the IPMI Formatted Data=3D=3D=3D=3D=3D=3D=3D=3D\n");<b=
r>&gt; +<br>&gt; + &nbsp; &nbsp;for (int j =3D 0;j&lt;index;j++)<br>&gt; + =
&nbsp; &nbsp; &nbsp; &nbsp;printf("%02x ", data[j]);<br>&gt; +<br>&gt; + &n=
bsp; &nbsp;memcpy(respptr-&gt;data,data,SIZE=5FBOOT=5FOPTION);<br>&gt; + &n=
bsp; &nbsp;return 0;<br>&gt; +<br>&gt; +}<br>&gt; +<br>&gt; +uint8=5Ft setH=
ostNetworkData(set=5Fsys=5Fboot=5Foptions=5Ft * reqptr)<br>&gt; +{<br>&gt; =
+ &nbsp; &nbsp;string host=5Fnetwork=5Fconfig;<br>&gt; + &nbsp; &nbsp;char =
mac[SIZE=5FMAC];<br>&gt; + &nbsp; &nbsp;char ipAddress[INET=5FADDRSTRLEN];<=
br>&gt; + &nbsp; &nbsp;char gateway[INET=5FADDRSTRLEN];<br>&gt; + &nbsp; &n=
bsp;char prefix[1];<br>&gt; + &nbsp; &nbsp;char dhcp[2];<br>&gt; + &nbsp; &=
nbsp;uint32=5Ft cookie =3D 0;<br>&gt; +<br>&gt; +<br>&gt; + &nbsp; &nbsp;me=
mset( mac ,0,SIZE=5FMAC );<br>&gt; + &nbsp; &nbsp;memset(ipAddress,0,INET=
=5FADDRSTRLEN);<br>&gt; + &nbsp; &nbsp;memset(gateway,0,INET=5FADDRSTRLEN);=
<br>&gt; + &nbsp; &nbsp;memset(prefix,0,1);<br>&gt; + &nbsp; &nbsp;memset(d=
hcp,0,2);<br>&gt; +<br>&gt; + &nbsp; &nbsp;uint8=5Ft index =3D 9; &nbsp;<br=
>&gt; + &nbsp; &nbsp;sscanf((char *)&amp;(reqptr-&gt;data[1]),"%02X",&amp;c=
ookie);<br>&gt; +<br>&gt; + &nbsp; &nbsp;if ( !cookie) {<br>&gt; + &nbsp; &=
nbsp;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; snprintf(mac, SIZE=5FMAC, "%02x=
:%02x:%02x:%02x:%02x:%02x",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;reqptr-&gt;data[index],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;reqptr-&gt;data[index+1],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;reqptr-&gt;data[index+2],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp;reqptr-&gt;data[index+3],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;reqptr-&gt;data[index+4],<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;reqptr-&gt;data[index+5]);<br>&gt; +<br>&gt; +<br>&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp;snprintf(dhcp,2, "%d", reqptr-&gt;data[index+6]);<br>&=
gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;snprintf(ipAddress, INET=5FADDRS=
TRLEN, "%d.%d.%d.%d",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;re=
qptr-&gt;data[index+8], reqptr-&gt;data[index+9], reqptr-&gt;data[index+10]=
, reqptr-&gt;data[index+11]);<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbs=
p;snprintf(prefix, INET=5FADDRSTRLEN, "%d", reqptr-&gt;data[index+12]);<br>=
&gt; +<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;snprintf(gateway, INE=
T=5FADDRSTRLEN, "%d.%d.%d.%d",<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;reqptr-&gt;data[index+13], reqptr-&gt;data[index+14], reqptr-&gt;dat=
a[index+15], reqptr-&gt;data[index+16]);<br>&gt; + &nbsp; &nbsp;}<br>&gt; +=
<br>&gt; + &nbsp; &nbsp;host=5Fnetwork=5Fconfig +=3D "ipaddress=3D"+string(=
ipAddress)+",prefix=3D"+ \<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; string(prefix)+",gateway=3D"+string(=
gateway)+\<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; ",mac=3D"+string(mac)+",dhcp=3D"+string(dhcp);<br>&g=
t; +<br>&gt; +<br>&gt; + &nbsp; &nbsp;printf ("Network configuration change=
d: %s\n",host=5Fnetwork=5Fconfig.c=5Fstr());<br>&gt; +<br>&gt; + &nbsp; &nb=
sp;int r =3D dbus=5Fset=5Fproperty("network=5Fconfig",host=5Fnetwork=5Fconf=
ig.c=5Fstr());<br>&gt; +<br>&gt; + &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Dbus set property(network=5Fconf=
ig) failed for set=5Fsys=5Fboot=5Foptions.\n");<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp;r =3D IPMI=5FCC=5FUNSPECIFIED=5FERROR;<br>&gt; + &nbsp; &nbsp;}<b=
r>&gt; +<br>&gt; + &nbsp; &nbsp;return r;<br>&gt; +<br>&gt; +}<br>&gt; +<br=
>&gt; &nbsp;ipmi=5Fret=5Ft ipmi=5Fchassis=5Fwildcard(ipmi=5Fnetfn=5Ft netfn=
, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Fre=
quest=5Ft request, ipmi=5Fresponse=5Ft response,<br>&gt; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;ipmi=5Fdata=5Flen=5Ft data=5Flen, ipmi=5Fcontext=5Ft cont=
ext)<br>&gt; @@ -446,7 +625,18 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=
=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbsp;<br>&gt; - &nbs=
p; &nbsp;} else {<br>&gt; + &nbsp; &nbsp;} else if ( reqptr-&gt;parameter =
=3D=3D 0x61 ) {<br>&gt; + &nbsp; &nbsp; &nbsp; resp-&gt;parm &nbsp; &nbsp; =
&nbsp;=3D 0x61;<br>&gt; + &nbsp; &nbsp; &nbsp; int ret =3D getHostNetworkDa=
ta(resp);<br>&gt; + &nbsp; &nbsp; &nbsp; if (ret &lt; 0) {<br>&gt; + &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; fprintf(stderr, "getHostNetworkData failed for=
 get=5Fsys=5Fboot=5Foptions.\n");<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; rc =3D IPMI=5FCC=5FUNSPECIFIED=5FERROR;<br>&gt; +<br>&gt; + &nbsp; &nbs=
p; &nbsp; }else<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FC=
C=5FOK;<br>&gt; + &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp; &nbsp;else {<br=
>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Unsupported parame=
ter 0x%x\n", reqptr-&gt;parameter);<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &=
nbsp;<br>&gt; @@ -464,11 +654,10 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fset=5Fs=
ys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nb=
sp;{<br>&gt; &nbsp; &nbsp; &nbsp;ipmi=5Fret=5Ft rc =3D IPMI=5FCC=5FOK;<br>&=
gt; &nbsp; &nbsp; &nbsp;char *s;<br>&gt; -<br>&gt; - &nbsp; &nbsp;printf("I=
PMI SET=5FSYS=5FBOOT=5FOPTIONS\n");<br>&gt; -<br>&gt; &nbsp; &nbsp; &nbsp;s=
et=5Fsys=5Fboot=5Foptions=5Ft *reqptr =3D (set=5Fsys=5Fboot=5Foptions=5Ft *=
) request;<br>&gt; &nbsp;<br>&gt; + &nbsp; &nbsp;printf("IPMI SET=5FSYS=5FB=
OOT=5FOPTIONS reqptr-&gt;parameter =3D[%d]\n",reqptr-&gt;parameter);<br>&gt=
; +<br>&gt; &nbsp; &nbsp; &nbsp;// This IPMI command does not have any resp=
osne data<br>&gt; &nbsp; &nbsp; &nbsp;*data=5Flen =3D 0;<br>&gt; &nbsp;<br>=
&gt; @@ -476,6 +665,7 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fset=5Fsys=5Fboot=
=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp; &nbsp=
; &nbsp; * Parameter #5 means boot flags. Please refer to 28.13 of ipmi doc=
.<br>&gt; &nbsp; &nbsp; &nbsp; * This is the only parameter used by petitbo=
ot.<br>&gt; &nbsp; &nbsp; &nbsp; */<br>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp;i=
f (reqptr-&gt;parameter =3D=3D 5) {<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp;s =3D get=5Fboot=5Foption=5Fby=5Fipmi(((reqptr-&gt;data[1=
] &amp; 0x3C) &gt;&gt; 2));<br>&gt; @@ -507,7 +697,16 @@ ipmi=5Fret=5Ft ipm=
i=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=
=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IP=
MI=5FCC=5FUNSPECIFIED=5FERROR;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<=
br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp;} else {<br>&gt; + &nbsp; &nbsp;}<br>=
&gt; + &nbsp; &nbsp;else if ( reqptr-&gt;parameter =3D=3D 0x61 ) {<br>&gt; =
+ &nbsp; &nbsp; &nbsp; printf("IPMI SET=5FSYS=5FBOOT=5FOPTIONS reqptr-&gt;p=
arameter =3D[%d]\n",reqptr-&gt;parameter);<br>&gt; + &nbsp; &nbsp; &nbsp; i=
nt ret =3D setHostNetworkData(reqptr);<br>&gt; + &nbsp; &nbsp; &nbsp; if (r=
et &lt; 0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; fprintf(stderr, "=
setHostNetworkData failed for set=5Fsys=5Fboot=5Foptions.\n");<br>&gt; + &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; rc =3D IPMI=5FCC=5FUNSPECIFIED=5FERROR;<br=
>&gt; + &nbsp; &nbsp; &nbsp; }<br>&gt; + &nbsp; &nbsp;} &nbsp; &nbsp; &nbsp=
;<br>&gt; + &nbsp; &nbsp;else {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;f=
printf(stderr, "Unsupported parameter 0x%x\n", reqptr-&gt;parameter);<br>&g=
t; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FPARM=5FNOT=5FSUPPOR=
TED;<br>&gt; &nbsp; &nbsp; &nbsp;}</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
