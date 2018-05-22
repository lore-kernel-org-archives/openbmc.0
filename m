Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qyFf0jkLzDqp5
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 00:09:41 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4ME5tNK091895
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 10:09:39 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j4m0mjqhd-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 10:09:39 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 22 May 2018 08:09:38 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 22 May 2018 08:09:36 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4ME9RRW11665880; Tue, 22 May 2018 07:09:36 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44B41BE04A;
 Tue, 22 May 2018 08:09:36 -0600 (MDT)
Received: from [9.80.236.89] (unknown [9.80.236.89])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 6BE64BE039;
 Tue, 22 May 2018 08:09:35 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.13 1/4] fsi/occ: Add retries on SBE errors
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20180518013500.18005-1-benh@kernel.crashing.org>
 <1526879662.2642052.1378929336.646BF02C@webmail.messagingengine.com>
 <0450d7c40fe4e8015311ef6de478893a58445d9b.camel@kernel.crashing.org>
 <142d4920-3a8b-b2ba-a218-e4bd299c572c@linux.vnet.ibm.com>
 <fbf1dd20d94394d5ea6357abd6aa8ac5f7c0bcc8.camel@kernel.crashing.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 22 May 2018 09:09:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <fbf1dd20d94394d5ea6357abd6aa8ac5f7c0bcc8.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18052214-0004-0000-0000-00001421FFDE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009065; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000261; SDB=6.01036036; UDB=6.00529970; IPR=6.00815164; 
 MB=3.00021235; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-22 14:09:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052214-0005-0000-0000-0000874E54E1
Message-Id: <26edb5b7-95ca-a224-f4e7-40f31d85a193@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-22_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805220164
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
X-List-Received-Date: Tue, 22 May 2018 14:09:42 -0000



On 05/21/2018 05:53 PM, Benjamin Herrenschmidt wrote:
> On Mon, 2018-05-21 at 13:48 -0500, Eddie James wrote:
>>>> 3.3.1 BMC-OCC Communication Failure Handling
>>>>
>>>> On failures communicating with an OCC the BMC should first verify
>>>> that the “OCC Active” sensor is TRUE.  If the OCCs are not active the
>>>> error should be ignored and communication with the OCC should not be
>>>> retired until the “OCC Active” sensor is TRUE.  If the “OCC Active”
>>>> sensor is TRUE the command should be retried twice.
>>> What is the "OCC Active sensor" ?
>> It's a value in the OCC poll response.
> That's only useful if you can get that response then... which you can't
> if the communication fails. I'm missing something here.

Ah. There is also the IPMI OCC active sensor, which is what this must 
mean. We're doing this correctly by unbinding the occ-hwmon driver when 
the OCC active sensor comes in false. So, if driver is bound, OCC active 
must be true, so we "retry" twice by only setting the error attribute 
after two failed poll responses.

Thanks... sorry for the mixup.
Eddie

>
> Ben.
>
