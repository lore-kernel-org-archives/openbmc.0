Return-Path: <austenc@us.ibm.com>
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 (using TLSv1.2 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qTh0v4dTWzDq6X
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 16:22:55 +1100 (AEDT)
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 22 Mar 2016 01:22:52 -0400
Received: from d01dlp02.pok.ibm.com (9.56.250.167)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 22 Mar 2016 01:22:52 -0400
X-IBM-Helo: d01dlp02.pok.ibm.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28])
 by d01dlp02.pok.ibm.com (Postfix) with ESMTP id BC5A46E8040
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 01:09:41 -0400 (EDT)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u2M5MpUe31064170
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 05:22:51 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u2M5MoU2014760
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 01:22:50 -0400
Received: from d50lp32.co.us.ibm.com (d50lp32.boulder.ibm.com [9.17.249.36])
 by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u2M5Mn0f014732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2016 01:22:50 -0400
Message-Id: <201603220522.u2M5Mn0f014732@d01av04.pok.ibm.com>
Received: from localhost
 by d50lp32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Mon, 21 Mar 2016 23:22:49 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.73)
 by d50lp32.co.us.ibm.com (192.168.2.143) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Mon, 21 Mar 2016 23:22:48 -0600
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: austenc@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <austenc@us.ibm.com>;
 Tue, 22 Mar 2016 05:22:47 -0000
Received: from us1a3-smtp01.a3.dal06.isc4sb.com (10.106.154.95)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Tue, 22 Mar 2016 05:22:43 -0000
Received: from us1a3-mail75.a3.dal09.isc4sb.com ([10.142.3.82])
 by us1a3-smtp01.a3.dal06.isc4sb.com
 with ESMTP id 2016032205224299-506478 ;
 Tue, 22 Mar 2016 05:22:42 +0000 
In-Reply-To: 
Subject: Event Log parser 
From: "Chris Austen" <austenc@us.ibm.com>
To: openbmc@lists.ozlabs.org, "Gus Schlachter" <gussch@us.ibm.com>, "Russel L
 Young" <youngr1@us.ibm.com>
Date: Tue, 22 Mar 2016 05:22:42 +0000
Sensitivity: 
References: 
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
X-Mailer: Lotus Domino Web Server Build V851SAAS_03072016_FP1 March 14, 2016
X-LLNOutbound: False
X-Disclaimed: 13615
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16032205-0041-0000-0000-000003A8F3AD
X-IBM-ISS-SpamDetectors: Score=0.423878; BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0;
 PH=0; SC=0.423878; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005066; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000153; SDB=6.00676857; UDB=6.00310084; UTC=2016-03-22
 05:22:45
x-cbparentid: 16032205-0598-0000-0000-000007083965
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
X-List-Received-Date: Tue, 22 Mar 2016 05:22:56 -0000

<div class=3D"socmaildefaultfont" dir=3D"ltr" style=3D"font-family:Arial;fo=
nt-size:10.5pt" ><div dir=3D"ltr" ><span style=3D"font-family:courier new,c=
ourier,monospace;" >Here's a first pass at the event log parser.&nbsp; It h=
as the stuff for the BMC viewer, the eSEL for (not sure really) and the Deb=
ug Data is a good old fashion PEL.&nbsp; Thoughts?&nbsp; </span></div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" >&nbsp;</div>
<div dir=3D"ltr" ><div><span style=3D"font-family:courier new,courier,monos=
pace;" >$ ./pelparser.py 989<br>Message: A cpu1 has experienced a unrecover=
able error<br>Severity: unrecoverable error<br>Association: /org/openbmc/in=
ventory/system/chassis/motherboard/cpu1<br>Tue 15 Mar 2016 12:34:04 AM<br>e=
SEL:<br>00000000:&nbsp; 00 00 df 00 00 00 00 20&nbsp; 00 04 07 0e 07 aa 00 =
00&nbsp; |....... ........|</span></div>
<div><span style=3D"font-family:courier new,courier,monospace;" >Debug Data=
:<br>00000000:&nbsp; 50 48 00 30 01 00 2a 00&nbsp; 00 00 00 10 af db 9f a8&=
nbsp; |PH.0..*.........|<br>00000010:&nbsp; 00 00 00 10 af ae 27 98&nbsp; 4=
2 00 00 0a 00 00 00 00&nbsp; |......'.B.......|<br>00000020:&nbsp; 00 00 00=
 00 00 00 00 00&nbsp; 90 00 60 bc 90 00 60 bc&nbsp; |..........`...`.|<br>0=
