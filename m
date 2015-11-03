Return-Path: <austenc@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C35091A0298
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 23:18:49 +1100 (AEDT)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 3 Nov 2015 07:18:47 -0500
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 3 Nov 2015 07:18:44 -0500
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25])
 by d01dlp03.pok.ibm.com (Postfix) with ESMTP id C6A37C90041
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2015 07:06:54 -0500 (EST)
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 tA3CIiKO59310278
 for <openbmc@lists.ozlabs.org>; Tue, 3 Nov 2015 12:18:44 GMT
Received: from d01av03.pok.ibm.com (localhost [127.0.0.1])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 tA3CIhVe030020
 for <openbmc@lists.ozlabs.org>; Tue, 3 Nov 2015 07:18:43 -0500
Received: from d50lp02.ny.us.ibm.com (d50lp02.pok.ibm.com [146.89.104.208])
 by d01av03.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 tA3CIhrx030005
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 3 Nov 2015 07:18:43 -0500
Message-Id: <201511031218.tA3CIhrx030005@d01av03.pok.ibm.com>
Received: from /spool/local
 by d50lp02.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 3 Nov 2015 07:18:36 -0500
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by d50lp02.ny.us.ibm.com (158.87.18.21) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Tue, 3 Nov 2015 07:18:34 -0500
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 3 Nov 2015 12:18:33 -0000
Received: from us1a3-smtp03.a3.dal06.isc4sb.com (10.106.154.94)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 3 Nov 2015 12:18:31 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp03.a3.dal06.isc4sb.com
 with ESMTP id 2015110312184523-226189 ;
 Tue, 3 Nov 2015 12:18:45 +0000 
In-Reply-To: <OF957048BA.07DD0CF2-ON86257EF2.00366792-86257EF2.00366F8B@LocalDomain>
Date: Tue, 3 Nov 2015 12:18:30 +0000
To: "Norman James" <njames@us.ibm.com>, "Patrick Williams III"
 <iawillia@us.ibm.com>
From: "Chris Austen" <austenc@us.ibm.com>
Subject: Re: 9.3.164.147 is running Candidate 4 and so can you
Cc: "openbmc" <openbmc@lists.ozlabs.org>
Importance: Normal
MIME-Version: 1.0
X-Mailer: IBM Traveler 9.0.1.8 Build 201510142205_20
X-KeepSent: 00D6DD05:DC909F75-00257EF2:00439C6B;
 type=4; name=$KeepSent
X-LLNOutbound: False
X-Disclaimed: 21983
X-TNEFEvaluated: 1
Content-Type: multipart/alternative; 
 boundary="----=_Part_73_101058054.1446553110211"
x-cbid: 15110312-0041-0000-0000-000002341896
X-IBM-ISS-SpamDetectors: Score=0.387138; BY=0.292933; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.387138; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004563; HX=3.00000236; KW=3.00000007;
 PH=3.00000004; SC=3.00000120; SDB=6.00612054; UDB=6.00270470; UTC=2015-11-03
 12:18:32
x-cbparentid: 15110312-5090-0000-0000-000005A34D50
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
X-List-Received-Date: Tue, 03 Nov 2015 12:18:51 -0000


------=_Part_73_101058054.1446553110211
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Patrick make a tag.=20
  =20
    Norm, latest will work until there is a tag
 =20
  Sent from my iPhone using IBM Verse
 =20
  On Nov 3, 2015, 4:28:17 AM, "Norman James" <njames@us.ibm.com> wrote:
  I don't see any tags. Who is tagging the release?
  =20
  =20
   Regards,
   Norman James
   IBM - POWER Systems Architect
   Phone: 1-512-286-6807 (T/L: 363-6807)
   Internet: njames@us.ibm.com
  =20
  =20
         Chris Austen---11/02/2015 05:54:30 PM---System powers on things of=
 interest below. You all have 4 hours before I ask Patrick to tag it as t
          =20
     From: Chris Austen/Austin/IBM@IBMUS
     To: openbmc@lists.ozlabs.org
     Date: 11/02/2015 05:54 PM
     Subject: 9.3.164.147 is running Candidate 4 and so can you
     Sent by: "openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.o=
rg>
    =20
    =20
    =20
     System powers on things of interest below. You all have 4 hours before=
 I ask Patrick to tag it as the Nov 1 deliverable. I verified it compiles i=
n Palmetto and Barreleye. Switching to QEMU requires rm -rf build/tmp so th=
e dependencies are still not correct.
     =20
     =20
     Flash images...
     9.3.164.219:/tftpboot/cuImage=5F1031=5F4
     9.3.164.219:/tftpboot/initrd=5F1031=5F4
     =20
     ipmi trace...
     /gsa/ausgsa/home/c/a/causten/public/openbmc/obmc=5Fipmitrace=5F1031=5F=
