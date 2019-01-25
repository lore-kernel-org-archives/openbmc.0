Return-Path: <tomjose@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tomjose@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43mCth18V4zDqLl
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jan 2019 20:11:07 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x0P99axB065315
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jan 2019 04:11:05 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2q7w6jq468-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 25 Jan 2019 04:11:04 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <tomjose@linux.vnet.ibm.com>;
 Fri, 25 Jan 2019 09:11:02 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 25 Jan 2019 09:11:00 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x0P9AxBJ57475262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 25 Jan 2019 09:10:59 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E64525205A;
 Fri, 25 Jan 2019 09:10:58 +0000 (GMT)
Received: from [9.193.103.209] (unknown [9.193.103.209])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 5AE4A52054;
 Fri, 25 Jan 2019 09:10:58 +0000 (GMT)
Subject: Re: IPMI SEL refactoring comments
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>, openbmc@lists.ozlabs.org
References: <551365ea-c6e2-b3d6-c9a5-2b9cdced6120@linux.vnet.ibm.com>
 <87ce0ee0-8ac8-829f-29a4-1a9803985ef0@linux.intel.com>
 <35d845e7-b3e3-7c40-3061-888ae2866b0d@linux.vnet.ibm.com>
 <c9db917c-5fc5-a4ae-2876-96a0a6d09301@linux.intel.com>
From: Tom Joseph <tomjose@linux.vnet.ibm.com>
Date: Fri, 25 Jan 2019 14:40:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c9db917c-5fc5-a4ae-2876-96a0a6d09301@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19012509-0016-0000-0000-0000024A455F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19012509-0017-0000-0000-000032A48DD1
Message-Id: <17f87adc-be5c-fdf2-5190-be4ba75c897d@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-01-25_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1901250077
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
X-List-Received-Date: Fri, 25 Jan 2019 09:11:08 -0000



