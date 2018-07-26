Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41by804JWszF0PZ
 for <openbmc@lists.ozlabs.org>; Fri, 27 Jul 2018 02:23:27 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6QGJJ69026590
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 12:23:25 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2kfgh8uq3s-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 12:23:24 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 26 Jul 2018 12:23:24 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 26 Jul 2018 12:23:21 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6QGNLAC10092986
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 16:23:21 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93D5FAC059
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 12:24:03 -0400 (EDT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 513C8AC05F
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 12:24:03 -0400 (EDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Thu, 26 Jul 2018 12:24:03 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 26 Jul 2018 11:29:38 -0500
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Re: Virtual Media
In-Reply-To: <69abb9a05c7d01b71cd4a69f3e7c548e@linux.vnet.ibm.com>
References: <69abb9a05c7d01b71cd4a69f3e7c548e@linux.vnet.ibm.com>
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18072616-0064-0000-0000-0000033016AB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009432; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01066459; UDB=6.00547915; IPR=6.00844322; 
 MB=3.00022337; MTD=3.00000008; XFM=3.00000015; UTC=2018-07-26 16:23:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18072616-0065-0000-0000-00003A1452A5
Message-Id: <f26335dcac22d2814992d2b8177f46ce@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-26_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=503 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807260167
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2018 16:23:29 -0000

Hi,

Does anyone know if supporting multiple virtual media instances at once 
is ever a required/useful customer use case?  If not, we will just plan 
on supporting 1 at a time.

Thanks,

Matt


On 2018-07-18 16:55, Matt Spinler wrote:
> Hi,
> 
> We are preparing to start working on virtual media, as in remote mass 
> storage.
> 
> I saw there was a discussion about it at the hackathon,
> https://docs.google.com/document/d/1lvK2o4-mMHQ5R0rs1gaB71SKw0dCAlJjyxIqh5azm3k.
> 
> Has anyone done any more work on this yet, or plan to?
> 
> I hope to send out a high level design for RFC soon, or people can 
> chime in now
> with any ideas they have for it.
> 
> 
> Thanks!
> Matt
