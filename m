Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zVv4K26jnzDqkr
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jan 2018 15:47:12 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w0U4hg1T025594
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 23:47:10 -0500
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ftdcc0w70-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jan 2018 23:47:10 -0500
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Mon, 29 Jan 2018 21:47:09 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 29 Jan 2018 21:47:08 -0700
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w0U4l7L711469102; Mon, 29 Jan 2018 21:47:07 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DEA5BE03A;
 Mon, 29 Jan 2018 21:47:07 -0700 (MST)
Received: from birb.localdomain (unknown [9.81.201.128])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP id 9EF2CBE039;
 Mon, 29 Jan 2018 21:47:06 -0700 (MST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 8DD694F0DAB; Tue, 30 Jan 2018 15:47:02 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Andrew Jeffery <andrew@aj.id.au>, Alexander Amelkin <a.amelkin@yadro.com>, 
 openbmc@lists.ozlabs.org
Subject: Re: BMC Image Signing Proposal
In-Reply-To: <1517207425.21006.27.camel@aj.id.au>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au>
Date: Tue, 30 Jan 2018 15:47:02 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18013004-0012-0000-0000-000015ABF716
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008451; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000248; SDB=6.00982358; UDB=6.00498114; IPR=6.00761640; 
 BA=6.00005799; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00019279; XFM=3.00000015;
 UTC=2018-01-30 04:47:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18013004-0013-0000-0000-0000514602C8
Message-Id: <87shaoymux.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-01-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1801300060
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.25
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Jan 2018 04:47:13 -0000

Andrew Jeffery <andrew@aj.id.au> writes:
> On Fri, 2018-01-26 at 14:07 +0300, Alexander Amelkin wrote:
>> Hi, Anoo!
>> 
>> The thoughts are as follows:
>> 
>> 1. BMC usually runs in a secured environment where probability of 
>> tampering with flash IC contents by means other than BMC's firmware 
>> itself is negligible.
>
> This does bring up the issue of developing a threat model to develop
> against; we should probably do that. However, without one, I feel like
> we should design *for* defense in depth and allow people to remove
> protections as they see fit for their environment, rather than make
> potentially compromising assumptions about what that environment is at
> the outset.
>
> For instance, whilst BMCs might typically be isolated from customer
> traffic on a separate LAN, there's still the in-band interface which
> can be used to poke at the BMC. Vulnerabilities in the IPMI stack could
> lead to BMC compromise and undesirable flash writes*. Therefore BMC
> flash integrity remains a valid concern despite network isolation.
>
> * This ties into Michael Brown's talks of isolating daemons to their
> own user/group and enforcing SELinux policy against them.

using isolation technologies that are used by containers may also add
extra depth, and be a good interim solution as SELinux policy is
developed and tuned.

>> 2. U-Boot already performs image checksum validation before booting a 
>> FIT image
>
> Typically the rootfs is not part of the FIT, so it will not be checked.
>     Some systems supported by OpenBMC directly mount the rootfs rather
> than booting through an initrd, which makes rootfs authentication
> somewhat tricky. Regardless, with signed images we should expand the
> FIT hash check to be a full signature check.

dm-verity would solve that (for a ro rootfs). The read/write parts will
have to be carefully controlled of course, noexec is an obvious
thing. Oh, and not having configuration as executable code and being
*paranoid* about parsing config.

-- 
Stewart Smith
OPAL Architect, IBM.
