Return-Path: <gmills@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 448CX53pFpzDq9L
 for <openbmc@lists.ozlabs.org>; Wed, 27 Feb 2019 09:04:19 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x1QM4DQs084093
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 17:04:14 -0500
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2qwb4rhhgs-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 17:04:13 -0500
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Tue, 26 Feb 2019 22:03:27 -0000
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 26 Feb 2019 22:03:23 -0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x1QM3Mm320971654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 22:03:23 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A95DC112083
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 22:03:22 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C75B112089
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 22:03:22 +0000 (GMT)
Received: from [9.10.100.31] (unknown [9.10.100.31])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Tue, 26 Feb 2019 22:03:22 +0000 (GMT)
Subject: Re: Using Stale bot to clean up issues
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
References: <01b53196-6c78-b004-8cd0-8534c516cbaf@linux.vnet.ibm.com>
 <df81f451-6982-6fd8-8acd-ab24b8f4c88f@intel.com>
 <5f203acc-f41d-cbae-1b1d-4c0af9d51b6e@linux.vnet.ibm.com>
 <9384d805-8ce2-a3b9-4406-06cf4f775306@gmail.com>
 <17b83fbc-247f-dee2-9fc3-2dd3efdee670@linux.vnet.ibm.com>
Date: Tue, 26 Feb 2019 16:03:22 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <17b83fbc-247f-dee2-9fc3-2dd3efdee670@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19022622-0064-0000-0000-000003AFE7B4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010670; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01166812; UDB=6.00609515; IPR=6.00947418; 
 MB=3.00025755; MTD=3.00000008; XFM=3.00000015; UTC=2019-02-26 22:03:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19022622-0065-0000-0000-00003C8BA9EB
Message-Id: <9e2daca4-c082-0bf7-071f-62c2af9129e7@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-02-26_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=653 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1902260150
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
X-List-Received-Date: Tue, 26 Feb 2019 22:04:22 -0000


On 2/11/2019 9:50 PM, GUNNAR MILLS wrote:
>
> Don't touch them until 6 months of inactively and then another month 
> of inactively in this "stale" state before closing. We can revisit 
> this later.
>

> Need to be "an organization owner or have admin permissions in a 
> repository to install a GitHub App".  Will then need a .github/stale.yml
>
Are there still concerns or can we install this Stale bot?
https://github.com/apps/stale

- Gunnar
