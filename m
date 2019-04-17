Return-Path: <jrey@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44kSTv5pd9zDqHj
 for <openbmc@lists.ozlabs.org>; Wed, 17 Apr 2019 13:32:19 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3H3TPU6033570
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 23:32:16 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2rwq9g9evs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 16 Apr 2019 23:32:16 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <jrey@linux.ibm.com>;
 Wed, 17 Apr 2019 04:32:15 +0100
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 17 Apr 2019 04:32:14 +0100
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3H3WDWC32571516
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 17 Apr 2019 03:32:13 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 176BDB205F;
 Wed, 17 Apr 2019 03:32:13 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A41F9B206B;
 Wed, 17 Apr 2019 03:32:12 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 17 Apr 2019 03:32:12 +0000 (GMT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 16 Apr 2019 22:33:31 -0500
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, openbmc
 <openbmc-bounces+jrey=linux.ibm.com@lists.ozlabs.org>
Subject: Re: Redfish OEM commands in OpenBMC - OpenBMC extensions to the
 Redfish standard
In-Reply-To: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
References: <CALLMt=qEtkfBwBcV1WzsGuCozyT1Fs8+1d+nUPPScxq1ZpihJQ@mail.gmail.com>
X-Sender: jrey@linux.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 19041703-0064-0000-0000-000003CC54D3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010941; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000284; SDB=6.01190185; UDB=6.00623658; IPR=6.00970983; 
 MB=3.00026475; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-17 03:32:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19041703-0065-0000-0000-00003D18F2F3
Message-Id: <0306c854ab75fffc95b943526cbf795b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-17_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904170021
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Apr 2019 03:32:20 -0000

On 2019-04-16 14:02, Andrew Geissler wrote:
> Greetings,
> 
> As more and more of us are implementing Redfish within OpenBMC we are 
> starting
> to run into situations where the function we need to implement is not 
> available
> in the current Redfish schemas.
> 
> We've been joining DMTF workgroups and starting to get familiar with 
> the process
> but, if OpenBMC upstreaming is considered slow, it's looking like 
> upstreaming
> to the DMTF could be even slower.
> 
> So my question is, are we taking a no OEM policy within OpenBMC? Or are 
> we going
> to take a more flexible approach. Similar to openbmc/linux, as long as 
> you're
> working upstream with the DMTF on your changes, OEM would be 
> acceptable?

Good questions!

A third approach: At the OpenBMC project level, we document, discuss, 
and agree on "OpenBMC extensions to the Redfish standard".  Once 
approved, we can simultaneously (a) implement the extensions and (b) 
attempt to upstream them to DMTF.  ==> If the extensions are accepted, 
celebrate!  If not, ... we'll have more work.

- Joseph

> From what I've seen so far, it looks like a lot of companies have gone 
> the OEM
> route initially. They then use that experience to guide the discussion 
> with the
> DMTF workgroups.
> 
> There could be some gray areas. For example, I want to add a Priority
> property to the UpdateService [1]. Maybe this would be ok to carry as 
> an OEM
> for a bit? Adriana wants to propose a whole new backup and restore 
> design [2].
> Maybe that needs a bit more traction upstream to ensure it's going in 
> the right
> direction for something DMTF would approve first? If we start limiting 
> ourselves
> as a community on what DMTF has approved, I think we're going to 
> struggle to
> deliver certain new functions.
> 
> Andrew
> 
> [1] https://github.com/DMTF/Redfish/issues/3357 (can only see with DMTF 
> access)
> [2] https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/18163
