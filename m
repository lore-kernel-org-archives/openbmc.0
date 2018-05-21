Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qSj65XTyzF164
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 04:58:18 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4LIs0Bv032781
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 14:58:15 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2j42xbsyja-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 14:58:15 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 21 May 2018 12:58:14 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 21 May 2018 12:58:11 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4LIwAHO196946; Mon, 21 May 2018 11:58:10 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F57013603A;
 Mon, 21 May 2018 12:58:10 -0600 (MDT)
Received: from [9.85.196.42] (unknown [9.85.196.42])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id E01CB13603C;
 Mon, 21 May 2018 12:58:09 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.13 2/4] fsi/occ: Add Retries on checksum errors
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20180518013500.18005-1-benh@kernel.crashing.org>
 <20180518013500.18005-2-benh@kernel.crashing.org>
 <1526880377.2644647.1378943632.1451B0E7@webmail.messagingengine.com>
 <05ebcf5940e45a9083a65f6cc35eda367b44f9fc.camel@kernel.crashing.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 21 May 2018 13:58:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <05ebcf5940e45a9083a65f6cc35eda367b44f9fc.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18052118-0008-0000-0000-000009D38E09
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009062; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000261; SDB=6.01035652; UDB=6.00529739; IPR=6.00814780; 
 MB=3.00021227; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-21 18:58:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052118-0009-0000-0000-000047623D90
Message-Id: <db3ce0ae-9aba-c764-5e79-0140e095330e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-21_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805210224
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
X-List-Received-Date: Mon, 21 May 2018 18:58:19 -0000



On 05/21/2018 09:48 AM, Benjamin Herrenschmidt wrote:
> On Mon, 2018-05-21 at 14:56 +0930, Andrew Jeffery wrote:
>> On Fri, 18 May 2018, at 11:04, Benjamin Herrenschmidt wrote:
>>> Similarily to the new retry on SBE fifo errors, this adds
>>> retries if the data we obtain from the OCC has a bad checksum.
>>>
>>> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> ---
>>>   drivers/fsi/fsi-occ.c | 8 ++++++--
>>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
>>> index f4b2df7a3084..7a5afa78fb6b 100644
>>> --- a/drivers/fsi/fsi-occ.c
>>> +++ b/drivers/fsi/fsi-occ.c
>>> @@ -652,7 +652,7 @@ static void occ_worker(struct work_struct *work)
>>>   	struct occ_client *client;
>>>   	struct occ *occ = container_of(work, struct occ, work);
>>>   	struct device *sbefifo = occ->sbefifo;
>>> -
>>> +	int retries = 0;
>>>   again:
>>>   	if (occ->cancel)
>>>   		return;
>>> @@ -720,7 +720,10 @@ static void occ_worker(struct work_struct *work)
>>>   	xfr->resp_data_length = resp_data_length + 7;
>>>   
>>>   	rc = occ_verify_checksum(resp, resp_data_length);
>>> -
>>> +	if (rc) {
>>> +		if (retries++ < OCC_COMMAND_RETRIES)
>>> +			goto again;
>>> +	}
>> How should this interact with the OCC error handling mentioned in my
>> reply on the previous patch? I feel like a checksum error is a bit of
>> a grey area - probably caused by the transport, but possibly due to
>> OCC firmware bugs as well?
> Would it hurt to retry in any case ?
>
>>   If it's the former then retrying independent of the OCC error
>> handling protocol is probably okay, but if we're trying to catch the
>> latter then maybe we should let this be handled as part of the OCC
>> error handling code?
>>
>> Eddie?

The checksum is part of the OCC response, so it's not a transport thing. 
If we've gotten to checking the checksum then we've got a full response 
that looks valid so far (reasonable length, etc).

If we're trying to adhere to the OCC spec, then I'm of the opinion that 
we shouldn't do any retries except for those handled in the occ-hwmon 
driver.

>>
>> Ben: Did you actually hit cases where this path was triggered? There
>> was the corruption issue with simultaneous LPC cycles that turned out
>> to be issues around level-shifters and synchronisers, was that it?
> Yes, and I had cases where the CRC4 didn't "catch" the errors. The
> retry fixed it. Now with the FSI layer being much more reliable, it
> might be that all that retry stuff I added is no longer necessary, so I
> won't be fighting for it, though I did find the upper layer error
> handling to be somewhat lacking in efficacy...
>
> I plan to do a deep dive on the rest of the OCC driver this week
> regardless. I don't like a few things about it, such as the 2 layers
> between fsi-occ and sbe_p9, that should be just one (sadly this change
> will break the userspace binding code...).

What do you mean two layers? fsi-occ and occ-hwmon? I fear that the 
hwmon maintainer won't like having so much transport stuff (and a 
chardev) in the hwmon driver.

Thanks,
Eddie

>
> I'll see if I can figure out how that error hanlding works.
>
> Cheers,
> Ben.
>
>>>   done:
>>>   	mutex_unlock(&occ->occ_lock);
>>>   
>>> @@ -732,6 +735,7 @@ static void occ_worker(struct work_struct *work)
>>>   	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
>>>   	list_del(&xfr->link);
>>>   	empty = list_empty(&occ->xfrs);
>>> +	retries = 0;
>>>   
>>>   	spin_unlock_irqrestore(&occ->list_lock, flags);
>>>   
>>> -- 
>>> 2.17.0
>>>
