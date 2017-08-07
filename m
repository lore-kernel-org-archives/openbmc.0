Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRBNl3Qz7zDqp7
 for <openbmc@lists.ozlabs.org>; Tue,  8 Aug 2017 08:03:03 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v77Lwgk2105457
 for <openbmc@lists.ozlabs.org>; Mon, 7 Aug 2017 18:03:00 -0400
Received: from smtp.notes.na.collabserv.com (smtp.notes.na.collabserv.com
 [192.155.248.90])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c6t950c68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 07 Aug 2017 18:03:00 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Mon, 7 Aug 2017 22:02:59 -0000
Received: from us1a3-smtp07.a3.dal06.isc4sb.com (10.146.103.14)
 by smtp.notes.na.collabserv.com (10.106.227.141) with
 smtp.notes.na.collabserv.com ESMTP; Mon, 7 Aug 2017 22:02:58 -0000
Received: from us1a3-mail79.a3.dal09.isc4sb.com ([10.142.3.136])
 by us1a3-smtp07.a3.dal06.isc4sb.com
 with ESMTP id 2017080722025750-936992 ;
 Mon, 7 Aug 2017 22:02:57 +0000 
In-Reply-To: <1501739988.2664.33.camel@au1.ibm.com>
Subject: Re: OpenBMC Image Management
From: "Milton Miller II" <miltonm@us.ibm.com>
To: benh@ozlabs.au.ibm.com
Cc: Patrick Williams <patrick@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
Date: Mon, 7 Aug 2017 22:02:57 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <1501739988.2664.33.camel@au1.ibm.com>,
 <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <CAFR_W8pDQxg9sGmOVOhfJUAo1MqO0LOALrm9uuUDU2Dp836Y8g@mail.gmail.com>
 <9DAA22C7-7A31-47F1-8F14-B0227892DA57@linux.vnet.ibm.com>
 <1501719295.2664.14.camel@au1.ibm.com>
 <20170803055546.A99FA112040@b01ledav004.gho.pok.ibm.com>
X-Mailer: IBM iNotes ($HaikuForm 984.1) | IBM Domino Build
 SCN17194_20170713T0023_FP2.1 July 18, 2017 at 09:50
X-LLNOutbound: False
X-Disclaimed: 50731
X-TNEFEvaluated: 1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17080722-9717-0000-0000-000003B79CAC
X-IBM-SpamModules-Scores: BY=0; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0;
 SC=0.40962; ST=0; TS=0; UL=0; ISC=; MB=0.195885
X-IBM-SpamModules-Versions: BY=3.00007503; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00899034; UDB=6.00449956; IPR=6.00679239; 
 BA=6.00005516; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016579; XFM=3.00000015;
 UTC=2017-08-07 22:02:59
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-08-07 16:22:05 - 6.00007144
x-cbparentid: 17080722-9718-0000-0000-000094715E4E
Message-Id: <OF8B7A4403.5F8D0C2D-ON00258175.00786E55-00258175.00791EEE@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-07_13:, , signatures=0
X-Proofpoint-Spam-Reason: safe
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
X-List-Received-Date: Mon, 07 Aug 2017 22:03:04 -0000

On 08/03/2017 around 1:00am in some time zone, Benjamin Herrenschmidt wrote:
>On Thu, 2017-08-03 at 00:55 -0500, Patrick Williams wrote:
>> But ok, I'll bite.  There are two main reasons we went this path:
>>=20
>>     *  UBIFS is, to the best of my knowledge, a better file system
>than
>>        JFFS2 in pretty much every metric.
>>=20
>>     *  Dynamic volumes are easier to deal with than static volumes,
>>        which Adriana spelled out above.
>>=20
>> Is your real question why do we have a file system instead of a raw
>FFS
>> image?=20
>
>No that wasn't my real question. I was just wondering why ubifs
>compared to jffs2, I was under the impression that ubifs was designed
>for large NAND flashes.
>
>I might be wrong, mind you, but I remember reading that it had
>significant overhead for a small flash.


There was some discussion about the OLPC decision to not use UBI on=20
their flash because of space.

UBI requires two write programming units to hold two units of metadata=20
for each erase block.  One block holds the wear leveling counter and is=20
written immediately after erase, and the second holds the assigned volume=20
and logical erase block theirin.  On NAND, each of these are a write=20
program unit and can be upuwards of 256 bytes, and erase units might be=20
a few kbytes.  On NOR, which we are using, these are each assigned a=20
minimum size of 64 bytes.  Also ubi enforces each erase block must=20
be at least 16kB, this means we have to use 64kB sectors not 4kB.

Thus the overhead for ubi is 128 bytes per 65536 bytes, and in return=20
we get volume management and wear leveling across the whole device.

We have to use 64k blocks vs 4k but can share 1 floating block across
all volumes in the device.

I have not analyzed the efficency of jffs2 vs ubifs for storage and=20
journaling.   jffs2 mantains all inodes in ram, it appears that ubifs
presently does but would not be required to.  Both have shutdown fast
mount support and both have some degree of support for compressed file
fragments.

jffs2 only supports synchronous updates to the flash, ubifs has a mount=20
option to do the same but can do async writeback to the flash.  This may=20
expose our applications to needing to add fsync code.

milton
