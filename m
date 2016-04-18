Return-Path: <ratagupt@in.ibm.com>
Received: from e28smtp02.in.ibm.com (e28smtp02.in.ibm.com [125.16.236.2])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qpM4x3t2KzDq60
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 18:39:13 +1000 (AEST)
Received: from localhost
 by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Mon, 18 Apr 2016 14:09:08 +0530
Received: from d28relay01.in.ibm.com (9.184.220.58)
 by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Mon, 18 Apr 2016 14:09:05 +0530
X-IBM-Helo: d28relay01.in.ibm.com
X-IBM-MailFrom: ratagupt@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d28relay01.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3I8d32P39059602
 for <openbmc@lists.ozlabs.org>; Mon, 18 Apr 2016 14:09:04 +0530
Message-Id: <201604180839.u3I8d32P39059602@d28relay01.in.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Mon, 18 Apr 2016 02:39:03 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.66)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 18 Apr 2016 02:39:01 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: ratagupt@in.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <ratagupt@in.ibm.com>;
 Mon, 18 Apr 2016 08:39:00 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.127) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 18 Apr 2016 08:38:59 -0000
Received: from us1a3-mail111.a3.dal06.isc4sb.com ([10.146.45.113])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2016041808385937-89398 ;
 Mon, 18 Apr 2016 08:38:59 +0000 
Subject: Re: [PATCH phosphor-host-ipmid] Adding Boot Policy
In-Reply-To: <20160405113150.70c2ffe5@camb691>
From: "Ratan K Gupta" <ratagupt@in.ibm.com>
To: cyrilbur@gmail.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Mon, 18 Apr 2016 08:38:58 +0000
Sensitivity: 
MIME-Version: 1.0
References: <20160405113150.70c2ffe5@camb691>,
 <1459769436-22641-1-git-send-email-openbmc-patches@stwcx.xyz><1459769436-22641-2-git-send-email-openbmc-patches@stwcx.xyz>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_04042016_FP5 April 14, 2016
X-LLNOutbound: False
X-Disclaimed: 51019
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16041808-0005-0000-0000-00000C091D7B
X-IBM-ISS-SpamDetectors: Score=0.417846; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005171; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000159; SDB=6.00689747; UDB=6.00317736; UTC=2016-04-18
 08:39:00
x-cbparentid: 16041808-9588-0000-0000-0000031294D2
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
X-List-Received-Date: Mon, 18 Apr 2016 08:39:14 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >Hi Cyril,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Please find my comments inline.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Regards</div>
<div dir=3D"ltr" >Ratan</div>
<blockquote data-history-content-modified=3D"1" data-history-expanded=3D"1"=
 dir=3D"ltr" style=3D"border-left:solid #aaaaaa 2px; margin-left:5px; paddi=
ng-left:5px; direction:ltr; margin-right:0px" >----- Original message -----=
<br>From: Cyril Bur &lt;cyrilbur@gmail.com&gt;<br>To: Ratan K Gupta/India/I=
BM@IBMIN<br>Cc: OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt;, openbmc@=
lists.ozlabs.org<br>Subject: Re: [PATCH phosphor-host-ipmid] Adding Boot Po=
licy<br>Date: Tue, Apr 5, 2016 7:03 AM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Mon, &nbsp;4 Apr 2016 06:30:36 -0500<br>OpenBMC Patches &lt;openbmc=
-patches@stwcx.xyz&gt; wrote:<br><br>Hi,<br><br>Thanks for the contribution=
. I have some concerns, most are summarised here:<br><a href=3D"https://git=
hub.com/openbmc/docs/blob/master/contributing.md" target=3D"=5Fblank" >http=
s://github.com/openbmc/docs/blob/master/contributing.md</a><br><br>You'll w=
ant to note<br><a href=3D"https://github.com/openbmc/docs/blob/master/contr=
ibuting.md#coding-style" target=3D"=5Fblank" >https://github.com/openbmc/do=
cs/blob/master/contributing.md#coding-style</a>&nbsp;and<br><a href=3D"http=
s://github.com/openbmc/docs/blob/master/contributing.md#submitting-changes"=
 target=3D"=5Fblank" >https://github.com/openbmc/docs/blob/master/contribut=
