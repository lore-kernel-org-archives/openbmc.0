Return-Path: <gmills@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gmills@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44W7Zq5w4dzDq6B
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 04:12:13 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2TH99Zw076648
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 13:12:11 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rhpvf213c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 13:12:11 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <gmills@linux.vnet.ibm.com>;
 Fri, 29 Mar 2019 17:12:11 -0000
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 29 Mar 2019 17:12:08 -0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2THC7hC59637786
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 17:12:07 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A42CBE053
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 17:12:07 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15AD9BE058
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 17:12:06 +0000 (GMT)
Received: from [9.10.100.31] (unknown [9.10.100.31])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP
 for <openbmc@lists.ozlabs.org>; Fri, 29 Mar 2019 17:12:06 +0000 (GMT)
Subject: Re: Using Stale bot to clean up issues
From: Gunnar Mills <gmills@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org
References: <01b53196-6c78-b004-8cd0-8534c516cbaf@linux.vnet.ibm.com>
 <df81f451-6982-6fd8-8acd-ab24b8f4c88f@intel.com>
 <5f203acc-f41d-cbae-1b1d-4c0af9d51b6e@linux.vnet.ibm.com>
 <9384d805-8ce2-a3b9-4406-06cf4f775306@gmail.com>
 <17b83fbc-247f-dee2-9fc3-2dd3efdee670@linux.vnet.ibm.com>
 <9e2daca4-c082-0bf7-071f-62c2af9129e7@linux.vnet.ibm.com>
Date: Fri, 29 Mar 2019 12:12:07 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <9e2daca4-c082-0bf7-071f-62c2af9129e7@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19032917-0036-0000-0000-00000A9F88C2
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010835; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01181445; UDB=6.00618364; IPR=6.00962166; 
 MB=3.00026212; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-29 17:12:09
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032917-0037-0000-0000-00004B334690
Message-Id: <4a98cba5-0dc0-6d3b-289f-c483aa5f28e0@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-29_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=839 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903290121
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
X-List-Received-Date: Fri, 29 Mar 2019 17:12:20 -0000

On 2/26/2019 4:03 PM, Gunnar Mills wrote:

>
> Are there still concerns or can we install this Stale bot?
> https://github.com/apps/stale
>
>
Stale bot was installed on openbmc/openbmc. If any issues get tagged 
'stale' that you would like *not* to see closed, just add a comment. :)

Thanks,
Gunnar
