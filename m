Return-Path: <benh@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tyJtY4fJwzDqN3
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 15:28:36 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
 v0A4OFbG047987
 for <openbmc@lists.ozlabs.org>; Mon, 9 Jan 2017 23:28:33 -0500
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0b-001b2d01.pphosted.com with ESMTP id 27vmewyrxy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 09 Jan 2017 23:28:33 -0500
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Tue, 10 Jan 2017 14:28:30 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Tue, 10 Jan 2017 14:28:27 +1000
Received: from d23relay09.au.ibm.com (d23relay09.au.ibm.com [9.185.63.181])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 3B4602BB0055
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 15:28:27 +1100 (EST)
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0A4SRFp58720394
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 15:28:27 +1100
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v0A4SQW3003749
 for <openbmc@lists.ozlabs.org>; Tue, 10 Jan 2017 15:28:27 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v0A4SQox003746; Tue, 10 Jan 2017 15:28:26 +1100
Received: from pasglop (unknown [9.192.163.4])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9E03CA0120;
 Tue, 10 Jan 2017 15:28:24 +1100 (AEDT)
Subject: Re: [PATCH v2 4/5] drivers/mailbox: Add aspeed ast2400/ast2500 mbox
 driver
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Andrew Jeffery <andrew@aj.id.au>, Cyril Bur <cyrilbur@gmail.com>,
 openbmc@lists.ozlabs.org
Cc: millerjo@linux.vnet.ibm.com
Date: Mon, 09 Jan 2017 22:28:24 -0600
In-Reply-To: <1484002504.12800.1.camel@aj.id.au>
References: <20161222060610.29695-1-cyrilbur@gmail.com>
 <20161222060610.29695-5-cyrilbur@gmail.com>
 <1482460941.3419.26.camel@aj.id.au> <1482479795.14044.5.camel@gmail.com>
 <1483406661.7801.1.camel@aj.id.au> <1483911906.15843.61.camel@au1.ibm.com>
 <1483999740.6236.2.camel@gmail.com> <1484002504.12800.1.camel@aj.id.au>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.3 (3.22.3-1.fc25) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011004-0012-0000-0000-00000201ED9E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011004-0013-0000-0000-000006C86DF7
Message-Id: <1484022504.21117.7.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-10_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701100059
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
X-List-Received-Date: Tue, 10 Jan 2017 04:28:38 -0000

On Tue, 2017-01-10 at 09:25 +1030, Andrew Jeffery wrote:
> I'm in favour of removing the ioctl. So the logic would be:
> 
> 1. If lpos is zero, assume a MBOX_NUM_DATA_REGS-sized write as we do
> currently
> 2. If lpos is non-zero, assume a single byte write
> 
> On that, should we be testing the assumptions about buffer sizes?
> Currently we don't (we use the MBOX_NUM_DATA_REGS rather than count).

I would enforce the lpos is some specific magic value such as 0x1000
for the special write bcs we might want to support partial writes
inside the 16 bytes area...

Cheers,
Ben.
