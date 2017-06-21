Return-Path: <miltonm@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wtFGH0t90zDqj1
 for <openbmc@lists.ozlabs.org>; Thu, 22 Jun 2017 05:32:06 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5LJSdRL034259
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 15:32:04 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b7uxfh8tb-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 15:32:03 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 21 Jun 2017 15:32:02 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 21 Jun 2017 15:32:01 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5LJW1aP62521350
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 19:32:01 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9BD52B205D
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 15:29:34 -0400 (EDT)
Received: from d50lp03.ny.us.ibm.com (unknown [146.89.104.211])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS id 86FF2B2056
 for <openbmc@lists.ozlabs.org>; Wed, 21 Jun 2017 15:29:34 -0400 (EDT)
Received: from localhost
 by d50lp03.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 21 Jun 2017 15:32:01 -0400
Received: from smtp.notes.na.collabserv.com (158.85.210.114)
 by d50lp03.ny.us.ibm.com (158.87.18.22) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128/128)
 Wed, 21 Jun 2017 15:31:58 -0400
Received: from localhost
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <miltonm@us.ibm.com>;
 Wed, 21 Jun 2017 19:31:57 -0000
Received: from us1b3-smtp01.a3dr.sjc01.isc4sb.com (10.122.7.174)
 by smtp.notes.na.collabserv.com (10.122.47.58) with
 smtp.notes.na.collabserv.com ESMTP; Wed, 21 Jun 2017 19:31:55 -0000
Received: from us1b3-mail79.a3dr.sjc01.isc4sb.com ([10.122.105.126])
 by us1b3-smtp01.a3dr.sjc01.isc4sb.com
 with ESMTP id 2017062119315511-786836 ;
 Wed, 21 Jun 2017 19:31:55 +0000 
In-Reply-To: <CALLMt=q8L8UwegNKy+D0uhyqi25sfpUW27FjwBbqmVme1OgP0g@mail.gmail.com>
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Break and set pin states on
 GPIO master remove
From: "Milton Miller II" <miltonm@us.ibm.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 21 Jun 2017 19:31:54 +0000
MIME-Version: 1.0
Sensitivity: 
Importance: Normal
X-Priority: 3 (Normal)
References: <CALLMt=q8L8UwegNKy+D0uhyqi25sfpUW27FjwBbqmVme1OgP0g@mail.gmail.com>,
 <20170606200230.77482-1-cbostic@linux.vnet.ibm.com>
 <1ac7a650-9524-4c50-f449-b5fc89e8d988@ozlabs.org>
 <bdb441e5-5485-9a67-1749-029f684162f9@linux.vnet.ibm.com>
 <2986922.Yi4HN7lb1t@new-mexico>
 <ce283d8e-ba55-9476-8409-e5982a63034f@ozlabs.org>
X-Mailer: IBM iNotes ($HaikuForm 964) | IBM Domino Build
 SCN17157_20170606T0034 June 06, 2017 at 00:34
X-LLNOutbound: False
X-Disclaimed: 50319
X-TNEFEvaluated: 1
X-LLNXfer: False
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
x-cbid: 17062119-0048-0000-0000-000001AE2A1D
X-IBM-SpamModules-Scores: FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; SC=0.399202;
 ST=0; TS=0; UL=0; ISC=; MB=0.220251
X-IBM-SpamModules-Versions: BY=3.00007267; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00877938; UDB=6.00437401; IPR=6.00658078; 
 BA=6.00005434; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015912; XFM=3.00000015;
 UTC=2017-06-21 19:31:57
X-IBM-AV-DETECTION: SAVI=unsuspicious REMOTE=unsuspicious XFE=unused
X-IBM-AV-VERSION: SAVI=2017-06-21 18:33:56 - 6.00006918
x-cbparentid: 17062119-9696-0000-0000-0000D2E8E5EB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007267; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00877937; UDB=6.00437401; IPR=6.00658078; 
 BA=6.00005434; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015912; XFM=3.00000015;
 UTC=2017-06-21 19:32:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
Message-Id: <OF25D89DF3.3352CCD9-ON00258146.006B4AC4-00258146.006B4AC8@notes.na.collabserv.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-21_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706210325
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
X-List-Received-Date: Wed, 21 Jun 2017 19:32:07 -0000

Around 06/21/2017, Andrew Geissler wrote:
>I think we had this same discussion last time Chris put this on the
>mailing list for 4.7 :)   I think we can do better here but we also
>(as usual) have a big time crunch.  Can we agree to put this in for
>now since our main goal is to just get 4.10 merged and of equal (or
>better) function to 4.7?  Chris can create an issue to come up with a
>final solution?  Without this change, cronus via the FSP debug does
>not work, which is a non-starter for picking this release up by IBM
>(and a lot of partners).
>
>I know, in theory, this is easy to fix, but it will require new
>testing, potentially new documentation for our users, and is just
>adding new function when we're mostly looking to just get a stable
>base going.
>
>Andrew
>
>On Thu, Jun 8, 2017 at 5:00 AM, Jeremy Kerr <jk@ozlabs.org> wrote:
>> Hi Alistair & Chris,
>>
>>>> The pins are set here mainly for the benefit of the Cronus debug
>>>> tools.   Its common practice in test and bringup labs to switch
>back and
>>>> forth between BMC and FSP-2 with Cronus to access the host
>processor
>>>> CFAMs over FSI.  Without the remove pin state changes Cronus
>cannot access.
>>>
>>> As far as I know you have to run "systemctl start
>fsi-disable.service"
>>> to switch over to Cronus mode. I think Jeremy's point is that it
>>> should be that service which explicitly sets up the hardware in a
>>> suitable mode rather than relying on side-effects from removing
>the
>>> kernel driver.
>>
>> Yep, spot on.
>>
>> Also, those side-effects might not be how the GPIOs need to
>configured
>> for the next usage of the FSI bus (which could be Cronus, but could
>also
>> be any other tool). So, let those tools handle the init correctly,
>> rather than the kernel making a guess at it.
>>

Actually I think there are well defined "Idle" states and I would expect=20
those to be asserted.

I would expect the gpios to be set such that changing the mux does not=20
glitch the signals to the chip.

Is this the state that is being set in the patch?

milton

[catching up after vacation]
