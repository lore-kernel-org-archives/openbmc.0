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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40175l3xB3zF11w
 for <openbmc@lists.ozlabs.org>; Wed, 14 Mar 2018 08:19:23 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w2DLIhTc075097
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 17:19:21 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2gpkeryas6-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 13 Mar 2018 17:19:21 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Tue, 13 Mar 2018 17:19:19 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 13 Mar 2018 17:19:16 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w2DLJFc739321776; Tue, 13 Mar 2018 21:19:15 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 111EEB204E;
 Tue, 13 Mar 2018 18:21:29 -0400 (EDT)
Received: from [9.10.99.29] (unknown [9.10.99.29])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id BD749B2050;
 Tue, 13 Mar 2018 18:21:28 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.13 1/2] hwmon (occ): Remove temperature fault
 attribute and VRM temp alarm
To: Joel Stanley <joel@jms.id.au>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "Edward A. James" <eajames@us.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, spinler@linux.vnet.ibm.com
References: <1519944259-27898-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1519944259-27898-2-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8XcKZvvU27n575J+GQ=kAm3PONYqWCZwESEaxq5Ne0KP0Q@mail.gmail.com>
 <71fbea13-49db-3a3e-40de-ab30b34c38ab@linux.vnet.ibm.com>
 <CACPK8XeuAjZa_A7FubAOpTRr1MQeBWKFQoqakGi-3QnGZASgvA@mail.gmail.com>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Tue, 13 Mar 2018 16:19:15 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XeuAjZa_A7FubAOpTRr1MQeBWKFQoqakGi-3QnGZASgvA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18031321-2213-0000-0000-0000027F1228
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008667; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.01002607; UDB=6.00510174; IPR=6.00781938; 
 MB=3.00020014; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-13 21:19:17
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18031321-2214-0000-0000-000059675ECA
Message-Id: <1218088b-56d9-4b9f-d1e2-5a5790d6b892@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-03-13_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1803130236
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
X-List-Received-Date: Tue, 13 Mar 2018 21:19:23 -0000



On 3/12/2018 10:26 PM, Joel Stanley wrote:
> On Fri, Mar 9, 2018 at 5:45 AM, Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
>>
>>
>> On 3/1/2018 6:39 PM, Joel Stanley wrote:
>>>
>>> On Fri, Mar 2, 2018 at 9:14 AM, Eddie James <eajames@linux.vnet.ibm.com>
>>> wrote:
>>>>
>>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>>
>>>> This removes the EAGAIN return for "sensor not ready" and the temperature
>>>> fault and vrm temp alarms attributes.
>>>>
>>>> Apologies for pushing this up so early... Userspace applications aren't
>>>> ready for this change. The hwmon polling application cannot accept EGAIN
>>>> yet, and we can't be returning apparent errors if the sensor is
>>>> temporarily unavailable.
>>>
>>>
>>> Okay. Brad's email is from October 5th, 2017. That's 148 days ago.
>>>
>>> Any ETA on when the userspace plans to get some love?
>>>
>>
>> We have 4 issues in the backlog to address the OCC GPU sensors returning
>> either a 0 or 0xFF:
>> https://github.com/openbmc/openbmc/issues/2327
>> https://github.com/openbmc/openbmc/issues/2329
>> https://github.com/openbmc/openbmc/issues/2222
>> https://github.com/openbmc/openbmc/issues/2223
>>
>> As fan control is already doing the right thing when it reads the values
>> as they are now, we deprioritized the work quite a bit so it still
>> isn't scheduled and may not be until later systems.
> 
> Okay. Lets get that work scheduled ASAP, as it's already been quite
> some time since we needed that fixed. I think it's now holding up the
> Witherspoon team from moving to the new kernel.
> 
> Do you have an ETA?

We're going to try to start work on it next sprint, so done in about a 
month give or take.

> 
> Cheers,
> 
> Joel
> 
