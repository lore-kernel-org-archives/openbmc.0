Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40lpN93QFFzF27x
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 06:00:56 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4FJx8Rq095955
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 16:00:52 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2j04wa3hk9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 15 May 2018 16:00:51 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Tue, 15 May 2018 14:00:50 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 15 May 2018 14:00:48 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4FK0itO12517808; Tue, 15 May 2018 13:00:47 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EAB313603C;
 Tue, 15 May 2018 14:00:47 -0600 (MDT)
Received: from birb.localdomain (unknown [9.41.172.201])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 78038136043;
 Tue, 15 May 2018 14:00:47 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id B0DF84EC649; Tue, 15 May 2018 15:00:45 -0500 (CDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Lei YU <mine260309@gmail.com>, Adriana Kobylak <anoo@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: BMC Image Signing Proposal
In-Reply-To: <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
References: <70e1d00f2f9abaea58ff3710d4fbcbff@linux.vnet.ibm.com>
 <7857d6b0-5c9b-63c1-4216-a737513a3f5a@yadro.com>
 <1517207425.21006.27.camel@aj.id.au> <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <874lm8pjd7.fsf@linux.vnet.ibm.com>
 <e1431b039c817b23b49b6f5833760152@linux.vnet.ibm.com>
 <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
Date: Tue, 15 May 2018 15:00:45 -0500
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18051520-0020-0000-0000-00000DF04E44
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009030; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000260; SDB=6.01032792; UDB=6.00528030; IPR=6.00811924; 
 MB=3.00021131; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-15 20:00:49
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051520-0021-0000-0000-00006163CDE5
Message-Id: <871seczo2a.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-15_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805150196
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
X-List-Received-Date: Tue, 15 May 2018 20:00:58 -0000

Lei YU <mine260309@gmail.com> writes:
> I'd like to bring this topic again.
>
> As I know image signing feature is completed for both BMC and PNOR:
> https://github.com/openbmc/phosphor-bmc-code-mgmt
> https://github.com/openbmc/openpower-pnor-code-mgmt
>
> However, the above repos are only for systems with UBI-FS feature.
> Most of machines are still using the "legacy" obmc flash layout, and thus
> they do not have image singing feature.
>
> So I would like to ask for ideas about how to support image signing feature
> for machines with "legacy" flash layout?
> 1. Should we use UBI-FS for machines that requires image signing feature?
> 2. Or should we implement image signing feature on "legacy" flash layout as
> well?

Either option is valid. I think we should get it gonig for non-UBI-FS
systems though, and we should do that through the host

-- 
Stewart Smith
OPAL Architect, IBM.