On Thursday 24 January 2019 06:18 AM, Bills, Jason M wrote:
>
>
> On 1/23/2019 8:11 AM, Tom Joseph wrote:
>> Hello Jason,
>>
>>
>> On Thursday 29 November 2018 04:51 AM, Bills, Jason M wrote:
>>>
>>>
>>> On 11/26/2018 5:26 AM, Tom Joseph wrote:
>>>> Hello Jason,
>>>>
>>>> I reviewed the patches for the IPMI SEL refactoring and wanted to 
>>>> summarize the concerns with the proposed design. There are some 
>>>> current features that are broken.
>>>>
>>>> 1) The sensor numbers are arbitrary in the proposed implementation 
>>>> and does not account for the presence/error corresponding to 
>>>> inventory objects. On IBM systems the host firmware does not rely 
>>>> on the SDR repository in BMC to figure out the sensor numbers, 
>>>> rather the sensor numbers are programmed into the  host firmware at 
>>>> the build time. So the sensor numbers cannot be arbitrary.
>>>>
>>> I think this is the main issue: mapping sensor paths to sensor 
>>> numbers in a flexible way.  Once we can find a way to allow custom 
>>> sensor number mapping, it should allow all types of sensors to be 
>>> mapped as needed.
>>>
>>> One idea we've had would be to somehow add the sensor number into 
>>> the sensor D-Bus object which would mitigate arbitrary numbering as 
>>> needed.
>>>
>>>>  > I know you are working on a proposal to have a customizable map 
>>>> of sensor number to path. The support is only for threshold based 
>>>> sensors( targeting only /xyz/openbmc_project/sensors namespace) , 
>>>> it needs to extend support for discrete sensors. The sensor types 
>>>> are limited to few types(temperature, voltage,current, fan_tach, 
>>>> power), need to support other sensor types in the specification. It 
>>>> might not be possible to deduce the sensor type from the D-Bus 
>>>> object path for all sensors.
>>>>
>>>> 2)  OpenPower systems like Witherspoon and Zaius relies on 
>>>> eSEL(extended SEL format) to report debug data from the host 
>>>> firmware. The eSEL data is added to the D-Bus native error log via 
>>>> the Add SEL entry command. This is not handled with the refactoring.
>>>>
>>>>  > This is an openpower requirement and needs to be handled in an 
>>>> openpower IPMI OEM library/application and not in the phosphor 
>>>> implementation. A D-Bus error log containing eSEL can be created on 
>>>> completion of transfer of eSEL and not depend on Add SEL entry. The 
>>>> callouts associated with the eSEL can be added to the D-Bus error 
>>>> log by keeping a watch on the IPMI SEL entries. This might need 
>>>> changes to phosphor-logging API to support adding callout after 
>>>> creation of error log. This is a proposal and looks viable.
>> I made progress with moving the openpower specific code from 
>> phosphor-host-ipmid to openpower IPMI OEM library.
>>>>
>>>> 3) The current implementation the Get SEL entry is translating the 
>>>> D-Bus error log to IPMI SEL format. If there is a FRU callout 
>>>> associated with the D-Bus error log(D-Bus object paths in the 
>>>> inventory namespace) it is mapped to the sensor number associated 
>>>> with FRU and reported through SEL.
>>>>
>>>>  > The implementation of the Get SEL entry needs to adapt to 
>>>> include all the objects paths(the patchsets target only 
>>>> /xyz/openbmc_project/sensors namespace) and map the D-Bus object 
>>>> path to the sensor numbers(based on the proposed customizable map).
>>>>
>>> This should also be solved by fixing the sensor number mapping.
>>>
>>>> 4) In the current implementation all the D-Bus error logs have 1x1 
>>>> mapping in the IPMI SEL. In the proposed solution the users will 
>>>> have to rely on both D-Bus error logs and IPMI SEL to get the 
>>>> complete picture. The customers cannot rely only on IPMI SEL as an 
>>>> event repository.
>>>>
>>>>  > In the current proposal D-Bus error logs reported by BMC will 
>>>> not be shown by SEL commands. I am okie with Jason's proposal to 
>>>> set up a D-Bus match (either by ipmid or phosphor-sel-logger) that 
>>>> will watch for new logging D-Bus objects to be created and add a 
>>>> SEL record for them on creation.
>>>>
>>> Another thought would be to abandon D-Bus-based logging and see if 
>>> the same information could be placed in the journal.
>>>
>>>> https://gerrit.openbmc-project.xyz/#/q/status:open++topic:%22IPMI+SEL%22 
>>>>
>>>>
>>>> Regards,
>>>> Tom
>>>>
>>>
>>> More work is needed to come up with a flexible generic sensor 
>>> numbering scheme that will work with the various sensor 
>>> implementations.  I have been assigned to a different task and will 
>>> not be working on this for a while.  So, as discussed in the call 
>>> this week, as a stop-gap, I plan to move the journal-based SEL 
>>> implementation into intel-ipmi-oem for now. We can revisit this as 
>>> we make progress on the sensor numbering issue. This will also allow 
>>> everyone to see the full working implementation which may help 
>>> resolve some questions.
>> Did you get to make  progress with the flexible generic sensor 
>> numbering scheme? We will be glad to have your journal based SEL 
>> implementation upstreamed.
>
> Sorry, I'm still mostly consumed with other tasks and haven't had much 
> chance to focus on this.  We've had a few thoughts on ways that we 
> could make the sensor numbering more flexible and able to handle 
> dynamic and hardcoded numbering.
>
> One thought is to use the map proposed here 
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-ipmid/+/17637/1 
> and offer a method to update the sensor numbers with hardcoded sensor 
> data.  This map could then be referenced for all sensor numbers in the 
> system.

My thought is to have a JSON file that has sensor number to object 
mappings( and probably more relevant IPMI information) that can be 
consumed by any IPMI relevant applications. So the systems that rely on 
hardcoded sensor numbers will provide the mappings otherwise generate 
dynamic sensor numbers. The map described in the patch can be updated 
with the hardcoded sensor data.

> Another thought would be to add an optional sensor number value into 
> the sensor D-Bus object.  Then if a sensor number is found, use it; 
> otherwise, assign a dynamic number.

I am not excited having IPMI sensor information in the sensor D-Bus 
object. It is one of the design goals to have the D-Bus representation 
separated from the external interface representations(like IPMI).

>
> Will either of these options provide a feasible solution for sensor 
> numbering?
>
>>>
>>> Thanks,
>>> -Jason
>>>
>>
>
