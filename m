Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xxQv119WczDq8f
 for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2017 00:56:44 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v8JEtAeQ020661
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 10:56:42 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2d354d9cam-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 19 Sep 2017 10:56:42 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 19 Sep 2017 08:56:41 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 19 Sep 2017 08:56:40 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v8JEudBj64946202; Tue, 19 Sep 2017 07:56:39 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8395F6E041;
 Tue, 19 Sep 2017 08:56:39 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.174.252])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP id 13E6E6E035;
 Tue, 19 Sep 2017 08:56:38 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10] drivers/hwmon/occ: Switch to non-blocking
 for occ reads
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@us.ibm.com>
References: <1505769141-1288-1-git-send-email-eajames@linux.vnet.ibm.com>
 <aa870aa4-0eac-9d99-0133-eac71f05bec0@ozlabs.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 19 Sep 2017 09:56:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <aa870aa4-0eac-9d99-0133-eac71f05bec0@ozlabs.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17091914-0012-0000-0000-000015076449
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007762; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000230; SDB=6.00919313; UDB=6.00461866; IPR=6.00699539; 
 BA=6.00005598; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017211; XFM=3.00000015;
 UTC=2017-09-19 14:56:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17091914-0013-0000-0000-00004F8CF3E2
Message-Id: <a8ccb051-f52a-0b1c-9dd2-b370217bbb39@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-09-19_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1709190212
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
X-List-Received-Date: Tue, 19 Sep 2017 14:56:45 -0000



On 09/19/2017 02:13 AM, Jeremy Kerr wrote:
> Hi Eddie,
>
>> It's possible for the sbefifo ops to hang entirely if the system goes
>> down (checkstop, etc), meaning that the occ and occ-hwmon drivers may
>> hang during remove().
> How does this address that though? Your comment implies that a thread is
> stuck in occ_drv_read, is that correct?

Correct.

>
> I see that you're now opening in non-blocking mode, but:
>
>> -	rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
>> -	if (rc < 0)
>> -		goto err;
>> +	do {
>> +		rc = occ_drv_read(client, (char *)resp, sizeof(*resp));
>> +		if (rc != -EAGAIN)
>> +			break;
>> +
>> +		set_current_state(TASK_INTERRUPTIBLE);
>> +		schedule_timeout(msecs_to_jiffies(OCC_CMD_INCOMPLETE_MS));
>> +	} while (!p9_sbe_occ->cancel);
> - the only way that you hit the !p9_sbe_occ->cancel condition is if
> we've run the ->remove callback, in which case we *definitely* shouldn't
> have threads still referencing the device.

Hmm. In this error case, remove() is called from the sysfs unbind 
pathway. I could be wrong, but I don't see anything in the kernel to 
block in or return from unbind if there are hwmon files open. So I think 
it's possible to get to remove() with threads hanging around.

> There seems to be nothing
> preventing p9_sbe_occ from being free()ed underneath you.

That is true... Most likely we get lucky due to trying to remove hwmon 
files before freeing p9_sbe_occ... I'll have to fix this.

Thanks for the review!
Eddie

>
> If this patch works, it suggests that there's either a
> reference-counting issue, or a memory leak.
>
> Regards,
>
>
> Jeremy
>
