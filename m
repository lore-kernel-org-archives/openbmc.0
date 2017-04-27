Return-Path: <eajames@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wDW2q4mhlzDqCf
 for <openbmc@lists.ozlabs.org>; Fri, 28 Apr 2017 07:55:15 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v3RLsLKj135677
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:55:07 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2a3j0kk0db-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:55:07 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@us.ibm.com>;
 Thu, 27 Apr 2017 17:55:05 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 27 Apr 2017 17:55:04 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v3RLt1xa44171424
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 21:55:04 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A66F5AE043
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:54:52 -0400 (EDT)
Received: from d50lp33.co.us.ibm.com (unknown [9.17.249.38])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS id 6111CAE05F
 for <openbmc@lists.ozlabs.org>; Thu, 27 Apr 2017 17:54:52 -0400 (EDT)
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@us.ibm.com>;
 Thu, 27 Apr 2017 15:55:03 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Thu, 27 Apr 2017 15:55:01 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <eajames@us.ibm.com>;
 Thu, 27 Apr 2017 21:55:00 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 27 Apr 2017 21:54:56 -0000
Received: from us1a3-mail68.a3.dal09.isc4sb.com ([10.142.3.220])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2017042721545600-824952 ;
 Thu, 27 Apr 2017 21:54:56 +0000 
Subject: Re: Switching to 4.10
In-Reply-To: <CACPK8XdLpPYitsvg9Eaw+g4jRX0Ki=9oBCtgtd9fx=_XevdfhA@mail.gmail.com>
From: "Edward James" <eajames@us.ibm.com>
To: joel@jms.id.au
Cc: bradleyb@fuzziesquirrel.com, brendanhiggins@google.com,
 msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org,
 raltherr@google.com, xow@google.com
Date: Thu, 27 Apr 2017 21:54:56 +0000
Sensitivity: 
MIME-Version: 1.0
References: <CACPK8XdLpPYitsvg9Eaw+g4jRX0Ki=9oBCtgtd9fx=_XevdfhA@mail.gmail.com>,
 <CACPK8XfFF7tNrLjroNA05-c3pMZWFbiKvHq+oFLjBDSkgqfjDw@mail.gmail.com>
 <CAPH-5w6-2zVQn2iNVP28aOAS_r11rxGYCrioXCR-sX8Ln7_BZQ@mail.gmail.com>
 <CAPH-5w4OS_oT5MMu2kEOUwtOza_LO94vwSH9dZHpVMa_4OA38Q@mail.gmail.com>
 <CAPLgG=nuU5befF4AfheWAbnU7tYPCpZSnj+-Zk8MDkvaKek+uw@mail.gmail.com>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: IBM Verse Build 14114-1129 | IBM Domino Build
 SCN17101_20170411T0540_FP3 April 25, 2017 at 12:55
X-LLNOutbound: False
X-Disclaimed: 10819
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 17042721-0036-0000-0000-000001F1DD6C
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.397008;
 ST=0; TS=0; UL=0; ISC=; MB=0.060019
X-IBM-SpamModules-Versions: BY=3.00006985; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00853329; UDB=6.00421928; IPR=6.00632220; 
 BA=6.00005316; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015210; XFM=3.00000014;
 UTC=2017-04-27 21:54:59
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-04-27 19:12:48 - 6.00006659
x-cbparentid: 17042721-7094-0000-0000-00000BBEB0B0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006985; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000208; SDB=6.00853329; UDB=6.00421928; IPR=6.00632220; 
 BA=6.00005316; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015210; XFM=3.00000014;
 UTC=2017-04-27 21:55:05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF1B45F0C6.795DC987-ON0025810F.0077B627-0025810F.007862FD@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-04-27_18:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1704270347
X-Mailman-Approved-At: Mon, 01 May 2017 09:52:13 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Apr 2017 21:55:16 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial, H=
elvetica, sans-serif;font-size:10.5pt" ><div dir=3D"ltr" >Hey Joel,</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >I don't think we can pull in the occ-hwmon driver yet, be=
cause there will some moderate restructuring due to the way the SBEFIFO and=
 OCC driver interact for P9, which I didn't anticipate in how I wrote the P=
8 side of things. Haven't gotten to that yet.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >For the I2C driver, I have the new kernel I2C FSI client =
driver on the obmc mailing list, but need some feedback on the dt bindings.=
 The old FSP-based I2C driver can be put in, but needs some work for the en=
