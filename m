Return-Path: <benh@au1.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xN9ZV5MpWzDr2Q
 for <openbmc@lists.ozlabs.org>; Thu,  3 Aug 2017 10:16:02 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v730E3rt011625
 for <openbmc@lists.ozlabs.org>; Wed, 2 Aug 2017 20:15:59 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2c3r5a20a9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 02 Aug 2017 20:15:59 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <benh@au1.ibm.com>;
 Thu, 3 Aug 2017 10:15:56 +1000
Received: from d23relay06.au.ibm.com (202.81.31.225)
 by e23smtp08.au.ibm.com (202.81.31.205) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Thu, 3 Aug 2017 10:15:54 +1000
Received: from d23av05.au.ibm.com (d23av05.au.ibm.com [9.190.234.119])
 by d23relay06.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v730Fk2h15269906
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 10:15:54 +1000
Received: from d23av05.au.ibm.com (localhost [127.0.0.1])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v730FL0k009530
 for <openbmc@lists.ozlabs.org>; Thu, 3 Aug 2017 10:15:22 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av05.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v730FLUW008821; Thu, 3 Aug 2017 10:15:21 +1000
Received: from pasglop (unknown [9.192.176.176])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 47C1FA01E5;
 Thu,  3 Aug 2017 10:14:57 +1000 (AEST)
Subject: Re: OpenBMC Image Management
From: Benjamin Herrenschmidt <benh@au1.ibm.com>
Reply-To: benh@au1.ibm.com
To: Adriana Kobylak <anoo@linux.vnet.ibm.com>, Maxim Sloyko <maxims@google.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Thu, 03 Aug 2017 10:14:55 +1000
In-Reply-To: <9DAA22C7-7A31-47F1-8F14-B0227892DA57@linux.vnet.ibm.com>
References: <75C63AB7-E340-4A78-BA82-80F96EAEA051@linux.vnet.ibm.com>
 <CAFR_W8pDQxg9sGmOVOhfJUAo1MqO0LOALrm9uuUDU2Dp836Y8g@mail.gmail.com>
 <9DAA22C7-7A31-47F1-8F14-B0227892DA57@linux.vnet.ibm.com>
Organization: IBM Australia
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.4 (3.24.4-1.fc26) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17080300-0048-0000-0000-0000025775ED
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080300-0049-0000-0000-0000480A3E34
Message-Id: <1501719295.2664.14.camel@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-02_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708030002
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
X-List-Received-Date: Thu, 03 Aug 2017 00:16:03 -0000

On Wed, 2017-08-02 at 12:15 -0500, Adriana Kobylak wrote:
> General:
> * Move to UBI volume management (on the BMC and PNOR chips), which
> provides dynamic partitioning and wear-leveling. In a limited flash
> space environment there might be the need to re-allocate partition
> space and resizing in a static partitioning implementation can be
> very painful.
> * Use CRAMFS for read-only partitions, and UBIFS for read-write
> partitions.

I still don't understand what is the point of using UBI on a 32M or 64M
NOR flash. Other than wasting space and time.

Ben.
