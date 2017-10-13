Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yDB9f6VbCzDqvT
 for <openbmc@lists.ozlabs.org>; Sat, 14 Oct 2017 02:15:34 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9DF9j5t034861
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 11:15:32 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2djx4rwqvh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 13 Oct 2017 11:15:21 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Fri, 13 Oct 2017 09:15:20 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 13 Oct 2017 09:15:18 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9DFFHkW63373542; Fri, 13 Oct 2017 08:15:17 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CD1EBE03A;
 Fri, 13 Oct 2017 09:15:17 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.80.218.27])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id CDC86BE03B;
 Fri, 13 Oct 2017 09:15:16 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 2/2] drivers: hwmon: occ: Add sysfs_notify
 to throttling attributes
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
References: <1507322581-13947-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507322581-13947-3-git-send-email-eajames@linux.vnet.ibm.com>
 <1507875069.5452.203.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Fri, 13 Oct 2017 10:15:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1507875069.5452.203.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17101315-0020-0000-0000-00000CD865FF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007891; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000236; SDB=6.00930594; UDB=6.00468472; IPR=6.00710860; 
 BA=6.00005636; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017527; XFM=3.00000015;
 UTC=2017-10-13 15:15:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101315-0021-0000-0000-00005E800D14
Message-Id: <71cf1bf4-1b85-ac18-dcb0-9ae406de1296@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-13_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710130210
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 13 Oct 2017 15:15:35 -0000



On 10/13/2017 01:11 AM, Andrew Jeffery wrote:
> On Fri, 2017-10-06 at 15:43 -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>   
>> Need to alert user space when we change throttling state.
>>   
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/hwmon/occ/common.c | 25 +++++++++++++++++++++----
>>   1 file changed, 21 insertions(+), 4 deletions(-)
>>   
>> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
>> index e8579b6..242ba40 100644
>> --- a/drivers/hwmon/occ/common.c
>> +++ b/drivers/hwmon/occ/common.c
>> @@ -182,6 +182,7 @@ int occ_poll(struct occ *occ)
>>   	u16 checksum = occ->poll_cmd_data + 1;
>>   	u8 cmd[8];
>>   	u8 occs_present = header->occs_present;
>> +	u8 ext_status = header->ext_status;
>>   
>>   	cmd[0] = 0;
>>   	cmd[1] = 0;
>> @@ -206,10 +207,26 @@ int occ_poll(struct occ *occ)
>>   	} else
>>   		occ->last_safe = 0;
>>   
>> -	if (occs_present != header->occs_present && occ->hwmon &&
>> -	    (header->status & OCC_STAT_MASTER)) {
>> -		sysfs_notify(&occ->bus_dev->kobj, NULL,
>> -			     occ->status_attrs[7].dev_attr.attr.name);
>> +	if (occ->hwmon) {
>> +		if (occs_present != header->occs_present &&
>> +		    (header->status & OCC_STAT_MASTER))
>> +			sysfs_notify(&occ->bus_dev->kobj, NULL,
>> +				     occ->status_attrs[7].dev_attr.attr.name);
> Why are we now protecting this under the occ->hwmon condition? Shouldn't we
> have done that in the previous patch which introduced the notify for
> occs_present?

Checking for occ->hwmon was there previously.

Thanks,
Eddie

>
> Andrew