dianness changes, which I'm hoping to get done tomorrow/monday.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >Thanks,</div>
<div dir=3D"ltr" >Eddie</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Joel Stanley &lt;j=
oel@jms.id.au&gt;<br>Sent by: joel.stan@gmail.com<br>To: Rick Altherr &lt;r=
altherr@google.com&gt;, Brad Bishop &lt;bradleyb@fuzziesquirrel.com&gt;, ms=
barth &lt;msbarth@linux.vnet.ibm.com&gt;, Edward James &lt;eajames@us.ibm.c=
om&gt;<br>Cc: Xo Wang &lt;xow@google.com&gt;, OpenBMC Maillist &lt;openbmc@=
lists.ozlabs.org&gt;, Brendan Higgins &lt;brendanhiggins@google.com&gt;<br>=
Subject: Re: Switching to 4.10<br>Date: Thu, Apr 27, 2017 2:33 AM<br>&nbsp;
<div><font size=3D"2" face=3D"Default Monospace,Courier New,Courier,monospa=
ce" >On Thu, Apr 27, 2017 at 3:00 AM, Rick Altherr &lt;raltherr@google.com&=
gt; wrote:<br>&gt; I saw Joel started <a href=3D"https://gerrit.openbmc-pro=
ject.xyz/#/c/2846/" target=3D"=5Fblank" >https://gerrit.openbmc-project.xyz=
/#/c/2846/</a>&nbsp;which has a<br>&gt; defconfig for ast2400. &nbsp;If you=
 have one for ast2500, please upload a new<br>&gt; patch set to that change=
.<br><br>I have defconfigs in the tree that are ready to go. I will upload =
them<br>to Gerrit when I get the chance.<br><br>I've pulled in:<br><br>&nbs=
p;- Ben's ftgmac100 patches from the net-next tree<br>&nbsp;- Brendan's i2c=
 patches, v7<br>&nbsp;- Andrew's GPIO and Pinconf patches from the gpio and=
 pinconf trees<br>&nbsp;- Chris Bostic's FSI series, v6<br><br>These are go=
ing through a test cycle on the ast2500evb and Plametto<br>tonight. Once I =
have an ack for the i2c device tree, I will add that<br>to the tree and pus=
h to github.<br><br>Eddie, can you let me know which version of your OCC hw=
mon patches you<br>want included. Same goes for the CFAM I2C patches. If yo=
u want to wait<br>for review then please ping your reviewers and we can see=
 if we can<br>get the patches reviewed before we include them.<br><br>Brad,=
 can you point me to the SBE FIFO work that you want included. If<br>you wo=
uld prefer to wait for review that is okay.<br><br>Matt, I think do you wan=
t to merge the MAX31785 hwmon driver as-is for now?<br><br>Cheers,<br><br>J=
Oel<br><br>&gt;<br>&gt; On Tue, Apr 25, 2017 at 5:30 PM, Xo Wang &lt;xow@go=
ogle.com&gt; wrote:<br>&gt;&gt;<br>&gt;&gt; On Tue, Apr 25, 2017 at 4:57 PM=
, Xo Wang &lt;xow@google.com&gt; wrote:<br>&gt;&gt; &gt; Hi Joel,<br>&gt;&g=
t; &gt;<br>&gt;&gt; &gt; On Thu, Apr 20, 2017 at 7:30 PM, Joel Stanley &lt;=
joel@jms.id.au&gt; wrote:<br>&gt;&gt; &gt;&gt; Hello team,<br>&gt;&gt; &gt;=
&gt;<br>&gt;&gt; &gt;&gt; I want to make the 4.10 change happen. We don't h=
ave the resource to<br>&gt;&gt; &gt;&gt; be maintaining two trees, and the =
4.10 tree has a whole heap of<br>&gt;&gt; &gt;&gt; shinyness - faster netwo=
rk, faster flash access, improved I2C.<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt=
;&gt; To this end I will stop merging patches in to 4.7. Please target the<=
br>&gt;&gt; &gt;&gt; 4.10 tree from here on.<br>&gt;&gt; &gt;&gt;<br>&gt;&g=
t; &gt;&gt; Use this thread to discuss concerns and coordinate the work tha=
t needs<br>&gt;&gt; &gt;&gt; to be done. Bits that I'm aware of<br>&gt;&gt;=
 &gt;&gt;<br>&gt;&gt; &gt;&gt; &nbsp;- Eddie is updating userspace to the n=