4.txt
     =20
     rest stuff...
     $ curl http://9.3.164.147/org/openbmc/inventory/system/chassis/motherb=
oard/enumerate
     causten@causten-VirtualBox:~/openbmc-barreleye/build
     $ curl http://9.3.164.147/org/openbmc/inventory/system/chassis/motherb=
oard/
     [
     "/org/openbmc/inventory/system/chassis/motherboard/dimm3",
     "/org/openbmc/inventory/system/chassis/motherboard/dimm2",
     "/org/openbmc/inventory/system/chassis/motherboard/dimm1",
     "/org/openbmc/inventory/system/chassis/motherboard/dimm0",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0",
     "/org/openbmc/inventory/system/chassis/motherboard/centaur0",
     "/org/openbmc/inventory/system/chassis/motherboard/bmc"
     ]causten@causten-VirtualBox:~/openbmc-barreleye/build
     $ curl http://9.3.164.147/org/openbmc/inventory/system/chassis/motherb=
oard/list
     [
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core9",
     "/org/openbmc/inventory/system/chassis/motherboard/dimm2",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core11",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core10",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core8",
     "/org/openbmc/inventory/system/chassis/motherboard/centaur0",
     "/org/openbmc/inventory/system/chassis/motherboard/dimm3",
     "/org/openbmc/inventory/system/chassis/motherboard/dimm1",
     "/org/openbmc/inventory/system/chassis/motherboard/dimm0",
     "/org/openbmc/inventory/system/chassis/motherboard/bmc",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core7",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core6",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core5",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core4",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core3",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core2",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core1",
     "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core0"
     ]causten@causten-VirtualBox:~/openbmc-barreleye/build
     $
     =20
     =20
     Petetitboot shows disks now...
     Petitboot (dev.20150929) TN71-BP012 unavailable
     =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80
     [Disk: sda2 / e0754d74-9c6f-4daa-9e81-ee5ae09d0f64]
     Ubuntu, with Linux 3.16.0-23-generic (recovery mode)
     Ubuntu, with Linux 3.16.0-23-generic
     Ubuntu
      System information
     System configuration
     Language
     Rescan devices
     Retrieve config from URL
     *Exit to shell=20
     =20
     =20
     =20
     root@palmetto:~# i2cdetect -l
     i2c-0 i2c Aspeed i2c at f018a040 I2C adapter
     i2c-1 i2c Aspeed i2c at f018a080 I2C adapter
     i2c-2 i2c Aspeed i2c at f018a0c0 I2C adapter
     i2c-3 i2c Aspeed i2c at f018a100 I2C adapter
     i2c-4 i2c Aspeed i2c at f018a140 I2C adapter
     i2c-5 i2c Aspeed i2c at f018a180 I2C adapter
     i2c-6 i2c Aspeed i2c at f018a1c0 I2C adapter
     i2c-7 i2c Aspeed i2c at f018a300 I2C adapter
     i2c-8 i2c Aspeed i2c at f018a340 I2C adapter
     root@palmetto:~#
     =20
     =20
    =20
     Chris Austen
     POWER Systems Enablement Manager
     (512) 286-5184 (T/L: 363-5184)
     =5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
     openbmc mailing list
     openbmc@lists.ozlabs.org
     https://lists.ozlabs.org/listinfo/openbmc

