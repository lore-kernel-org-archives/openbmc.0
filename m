Return-Path: <prvs=0631e934e4=stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=prvs=0631e934e4=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Fdvf1DzjzF271
 for <openbmc@lists.ozlabs.org>; Tue,  3 Apr 2018 16:09:01 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3364Psn101024
 for <openbmc@lists.ozlabs.org>; Tue, 3 Apr 2018 02:08:59 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2h3x9ak55s-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Apr 2018 02:08:59 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Tue, 3 Apr 2018 02:08:54 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 3 Apr 2018 02:08:50 -0400
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3368nsv47579210; Tue, 3 Apr 2018 06:08:49 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96C08AE034;
 Tue,  3 Apr 2018 02:10:29 -0400 (EDT)
Received: from birb.localdomain (unknown [9.81.197.236])
 by b01ledav005.gho.pok.ibm.com (Postfix) with SMTP id E1755AE03C;
 Tue,  3 Apr 2018 02:10:27 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 764AB4EC648; Tue,  3 Apr 2018 16:08:42 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Rob Lippert <rlippert@google.com>
Cc: "Tanous\, Ed" <ed.tanous@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Venture <venture@google.com>,
 "Mohit Gupta \(QDT\)" <guptam@qti.qualcomm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Exposing POST codes
In-Reply-To: <CAFRv3wxYm5D_o9XJ5z=FEq_aC39Y2VgV=+L5eTfAHfFrYRPxMg@mail.gmail.com>
References: <CAO=notzv-4wn7J+uAzPYw1uWzTiN5jOGqHNEDUAzAGS+j5wivQ@mail.gmail.com>
 <DEC5C953-385A-4118-AEC5-D2BFDEA29469@fuzziesquirrel.com>
 <7E9441B1E5EFFD4681F54958E82169932F669996@ORSMSX114.amr.corp.intel.com>
 <87efkyf1xw.fsf@linux.vnet.ibm.com>
 <CAFRv3ww59TrnRBWAKZu4LEc5V2iaSW03MEZQgQw6Yrymqt9Meg@mail.gmail.com>
 <87y3iwo4i4.fsf@linux.vnet.ibm.com>
 <CAFRv3wxYm5D_o9XJ5z=FEq_aC39Y2VgV=+L5eTfAHfFrYRPxMg@mail.gmail.com>
Date: Tue, 03 Apr 2018 16:08:42 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18040306-0036-0000-0000-000002DAFA45
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008793; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01012371; UDB=6.00515952; IPR=6.00791639; 
 MB=3.00020384; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-03 06:08:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18040306-0037-0000-0000-000043D957E1
Message-Id: <878ta495zp.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-04-03_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804030065
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
X-List-Received-Date: Tue, 03 Apr 2018 06:09:02 -0000

Rob Lippert <rlippert@google.com> writes:
> On Mon, Mar 12, 2018 at 11:48 PM, Stewart Smith <stewart@linux.vnet.ibm.com>
> wrote:
>
>> Rob Lippert <rlippert@google.com> writes:
>> > I implemented port 80h POST codes for POWER9 hostboot a while back:
>> > https://github.com/open-power/hostboot/blob/
>> c93bef31ae6ce781f9e0a11bb9224b6728ff120f/src/usr/
>> initservice/istepdispatcher/istepdispatcher.C#L2312
>> >
>> > On Zaius machines we are using that support with Patrick's snoop daemon
>> and
>> > a separate daemon that receives the code via dbus and outputs it over the
>> > front 7seg debug display.
>> > It has proven useful for getting early error/debug reports from
>> technicians
>> > at scale e.g. "5 machines stopped at code 35h, 2 at 72h" provides a quick
>> > overview of what the problems are for me to debug further (since I have
>> the
>> > decoder ring, and the istep names would be useless to them anyways).
>>
>> Neat!
>>
>> Anything we should add to skiboot or petitboot environment for this? Or
>> do we not fail in IPL enough to warrant it?
>>
>
> I've never seen a hang in skiboot/petitboot yet so haven't done the work
> there to add POST codes yet...

We'll have to try harder :)

I manage to get us to die in plenty of ways, so maybe you're just lucky
enough to not pick things up when that's the case.

-- 
Stewart Smith
OPAL Architect, IBM.
