Return-Path: <gwshan@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rhzPz35kTzDqnK
 for <openbmc@lists.ozlabs.org>; Sun,  3 Jul 2016 15:35:34 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
 u635Xdk5027774
 for <openbmc@lists.ozlabs.org>; Sun, 3 Jul 2016 01:35:31 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0b-001b2d01.pphosted.com with ESMTP id 23x77vt26y-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Sun, 03 Jul 2016 01:35:30 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gwshan@linux.vnet.ibm.com>;
 Sun, 3 Jul 2016 15:35:28 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
 by e23smtp06.au.ibm.com (202.81.31.212) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Sun, 3 Jul 2016 15:35:25 +1000
X-IBM-Helo: d23dlp02.au.ibm.com
X-IBM-MailFrom: gwshan@linux.vnet.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
 by d23dlp02.au.ibm.com (Postfix) with ESMTP id 1B3862BB0057
 for <openbmc@lists.ozlabs.org>; Sun,  3 Jul 2016 15:35:25 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u635ZPRl3080518
 for <openbmc@lists.ozlabs.org>; Sun, 3 Jul 2016 15:35:25 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u635ZOZe029246
 for <openbmc@lists.ozlabs.org>; Sun, 3 Jul 2016 15:35:24 +1000
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u635ZOc2029243; Sun, 3 Jul 2016 15:35:24 +1000
Received: from bran.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 by ozlabs.au.ibm.com (Postfix) with ESMTP id 2921AA00AB;
 Sun,  3 Jul 2016 15:35:24 +1000 (AEST)
Received: from gwshan (shangw.ozlabs.ibm.com [10.61.2.199])
 by bran.ozlabs.ibm.com (Postfix) with ESMTP id 1B48AE3B49;
 Sun,  3 Jul 2016 15:35:24 +1000 (AEST)
Received: by gwshan (Postfix, from userid 1000)
 id 14821942D17; Sun,  3 Jul 2016 15:35:24 +1000 (AEST)
Date: Sun, 3 Jul 2016 15:35:24 +1000
From: Gavin Shan <gwshan@linux.vnet.ibm.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Gavin Shan <gwshan@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 07/10] net/farady: Read MAC address from chip
Reply-To: Gavin Shan <gwshan@linux.vnet.ibm.com>
References: <1467282471-16560-1-git-send-email-gwshan@linux.vnet.ibm.com>
 <1467282471-16560-8-git-send-email-gwshan@linux.vnet.ibm.com>
 <CACPK8XemtUzUMZXFjZSe9aQixcgiQnZimxMA7aMrts-1Yoya1Q@mail.gmail.com>
 <1467372307.7422.40.camel@kernel.crashing.org>
 <CACPK8XdAiDW=PADte4ZWNumKYXCkK-8kcw0atOUQATORsRQEGA@mail.gmail.com>
 <CACPK8Xc1adhXOtmtNHYzbivqzxVABxfG2L6CPsNEMWkbV0KCwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xc1adhXOtmtNHYzbivqzxVABxfG2L6CPsNEMWkbV0KCwA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16070305-0040-0000-0000-000001BC60B4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16070305-0041-0000-0000-00000A00F21A
Message-Id: <20160703053523.GA9530@gwshan>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2016-07-03_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
 definitions=main-1607030062
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Jul 2016 05:35:35 -0000

On Fri, Jul 01, 2016 at 09:47:58PM +0930, Joel Stanley wrote:
>On 1 Jul 2016 20:55, "Benjamin Herrenschmidt" <benh@kernel.crashing.org>
>wrote:
>>
>> On Thu, 2016-06-30 at 23:35 +0930, Joel Stanley wrote:
>> > On Thu, Jun 30, 2016 at 7:57 PM, Gavin Shan  wrote:
>> > > The device is assigned with random MAC address. It isn't reasonable.
>> > > An valid MAC address might have been in the chip. It's reasonable
>> > > to use it to maintain consistency.
>> > >
>> > > This uses the MAC address in the chip if it's valid. Otherwise, a
>> > > random MAC address is given as before.
>>
>> If that is a worry we could use a device-tree property. Does our
>> uboot update the DT ? If yes it can set the local-mac-address prop.
>
>It doesn't currently, but we will be adding that soon we need to update the
>memory node for systems where board revisions change the DRAM size.
>

In the revision I sent to community just now, the MAC address is picked from
device-tree if there is a valid one. Otherwise, the one in the chip is checked.
random MAC address will be used if both are invalid. In this way, the kernel
compatible whatever uboot changes we will have.

Thanks,
Gavin
