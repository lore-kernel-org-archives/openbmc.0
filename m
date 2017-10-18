Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yHD0J1YjmzDrG0
 for <openbmc@lists.ozlabs.org>; Thu, 19 Oct 2017 00:47:58 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9IDkgle146718
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 09:47:56 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dp4em7nrq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 18 Oct 2017 09:47:56 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 18 Oct 2017 07:47:55 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 18 Oct 2017 07:47:53 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9IDlrIT852302; Wed, 18 Oct 2017 06:47:53 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37FC1BE042;
 Wed, 18 Oct 2017 07:47:53 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id D9B7DBE039;
 Wed, 18 Oct 2017 07:47:52 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 2/3] drivers: fsi: sbefifo: Fix memory leak
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bradleyb@fuzziesquirrel.com
References: <1508276153-3779-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1508276153-3779-3-git-send-email-eajames@linux.vnet.ibm.com>
 <1508333045.24322.25.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 18 Oct 2017 08:47:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1508333045.24322.25.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17101813-0008-0000-0000-000008BAD396
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007914; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000237; SDB=6.00932918; UDB=6.00469846; IPR=6.00713208; 
 BA=6.00005646; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017590; XFM=3.00000015;
 UTC=2017-10-18 13:47:54
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17101813-0009-0000-0000-000044698FBF
Message-Id: <e38121a1-fed3-6ba9-0d49-c42b02d5c53e@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-18_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710180192
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
X-List-Received-Date: Wed, 18 Oct 2017 13:48:00 -0000



On 10/18/2017 08:24 AM, Andrew Jeffery wrote:
> On Tue, 2017-10-17 at 16:35 -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>   
>> Transfers weren't being cleaned up if they were complete but the user
>> never finished reading. This is very common.
> I'm curious as to why this is common, but regardless, the patch looks
> fine given the premise.

Users just seemed to do this very frequently, from my tracing. They just 
don't finish reading all the available data and instead just close the 
client. That's because the actual data packet is some number of words 
less than the amount of data read and returned by the SBEFIFO. In 
practice, a user should read all the extra bytes to check them to make 
sure the transfer was successful, but it's actually difficult to know 
how much extra data is there.

This only happens if the driver has actually read all the data out of 
the FIFO and therefore removed the transfer from it's queue.

Thanks,
Eddie

>
> Andrew
>
>>   
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/fsi/fsi-sbefifo.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>   
>> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
>> index c914eaf..764d8f3 100644
>> --- a/drivers/fsi/fsi-sbefifo.c
>> +++ b/drivers/fsi/fsi-sbefifo.c
>> @@ -321,6 +321,11 @@ static void sbefifo_client_release(struct kref *kref)
>>   
>>   	if (!READ_ONCE(sbefifo->rc)) {
>>   		list_for_each_entry(xfr, &client->xfrs, client) {
>> +			if (test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
>> +				kfree(xfr);
>> +				continue;
>> +			}
>> +
>>   			/*
>>   			 * The client left with pending or running xfrs.
>>   			 * Cancel them.
