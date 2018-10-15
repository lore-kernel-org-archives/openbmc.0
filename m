Return-Path: <msbarth@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=msbarth@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 42Yfh86HdDzF3Nw
 for <openbmc@lists.ozlabs.org>; Tue, 16 Oct 2018 00:40:05 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w9FDcvY6114262
 for <openbmc@lists.ozlabs.org>; Mon, 15 Oct 2018 09:40:03 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2n4u1bjvmn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 15 Oct 2018 09:40:02 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <msbarth@linux.ibm.com>;
 Mon, 15 Oct 2018 09:40:01 -0400
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 15 Oct 2018 09:39:59 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w9FDdwV937290030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 15 Oct 2018 13:39:58 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AECC711206B;
 Mon, 15 Oct 2018 09:39:18 -0400 (EDT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76B71112065;
 Mon, 15 Oct 2018 09:39:18 -0400 (EDT)
Received: from [9.10.99.188] (unknown [9.10.99.188])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Oct 2018 09:39:18 -0400 (EDT)
Subject: Re: Notion of Flakiness in Sensor Readings
To: Patrick Venture <venture@google.com>,
 Matt Spinler <mspinler@linux.vnet.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 James Feist <james.feist@linux.intel.com>
References: <CAO=notz_KizBdONsKjtQ6U05r4hWQOuxa_cx9Cshps7V8=PRbw@mail.gmail.com>
 <3fc8bbb4-2db9-6df0-4fc3-1addf4b94ac3@linux.intel.com>
 <CAO=notwOiB-v5LxZ=OagkGTzhM8dnt5kogO=eaTGEKGp7si14Q@mail.gmail.com>
 <e6652bad-d524-3912-6be2-9dc2bc9d4669@linux.vnet.ibm.com>
 <CAO=notyHG4EvvjouSJjo+n9oRDjp81W5vQFcvG4ZXiue_jmqzw@mail.gmail.com>
From: Matthew Barth <msbarth@linux.ibm.com>
Date: Mon, 15 Oct 2018 08:39:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAO=notyHG4EvvjouSJjo+n9oRDjp81W5vQFcvG4ZXiue_jmqzw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18101513-0064-0000-0000-0000036097B5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009879; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000268; SDB=6.01103029; UDB=6.00570909; IPR=6.00883080; 
 MB=3.00023762; MTD=3.00000008; XFM=3.00000015; UTC=2018-10-15 13:40:01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18101513-0065-0000-0000-00003AFD2850
Message-Id: <04b9bce1-10b9-8603-4cdb-f1020fd0f6ee@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-10-15_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1807170000 definitions=main-1810150125
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
X-List-Received-Date: Mon, 15 Oct 2018 13:40:09 -0000



On 10/12/2018 04:32 PM, Patrick Venture wrote:
> On Fri, Oct 12, 2018 at 2:28 PM Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
>>
>>
>>
>> On 10/12/2018 4:23 PM, Patrick Venture wrote:
>>> On Fri, Oct 12, 2018 at 2:09 PM James Feist <james.feist@linux.intel.com> wrote:
>>>> On 10/12/2018 01:53 PM, Patrick Venture wrote:
>>>>> Currently, there are a few approaches in phosphor-hwmon on how to
>>>>> handle sensors being present sometimes, or flaky on reads.  We've
>>>>> talked in the past about how to handle a read failure that should be
>>>>> ignored.  A real failure that is flaky or temporary.
>>>>>
>>>>> I was thinking of just adding a property to the Sensor.Value interface
>>>>> to report information.  Basically, someone reading the value needs to
>>>>> know if it's valid.  The idea of a range check for validity doesn't
>>>>> work as cleanly for this specific purpose, in my opinion.  The min/max
>>>>> can be used cleanly to determine the linearization though!
>>>>>
>>>>> I was thinking perhaps a boolean, that you can check to see if the
>>>>> value should be used or trusted.  Then, I thought, perhaps, a enum
>>>>> with a series of states, starting with the states of "Valid',
>>>>> "Invalid."  Not being able to think of a third state, I fell back onto
>>>>> a boolean.
>>
>> If the hwmon driver for your device provides a _fault attribute, and
>> that gets set, the code is already
>> set up to create an OperationalStatus interface on that sensor instance
>> and set the Functional
>> property to false.
> 
> I'd like to drop this such that the failure behavior can be returning
> a NaN double.
> https://github.com/openbmc/phosphor-hwmon/blob/master/hwmonio.cpp#L127
> 
> For the drivers that don't have the fault attribute, and in the case
> where phosphor-host-ipmid doesn't check for that kind of failure.
> 
IMHO, we should handle this by removing the sensor from dbus instead of 
using a special value type if we're unable to use the OperationalStatus. 
In either case, the code utilizing this sensor would need to 
specifically handle this NaN value or handle having the sensor removed 
from dbus. It seems more generically, to me, to have hwmon remove the 
sensor from dbus instead of using a NaN double so this can be used 
across other sensor drivers that may not return a double type.
>>
>>>> For Valid / Invalid we've produced nan on D-Bus to know that the sensor
>>>> is in an invalid state (like power off for tach values). Although I'm
>>>> not sure how this would be produced using the int64 interface, for the
>>>> double std::nan will go over d-bus correctly.
>>> So if i just wait until we're using double, the issue basically
>>> resolves itself? :D :D
>>>
>>>>> Thoughts?
>>>>>
>>>>> Patrick
>>>>>
>>
> 
