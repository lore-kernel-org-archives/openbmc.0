Return-Path: <cbostic@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wY2vr2cl2zDqdR
 for <openbmc@lists.ozlabs.org>; Thu, 25 May 2017 05:46:31 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4OJhauY120053
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 15:46:29 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2angj904m5-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 24 May 2017 15:46:28 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 24 May 2017 15:46:28 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 24 May 2017 15:46:25 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4OJkO7h64749616; Wed, 24 May 2017 19:46:25 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53806B2050;
 Wed, 24 May 2017 15:44:02 -0400 (EDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.41.175.240])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 12245B2046;
 Wed, 24 May 2017 15:44:02 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] drivers/watchdog: Add user space access to
 aspeed ext signal and reset
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
References: <20170523212845.89898-1-cbostic@linux.vnet.ibm.com>
 <1495579753.7794.1.camel@aj.id.au>
Cc: openbmc@lists.ozlabs.org
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 24 May 2017 14:46:23 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1495579753.7794.1.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17052419-0040-0000-0000-00000348A942
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007112; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00865095; UDB=6.00429519; IPR=6.00644876; 
 BA=6.00005372; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015569; XFM=3.00000015;
 UTC=2017-05-24 19:46:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17052419-0041-0000-0000-0000073CDE78
Message-Id: <3e847c1b-89c9-dade-583c-a44f9e6170ce@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-24_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705240094
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 24 May 2017 19:46:32 -0000



On 5/23/17 5:49 PM, Andrew Jeffery wrote:
> On Tue, 2017-05-23 at 16:28 -0500, Christopher Bostic wrote:
>> Add sysfs files for 'ext signal' mode and 'system reset' mode within
>> the aspeed watchdog device driver for wdt1 and wdt2
> This commit message explains what the patch does, not why we need it.
> The code change already describes what it does, so can you please
> instead outline in the commit message what the motivation is (or
> potential motivations are). Ultimately what I'm interested in is
> whether this should be a platform design decision (and so should be
> managed via devicetree), or userspace policy, which is what we have
> here.
>
> Separately, given it's fairly generic and assuming the motivation is
> reasonable, I'd suggest also sending it upstream.

Hi Andrew,

Will change the 'what' to 'why' as per your recommendations.

> Andrew
>
>>> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
>> + wdt->ctrl |= WDT_CTRL_WDT_EXT;
>>> +		writel(wdt->ctrl, wdt->base + WDT_CTRL);
>>> +	} else if (!strncmp(buf, "off", strlen("off"))) {
>>> +		wdt->ctrl &= ~WDT_CTRL_WDT_EXT;
>>> +		writel(wdt->ctrl, wdt->base + WDT_CTRL);
>>> +	} else {
>>> +		dev_warn(dev, "Unknown reset system mode command: %s\n", buf);
>>> +		return -EINVAL;
>>> +	}
>> +
>>> +	return count;
>> +}
>> +
>> +static ssize_t aspeed_wdt_ext_signal_show(struct device *dev,
>>> +					  struct device_attribute *attr,
>>> +					  char *buf)
>> +{
>>> +	struct platform_device *pdev = to_platform_device(dev);
>>> +	struct aspeed_wdt *wdt = platform_get_drvdata(pdev);
>>> +	int ret;
>> +
>>> +	if (readl(wdt->base + WDT_CTRL) & WDT_CTRL_WDT_EXT)
>>> +		ret = sprintf(buf, "on\n");
>>> +	else
>>> +		ret = sprintf(buf, "off\n");
>> +
>>> +	return ret;
>> +}
>> +
>> +static DEVICE_ATTR(ext_signal, 0644,
>> +		   aspeed_wdt_ext_signal_show, aspeed_wdt_ext_signal_store);
> The on/off implementations for show/store callbacks are very similar,
> only differentiated by the bit that we're flipping. We could almost cut
> the code in half by parameterising a function with the bit of interest
> and invoking it appropriately in the callback handlers. Thoughts?

True, will optimize this.

Thanks,
Chris

>
> Andrew
>
>> +
>> +static struct attribute *aspeed_wdt_attrs[] = {
>>> +	&dev_attr_reset_system.attr,
>>> +	&dev_attr_ext_signal.attr,
>>> +	NULL
>> +};
>> +ATTRIBUTE_GROUPS(aspeed_wdt);
>> +
>>   static int aspeed_wdt_probe(struct platform_device *pdev)
>>   {
>>>   	struct aspeed_wdt *wdt;
>> @@ -169,7 +256,7 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>>>   	wdt->wdd.ops = &aspeed_wdt_ops;
>>>   	wdt->wdd.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT_MS;
>>>   	wdt->wdd.parent = &pdev->dev;
>> -
>>> +	wdt->wdd.groups = aspeed_wdt_groups;
>>>   	wdt->wdd.timeout = WDT_DEFAULT_TIMEOUT;
>>>   	watchdog_init_timeout(&wdt->wdd, 0, &pdev->dev);
>>   
