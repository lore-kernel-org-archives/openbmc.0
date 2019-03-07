Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44FZDV0SltzDqFY
 for <openbmc@lists.ozlabs.org>; Fri,  8 Mar 2019 02:24:25 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x27FJkQB119355
 for <openbmc@lists.ozlabs.org>; Thu, 7 Mar 2019 10:24:24 -0500
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2r34r6mdc2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 07 Mar 2019 10:24:23 -0500
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Thu, 7 Mar 2019 15:24:22 -0000
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 7 Mar 2019 15:24:20 -0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x27FOIhd25231418
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 7 Mar 2019 15:24:19 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD177AE062;
 Thu,  7 Mar 2019 15:24:18 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 720D1AE060;
 Thu,  7 Mar 2019 15:24:18 +0000 (GMT)
Received: from [9.85.153.16] (unknown [9.85.153.16])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  7 Mar 2019 15:24:18 +0000 (GMT)
Subject: Re: License change for obmc-ikvm
To: "Khetan, Sharad" <sharad.khetan@intel.com>,
 Eddie James <eajames@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "1450335857@qq.com" <1450335857@qq.com>,
 "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
 "venture@google.com" <venture@google.com>
References: <42f16713-0719-4871-59a8-aa912a3b79ee@linux.vnet.ibm.com>
 <C02E8263-2029-499C-8485-98EB19EC6438@intel.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Thu, 7 Mar 2019 09:24:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <C02E8263-2029-499C-8485-98EB19EC6438@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19030715-0040-0000-0000-000004CE07DA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010721; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000281; SDB=6.01170954; UDB=6.00606765; IPR=6.00951597; 
 MB=3.00025875; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-07 15:24:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19030715-0041-0000-0000-000008D915A3
Message-Id: <507b980e-a9b5-e816-0346-1915f3885116@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-07_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903070104
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
X-List-Received-Date: Thu, 07 Mar 2019 15:24:26 -0000


On 3/6/19 4:31 PM, Khetan, Sharad wrote:
> Hi Eddie,
> Is there a reason for changing the license to GPL2? Is it because of a need to add a GPL2 component or is there a different reason?

Hi,

Yes, the application typically links with libvncserver which is licensed 
GPL2. So obmc-ikvm should also be licensed GPL2.

Thanks,

Eddie

> Thanks,
> -Sharad
>
>> On Mar 6, 2019, at 10:31 PM, Eddie James <eajames@linux.vnet.ibm.com> wrote:
>>
>> Hi,
>>
>> We're planning to change the license for obmc-ikvm from Apache 2 to GPL 2. The change is up on gerrit for review here: https://gerrit.openbmc-project.xyz/#/c/openbmc/obmc-ikvm/+/18974/
>>
>> I've added all contributors to review, but anyone else feel free to review there or reply to this thread.
>>
>> Thanks!
>>
>> Eddie
>>
