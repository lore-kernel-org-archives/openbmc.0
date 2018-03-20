Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405GpR23PvzF1b3
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 02:20:30 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2KFJpaJ139954
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 11:20:27 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gu40btw26-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 20 Mar 2018 11:20:22 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 20 Mar 2018 11:20:13 -0400
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 20 Mar 2018 11:20:11 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2KFKBh855771212; Tue, 20 Mar 2018 15:20:11 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5B652803F;
 Tue, 20 Mar 2018 11:19:34 -0400 (EDT)
Received: from birb.localdomain (unknown [9.85.145.175])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 745FB28050;
 Tue, 20 Mar 2018 11:19:34 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 72C174EC697; Tue, 20 Mar 2018 08:20:08 -0700 (PDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Kun Yi <kunyi@google.com>, Emily Shaffer <emilyshaffer@google.com>
Cc: tomjose@linux.vnet.ibm.com, vernon.mauery@linux.intel.com,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, bradleyb@us.ibm.com
Subject: Re: IPMI SOL performance
In-Reply-To: <CAGMNF6XP7Pq4A=cxPps9K7OYHEnFE2Ge2u-7nOpng5kwzZWMhQ@mail.gmail.com>
References: <f34018a7-be64-9a2b-befd-632747234fd0@linux.vnet.ibm.com>
 <eb3ad4a5-d261-adaa-1782-b7cf77fc7267@linux.vnet.ibm.com>
 <CAJoAoZnqH=C6Nd-XLtZE=4+AcfFQg53B0GYeTWM_03KJCQEo1w@mail.gmail.com>
 <87y3iokp44.fsf@linux.vnet.ibm.com>
 <CAJoAoZko_Y3iJp07VBJ72E+OEq8TwXXnO5XxuqEnTPw2=EqGJw@mail.gmail.com>
 <1c20052d-f274-f821-4a68-591517f62537@linux.vnet.ibm.com>
 <CAJoAoZ=g9p75Y32NeVbhL8CamLbkAinqW9sDa+PVO_3f0DdfBw@mail.gmail.com>
 <CAGMNF6XP7Pq4A=cxPps9K7OYHEnFE2Ge2u-7nOpng5kwzZWMhQ@mail.gmail.com>
Date: Tue, 20 Mar 2018 08:20:08 -0700
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18032015-0024-0000-0000-000003396738
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008709; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01005842; UDB=6.00512101; IPR=6.00785125; 
 MB=3.00020146; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-20 15:20:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032015-0025-0000-0000-000047633188
Message-Id: <87vadqlqon.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-20_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803200177
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
X-List-Received-Date: Tue, 20 Mar 2018 15:20:31 -0000

Kun Yi <kunyi@google.com> writes:
> SOL performance issue aside, there is also an IPMI command for selecting
> the boot device. Is that command currently supported in the client in any
> way? That might be a more reliable solution than relying on console
> alone.

There is, and any reasonable automation kit is going to do that, except
for when it's something like my firmware test suite that executes a
bunch of commands in the petitboot shell environment, for which there's
no way to set "exit to shell" via IPMI, so we just use expect on the
console. We've worked around this in op-test by just using the ssh
console instead (and try not to pump too much data through it too
quickly so we don't hit the bug where we lose console output).

It'd be nice to be able to run the test suite over IPMI though, if only
for completeness.

-- 
Stewart Smith
OPAL Architect, IBM.
