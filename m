Return-Path: <vishwa@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wTJy45LWMzDqFT
 for <openbmc@lists.ozlabs.org>; Fri, 19 May 2017 04:05:32 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v4IHwkn2146320
 for <openbmc@lists.ozlabs.org>; Thu, 18 May 2017 14:05:23 -0400
Received: from e23smtp09.au.ibm.com (e23smtp09.au.ibm.com [202.81.31.142])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ahfw4stwa-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 18 May 2017 14:05:23 -0400
Received: from localhost
 by e23smtp09.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <vishwa@linux.vnet.ibm.com>;
 Fri, 19 May 2017 04:05:21 +1000
Received: from d23relay09.au.ibm.com (202.81.31.228)
 by e23smtp09.au.ibm.com (202.81.31.206) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 Fri, 19 May 2017 04:05:20 +1000
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v4II5CIY61210756
 for <openbmc@lists.ozlabs.org>; Fri, 19 May 2017 04:05:20 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v4II4kG1001277
 for <openbmc@lists.ozlabs.org>; Fri, 19 May 2017 04:04:46 +1000
Received: from [9.77.196.170] ([9.77.196.170])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 v4II4if5000854; Fri, 19 May 2017 04:04:45 +1000
Subject: Re: [PATCH] witherspoon: leds: Use underscore in led names than hyphen
To: Jeremy Kerr <jk@ozlabs.org>, openbmc@lists.ozlabs.org
References: <1494407411-2614-1-git-send-email-vishwa@linux.vnet.ibm.com>
 <dcb1228b-6c75-4c5d-ff6f-b44f72c56b24@ozlabs.org>
From: vishwa <vishwa@linux.vnet.ibm.com>
Date: Thu, 18 May 2017 23:35:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <dcb1228b-6c75-4c5d-ff6f-b44f72c56b24@ozlabs.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
x-cbid: 17051818-0052-0000-0000-0000024029B4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17051818-0053-0000-0000-0000081C8B29
Message-Id: <be4e7df8-ae7d-5670-05d0-78714b8fa916@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-05-18_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1705180120
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
X-List-Received-Date: Thu, 18 May 2017 18:05:33 -0000

hello Jeremy,

%I does not help me. I had tried with that before. But I am now thinking 
of a work-around that does not need this dev tree change. I will give it 
a try.

Thank you for reviewing.

On 05/17/2017 06:23 AM, Jeremy Kerr wrote:
> Hi Vishwa,
>
> [reply-to-all this time, sorry for the duplicate, Vishwa]
>
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -50,15 +50,15 @@
>>   	leds {
>>   		compatible = "gpio-leds";
>>   
>> -		rear-fault {
>> +		rear_fault {
>>   			gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
>>   		};
> This is somewhat contrary to device-tree convention, where nodes (and
> properties, and compatible values) are generally hyphen-separated.
>
> Can we deal with this another way? Perhaps we can use the '%I' specifier
> in the systemd unit file, which bypasses the escaping?
>
> Cheers,
>
>
> Jeremy
>
>
