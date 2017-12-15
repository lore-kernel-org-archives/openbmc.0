Return-Path: <stewart@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yyd075tM4zDrWQ
 for <openbmc@lists.ozlabs.org>; Fri, 15 Dec 2017 15:35:35 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBF4YMLD095026
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 23:35:33 -0500
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ev689ab3f-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2017 23:35:33 -0500
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Thu, 14 Dec 2017 23:35:31 -0500
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 14 Dec 2017 23:35:30 -0500
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBF4ZUoC52690990; Fri, 15 Dec 2017 04:35:30 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C28F2124037;
 Thu, 14 Dec 2017 23:32:28 -0500 (EST)
Received: from birb.localdomain (unknown [9.102.53.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with SMTP id 059BD124035;
 Thu, 14 Dec 2017 23:32:27 -0500 (EST)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 6F2414EC6A2; Fri, 15 Dec 2017 15:35:23 +1100 (AEDT)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Jayanth Othayoth <ojayanth@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: dreport will replace ffdc tool starting from Feb-2018.
In-Reply-To: <CACkAXSrqHOkyDZpYRCtibiA6CQ9Z7XRXw5BcTkvDSMwd1pEvjQ@mail.gmail.com>
References: <CACkAXSrqHOkyDZpYRCtibiA6CQ9Z7XRXw5BcTkvDSMwd1pEvjQ@mail.gmail.com>
Date: Fri, 15 Dec 2017 15:35:23 +1100
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17121504-0036-0000-0000-0000029B897F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008206; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00960403; UDB=6.00485793; IPR=6.00740418; 
 BA=6.00005741; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018553; XFM=3.00000015;
 UTC=2017-12-15 04:35:31
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121504-0037-0000-0000-000042ABD6B3
Message-Id: <874loswqus.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-15_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712150062
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 15 Dec 2017 04:35:36 -0000

Jayanth Othayoth <ojayanth@gmail.com> writes:
> Starting feb-2018 ffdc tool will be removed from openbmc builds. dreport
> will replace ffdc tool with support for additional features.  dreport is
> already available in openbmc builds.
>
> Users of ffdc tool must plan to migrate to dreport.
>
> dreport is  a drop-in replacement for ffdc.  ie run dreport instead of
> ffdc.

For ease of use, a shell alias would be appreciated. Old habits die hard :)

-- 
Stewart Smith
OPAL Architect, IBM.
