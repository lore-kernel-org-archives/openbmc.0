Return-Path: <miltonm@us.ibm.com>
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9CB0A1A01D8
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 03:32:38 +1100 (AEDT)
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 2 Feb 2016 09:32:34 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 2 Feb 2016 09:32:33 -0700
X-IBM-Helo: d03dlp03.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 1700F19D8058
 for <openbmc@lists.ozlabs.org>; Tue,  2 Feb 2016 09:20:32 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u12GWWbG19791984
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 09:32:32 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u12GWVeu028113
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 09:32:31 -0700
Received: from d50lp31.co.us.ibm.com (d50lp31.boulder.ibm.com [9.17.249.32])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u12GWMe9026533
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 2 Feb 2016 09:32:23 -0700
Message-Id: <201602021632.u12GWMe9026533@d03av03.boulder.ibm.com>
Received: from localhost
 by d50lp31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 2 Feb 2016 09:32:22 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.82)
 by d50lp31.co.us.ibm.com (192.168.2.141) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 2 Feb 2016 09:32:19 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Tue, 2 Feb 2016 16:32:17 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.105) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 2 Feb 2016 16:32:14 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016020216321299-300467 ;
 Tue, 2 Feb 2016 16:32:12 +0000 
Subject: Re: [PATCH openbmc 7/8] Hack to make fw_setenv work
In-Reply-To: <1454027042.3148.71.camel@au1.ibm.com>
From: "Milton Miller II" <miltonm@us.ibm.com>
To: benh@au1.ibm.com
Cc: openbmc-patches@stwcx.xyz, openbmc@lists.ozlabs.org
Date: Tue, 2 Feb 2016 16:32:13 +0000
Sensitivity: 
MIME-Version: 1.0
References: <1454027042.3148.71.camel@au1.ibm.com>,
 <1454021419-16743-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454021419-16743-8-git-send-email-openbmc-patches@stwcx.xyz>
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_01182016_FP3 January 26, 2016
X-LLNOutbound: False
X-Disclaimed: 64663
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16020216-0013-0000-0000-00001C77421F
X-IBM-ISS-SpamDetectors: Score=0.417846; BY=0.257092; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.417846; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004870; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00654207; UDB=6.00296399; UTC=2016-02-02
 16:32:14
x-cbparentid: 16020216-9900-0000-0000-000005EFB59D
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
X-List-Received-Date: Tue, 02 Feb 2016 16:32:39 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" >I've added decoding of the fsr and sr an=
d tracing and found that at some point the fsr Erase-error comes on and sho=
rtly thereafter the Program-Error comes on.&nbsp; Alas, that trace didn't h=
ave the dynamic debug for read, write, and erase commands enabled, and I go=
t busy getting what we have flushed.&nbsp; Also, there was no way to send t=
he clear-status command so I had to power cycle to try again.</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >The biggest difference from what I can see is that fw=5Fs=
etenv calls erase and write on the whole env file of 32 kernel erase pages =
while flashcp and flash=5Feraseall do an ioctl one erase block at a time, a=
nd then optionally write to stdout.&nbsp; The spi-nor.c library appears to =
loop over the approprate sized chunks, but it appears the original data is =
not erased.&nbsp; I even did a manual wirte to ff and setenv created a good=
 checksum (once).&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >milton</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<blockquote data-history-content-modified=3D"1" dir=3D"ltr" style=3D"border=
-left:solid #aaaaaa 2px; margin-left:5px; padding-left:5px; direction:ltr; =
margin-right:0px" >----- Original message -----<br>From: Benjamin Herrensch=
midt &lt;benh@au1.ibm.com&gt;<br>To: OpenBMC Patches &lt;openbmc-patches@st=
wcx.xyz&gt;, openbmc@lists.ozlabs.org<br>Cc: Milton Miller II/Austin/IBM@IB=
MUS<br>Subject: Re: [PATCH openbmc 7/8] Hack to make fw=5Fsetenv work<br>Da=
te: Thu, Jan 28, 2016 6:25 PM<br>&nbsp;
<div><font face=3D"Default Monospace,Courier New,Courier,monospace" size=3D=
"2" >On Thu, 2016-01-28 at 16:50 -0600, OpenBMC Patches wrote:<br>&gt; From=
: "Milton D. Miller II" &lt;miltonm@us.ibm.com&gt;<br>&gt;<br>&gt; The fw=
=5Fsetenv is not working with the kernel mtd driver.&nbsp;&nbsp;It works<br=
>&gt; on a plain flat file, and flashcp which is used in /update works.<br>=
<br>Do we know why the kernel mtd driver doesn't work ? This worries me ...=
<br>we should root cause this first.<br><br>&gt; Find the u-boot-env mtd, l=
ink it in run and copy the contents to a<br>&gt; plain file in /run during =
init.&nbsp;&nbsp;In shutdown, check for the link,<br>&gt; the file having d=
ata, no current image update for the u-boot-env,<br>&gt; and that the conte=
nt differs from the mtd via the link.&nbsp;&nbsp;If all<br>&gt; are true cr=
eate a symlink to the file and trigger the update.<br>&gt;<br>&gt; Along wt=
ih changing the fw=5Fenv.config this causes the fw=5Fsetenv<br>&gt; and fw=
=5Fprintenv utilities to set and update this cached file which<br>&gt; will=
 be synced during a normal bmc reboot.&nbsp;&nbsp;This will allow us to<br>=
