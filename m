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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qyBF5WcGzDr5J
 for <openbmc@lists.ozlabs.org>; Wed, 23 May 2018 00:06:45 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4ME5ukf001226
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 10:06:42 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j4m949bn4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 10:06:42 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 22 May 2018 08:06:39 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 22 May 2018 08:06:37 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4ME6aaf12059134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 22 May 2018 07:06:36 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F10FBE047;
 Tue, 22 May 2018 08:06:36 -0600 (MDT)
Received: from [9.80.236.89] (unknown [9.80.236.89])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 6333EBE039;
 Tue, 22 May 2018 08:06:35 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.13 2/4] fsi/occ: Add Retries on checksum errors
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20180518013500.18005-1-benh@kernel.crashing.org>
 <20180518013500.18005-2-benh@kernel.crashing.org>
 <1526880377.2644647.1378943632.1451B0E7@webmail.messagingengine.com>
 <05ebcf5940e45a9083a65f6cc35eda367b44f9fc.camel@kernel.crashing.org>
 <db3ce0ae-9aba-c764-5e79-0140e095330e@linux.vnet.ibm.com>
 <d8828349e3d4f01a5ce9ecde529b84c792b708c3.camel@kernel.crashing.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 22 May 2018 09:06:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <d8828349e3d4f01a5ce9ecde529b84c792b708c3.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18052214-0020-0000-0000-00000DFBD39F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009065; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000261; SDB=6.01036034; UDB=6.00529969; IPR=6.00815163; 
 MB=3.00021235; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-22 14:06:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052214-0021-0000-0000-0000617FC83F
Message-Id: <6b3e0f7f-8cd1-b413-fd0f-dd0f3c3d7001@linux.vnet.ibm.com>
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
X-List-Received-Date: Tue, 22 May 2018 14:06:46 -0000



On 05/21/2018 07:36 PM, Benjamin Herrenschmidt wrote:
> On Mon, 2018-05-21 at 13:58 -0500, Eddie James wrote:
>>>>     If it's the former then retrying independent of the OCC error
>>>> handling protocol is probably okay, but if we're trying to catch the
>>>> latter then maybe we should let this be handled as part of the OCC
>>>> error handling code?
>>>>
>>>> Eddie?
>> The checksum is part of the OCC response, so it's not a transport thing.
>> If we've gotten to checking the checksum then we've got a full response
>> that looks valid so far (reasonable length, etc).
>>
>> If we're trying to adhere to the OCC spec, then I'm of the opinion that
>> we shouldn't do any retries except for those handled in the occ-hwmon
>> driver.
> I don't see any in there ... what am I missing ?

Oh yea, we moved the retries to userspace, sort of. Basically userspace 
keeps polling every second, even if it fails, until the "error" 
attribute gets set. That error attribute is only set if we've tried and 
failed to communicate a certain number of times 
(OCC_ERROR_COUNT_THRESHOLD in the occ hwmon driver). Once userspace 
picks up the error attribute, it has to take action on that, by 
resetting the OCC over IPMI, etc.

Thanks,
Eddie

>
> Cheers,
> Ben.
>
