Return-Path: <anoo@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anoo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40nXrT23MWzDqwW
 for <openbmc@lists.ozlabs.org>; Sat, 19 May 2018 01:57:57 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4IFqJK6144139
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 11:57:55 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2j1yhvq35v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 18 May 2018 11:57:54 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <anoo@linux.ibm.com>;
 Fri, 18 May 2018 11:57:54 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 18 May 2018 11:57:51 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4IFvo1H49086478; Fri, 18 May 2018 15:57:50 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C29B7B2064;
 Fri, 18 May 2018 12:59:45 -0400 (EDT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 023FAB2068;
 Fri, 18 May 2018 12:59:44 -0400 (EDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 18 May 2018 12:59:44 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 18 May 2018 11:01:16 -0500
From: Adriana Kobylak <anoo@linux.ibm.com>
To: Lei YU <mine260309@gmail.com>
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>, Adriana Kobylak
 <anoo@linux.vnet.ibm.com>, Stewart Smith <stewart@linux.vnet.ibm.com>, Yugi
 Mani <yupalani@microsoft.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 openbmc <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Subject: Re: BMC Image Signing Proposal
In-Reply-To: <CAARXrtksFbirzq70cLzvWRcxKxOT9rGYKPMa-+UQcMpvx0=ycw@mail.gmail.com>
References: <1517207425.21006.27.camel@aj.id.au>
 <87shaoymux.fsf@linux.vnet.ibm.com>
 <CACPK8XcLF+hw_gRM76fgJ9tPNZYr3_RiN=euOzw8KLOJ11ibXA@mail.gmail.com>
 <87lggezywe.fsf@linux.vnet.ibm.com>
 <3d38bc878a5b36f9091588d1fb842c1e@linux.vnet.ibm.com>
 <8172868d02b4f54ceaa101ba1c99fa5b@linux.vnet.ibm.com>
 <874lm8pjd7.fsf@linux.vnet.ibm.com>
 <e1431b039c817b23b49b6f5833760152@linux.vnet.ibm.com>
 <CAARXrtn6M=tzE-yMJWN4yaSHZJUYksMT=vMvVymY0kvgQJ4bfQ@mail.gmail.com>
 <MWHPR21MB0864432C6CB8EF9A575589B0D6930@MWHPR21MB0864.namprd21.prod.outlook.com>
 <20180516160209.GB105329@mauery>
 <CAARXrtksFbirzq70cLzvWRcxKxOT9rGYKPMa-+UQcMpvx0=ycw@mail.gmail.com>
X-Sender: anoo@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18051815-0040-0000-0000-0000042D70F5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009047; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000261; SDB=6.01034152; UDB=6.00528843; IPR=6.00813280; 
 MB=3.00021186; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-18 15:57:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051815-0041-0000-0000-000008338850
Message-Id: <435d4ae31bb1d8c4c06ec95cca51b5d2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-18_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805180172
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
X-List-Received-Date: Fri, 18 May 2018 15:58:01 -0000

On 2018-05-17 22:33, Lei YU wrote:

> So I think it is better for OpenBMC project to have a common (or 
> example)
> image signing tools/code, not for a specific machine or product, but 
> for the
> general machines in this project using legacy flash layout.
> Let's discuss and get a design proposal?
> 

Yeah, ideally we'd converge the legacy and ubi code update methods into 
one, to take advantage of the Software D-Bus interfaces and have the 
different features like signature verification, filesystem mirroring, 
etc be able to be picked up as separate packages. One starting point for 
the design proposal would be to determine how to separate in the build 
and the repo the different code update methods. Lei, want to take an 
initial stab at it? :)