ing.md#submitting-changes</a><br><br>I've added further comments inline.<br=
><br>Thanks,<br><br>Cyril<br><br>&gt; From: ratagupt &lt;ratagupt@in.ibm.co=
m&gt;<br>&gt;<br>&gt; ---<br>&gt; &nbsp;chassishandler.C | 59 +++++++++++++=
+++++++++++++++++++++++++++++++------------<br>&gt; &nbsp;1 file changed, 4=
7 insertions(+), 12 deletions(-)<br>&gt;<br>&gt; diff --git a/chassishandle=
r.C b/chassishandler.C<br>&gt; index fca3c79..1a5508f 100644<br>&gt; --- a/=
chassishandler.C<br>&gt; +++ b/chassishandler.C<br>&gt; @@ -92,7 +92,7 @@ f=
inish:<br>&gt; &nbsp; &nbsp; &nbsp;return r;<br>&gt; &nbsp;}<br>&gt; &nbsp;=
<br>&gt; -int dbus=5Fget=5Fproperty(char **buf)<br>&gt; +int dbus=5Fget=5Fp=
roperty(const char *name,char **buf)<br><br>The style guide recommends spac=
es between parameters.</font></div>
<div>&nbsp;</div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt;RG:- Done<br><br>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; &n=
bsp;sd=5Fbus=5Ferror error =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; &nbsp; &nbs=
p; &nbsp;sd=5Fbus=5Fmessage *m =3D NULL;<br>&gt; @@ -128,7 +128,7 @@ int db=
us=5Fget=5Fproperty(char **buf)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;m, &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* return mess=
age on success */<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "ss", &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* input signature */<br>&gt; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; host=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* first argumen=
t */<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; "boot=5Fflags"); &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p;/* second argument */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; name); &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* second argument */<br>&gt; &nbsp;=
<br>&gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp;fprintf(stderr, "Failed to issue method call: %s\n", error.mess=
age);<br>&gt; @@ -161,7 +161,7 @@ finish:<br>&gt; &nbsp; &nbsp; &nbsp;retur=
n r;<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; -int dbus=5Fset=5Fproperty(cons=
t char *buf)<br>&gt; +int dbus=5Fset=5Fproperty(const char * name,const cha=
r *value)<br>&gt; &nbsp;{<br>&gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Ferror erro=
r =3D SD=5FBUS=5FERROR=5FNULL;<br>&gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5Fmessa=
ge *m =3D NULL;<br>&gt; @@ -196,16 +196,16 @@ int dbus=5Fset=5Fproperty(con=
st char *buf)<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &amp;m, &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* return message on success */<=
br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; "ssv", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;/* input signature */<br>&gt; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ho=
st=5Fintf=5Fname, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* first argument */<br>&gt; - &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; "boot=5Fflags", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* second argume=
nt */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; name, &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; /* second argument */<br>&gt; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; "=
s", &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* thir=
d argument */<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; buf); &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; /* fourth argument */<br>&gt; + &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; value); &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* four=
th argument */<br><br>I'm not really sure why the /* {nth} argument */ comm=
ents but since they're<br>there please try to keep them aligned...<br>&gt;&=
gt;&gt;&gt;RG:Done<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;if (r &lt; 0)=
 {<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Failed to iss=
ue method call: %s\n", error.message);<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;goto finish;<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp;<br>&gt; - &=
nbsp; &nbsp;printf("IPMID boot option property set: {%s}.\n", buf);<br>&gt;=
 + &nbsp; &nbsp;printf("IPMID boot option property set: {%s}.\n", value);<b=
r>&gt; &nbsp;<br>&gt; &nbsp;finish:<br>&gt; &nbsp; &nbsp; &nbsp;sd=5Fbus=5F=
error=5Ffree(&amp;error);<br>&gt; @@ -374,7 +374,8 @@ char* get=5Fboot=5Fop=
tion=5Fby=5Fipmi(uint8=5Ft p) {<br>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; &nbs=
p;#define SET=5FPARM=5FVERSION 1<br>&gt; -#define SET=5FPARM=5FBOOT=5FFLAGS=
=5FVALID &nbsp; 0x80<br>&gt; +#define SET=5FPARM=5FBOOT=5FFLAGS=5FVALID=5FO=
NE=5FTIME &nbsp; 0x80<br>&gt; +#define SET=5FPARM=5FBOOT=5FFLAGS=5FVALID=5F=
PERMANENT &nbsp;0xC0<br>&gt; &nbsp;<br>&gt; &nbsp;ipmi=5Fret=5Ft ipmi=5Fcha=
ssis=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcmd=5Ft cm=
d,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;ipmi=5Frequest=5Ft request, =
ipmi=5Fresponse=5Ft response,<br>&gt; @@ -391,7 +392,7 @@ ipmi=5Fret=5Ft ip=
mi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft netfn, ipmi=5Fcm=
d=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp;memset(resp,0,sizeof(*resp));<br>&gt=
; &nbsp; &nbsp; &nbsp;resp-&gt;version &nbsp; =3D SET=5FPARM=5FVERSION;<br>=
&gt; &nbsp; &nbsp; &nbsp;resp-&gt;parm &nbsp; &nbsp; &nbsp;=3D 5;<br>&gt; -=
 &nbsp; &nbsp;resp-&gt;data[0] &nbsp; =3D SET=5FPARM=5FBOOT=5FFLAGS=5FVALID=
;<br>&gt; + &nbsp; &nbsp;resp-&gt;data[0] &nbsp; =3D SET=5FPARM=5FBOOT=5FFL=
AGS=5FVALID=5FONE=5FTIME;<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;*data=
=5Flen =3D sizeof(*resp);<br>&gt; &nbsp;<br>&gt; @@ -401,10 +402,11 @@ ipmi=
=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft net=
fn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp; */<br>&gt; &nbsp; &nbs=
p; &nbsp;if (reqptr-&gt;parameter =3D=3D 5) {<br>&gt; &nbsp;<br>&gt; - &nbs=
p; &nbsp; &nbsp; &nbsp;int r =3D dbus=5Fget=5Fproperty(&amp;p);<br>&gt; + &=
nbsp; &nbsp; &nbsp; &nbsp;/* Get the boot device */<br>&gt; + &nbsp; &nbsp;=
 &nbsp; &nbsp;int r =3D dbus=5Fget=5Fproperty("boot=5Fflags",&amp;p);<br>&g=
t; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; 0) {<br>&gt;=
 - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Dbus get prope=
rty failed for get=5Fsys=5Fboot=5Foptions.\n");<br>&gt; + &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Dbus get property(boot=5Fflags) fa=
iled for get=5Fsys=5Fboot=5Foptions.\n");<br>&gt; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FUNSPECIFIED=5FERROR;<br>&gt; &nbs=
p;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;} else {<br>&gt; @@ -412,8 +41=
4,31 @@ ipmi=5Fret=5Ft ipmi=5Fchassis=5Fget=5Fsys=5Fboot=5Foptions(ipmi=5Fn=
etfn=5Ft netfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;s =3D get=5Fipmi=5Fboot=5Foption(p);<br>&gt; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;resp-&gt;data[1] =3D (s &lt;&lt; 2);<br>=
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FOK;=
<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; +<br>&gt; + &nbsp=
; &nbsp; &nbsp; &nbsp;if (p)<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;{<br>&gt;=
 + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;free(p);<br>&gt; + &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;p =3D NULL;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;}<br><br>Ju=
st fyi free() will happily accept NULL as an argument and simply do nothing=
.<br>&gt;&gt;&gt;&gt;RG:- I was following the approach which was there befo=
re.<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;/* Get the boot policy *=
/<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;r =3D dbus=5Fget=5Fproperty("boot=5F=
policy",&amp;p);<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; =
0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Db=
us get property(boot=5Fpolicy) failed for get=5Fsys=5Fboot=5Foptions.\n");<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FUNSPE=
CIFIED=5FERROR;<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;} else {<br>=
&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;printf("BootPolic=
y is[%s]", p);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;resp-&gt;=
data[0] =3D (strcmp(p,"ONETIME")=3D=3D0)?SET=5FPARM=5FBOOT=5FFLAGS=5FVALID=
=5FONE=5FTIME:SET=5FPARM=5FBOOT=5FFLAGS=5FVALID=5FPERMANENT;<br><br>Wow, co=
uld you please make use of the spacebar and perhaps the enter key?</font></=
div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >RG:&gt;&gt;&gt;&gt;&gt;&gt;Done<br><br>Also, just to be safe it would =
be best of use strncmp.<br>For example strncmp(p, "ONETIME", strlen("ONETIM=
E"))<br><br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FC=
C=5FOK;<br>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp=
;<br>&gt; +<br>&gt; &nbsp; &nbsp; &nbsp;} else {<br>&gt; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr-&gt;=
parameter);<br>&gt; &nbsp; &nbsp; &nbsp;}<br>&gt; @@ -455,13 +480,23 @@ ipm=
i=5Fret=5Ft ipmi=5Fchassis=5Fset=5Fsys=5Fboot=5Foptions(ipmi=5Fnetfn=5Ft ne=
tfn, ipmi=5Fcmd=5Ft cmd,<br>&gt; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;} else {<br>&gt; &nbsp;<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;int r =3D dbus=5Fset=5Fproperty(s);<br>&gt; + &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp;int r =3D dbus=5Fset=5Fproperty("boot=5Fflags",s);<br>&g=
t; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt=
; 0) {<br>&gt; - &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fpr=
intf(stderr, "Dbus set property failed for set=5Fsys=5Fboot=5Foptions.\n");=
<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(s=
tderr, "Dbus set property(boot=5Fflags) failed for set=5Fsys=5Fboot=5Foptio=
ns.\n");<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp;rc =3D IPMI=5FCC=5FUNSPECIFIED=5FERROR;<br>&gt; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;}<br>&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&=
gt; + &nbsp; &nbsp; &nbsp;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;/* setting =
the boot policy */<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;s=3D (char *)(((req=
ptr-&gt;data[0] &amp; 0x40) =3D=3D 0x40) ?"PERMANENT":"ONETIME");<br><br>Fi=
rstly if you declare s as a 'const char *' (which by the looks of things it=
<br>probably should be anyway...) then you won't need the cast. Why introdu=
ce 0x40?<br>Wouldn't it be cleaner to just do<br><br>if ((reqptr-&gt;data[0=
] &amp; SET=5FPARM=5FBOOT=5FFLAGS=5FVALID=5FPERMANENT) =3D=3D<br>&nbsp;&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;SET=
=5FPARM=5FBOOT=5FFLAGS=5FVALID=5FPERMANENT)<br>s =3D "PERMANENT";<br>else<b=
r>s =3D "ONETIME";</font></div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >&gt;&gt;&gt;&gt;&gt;&gt;&gt;RG: would not be able to check with SET=5F=
PARM=5FBOOT=5FFLAGS=5FVALID=5FPERMANENT as by doing this it checks for the =
two bits(6 and 7).But with the 0x40,We are only checking the one bit(6th bi=
t).</font></div>
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >Anyways I have created the macro for better readability.</font></div>
<div><br><font face=3D"Default Monospace,Courier New,Courier,monospace" siz=
e=3D"2" >&gt; + &nbsp; &nbsp; &nbsp; &nbsp;printf ( "\nBoot Policy is %s",s=
);<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;int r =3D dbus=5Fset=5Fproperty("bo=
ot=5Fpolicy",s);<br>&gt; +<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp;if (r &lt; =
0) {<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fprintf(stderr, "Db=
us set property(boot=5Fpolicy) failed for set=5Fsys=5Fboot=5Foptions.\n");<=
br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;rc =3D IPMI=5FCC=5FUNSPE=
CIFIED=5FERROR;<br>&gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>&gt=
; &nbsp;<br>&gt; &nbsp; &nbsp; &nbsp;} else {<br>&gt; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;fprintf(stderr, "Unsupported parameter 0x%x\n", reqptr-&gt;par=
ameter);</font></div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