0000030:&nbsp; 55 48 00 18 01 00 26 00&nbsp; 10 03 40 00 00 00 00 00&nbsp; =
|UH....&amp;...@.....|<br>00000040:&nbsp; ff ff 00 00 00 00 00 00&nbsp; 50 =
53 00 50 01 01 00 00&nbsp; |........PS.P....|<br>00000050:&nbsp; 02 00 00 0=
9 2a 00 00 48&nbsp; 00 00 00 e0 00 00 02 00&nbsp; |....*..H........|<br>000=
00060:&nbsp; 00 00 00 00 00 20 00 00&nbsp; 00 0c 46 54 df 8e c7 c3&nbsp; |.=
.... ....FT....|<br>00000070:&nbsp; 00 00 04 4b 00 00 00 65&nbsp; 42 43 31 =
30 32 41 30 30&nbsp; |...K...eBC102A00|<br>00000080:&nbsp; 20 20 20 20 20 2=
0 20 20&nbsp; 20 20 20 20 20 20 20 20&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>00000090:=
&nbsp; 20 20 20 20 20 20 20 20&nbsp; 55 44 00 24 01 06 01 00&nbsp; |&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; UD.$....|<br>000000a0:&nbsp; 01 54 41 4=
b 00 00 00 06&nbsp; 00 00 00 00 00 00 00 00&nbsp; |.TAK............|<br>000=
000b0:&nbsp; 00 00 00 52 23 01 00 02&nbsp; 00 05 01 00 55 44 00 1c&nbsp; |.=
..R#.......UD..|<br>000000c0:&nbsp; 01 06 01 00 02 54 41 4b&nbsp; 00 00 00 =
05 00 00 00 55&nbsp; |.....TAK.......U|<br>000000d0:&nbsp; 00 5f 7a a8 44 3=
a 20 00&nbsp; 55 44 00 1c 01 04 01 00&nbsp; |.=5Fz.D: .UD......|<br>000000e=
0:&nbsp; 05 22 a1 58 01 85 0c 01&nbsp; cd 20 f7 0e 08 10 00 00&nbsp; |.".X.=
.... ......|<br>000000f0:&nbsp; 00 07 34 d0 55 44 05 98&nbsp; 01 00 2a 00 d=
a 21 01 01&nbsp; |..4.UD....*..!..|<br>00000100:&nbsp; 00 02 00 00 00 00 65=
 06&nbsp; 01 00 00 00 00 00 00 00&nbsp; |......e.........|<br>00000110:&nbs=
p; 0e 03 00 00 02 00 00 00&nbsp; 00 00 00 00 01 02 00 00&nbsp; |...........=
.....|<br>00000120:&nbsp; 00 00 00 00 00 00 00 00&nbsp; 00 00 00 00 00 00 0=
0 00&nbsp; |................|<br>00000130:&nbsp; 00 00 00 00 00 00 00 00&nb=
sp; 00 00 00 00 00 00 00 00&nbsp; |................|<br>00000140:&nbsp; 00 =
00 00 00 00 00 00 00&nbsp; 00 00 00 00 00 00 00 00&nbsp; |................|=
<br>00000150:&nbsp; 01 00 0b 03 00 00 00 00&nbsp; 00 00 00 00 8f f7 c9 17&n=
bsp; |................|<br>00000160:&nbsp; 01 00 01 80 ff f9 3c 00&nbsp; ff=
 b8 89 f6 00 00 00 00&nbsp; |......&lt;.........|<br>00000170:&nbsp; 05 90 =
