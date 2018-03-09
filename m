Return-Path: <miltonm@us.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=us.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=miltonm@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=us.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zykRM2dKJzF1vn
 for <openbmc@lists.ozlabs.org>; Sat, 10 Mar 2018 10:41:15 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w29NcqQW115219
 for <openbmc@lists.ozlabs.org>; Fri, 9 Mar 2018 18:41:13 -0500
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [158.85.210.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gkyv8gn0k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Mar 2018 18:41:12 -0500
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Fri, 9 Mar 2018 23:41:12 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.48) with
 smtp.notes.na.collabserv.com ESMTP; Fri, 9 Mar 2018 23:41:00 -0000
Received: from us1b3-mail79.a3dr.sjc01.isc4sb.com ([10.122.105.126])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2018030923405969-917346 ;
 Fri, 9 Mar 2018 23:40:59 +0000 
In-Reply-To: <20180307221124.GD10438@amd>
Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings: Add a
 document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Pavel Machek <pavel@ucw.cz>
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, linux-hwmon@vger.kernel.org,
 andrew@lunn.ch, jdelvare@suse.com, arnd@arndb.de,
 linux-doc@vger.kernel.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux@roeck-us.net,
 linux-arm-kernel@lists.infradead.org
Date: Fri, 9 Mar 2018 23:41:00 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <20180307221124.GD10438@amd>,
 <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-3-jae.hyun.yoo@linux.intel.com>
 <20180306124002.GA13950@amd>
 <33bf6563-b220-7ff9-8b04-84e9bd781b3f@linux.intel.com>
X-Mailer: IBM iNotes ($HaikuForm 1010) | IBM Domino Build
 SCN1805107_20180220T0755_FP2 March 05, 2018 at 08:20
X-LLNOutbound: False
X-Disclaimed: 47211
X-TNEFEvaluated: 1
X-LLNXfer: False
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 18030923-3721-0000-0000-000002A5D22F
X-IBM-SpamModules-Scores: BY=0.037583; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.391525; ST=0; TS=0; UL=0; ISC=; MB=0.198820
X-IBM-SpamModules-Versions: BY=3.00008643; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01000735; UDB=6.00509053; IPR=6.00780065; 
 BA=6.00005858; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019947; XFM=3.00000015;
 UTC=2018-03-09 23:41:09
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2018-03-09 19:50:14 - 6.00008166
x-cbparentid: 18030923-3722-0000-0000-0000B0C9D624
Message-Id: <OF08D8261E.8F72E5DC-ON0025824B.008218BB-0025824B.008218C6@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-09_11:, , signatures=0
X-Proofpoint-Spam-Reason: safe
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Mar 2018 23:41:19 -0000

About  03/07/2018 04:12PM in some time zone, Pavel Machek wrote:
>Subject: Re: [PATCH v2 2/8] [PATCH 2/8] Documentations: dt-bindings:
>Add a document of PECI adapter driver for Aspeed AST24xx/25xx SoCs
>
>Hi!
>
>> >Are these SoCs x86-based?
>>=20
>> Yes, these are ARM SoCs. Please see Andrew's answer as well.
>
>Understood, thanks.
>
>> >>+	Read sampling point selection. The whole period of a bit time
>will be
>> >>+	divided into 16 time frames. This value will determine which
>time frame
>> >>+	this controller will sample PECI signal for data read back.
>Usually in
>> >>+	the middle of a bit time is the best.
>> >
>> >English? "This value will determine when this controller"?
>> >
>>=20
>> Could I change it like below?:
>>=20
>> "This value will determine in which time frame this controller
>samples PECI
>> signal for data read back"
>
>I guess... I'm not native speaker, I guess this could be improved
>some
>more.
>

I agree this wording is still confusing.=20

The problem is that the key subject, the time of the sampling, is in the de=
scriptive clause "in which time frame".

"This value will determine the time frame in which the controller will samp=
le"

or perhaps phrase it as saving a specific sample from the over-clock, or a =
phase of the clock.

>Best regards,
>									Pavel
>
>--=20
>(english) http://www.livejournal.com/~pavelmachek
>(cesky, pictures)
>http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
>

milton
--
Speaking for myself not IBM.
