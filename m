Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sqqz46ZzLzDrL1
 for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2016 11:24:48 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 u970OMNO067355
 for <openbmc@lists.ozlabs.org>; Thu, 6 Oct 2016 20:24:46 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 25wu5jyedg-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2016 20:24:46 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 6 Oct 2016 18:24:45 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 6 Oct 2016 18:24:44 -0600
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: miltonm@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 43B5F1FF0025
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 18:24:24 -0600 (MDT)
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u970Oh3p14287186
 for <openbmc@lists.ozlabs.org>; Thu, 6 Oct 2016 17:24:43 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 696306A03C
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 18:24:43 -0600 (MDT)
Received: from d50lp33.co.us.ibm.com (unknown [9.17.249.38])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS id 541806A03B
 for <openbmc@lists.ozlabs.org>; Thu,  6 Oct 2016 18:24:43 -0600 (MDT)
Received: from localhost
 by d50lp33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 6 Oct 2016 18:24:43 -0600
Received: from smtp.notes.na.collabserv.com (192.155.248.81)
 by d50lp33.co.us.ibm.com (192.168.2.144) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128/128)
 Thu, 6 Oct 2016 18:24:41 -0600
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 7 Oct 2016 00:24:40 -0000
Received: from us1a3-smtp04.a3.dal06.isc4sb.com (10.106.154.237)
 by smtp.notes.na.collabserv.com (10.106.227.88) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 7 Oct 2016 00:24:38 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp04.a3.dal06.isc4sb.com
 with ESMTP id 2016100700243800-503608 ;
 Fri, 7 Oct 2016 00:24:38 +0000 
In-Reply-To: <CACPK8XdPfy7jN6ejsN=w_4wejy2zxBpwb8M3+b0GoLaW=0cKMw@mail.gmail.com>
Subject: Re: I2C device driver names
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Fri, 7 Oct 2016 00:24:38 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CACPK8XdPfy7jN6ejsN=w_4wejy2zxBpwb8M3+b0GoLaW=0cKMw@mail.gmail.com>,
 <b659d152-5481-193e-ce1b-520d3de7d2ba@linux.vnet.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 835.3) | IBM Domino Build
 V851SAAS_09122016_FP8 October 03, 2016
X-LLNOutbound: False
X-Disclaimed: 48227
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 16100700-0016-0000-0000-000004DCDD42
X-IBM-ISS-SpamDetectors: Score=0.410169; BY=0.280102; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410169; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00005865; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000186; SDB=6.00765244; UDB=6.00365632; UTC=2016-10-07
 00:24:39
x-cbparentid: 16100700-7094-0000-0000-000001D3508B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005865; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000186; SDB=6.00765244; UDB=6.00365632; IPR=6.00541097; 
 BA=6.00004791; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012898; XFM=3.00000011;
 UTC=2016-10-07 00:24:44
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF26A8D55C.BC71B175-ON00258045.000161A7-00258045.00024159@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-10-06_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=1
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
 definitions=main-1610070005
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
X-List-Received-Date: Fri, 07 Oct 2016 00:24:49 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><br>On 10/06/2016 about 06:43PM somewhere, Joel Stanley &lt;<a href=
=3D"mailto:joel@jms.id.au" target=3D"=5Fblank">joel@jms.id.au</a>&gt; wrote=
:<br>&gt;<br>&gt;On Fri, Oct 7, 2016 at 7:14 AM, Matt Spinler<br>&gt;&lt;<a=
 href=3D"mailto:mspinler@linux.vnet.ibm.com" target=3D"=5Fblank">mspinler@l=
inux.vnet.ibm.com</a>&gt; wrote:<br>&gt;&gt; Hi,<br>&gt;&gt;<br>&gt;&gt; As=
 part of my work to generate a device tree from the machine<br>&gt;readable=
<br>&gt;&gt; workbook XML, I need to create I2C device entries, which have =
the<br>&gt;compatible<br>&gt;&gt; properties that need to be filled in.<br>=
&gt;&gt;<br>&gt;&gt; The following parts are present in the system I'm tryi=
ng to build,<br>&gt;with<br>&gt;&gt; firmware requirements to access them. =
 I took a stab at the names.<br>&gt;Could<br>&gt;&gt; someone doublecheck t=
hem and maybe comment on if a driver is<br>&gt;missing, or<br>&gt;&gt; mayb=
e if some upcoming work is known that will include it?  I<br>&gt;didn't hav=
e<br>&gt;&gt; much luck finding a lot of these in the<br>&gt;Documentation/=
devicetree/bindings<br>&gt;&gt; directories.<br><br>Unique to the i2c subsy=
stem, i2c devices will also match when <br>the vendor is different but the =
chip name portion matches.<br><br>&gt;<br>&gt;If they're not in the kernel =
tree it could mean there is not a driver<br>&gt;for them, or that they are =
supported as part of the trivial device<br>&gt;bindings.<br>&gt;<br>&gt;&gt=
;<br>&gt;&gt; PMBus Power supplies:   ?<br>&gt;&gt;<br>&gt;&gt; MAX31785 fa=
n controller:  max,max31785<br><br>Maxim for the vendor? see <br>Documentat=
ion/devicetree/bindings/vendor-prefixes.txt<br><br>&gt;<br>&gt;Doesn't appe=
ar to be an upstream driver. Please open a ticket.<br>&gt;<br>&gt;&gt;<br>&=
gt;&gt; BMP280:  bosch,bmp280<br>&gt;<br>&gt;Supported by the iio bmp280 dr=
iver.<br>&gt;<br>&gt;&gt;<br>&gt;&gt; TMP4523A temp sensor:  ti,tmp423<br>&=
gt;<br>&gt;Supported by the tmp421 hwmon driver.<br>&gt;<br>&gt;&gt;<br>&gt=
;&gt; TMP275 temp sensor: ti,tmp275<br>&gt;<br>&gt;Documentation/devicetree=
/bindings/i2c/trivial-devices.txt<br>&gt;<br>&gt;Supported by the lm75 hwmo=
n driver.<br>&gt;<br>&gt;&gt; pca9552 IO expander:  nxp,pca9552<br>&gt;<br>=
&gt;This appears to be a LED driver?<br>&gt;<br>&gt;There's a LED device dr=
iver called leds-pca955x.<br><br>There is also a gpio driver for pca955[456=
7] in pca953x.c.<br><br>&gt;<br>&gt;&gt;<br>&gt;&gt; UCD90160 power sequenc=
er: ti,ucd90160<br>&gt;<br>&gt;A kernel driver called ucd9000 appears to su=
pport similar chips.<br>&gt;Please open a ticket.<br>&gt;<br>&gt;&gt;<br>&g=
t;&gt; RX8900CE RTC:  epson,rx8900ce<br>&gt;<br>&gt;No upstream driver. Ple=
ase open a ticket.<br>&gt;<br>&gt;&gt;<br>&gt;&gt; 24c64 EEPROM:  atmel,24c=
64<br>&gt;<br>&gt;LGTM.<br>&gt;<br>&gt;Cheers,<br>&gt;<br>&gt;Joel<br>&gt;<=
br>&gt;&gt;<br>&gt;&gt; There are also a handful of regulators, but so far =
I haven't heard<br>&gt;of any<br>&gt;&gt; requirements to access them.<br>&=
gt;&gt;<br>&gt;&gt; Thanks.<br><br><br></font><BR>