ew FSI APIs<br>&gt;&gt; &gt;&gt; &nbsp;- I need to merge the upstream FSI p=
atchset<br>&gt;&gt; &gt;&gt; &nbsp;- Brednan needs to post the lastest vers=
ion of the i2c patchset which<br>&gt;&gt; &gt;&gt; I will merge<br>&gt;&gt;=
 &gt;&gt; &nbsp;- I need to merge benh's ftgmac100 improvements<br>&gt;&gt;=
 &gt;<br>&gt;&gt; &gt; We'll need to update the defconfig in the build syst=
em. Currently if I<br>&gt;&gt; &gt; compile the kernel and generate a new d=
efconfig (make savedefconfig),<br>&gt;&gt; &gt; I see the following changes=
 in the 4.10 generated defconfig:<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; @@ -73,=
7 +73,6 @@<br>&gt;&gt; &gt; &nbsp;CONFIG=5FMTD=5FBLOCK=3Dy<br>&gt;&gt; &gt;=
 &nbsp;CONFIG=5FMTD=5FPARTITIONED=5FMASTER=3Dy<br>&gt;&gt; &gt; &nbsp;CONFI=
G=5FMTD=5FSPI=5FNOR=3Dy<br>&gt;&gt; &gt; -CONFIG=5FASPEED=5FFLASH=5FSPI=3Dy=
<br>&gt;&gt; &gt; &nbsp;CONFIG=5FMTD=5FUBI=3Dy<br>&gt;&gt; &gt; &nbsp;CONFI=
G=5FMTD=5FUBI=5FFASTMAP=3Dy<br>&gt;&gt; &gt; &nbsp;CONFIG=5FMTD=5FUBI=5FBLO=
CK=3Dy<br>&gt;&gt; &gt; @@ -116,7 +115,6 @@<br>&gt;&gt; &gt; &nbsp;# CONFIG=
=5FSERIO is not set<br>&gt;&gt; &gt; &nbsp;# CONFIG=5FVT is not set<br>&gt;=
&gt; &gt; &nbsp;CONFIG=5FLEGACY=5FPTY=5FCOUNT=3D4<br>&gt;&gt; &gt; -# CONFI=
G=5FDEVKMEM is not set<br>&gt;&gt; &gt; &nbsp;CONFIG=5FSERIAL=5F8250=3Dy<br=
>&gt;&gt; &gt; &nbsp;# CONFIG=5FSERIAL=5F8250=5FDEPRECATED=5FOPTIONS is not=
 set<br>&gt;&gt; &gt; &nbsp;CONFIG=5FSERIAL=5F8250=5FCONSOLE=3Dy<br>&gt;&gt=
