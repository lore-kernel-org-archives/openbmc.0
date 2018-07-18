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
 by lists.ozlabs.org (Postfix) with ESMTPS id 41W9lg2w22zDqBy
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jul 2018 07:49:18 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w6ILmlkr002959
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 17:49:16 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2kacp927kw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 17:49:16 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 18 Jul 2018 17:49:16 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Jul 2018 17:49:13 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w6ILnCiK9306514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 21:49:13 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE538112063
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 17:49:00 -0400 (EDT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8400112064
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 17:49:00 -0400 (EDT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Wed, 18 Jul 2018 17:49:00 -0400 (EDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 18 Jul 2018 16:55:12 -0500
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: Virtual Media
X-Sender: mspinler@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
X-TM-AS-GCONF: 00
x-cbid: 18071821-0040-0000-0000-00000450D6C3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009388; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000266; SDB=6.01062751; UDB=6.00545680; IPR=6.00840605; 
 MB=3.00022192; MTD=3.00000008; XFM=3.00000015; UTC=2018-07-18 21:49:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18071821-0041-0000-0000-0000085702CE
Message-Id: <69abb9a05c7d01b71cd4a69f3e7c548e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-07-18_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=291 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1806210000 definitions=main-1807180236
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
X-List-Received-Date: Wed, 18 Jul 2018 21:49:20 -0000

Hi,

We are preparing to start working on virtual media, as in remote mass 
storage.

I saw there was a discussion about it at the hackathon,
https://docs.google.com/document/d/1lvK2o4-mMHQ5R0rs1gaB71SKw0dCAlJjyxIqh5azm3k.

Has anyone done any more work on this yet, or plan to?

I hope to send out a high level design for RFC soon, or people can chime 
in now
with any ideas they have for it.


Thanks!
Matt
