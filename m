Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 405xVC4Hm5zF1nk
 for <openbmc@lists.ozlabs.org>; Thu, 22 Mar 2018 04:23:46 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2LHMAbR062153
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 13:23:44 -0400
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gur3wthqx-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 13:23:43 -0400
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Wed, 21 Mar 2018 11:23:42 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 21 Mar 2018 11:23:39 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2LHNc2a10289630
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 10:23:38 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D69FAC603E
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 11:23:38 -0600 (MDT)
Received: from [9.10.99.29] (unknown [9.10.99.29])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id B01F1C6037
 for <openbmc@lists.ozlabs.org>; Wed, 21 Mar 2018 11:23:38 -0600 (MDT)
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Subject: Code levels in error log entries
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date: Wed, 21 Mar 2018 12:23:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18032117-0028-0000-0000-00000955188E
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008717; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01006363; UDB=6.00512411; IPR=6.00785646; 
 MB=3.00020166; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-21 17:23:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032117-0029-0000-0000-00003A0E42F6
Message-Id: <120dd10d-e04a-477e-e84a-5cd536aff663@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-21_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803210199
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
X-List-Received-Date: Wed, 21 Mar 2018 17:23:48 -0000

For IBM systems, we need to add the current code level to each error log
object as it's created to make it easier on the lives of support
personnel.  It would be a new interface (or maybe use an existing
code version one) on the /xyz/openbmc_project/logging/entry/X objects.

Does anyone here that also uses error logs have an opinion on if they
would also be interested in this or not, so it would go into the common
logging code?

Unless others are interested in it, I plan on putting it in an IBM
specific repository.  (or maybe turn on with a configure option?)

Thanks
