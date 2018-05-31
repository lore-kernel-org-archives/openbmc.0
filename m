Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xKcH016ZzDr30
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 17:59:26 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4V7sovx011154
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 03:59:24 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2jab3avusm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 03:59:23 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Thu, 31 May 2018 03:59:23 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 31 May 2018 03:59:21 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4V7xK4S49020964
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 31 May 2018 07:59:20 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1E3D280D7;
 Thu, 31 May 2018 03:58:38 -0400 (EDT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2199280D3;
 Thu, 31 May 2018 03:58:37 -0400 (EDT)
Received: from birb.localdomain (unknown [9.81.205.11])
 by b01ledav001.gho.pok.ibm.com (Postfix) with SMTP;
 Thu, 31 May 2018 03:58:37 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 56AD84EC638; Thu, 31 May 2018 17:58:37 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>, Tao Ren <taoren@fb.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: Linux kenrel: Moving to a 4.17 base
In-Reply-To: <CACPK8XfTDqprASF==8wjeH+KnpECiJHrSiQ9ugYuBEe+RM4tgw@mail.gmail.com>
References: <CACPK8XfTDqprASF==8wjeH+KnpECiJHrSiQ9ugYuBEe+RM4tgw@mail.gmail.com>
Date: Thu, 31 May 2018 17:58:37 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18053107-0036-0000-0000-000002FE52A9
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009101; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000264; SDB=6.01040205; UDB=6.00530848; IPR=6.00819334; 
 MB=3.00021391; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-31 07:59:22
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18053107-0037-0000-0000-000044830839
Message-Id: <87sh6845oy.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-31_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=686 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1805220000 definitions=main-1805310089
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
X-List-Received-Date: Thu, 31 May 2018 07:59:27 -0000

Joel Stanley <joel@jms.id.au> writes:
> A non-goal is to maintain a long-lived stable tree, as this takes time
> away from the first goal.

Although syncing an openbmc release with an LTS kernel is probably a
good idea if someone wants a tree that's going to get some kind of
maintenance for a long time?

-- 
Stewart Smith
OPAL Architect, IBM.