; &gt; @@ -131,10 +129,8 @@<br>&gt;&gt; &gt; &nbsp;CONFIG=5FI2C=3Dy<br>&gt;=
&gt; &gt; &nbsp;CONFIG=5FI2C=5FCHARDEV=3Dy<br>&gt;&gt; &gt; &nbsp;CONFIG=5F=
I2C=5FASPEED=3Dy<br>&gt;&gt; &gt; -CONFIG=5FSENSORS=5FMAX31785=3Dy<br>&gt;&=
gt; &gt; &nbsp;CONFIG=5FSENSORS=5FLM75=3Dy<br>&gt;&gt; &gt; &nbsp;CONFIG=5F=
SENSORS=5FNCT7904=3Dy<br>&gt;&gt; &gt; -CONFIG=5FSENSORS=5FPOWER8=5FOCC=5FI=
2C=3Dy<br>&gt;&gt; &gt; &nbsp;CONFIG=5FPMBUS=3Dy<br>&gt;&gt; &gt; &nbsp;CON=
FIG=5FSENSORS=5FADM1275=3Dy<br>&gt;&gt; &gt; &nbsp;CONFIG=5FSENSORS=5FUCD90=
00=3Dy<br>&gt;&gt; &gt; @@ -143,21 +139,14 @@<br>&gt;&gt; &gt; &nbsp;# CONF=
IG=5FUSB=5FSUPPORT is not set<br>&gt;&gt; &gt; &nbsp;CONFIG=5FNEW=5FLEDS=3D=
y<br>&gt;&gt; &gt; &nbsp;CONFIG=5FLEDS=5FCLASS=3Dy<br>&gt;&gt; &gt; -CONFIG=
=5FLEDS=5FGPIO=3Dy<br>&gt;&gt; &gt; &nbsp;CONFIG=5FLEDS=5FTRIGGERS=3Dy<br>&=
gt;&gt; &gt; &nbsp;CONFIG=5FLEDS=5FTRIGGER=5FTIMER=3Dy<br>&gt;&gt; &gt; &nb=
sp;CONFIG=5FLEDS=5FTRIGGER=5FHEARTBEAT=3Dy<br>&gt;&gt; &gt; -CONFIG=5FLEDS=
=5FTRIGGER=5FGPIO=3Dy<br>&gt;&gt; &gt; &nbsp;CONFIG=5FRTC=5FCLASS=3Dy<br>&g=
t;&gt; &gt; &nbsp;CONFIG=5FRTC=5FDRV=5FDS1307=3Dy<br>&gt;&gt; &gt; &nbsp;CO=
NFIG=5FRTC=5FDRV=5FASPEED=3Dy<br>&gt;&gt; &gt; &nbsp;CONFIG=5FMAILBOX=3Dy<b=
r>&gt;&gt; &gt; -CONFIG=5FASPEED=5FMBOX=3Dy<br>&gt;&gt; &gt; &nbsp;# CONFIG=
=5FIOMMU=5FSUPPORT is not set<br>&gt;&gt; &gt; -CONFIG=5FFSI=3Dy<br>&gt;&gt=
; &gt; -CONFIG=5FFSI=5FMASTER=5FGPIO=3Dy<br>&gt;&gt; &gt; -CONFIG=5FFSI=5FS=
COM=3Dy<br>&gt;&gt; &gt; -CONFIG=5FFSI=5FI2C=3Dy<br>&gt;&gt; &gt; &nbsp;CON=
FIG=5FFIRMWARE=5FMEMMAP=3Dy<br>&gt;&gt; &gt; &nbsp;CONFIG=5FFANOTIFY=3Dy<br=
>&gt;&gt; &gt; &nbsp;CONFIG=5FAUTOFS4=5FFS=3Dy<br>&gt;&gt; &gt;<br>&gt;&gt;=
 &gt;&gt;<br>&gt;&gt; &gt;&gt; Cheers,<br>&gt;&gt; &gt;&gt;<br>&gt;&gt; &gt=
;&gt; Joel<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; I know that CONFIG=5FASPEED=5F=
FLASH=5FSPI is now CONFIG=5FSPI=5FASPEED=5FSMC, but<br>&gt;&gt; &gt; I've y=
et to look at each of the other differences.<br>&gt;&gt; &gt;<br>&gt;&gt; &=
gt; cheers<br>&gt;&gt; &gt; xo<br>&gt;&gt;<br>&gt;&gt; OK, I guess it's not=
 that much work to look at those configs. This<br>&gt;&gt; seems to work up=
 to the limit of the missing FSI drivers as previously<br>&gt;&gt; mentione=
d:<br>&gt;&gt;<br>&gt;&gt; ---<br>&gt;&gt; a/meta-openbmc-bsp/meta-aspeed/m=
eta-ast2500/recipes-kernel/linux/linux-obmc/defconfig<br>&gt;&gt; +++<br>&g=
t;&gt; b/meta-openbmc-bsp/meta-aspeed/meta-ast2500/recipes-kernel/linux/lin=
ux-obmc/defconfig<br>&gt;&gt; @@ -73,7 +73,7 @@ CONFIG=5FMTD=5FCMDLINE=5FPA=
RTS=3Dy<br>&gt;&gt; &nbsp;CONFIG=5FMTD=5FBLOCK=3Dy<br>&gt;&gt; &nbsp;CONFIG=
=5FMTD=5FPARTITIONED=5FMASTER=3Dy<br>&gt;&gt; &nbsp;CONFIG=5FMTD=5FSPI=5FNO=
R=3Dy<br>&gt;&gt; -CONFIG=5FASPEED=5FFLASH=5FSPI=3Dy<br>&gt;&gt; +CONFIG=5F=
SPI=5FASPEED=5FSMC=3Dy<br>&gt;&gt; &nbsp;CONFIG=5FMTD=5FUBI=3Dy<br>&gt;&gt;=
 &nbsp;CONFIG=5FMTD=5FUBI=5FFASTMAP=3Dy<br>&gt;&gt; &nbsp;CONFIG=5FMTD=5FUB=