&gt; set the ethaddr variable which already requires a reboot to activate.<=
br>&gt;<br>&gt; Note: the links are directly in /run because the fw=5F{set,=
print}env<br>&gt; utilities limit the env file name to 16 characters.<br>&g=
t;<br>&gt; Signed-off-by: Milton Miller &lt;miltonmm@us.ibm.com&gt;<br>&gt;=
 ---<br>&gt; &nbsp;.../meta-ast2400/recipes-bsp/u-<br>&gt; boot/files/fw=5F=
env.config&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;|&nbsp;<br>&gt; 3 ++-<br>&gt; &nbsp;.../recipes-phosphor/obmc-phosph=
or-initfs/files/obmc-<br>&gt; init.sh&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;|&nbsp;<br>&gt; 7 +++++++<br>&gt; &nbsp;.../recipes-phosphor/obmc-phosp=
hor-initfs/files/obmc-<br>&gt; shutdown.sh&nbsp;&nbsp;&nbsp;|&nbsp;<br>&gt;=
 5 +++++<br>&gt; &nbsp;3 files changed, 14 insertions(+), 1 deletion(-)<br>=
&gt;<br>&gt; diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes=
-bsp/u-<br>&gt; boot/files/fw=5Fenv.config b/meta-openbmc-bsp/meta-aspeed/m=
eta-<br>&gt; ast2400/recipes-bsp/u-boot/files/fw=5Fenv.config<br>&gt; index=
 fe09890..978e4d6 100644<br>&gt; --- a/meta-openbmc-bsp/meta-aspeed/meta-as=
t2400/recipes-bsp/u-<br>&gt; boot/files/fw=5Fenv.config<br>&gt; +++ b/meta-=
openbmc-bsp/meta-aspeed/meta-ast2400/recipes-bsp/u-<br>&gt; boot/files/fw=
=5Fenv.config<br>&gt; @@ -12,7 +12,8 @@<br>&gt; &nbsp;<br>&gt; &nbsp;# MTD =
SPI-dataflash example<br>&gt; &nbsp;# MTD device name Device offset Env. si=
ze Flash<br>&gt; sector size Number of sectors<br>&gt; -/dev/mtd2 0x00000 0=
x20000<br>&gt; +#/dev/mtd2 0x00000 0x20000<br>&gt; +/run/fw=5Fenv 0x00000 0=
x20000<br>&gt; &nbsp;#/dev/mtd5 0x4200 0x4200<br>&gt; &nbsp;#/dev/mtd6 0x42=
00 0x4200<br>&gt; &nbsp;<br>&gt; diff --git a/meta-phosphor/common/recipes-=
phosphor/obmc-phosphor-<br>&gt; initfs/files/obmc-init.sh b/meta-phosphor/c=
ommon/recipes-<br>&gt; phosphor/obmc-phosphor-initfs/files/obmc-init.sh<br>=
&gt; index 431780a..0dc4c35 100644<br>&gt; --- a/meta-phosphor/common/recip=
es-phosphor/obmc-phosphor-<br>&gt; initfs/files/obmc-init.sh<br>&gt; +++ b/=
meta-phosphor/common/recipes-phosphor/obmc-phosphor-<br>&gt; initfs/files/o=
bmc-init.sh<br>&gt; @@ -29,6 +29,13 @@ findmtd() {<br>&gt; &nbsp; echo $m<b=
r>&gt; &nbsp;}<br>&gt; &nbsp;<br>&gt; +env=3D$(findmtd u-boot-env)<br>&gt; =
+if test -n $env<br>&gt; +then<br>&gt; + ln -s /dev/$env /run/mtd:u-boot-en=
v<br>&gt; + cp /run/mtd:u-boot-env /run/fw=5Fenv<br>&gt; +fi<br>&gt; +<br>&=
gt; &nbsp;rofs=3D$(findmtd rofs)<br>&gt; &nbsp;rwfs=3D$(findmtd rwfs)<br>&g=
t; &nbsp;<br>&gt; diff --git a/meta-phosphor/common/recipes-phosphor/obmc-p=
hosphor-<br>&gt; initfs/files/obmc-shutdown.sh b/meta-phosphor/common/recip=
es-<br>&gt; phosphor/obmc-phosphor-initfs/files/obmc-shutdown.sh<br>&gt; in=
dex 029cd65..cc076fd 100644<br>&gt; --- a/meta-phosphor/common/recipes-phos=
phor/obmc-phosphor-<br>&gt; initfs/files/obmc-shutdown.sh<br>&gt; +++ b/met=
a-phosphor/common/recipes-phosphor/obmc-phosphor-<br>&gt; initfs/files/obmc=
-shutdown.sh<br>&gt; @@ -24,6 +24,11 @@ do<br>&gt; &nbsp;done<br>&gt; &nbsp=
;set +x<br>&gt; &nbsp;<br>&gt; +if test -s /run/fw=5Fenv -a -c /run/mtd:u-b=
oot-env -a ! -e /image-u-<br>&gt; boot-env &amp;&amp;<br>&gt; + ! cmp /run/=
mtd:u-boot-env /run/fw=5Fenv<br>&gt; +then<br>&gt; + ln -s /run/fw=5Fenv /i=
mage-u-boot-env<br>&gt; +fi<br>&gt; &nbsp;<br>&gt; &nbsp;if test -x /update=
 &amp;&amp; ls image-* &gt; /dev/null 2&gt;&amp;1<br>&gt; &nbsp;then</font>=
</div></blockquote>
<div dir=3D"ltr" >&nbsp;</div></div><BR>
