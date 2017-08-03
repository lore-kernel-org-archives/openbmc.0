Return-Path: <benh@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xNKCJ19qDzDqjD
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 15:59:55 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v735xbvH143499
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 01:59:53 -0400
Received: from e23smtp05.au.ibm.com (e23smtp05.au.ibm.com [202.81.31.147])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c3x4v0496-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 03 Aug 2017 01:59:53 -0400
Received: from localhost
 by e23smtp05.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Thu, 3 Aug 2017 15:59:51 +1000
Received: from d23relay09.au.ibm.com (202.81.31.228)
 by e23smtp05.au.ibm.com (202.81.31.211) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 15:59:50 +1000
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v735xoC633292388
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 15:59:50 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v735xnj2031717
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 15:59:49 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v735xn9I031711; Thu, 3 Aug 2017 15:59:49 +1000
Received: from pasglop (unknown [9.192.176.176])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 140EDA0098;
 Thu,  3 Aug 2017 15:59:49 +1000 (AEST)
Subject: Re: OpenBMC Image Management
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Patrick Williams <patrick@stwcx.xyz>
Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>, Maxim Sloyko
 <maxims@google.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 03 Aug 2017 15:59:48 +1000
In-Reply-To: <20170803055546.A99FA112040@b01ledav004.gho.pok.ibm.com>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <CAFR_W8pDQxg9sGmOVOhfJUAo1MqO0LOALrm9uuUDU2Dp836Y8g@mail.gmail.com>
 <9DAA22C7-7A31-47F1-8F14-B0227892DA57@linux.vnet.ibm.com>
 <1501719295.2664.14.camel@au1.ibm.com>
 <20170803055546.A99FA112040@b01ledav004.gho.pok.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.4 (3.24.4-1.fc26) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17080305-0016-0000-0000-0000025F6B1F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080305-0017-0000-0000-000006E0EA88
Message-Id: <1501739988.2664.33.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-03_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030091
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
X-List-Received-Date: Thu, 03 Aug 2017 05:59:56 -0000

On Thu, 2017-08-03 at 00:55 -0500, Patrick Williams wrote:
> But ok, I'll bite.  There are two main reasons we went this path:
> 
>     *  UBIFS is, to the best of my knowledge, a better file system than
>        JFFS2 in pretty much every metric.
> 
>     *  Dynamic volumes are easier to deal with than static volumes,
>        which Adriana spelled out above.
> 
> Is your real question why do we have a file system instead of a raw FFS
> image? 

No that wasn't my real question. I was just wondering why ubifs
compared to jffs2, I was under the impression that ubifs was designed
for large NAND flashes.

I might be wrong, mind you, but I remember reading that it had
significant overhead for a small flash.

Cheers,
Ben.
