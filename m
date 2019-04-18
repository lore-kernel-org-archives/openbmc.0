Return-Path: <miltonm@us.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44lYxv5JYHzDq5n
 for <openbmc@lists.ozlabs.org>; Fri, 19 Apr 2019 08:41:55 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3IMQGIM054360
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 18:41:53 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.73])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ry0wjb6aq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 18 Apr 2019 18:41:52 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Thu, 18 Apr 2019 22:41:52 -0000
Received: from us1a3-smtp02.a3.dal06.isc4sb.com (10.106.154.159)
 by smtp.notes.na.collabserv.com (10.106.227.90) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 18 Apr 2019 22:41:47 -0000
Received: from us1a3-mail228.a3.dal06.isc4sb.com ([10.146.103.71])
 by us1a3-smtp02.a3.dal06.isc4sb.com
 with ESMTP id 2019041822414673-1008357 ;
 Thu, 18 Apr 2019 22:41:46 +0000 
In-Reply-To: <20190417133941.22962-1-clg@kaod.org>
Subject: Re: [PATCH dev-5.0 0/4] spi-nor: aspeed: add support for the 4B
 opcodes
From: "Milton Miller II" <miltonm@us.ibm.com>
To: "=?ISO-8859-1?Q?C=E9dric_Le_Goater?=" <clg@kaod.org>
Cc: openbmc@lists.ozlabs.org, Andrew Jeffery <andrew@aj.id.au>
Date: Thu, 18 Apr 2019 22:41:46 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20190417133941.22962-1-clg@kaod.org>
X-Mailer: IBM iNotes ($HaikuForm 1048) | IBM Domino Build
 SCN1812108_20180501T0841_FP38 April 10, 2019 at 11:56
X-LLNOutbound: False
X-Disclaimed: 41031
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8
x-cbid: 19041822-3107-0000-0000-00000ACE7A66
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.417846; ST=0; TS=0; UL=0; ISC=; MB=0.025429
X-IBM-SpamModules-Versions: BY=3.00010952; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01191041; UDB=6.00624173; IPR=6.00971839; 
 BA=6.00006282; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00026507; XFM=3.00000015;
 UTC=2019-04-18 22:41:50
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2019-04-18 18:23:38 - 6.00009822
x-cbparentid: 19041822-3108-0000-0000-00006622BD68
Message-Id: <OFCF240B5C.80D7E82E-ON002583E0.007C1F22-002583E0.007CAC95@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-18_11:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2019 22:41:56 -0000

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><div>About&nbsp; 04/17/2019 08:55AM in some timezone, C=C3=A9dric Le=
 Goater wrote:</div><br><div><br></div><div>&gt;Here is a little series pro=
viding cleanups on the Aspeed SMC</div>&gt;Controller<br>&gt;driver and add=
ing support for the 4B opcodes which were recently<br>&gt;added<br>&gt;to t=
he Linux kernels 5.0.x.<br>&gt;<br>&gt;The use of the 4B opcodes was breaki=
ng the read of the golden buffer<br>&gt;done at slow speed in the optimizat=
ion read sequence. The code<br>&gt;assumed<br>&gt;that the chip was in 4B a=
ddress mode, as if a EN4B opcode had been<br>&gt;sent, but this is not the =
case anymore with 4B opcodes. The golden<br>&gt;buffer is now read with a S=
PINOR=5FOP=5FREAD=5F4B (0x13) when the chip<br>&gt;supports 4B opcodes.<br>=
&gt;<br>&gt;It should fix accesses to the palmetto PNOR and the Witherspoon=
 BMC<br>&gt;flash modules.<br>&gt;<br>&gt;<br>&gt;*Please test !*<br><div><=
br></div><div><br></div><div>Cedric,</div><div><br></div><div>did you notic=
e that spi=5Fnor=5Fread=5Fsfdp is now calling the nor-&gt;read method?</div=
><div><br></div><div>Since the read method is hard-coding the opcode, this =
means that we are</div><div>returning random flash contents instead of the =
flash parameter block, which</div><div>probably confuses the kernel.</div><=
div><br></div><div>milton</div><div><br></div></font><BR>