I=5FBLOCK=3Dy<br>&gt;&gt; @@ -116,7 +116,6 @@ CONFIG=5FINPUT=5FEVDEV=3Dy<br=
>&gt;&gt; &nbsp;# CONFIG=5FSERIO is not set<br>&gt;&gt; &nbsp;# CONFIG=5FVT=
 is not set<br>&gt;&gt; &nbsp;CONFIG=5FLEGACY=5FPTY=5FCOUNT=3D4<br>&gt;&gt;=
 -# CONFIG=5FDEVKMEM is not set<br>&gt;&gt; &nbsp;CONFIG=5FSERIAL=5F8250=3D=
y<br>&gt;&gt; &nbsp;# CONFIG=5FSERIAL=5F8250=5FDEPRECATED=5FOPTIONS is not =
set<br>&gt;&gt; &nbsp;CONFIG=5FSERIAL=5F8250=5FCONSOLE=3Dy<br>&gt;&gt; @@ -=
131,10 +130,11 @@ CONFIG=5FASPEED=5FBT=5FIPMI=5FBMC=3Dy<br>&gt;&gt; &nbsp;C=
ONFIG=5FI2C=3Dy<br>&gt;&gt; &nbsp;CONFIG=5FI2C=5FCHARDEV=3Dy<br>&gt;&gt; &n=
bsp;CONFIG=5FI2C=5FASPEED=3Dy<br>&gt;&gt; -CONFIG=5FSENSORS=5FMAX31785=3Dy<=
br>&gt;&gt; +CONFIG=5FGPIOLIB=3Dy<br>&gt;&gt; +CONFIG=5FGPIO=5FSYSFS=3Dy<br=
>&gt;&gt; +CONFIG=5FGPIO=5FASPEED=3Dy<br>&gt;&gt; &nbsp;CONFIG=5FSENSORS=5F=
LM75=3Dy<br>&gt;&gt; &nbsp;CONFIG=5FSENSORS=5FNCT7904=3Dy<br>&gt;&gt; -CONF=
IG=5FSENSORS=5FPOWER8=5FOCC=5FI2C=3Dy<br>&gt;&gt; &nbsp;CONFIG=5FPMBUS=3Dy<=
br>&gt;&gt; &nbsp;CONFIG=5FSENSORS=5FADM1275=3Dy<br>&gt;&gt; &nbsp;CONFIG=
=5FSENSORS=5FUCD9000=3Dy<br>&gt;&gt; @@ -152,12 +152,8 @@ CONFIG=5FRTC=5FCL=
ASS=3Dy<br>&gt;&gt; &nbsp;CONFIG=5FRTC=5FDRV=5FDS1307=3Dy<br>&gt;&gt; &nbsp=
;CONFIG=5FRTC=5FDRV=5FASPEED=3Dy<br>&gt;&gt; &nbsp;CONFIG=5FMAILBOX=3Dy<br>=
&gt;&gt; -CONFIG=5FASPEED=5FMBOX=3Dy<br>&gt;&gt; +CONFIG=5FASPEED=5FLPC=5FM=
BOX=3Dy<br>&gt;&gt; &nbsp;# CONFIG=5FIOMMU=5FSUPPORT is not set<br>&gt;&gt;=
 -CONFIG=5FFSI=3Dy<br>&gt;&gt; -CONFIG=5FFSI=5FMASTER=5FGPIO=3Dy<br>&gt;&gt=
; -CONFIG=5FFSI=5FSCOM=3Dy<br>&gt;&gt; -CONFIG=5FFSI=5FI2C=3Dy<br>&gt;&gt; =
&nbsp;CONFIG=5FFIRMWARE=5FMEMMAP=3Dy<br>&gt;&gt; &nbsp;CONFIG=5FFANOTIFY=3D=
y<br>&gt;&gt; &nbsp;CONFIG=5FAUTOFS4=5FFS=3Dy<br>&gt;&gt;<br>&gt;&gt; cheer=
s<br>&gt;&gt; xo<br>&gt;<br>&gt;</font><br>&nbsp;</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