------=_Part_73_101058054.1446553110211
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=utf-8

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"><style>div{-webkit-tap-highlight-color: rgba(0, 0, 0, 0);} Helvet=
ica Neue, Helvetica-Neue, Helvetica, Arial, sans-serif</style></head><body =
style=3D"color: #292929; font-family: blockquote {margin:1em 0em; color: #2=
92929;border-left: 2px solid #292929;padding-left: 1em; !important; font-si=
ze: 15 !important;"><div id=3D"content" class=3D"MaaS360PIMSDKComposeConten=
tContainerClass" spellcheck=3D"true" autocorrect=3D"true" autocapitalize=3D=
"true" style=3D"font-family: 'Helvetica Neue', Helvetica-Neue, Helvetica, A=
rial, sans-serif; margin-top: 15px;">Patrick make a tag.&nbsp;<div><br></di=
v><div>Norm, latest will work until there is a tag<br><br>Sent from my iPho=
ne using IBM Verse<br><br><hr>On Nov 3, 2015, 4:28:17 AM, "Norman James" &l=
t;njames@us.ibm.com&gt; wrote:<br><blockquote type=3D"cite" id=3D"MaaS360PI=
MSDKOriginalMessageId">I don't see any tags.  Who is tagging the release?<b=
r><br><br>Regards,<br>Norman James<br>IBM - POWER Systems Architect<br>Phon=
e: <a href=3D"tel:1-512-286-6807" x-apple-data-detectors=3D"true" x-apple-d=
ata-detectors-type=3D"telephone" x-apple-data-detectors-result=3D"1">1-512-=
286-6807</a> (T/L: <a href=3D"tel:363-6807" x-apple-data-detectors=3D"true"=
 x-apple-data-detectors-type=3D"telephone" x-apple-data-detectors-result=3D=
"2/0">363-6807</a>)<br>Internet: njames@us.ibm.com<br><br><div class=3D"dom=
ino-section"><div class=3D"domino-section-head"><span class=3D"domino-secti=
on-title"><font color=3D"#424282">Chris Austen---11/02/2015 05:54:30 PM---S=
ystem powers on things of interest below.  You all have 4 hours before I as=
k Patrick to tag it as t</font></span></div><div class=3D"domino-section-bo=
dy"><br><br><font size=3D"2" color=3D"#5F5F5F">From:        </font><font si=
ze=3D"2">Chris Austen/Austin/IBM@IBMUS</font><br><font size=3D"2" color=3D"=
#5F5F5F">To:        </font><font size=3D"2">openbmc@lists.ozlabs.org</font>=
<br><font size=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2"=
>11/02/2015 05:54 PM</font><br><font size=3D"2" color=3D"#5F5F5F">Subject: =
       </font><font size=3D"2">9.3.164.147 is running Candidate 4 and so ca=
n you</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:        </font><=
font size=3D"2">"openbmc" &lt;openbmc-bounces+njames=3Dus.ibm.com@lists.ozl=
abs.org&gt;</font><br><hr width=3D"100%" size=3D"2" align=3D"left" noshade=
=3D"" style=3D"color:#8091A5; "><br><br><br><font face=3D"Arial">System pow=
ers on things of interest below.  You all have 4 hours before I ask Patrick=
 to tag it as the Nov 1 deliverable.  I verified it compiles in Palmetto an=