05 18 00 01 05 14&nbsp; 01 28 00 42 45 52 52 00&nbsp; |.........(.BERR.|<br=
>00000180:&nbsp; 00 00 00 00 00 00 00 00&nbsp; 00 00 00 00 00 00 00 74&nbsp=
; |...............t|<br>00000190:&nbsp; 00 00 00 00 00 00 00 74&nbsp; 00 00=
 00 02 00 00 00 00&nbsp; |.......t........|<br>000001a0:&nbsp; 00 00 00 00 =
00 00 b9 e7&nbsp; 00 00 00 00 00 0c 46 54&nbsp; |..............FT|<br>00000=
1b0:&nbsp; df 8e c7 c3 00 00 04 4b&nbsp; 00 00 00 00 00 00 00 03&nbsp; |...=
....K........|<br>000001c0:&nbsp; 00 00 00 00 00 00 00 28&nbsp; 00 00 00 04=
 01 87 1f 33&nbsp; |.......(.......3|<br>000001d0:&nbsp; 00 00 00 01 00 08 =
46 54&nbsp; c5 4d 4d d3 00 00 01 a4&nbsp; |......FT.MM.....|<br>000001e0:&n=
bsp; ff b8 89 f6 ff f9 3c 00&nbsp; 00 00 00 24 01 28 00 42&nbsp; |......&lt=
;....$.(.B|<br>000001f0:&nbsp; 49 4d 50 00 00 00 00 00&nbsp; 00 00 00 00 00=
 00 00 00&nbsp; |IMP.............|<br>00000200:&nbsp; 00 00 02 44 00 00 00 =
00&nbsp; 00 00 02 44 00 00 00 0f&nbsp; |...D.......D....|<br>00000210:&nbsp=
; 00 00 00 00 00 00 00 00&nbsp; 00 01 37 84 00 00 00 01&nbsp; |..........7.=
....|<br>00000220:&nbsp; 00 08 46 54 6d 8e 51 4b&nbsp; 00 00 00 f7 00 00 00=
 00&nbsp; |..FTm.QK........|<br>00000230:&nbsp; 00 00 00 01 00 00 00 24&nbs=
p; 00 00 00 00 00 01 41 39&nbsp; |.......$......A9|<br>00000240:&nbsp; 00 0=
0 00 01 00 14 46 54&nbsp; de 92 8e 19 00 00 01 12&nbsp; |......FT........|<=
br>00000250:&nbsp; 00 00 00 01 00 00 00 00&nbsp; 00 00 00 00 00 00 00 01&nb=
sp; |................|<br>00000260:&nbsp; 22 0e a0 49 00 00 00 30&nbsp; 00 =
00 00 00 00 02 d4 bb&nbsp; |"..I...0........|<br>00000270:&nbsp; 00 00 00 0=
1 00 04 46 54&nbsp; e8 b5 22 fe 00 00 02 36&nbsp; |......FT.."....6|<br>000=
00280:&nbsp; 00 00 00 02 00 00 00 20&nbsp; 00 00 00 00 00 03 83 18&nbsp; |.=
...... ........|<br>00000290:&nbsp; 00 00 00 01 00 08 46 54&nbsp; 3f c0 13 =
09 00 00 00 5f&nbsp; |......FT?......=5F|<br>000002a0:&nbsp; 00 00 00 03 00=
 00 00 00&nbsp; 00 00 00 24 00 00 00 00&nbsp; |...........$....|<br>000002b=
0:&nbsp; 2a 02 a2 a5 00 00 00 00&nbsp; 00 08 46 54 af dd 57 8b&nbsp; |*....=
.....FT..W.|<br>000002c0:&nbsp; 00 00 02 b1 00 00 00 01&nbsp; 00 00 00 00 0=
0 00 00 24&nbsp; |...............$|<br>000002d0:&nbsp; 00 00 00 01 2b 76 53=
 c5&nbsp; 00 00 00 00 00 08 46 54&nbsp; |....+vS.......FT|<br>000002e0:&nbs=
p; 62 7b 55 e2 00 00 01 e9&nbsp; 00 00 04 b0 00 00 00 12&nbsp; |b{U........=
.....|<br>000002f0:&nbsp; 00 00 00 24 00 00 00 03&nbsp; 07 f3 03 0d 00 00 0=
0 01&nbsp; |...$............|<br>00000300:&nbsp; 00 04 46 54 14 00 8b b4&nb=
sp; 00 00 09 64 00 00 00 0f&nbsp; |..FT.......d....|<br>00000310:&nbsp; 00 =
00 00 20 00 00 00 03&nbsp; 07 f3 12 c8 00 00 00 01&nbsp; |... ............|=
<br>00000320:&nbsp; 00 04 46 54 f2 a2 29 77&nbsp; 00 00 05 e4 00 00 00 81&n=
bsp; |..FT..)w........|<br>00000330:&nbsp; 00 00 00 20 00 00 00 03&nbsp; 19=
 ac a1 ad 00 00 00 01&nbsp; |... ............|<br>00000340:&nbsp; 00 04 46 =
54 14 00 8b b4&nbsp; 00 00 09 64 00 00 00 04&nbsp; |..FT.......d....|<br>00=
000350:&nbsp; 00 00 00 20 00 00 00 03&nbsp; 19 ac cf 74 00 00 00 01&nbsp; |=
... .......t....|<br>00000360:&nbsp; 00 04 46 54 76 c1 3c d7&nbsp; 00 00 03=
 e7 ff fa 73 bc&nbsp; |..FTv.&lt;.......s.|<br>00000370:&nbsp; 00 00 00 20 =
00 00 00 03&nbsp; 2b 66 0d e6 00 00 00 01&nbsp; |... ....+f......|<br>00000=
380:&nbsp; 00 04 46 54 14 00 8b b4&nbsp; 00 00 09 64 00 00 00 03&nbsp; |..F=
T.......d....|<br>00000390:&nbsp; 00 00 00 20 00 00 00 03&nbsp; 2b 66 18 b3=
 00 00 00 01&nbsp; |... ....+f......|<br>000003a0:&nbsp; 00 04 46 54 6c 67 =
1e 6e&nbsp; 00 00 04 ca ff fd 4c d8&nbsp; |..FTlg.n......L.|<br>000003b0:&n=
bsp; 00 00 00 20 00 00 00 04&nbsp; 01 86 cc f4 00 00 00 01&nbsp; |... .....=
.......|<br>000003c0:&nbsp; 00 04 46 54 14 00 8b b4&nbsp; 00 00 09 64 00 00=
 00 01&nbsp; |..FT.......d....|<br>000003d0:&nbsp; 00 00 00 20 00 00 00 04&=
nbsp; 01 87 0c 30 00 00 00 01&nbsp; |... .......0....|<br>000003e0:&nbsp; 0=
0 14 46 54 dc 5f e9 79&nbsp; 00 00 00 de 00 3a da 68&nbsp; |..FT.=5F.y.....=
:.h|<br>000003f0:&nbsp; 00 00 81 e2 00 00 00 38&nbsp; ff ff ff ca ff ff ff =
d5&nbsp; |.......8........|<br>00000400:&nbsp; 00 00 00 30 00 00 00 04&nbsp=
; 01 87 16 46 00 00 00 01&nbsp; |...0.......F....|<br>00000410:&nbsp; 00 10=
 46 54 83 30 96 6d&nbsp; 00 00 00 e5 ff ff ff c9&nbsp; |..FT.0.m........|<b=
r>00000420:&nbsp; 00 1e f2 da 00 00 00 00&nbsp; 00 3a da 68 00 00 00 2c&nbs=
p; |.........:.h...,|<br>00000430:&nbsp; 01 28 00 42 49 4e 46 00&nbsp; 00 0=
0 00 00 00 00 00 00&nbsp; |.(.BINF.........|<br>00000440:&nbsp; 00 00 00 00=
 00 00 02 5c&nbsp; 00 00 00 00 00 00 02 5c&nbsp; |................|<br>0000=
0450:&nbsp; 00 00 00 10 00 00 00 00&nbsp; 00 00 00 00 00 00 a9 e3&nbsp; |..=
..............|<br>00000460:&nbsp; 00 00 00 00 00 04 46 54&nbsp; db 9b 7b c=
e 00 00 04 43&nbsp; |......FT..{....C|<br>00000470:&nbsp; 00 00 00 08 00 00=
 00 20&nbsp; 00 00 00 00 00 00 b2 fc&nbsp; |....... ........|<br>00000480:&=
nbsp; 00 00 00 00 00 04 46 54&nbsp; aa 50 bc e5 00 00 04 45&nbsp; |......FT=
.P.....E|<br>00000490:&nbsp; 00 00 00 00 00 00 00 20&nbsp; 00 00 00 00 00 0=
0 d4 f8&nbsp; |....... ........|<br>000004a0:&nbsp; 00 00 00 00 00 0c 46 54=
&nbsp; 14 92 c2 af 00 00 04 6e&nbsp; |......FT.......n|<br>000004b0:&nbsp; =
00 00 00 00 00 00 00 01&nbsp; 00 00 00 00 00 00 00 28&nbsp; |..............=
.(|<br>000004c0:&nbsp; 00 00 00 00 00 00 ef c2&nbsp; 00 00 00 00 00 0c 46 5=
4&nbsp; |..............FT|<br>000004d0:&nbsp; e1 e7 d3 93 00 00 04 8b&nbsp;=
 00 00 00 00 00 00 00 00&nbsp; |................|<br>000004e0:&nbsp; 00 00 =
00 00 00 00 00 28&nbsp; 00 00 00 00 00 01 1a ee&nbsp; |.......(........|<br=
>000004f0:&nbsp; 00 00 00 01 00 04 46 54&nbsp; aa 61 48 bc 00 00 02 ce&nbsp=
; |......FT.aH.....|<br>00000500:&nbsp; 00 00 08 08 00 00 00 20&nbsp; 00 00=
 00 00 00 02 e9 e9&nbsp; |....... ........|<br>00000510:&nbsp; 00 00 00 01 =
00 04 46 54&nbsp; 14 d0 66 19 00 00 02 1b&nbsp; |......FT..f.....|<br>00000=
520:&nbsp; 00 02 90 30 00 00 00 20&nbsp; 00 00 00 00 00 03 7a f3&nbsp; |...=
0... ......z.|<br>00000530:&nbsp; 00 00 00 01 00 04 46 54&nbsp; f7 69 80 3b=
 00 00 02 f7&nbsp; |......FT.i.;....|<br>00000540:&nbsp; ff fc 2b f8 00 00 =
00 20&nbsp; 00 00 00 00 00 04 2e 88&nbsp; |..+.... ........|<br>00000550:&n=
bsp; 00 00 00 01 00 04 46 54&nbsp; 35 cd 54 58 00 00 00 b8&nbsp; |......FT5=
.TX....|<br>00000560:&nbsp; 80 00 00 00 00 00 00 20&nbsp; 00 00 00 00 00 04=
 41 b1&nbsp; |....... ......A.|<br>00000570:&nbsp; 00 00 00 01 00 04 46 54&=
nbsp; 10 2c c2 65 00 00 00 37&nbsp; |......FT.,.e...7|<br>00000580:&nbsp; f=
f ff ff e1 00 00 00 20&nbsp; 00 00 00 00 00 04 5a 38&nbsp; |....... ......Z=
8|<br>00000590:&nbsp; 00 00 00 00 00 04 46 54&nbsp; 98 0b 99 ad 00 00 01 75=
&nbsp; |......FT.......u|<br>000005a0:&nbsp; ff fc d5 58 00 00 00 20&nbsp; =
00 00 00 01 0c ed 41 b6&nbsp; |...X... ......A.|<br>000005b0:&nbsp; 00 00 0=
0 00 00 0c 46 54&nbsp; 63 7f 62 1d 00 00 02 e8&nbsp; |......FTc.b.....|<br>=
000005c0:&nbsp; 00 00 00 01 00 00 00 00&nbsp; 00 00 0c fd 00 00 00 28&nbsp;=
 |...............(|<br>000005d0:&nbsp; 00 00 00 01 0c ed 4c 05&nbsp; 00 00 =
00 00 00 0c 46 54&nbsp; |......L.......FT|<br>000005e0:&nbsp; 63 7f 62 1d 0=
0 00 02 e8&nbsp; 00 00 00 03 00 00 00 00&nbsp; |c.b.............|<br>000005=
f0:&nbsp; 00 00 0f 11 00 00 00 28&nbsp; 00 00 00 01 0c ed 54 89&nbsp; |....=
...(......T.|<br>00000600:&nbsp; 00 00 00 00 00 0c 46 54&nbsp; 63 7f 62 1d =
00 00 02 e8&nbsp; |......FTc.b.....|<br>00000610:&nbsp; 00 00 00 05 00 00 0=
0 00&nbsp; 00 00 07 ed 00 00 00 28&nbsp; |...............(|<br>00000620:&nb=
sp; 00 00 00 01 0c ed 5d 0b&nbsp; 00 00 00 00 00 0c 46 54&nbsp; |......]...=
....FT|<br>00000630:&nbsp; 63 7f 62 1d 00 00 02 e8&nbsp; 00 00 00 07 00 00 =
00 00&nbsp; |c.b.............|<br>00000640:&nbsp; 00 00 07 ed 00 00 00 28&n=
bsp; 00 00 00 01 0c ed 66 cc&nbsp; |.......(......f.|<br>00000650:&nbsp; 00=
 00 00 00 00 08 46 54&nbsp; 2f f6 27 c7 00 00 00 8b&nbsp; |......FT/.'.....=
|<br>00000660:&nbsp; 00 00 07 ed 00 00 0f 11&nbsp; 00 00 00 24 00 00 00 04&=
nbsp; |...........$....|<br>00000670:&nbsp; 01 87 29 4a 00 00 00 01&nbsp; 0=
0 04 46 54 6c fe 69 43&nbsp; |..)J......FTl.iC|<br>00000680:&nbsp; 00 00 01=
 26 00 00 00 00&nbsp; 00 00 00 20 55 44 00 d0&nbsp; |...&amp;....... UD..|<=
br>00000690:&nbsp; 01 03 01 00 00 00 00 00&nbsp; 00 02 eb e4 00 00 00 00&nb=
sp; |................|<br>000006a0:&nbsp; 00 02 aa 44 00 00 00 00&nbsp; 40 =
3b e2 04 00 00 00 00&nbsp; |...D....@;......|<br>000006b0:&nbsp; 40 3c 17 7=
0 00 00 00 00&nbsp; 40 3b d7 98 00 00 00 00&nbsp; |@&lt;.p....@;......|<br>=
000006c0:&nbsp; 40 3b dd 44 00 00 00 00&nbsp; 40 3b de ec 00 00 00 00&nbsp;=
 |@;.D....@;......|<br>000006d0:&nbsp; 40 3b e0 48 00 00 00 00&nbsp; 40 3c =
0d e0 00 00 00 00&nbsp; |@;.H....@&lt;......|<br>000006e0:&nbsp; 40 3b 7a d=
c 00 00 00 00&nbsp; 40 31 9f e8 00 00 00 00&nbsp; |@;z.....@1......|<br>000=
006f0:&nbsp; 40 3b ac 80 00 00 00 00&nbsp; 40 3b ae e0 00 00 00 00&nbsp; |@=
;......@;......|<br>00000700:&nbsp; 40 3b 78 b4 00 00 00 00&nbsp; 40 31 9f =
e8 00 00 00 00&nbsp; |@;x.....@1......|<br>00000710:&nbsp; 40 3b ac 80 00 0=
0 00 00&nbsp; 40 3b ae e0 00 00 00 00&nbsp; |@;......@;......|<br>00000720:=
&nbsp; 40 3b 78 b4 00 00 00 00&nbsp; 40 31 9f e8 00 00 00 00&nbsp; |@;x....=
.@1......|<br>00000730:&nbsp; 40 3b ac 80 00 00 00 00&nbsp; 40 3b ae e0 00 =
00 00 00&nbsp; |@;......@;......|<br>00000740:&nbsp; 40 3b 78 b4 00 00 00 0=
0&nbsp; 40 31 9f e8 00 00 00 00&nbsp; |@;x.....@1......|<br>00000750:&nbsp;=
 40 33 64 60 00 00 00 00&nbsp; 00 00 25 64 55 44 00 1c&nbsp; |@3d`......%dU=
D..|<br>00000760:&nbsp; 01 01 01 00 48 6f 73 74&nbsp; 62 6f 6f 74 20 42 75 =
69&nbsp; |....Hostboot Bui|<br>00000770:&nbsp; 6c 64 20 49 44 3a 20 00&nbsp=
; 55 44 00 34 01 04 01 00&nbsp; |ld ID: .UD.4....|<br>00000780:&nbsp; 07 5f=
 1d f4 30 30 55 4c&nbsp; 38 36 36 a0 00 00 00 01&nbsp; |.=5F..00UL866.....|=
<br>00000790:&nbsp; 00 01 71 37 00 00 0b ac&nbsp; 54 02 59 41 31 39 33 32&n=
bsp; |..q7....T.YA1932|<br>000007a0:&nbsp; 38 30 30 31 35 35 00 01&nbsp; 5e=
 20 00 00 00 00 00 01&nbsp; |800155..^ ......|<br>000007b0:&nbsp; 00 04 46 =
54 e5 27 a0 9f&nbsp; 00 00 08 f1 00 00 00 00&nbsp; |..FT.'..........|<br>00=
0007c0:&nbsp; 00 00 00 20 00 00 00 05&nbsp; 22 60 08 71 00 00 00 01&nbsp; |=
... ...."`.q....|<br>000007d0:&nbsp; 00 04 46 54 d9 28 5e f6&nbsp; 00 00 09=
 47 00 00 00 00&nbsp; |..FT.(^....G....|<br>000007e0:&nbsp; 00 00 00 20 00 =
00 00 17&nbsp; 28 90 a5 e7 00 00 00 01&nbsp; |... ....(.......|</span></div>
<div>&nbsp;</div></div>
<div dir=3D"ltr" >&nbsp;
<div><br>Chris Austen<br>POWER Systems Enablement Manager<br>(512) 286-5184=
 (T/L: 363-5184)</div></div></div><BR>
