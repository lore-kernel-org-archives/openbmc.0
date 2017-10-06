Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7Vxq3npSzDqqL
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 11:34:06 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v960TAGS126811
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 20:34:04 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ddvq3pj5q-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 20:34:04 -0400
Received: from localhost
 by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:34:03 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:34:01 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v960Y0ZY41025594; Fri, 6 Oct 2017 00:34:00 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88BF2B2050;
 Thu,  5 Oct 2017 20:31:18 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 2DCFAB204D;
 Thu,  5 Oct 2017 20:31:18 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v3 24/31] drivers: fsi: occ: Remove
 unnecessary platform_set_drvdata call
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-25-git-send-email-eajames@linux.vnet.ibm.com>
 <1507245291.5452.111.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 5 Oct 2017 19:33:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1507245291.5452.111.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17100600-0008-0000-0000-0000028BD1DE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927027; UDB=6.00466424; IPR=6.00707281; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017414; XFM=3.00000015;
 UTC=2017-10-06 00:34:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100600-0009-0000-0000-000036EB79B1
Message-Id: <db8ca08a-e913-312a-4aa3-8c503003f00b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-05_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710060005
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
X-List-Received-Date: Fri, 06 Oct 2017 00:34:08 -0000



On 10/05/2017 06:14 PM, Andrew Jeffery wrote:
> On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>   
>> The purpose was to set that pointer null before probing. However, it is
>> set null by the kernel by default.
>>   
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/fsi/occ.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>   
>> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
>> index 916c342..561b029 100644
>> --- a/drivers/fsi/occ.c
>> +++ b/drivers/fsi/occ.c
>> @@ -703,9 +703,6 @@ static int occ_probe(struct platform_device *pdev)
>>   	mutex_init(&occ->occ_lock);
>>   	INIT_WORK(&occ->work, occ_worker);
>>   
>> -	/* ensure NULL before we probe children, so they don't hang FSI */
>> -	platform_set_drvdata(pdev, NULL);
>> -
> Bizarre that it was even there in the first place - do you know the history of
> the comment?

I made the comment. I wasn't sure if there were situations where that 
wouldn't be NULL before probe() somehow. Regarding the hanging FSI... 
that was before some FSI core fixes were in that prevent that situation 
during probe().

>
>>   	if (dev->of_node) {
>>   		rc = of_property_read_u32(dev->of_node, "reg", &reg);
>>   		if (!rc) {