d Barreleye.  Switching to QEMU requires rm -rf build/tmp so the dependenci=
es are still not correct.</font><br><font face=3D"Arial"> </font><br><font =
face=3D"Arial"> </font><br><b><font face=3D"Arial">Flash images...</font></=
b><br><font face=3D"Courier">9.3.164.219:/tftpboot/cuImage=5F1031=5F4</font=
><br><font face=3D"Courier">9.3.164.219:/tftpboot/initrd=5F1031=5F4</font><=
br><font face=3D"Arial"> </font><br><b><font face=3D"Arial">ipmi trace...</=
font></b><br><font face=3D"Arial">/gsa/ausgsa/home/c/a/causten/public/openb=
mc/obmc=5Fipmitrace=5F1031=5F4.txt</font><br><font face=3D"Arial"> </font><=
br><b><font face=3D"Arial">rest stuff...</font></b><br><font face=3D"Arial"=
>$ curl </font><a href=3D"http://9.3.164.147/org/openbmc/inventory/system/c=
hassis/motherboard/enumerate"><u><font color=3D"#0000FF" face=3D"Arial">htt=
p://9.3.164.147/org/openbmc/inventory/system/chassis/motherboard/enumerate<=
/font></u></a><font face=3D"Arial"><br>causten@causten-VirtualBox:~/openbmc=
-barreleye/build<br>$ curl </font><a href=3D"http://9.3.164.147/org/openbmc=
/inventory/system/chassis/motherboard/"><u><font color=3D"#0000FF" face=3D"=
Arial">http://9.3.164.147/org/openbmc/inventory/system/chassis/motherboard/=
</font></u></a><font face=3D"Arial"><br>[<br>  "/org/openbmc/inventory/syst=
em/chassis/motherboard/dimm3",<br>  "/org/openbmc/inventory/system/chassis/=
motherboard/dimm2",<br>  "/org/openbmc/inventory/system/chassis/motherboard=
/dimm1",<br>  "/org/openbmc/inventory/system/chassis/motherboard/dimm0",<br=
>  "/org/openbmc/inventory/system/chassis/motherboard/cpu0",<br>  "/org/ope=
nbmc/inventory/system/chassis/motherboard/centaur0",<br>  "/org/openbmc/inv=
entory/system/chassis/motherboard/bmc"<br>]causten@causten-VirtualBox:~/ope=
nbmc-barreleye/build<br>$ curl </font><a href=3D"http://9.3.164.147/org/ope=
nbmc/inventory/system/chassis/motherboard/list"><u><font color=3D"#0000FF" =
face=3D"Arial">http://9.3.164.147/org/openbmc/inventory/system/chassis/moth=
erboard/list</font></u></a><font face=3D"Arial"><br>[<br>  "/org/openbmc/in=
ventory/system/chassis/motherboard/cpu0/core9",<br>  "/org/openbmc/inventor=
y/system/chassis/motherboard/dimm2",<br>  "/org/openbmc/inventory/system/ch=
assis/motherboard/cpu0/core11",<br>  "/org/openbmc/inventory/system/chassis=
/motherboard/cpu0/core10",<br>  "/org/openbmc/inventory/system/chassis/moth=
erboard/cpu0/core8",<br>  "/org/openbmc/inventory/system/chassis/motherboar=
d/centaur0",<br>  "/org/openbmc/inventory/system/chassis/motherboard/dimm3"=
,<br>  "/org/openbmc/inventory/system/chassis/motherboard/dimm1",<br>  "/or=
g/openbmc/inventory/system/chassis/motherboard/dimm0",<br>  "/org/openbmc/i=
nventory/system/chassis/motherboard/bmc",<br>  "/org/openbmc/inventory/syst=
em/chassis/motherboard/cpu0",<br>  "/org/openbmc/inventory/system/chassis/m=
otherboard/cpu0/core7",<br>  "/org/openbmc/inventory/system/chassis/motherb=
oard/cpu0/core6",<br>  "/org/openbmc/inventory/system/chassis/motherboard/c=
pu0/core5",<br>  "/org/openbmc/inventory/system/chassis/motherboard/cpu0/co=
re4",<br>  "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core3",<=
br>  "/org/openbmc/inventory/system/chassis/motherboard/cpu0/core2",<br>  "=
/org/openbmc/inventory/system/chassis/motherboard/cpu0/core1",<br>  "/org/o=
penbmc/inventory/system/chassis/motherboard/cpu0/core0"<br>]causten@causten=
-VirtualBox:~/openbmc-barreleye/build<br>$</font><br><font face=3D"Arial"> =
</font><br><font face=3D"Arial"> </font><br><b><font face=3D"Arial">Petetit=
boot shows disks now...</font></b><br><font face=3D"Arial">Petitboot (dev.2=
0150929)                          TN71-BP012       unavailable<br> =E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80<br>  [Disk: sda2 / e0754d74-9c6f-4daa-9e81-ee5ae09d0f=
64]<br>    Ubuntu, with Linux 3.16.0-23-generic (recovery mode)<br>    Ubun=
tu, with Linux 3.16.0-23-generic<br>    Ubuntu</font><br><font face=3D"Aria=
l">  System information<br>  System configuration<br>  Language<br>  Rescan=
 devices<br>  Retrieve config from URL<br> *Exit to shell                  =
                       </font><br><font face=3D"Arial"> </font><br><font fa=
ce=3D"Arial"> </font><br><font face=3D"Arial"> </font><br><font face=3D"Ari=
al">root@palmetto:~# i2cdetect -l<br>i2c-0    i2c           Aspeed i2c at f=
018a040              I2C adapter<br>i2c-1    i2c           Aspeed i2c at f0=
18a080              I2C adapter<br>i2c-2    i2c           Aspeed i2c at f01=
8a0c0              I2C adapter<br>i2c-3    i2c           Aspeed i2c at f018=
a100              I2C adapter<br>i2c-4    i2c           Aspeed i2c at f018a=
140              I2C adapter<br>i2c-5    i2c           Aspeed i2c at f018a1=
80              I2C adapter<br>i2c-6    i2c           Aspeed i2c at f018a1c=
0              I2C adapter<br>i2c-7    i2c           Aspeed i2c at f018a300=
              I2C adapter<br>i2c-8    i2c           Aspeed i2c at f018a340 =
             I2C adapter<br>root@palmetto:~#</font><br><font face=3D"Arial"=
> </font><br><font face=3D"Arial">  </font><br><font face=3D"Arial"><br>Chr=
is Austen<br>POWER Systems Enablement Manager<br><a href=3D"tel:(512)%20286=
-5184" x-apple-data-detectors=3D"true" x-apple-data-detectors-type=3D"telep=
hone" x-apple-data-detectors-result=3D"10">(512) 286-5184</a> (T/L: <a href=
=3D"tel:363-5184" x-apple-data-detectors=3D"true" x-apple-data-detectors-ty=
pe=3D"telephone" x-apple-data-detectors-result=3D"11">363-5184</a>)</font><=
br><tt>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
<br>openbmc mailing list<br>openbmc@lists.ozlabs.org<br></tt><tt><a href=3D=
"https://lists.ozlabs.org/listinfo/openbmc">https://lists.ozlabs.org/listin=
fo/openbmc</a></tt><tt><br></tt></div></div></blockquote></div></div><BR>
</body></html>

------=_Part_73_101058054.1446553110211--
