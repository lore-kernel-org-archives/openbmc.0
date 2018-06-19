Return-Path: <stewart@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418wyk2NC4zF0wM
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 15:10:38 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w5J59M8b087398
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 01:10:35 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2jppm4hf05-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 01:10:35 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Tue, 19 Jun 2018 01:10:34 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 19 Jun 2018 01:10:33 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w5J5AWu68782342
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 19 Jun 2018 05:10:32 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3E3F12405B;
 Tue, 19 Jun 2018 02:12:16 -0400 (EDT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D00B12405A;
 Tue, 19 Jun 2018 02:12:16 -0400 (EDT)
Received: from birb.localdomain (unknown [9.185.142.115])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 19 Jun 2018 02:12:16 -0400 (EDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id A84974EC648; Tue, 19 Jun 2018 15:10:26 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: Joel Stanley <joel@jms.id.au>, OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: 4.17 kernel published
In-Reply-To: <CACPK8Xd_cV+u880CSWEOXHicWEM5xsusjq=5ngsxwY7XLZiaNQ@mail.gmail.com>
References: <CACPK8Xd_cV+u880CSWEOXHicWEM5xsusjq=5ngsxwY7XLZiaNQ@mail.gmail.com>
Date: Tue, 19 Jun 2018 15:10:26 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 18061905-0060-0000-0000-0000027F6208
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009217; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000265; SDB=6.01049085; UDB=6.00537517; IPR=6.00828058; 
 MB=3.00021731; MTD=3.00000008; XFM=3.00000015; UTC=2018-06-19 05:10:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18061905-0061-0000-0000-000045803848
Message-Id: <87po0nicot.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-06-19_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=839 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1805220000 definitions=main-1806190059
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
X-List-Received-Date: Tue, 19 Jun 2018 05:10:38 -0000

Joel Stanley <joel@jms.id.au> writes:
> The 4.17 based kernel has been pushed to the openbmc Linux repository.
> From gerrit:
>
>     kernel: Move to 4.17
>
>     This brings the dev-4.13 development cycle to a close. By the end of the
>     cycle the 4.13 tree contained 236 patches.
>
>     This moves all of the 4.13 based functionality on top of a 4.17 base. We
>     currently have 97 patches in the tree. The reduction of 139 is mostly
>     due to code landing in Linus' tree, with a handful of fixes being merged
>     into the base patch.
>
>     The configuration is updated with newly landed drivers. In addition new
>     upstream security features are enabled, and legacy ATAG DTB support and
>     /dev/mem are removed.

No /dev/mem? WOOHOO!

-- 
Stewart Smith
OPAL Architect, IBM.
