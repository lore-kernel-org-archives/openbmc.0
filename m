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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Xwpd0qNSzDqGZ
 for <openbmc@lists.ozlabs.org>; Tue,  2 Apr 2019 02:13:44 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x31F65Ij132079
 for <openbmc@lists.ozlabs.org>; Mon, 1 Apr 2019 11:13:42 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rkmtfhfsc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 01 Apr 2019 11:13:42 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 1 Apr 2019 16:13:41 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Apr 2019 16:13:40 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x31FDdhh24969218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Apr 2019 15:13:39 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02EDE28066;
 Mon,  1 Apr 2019 15:13:39 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A23DE28058;
 Mon,  1 Apr 2019 15:13:38 +0000 (GMT)
Received: from [9.41.179.222] (unknown [9.41.179.222])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Apr 2019 15:13:38 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 v2 5/5] ARM: dts: romulus: Enable video engine
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1553894143-559-1-git-send-email-eajames@linux.ibm.com>
 <1553894143-559-6-git-send-email-eajames@linux.ibm.com>
 <CACPK8Xf_yDn4Ss=tBHCWZQEw3C8K_wcBpKBh+AjP0wq0g7pOqQ@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 1 Apr 2019 10:13:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xf_yDn4Ss=tBHCWZQEw3C8K_wcBpKBh+AjP0wq0g7pOqQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19040115-0040-0000-0000-000004DA403F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010855; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000283; SDB=6.01182825; UDB=6.00619101; IPR=6.00963567; 
 MB=3.00026246; MTD=3.00000008; XFM=3.00000015; UTC=2019-04-01 15:13:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19040115-0041-0000-0000-000008E565F4
Message-Id: <8b989f67-f15c-49b8-8bb2-e1b694d6a859@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-01_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904010102
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
X-List-Received-Date: Mon, 01 Apr 2019 15:13:45 -0000


On 4/1/19 1:27 AM, Joel Stanley wrote:
> On Fri, 29 Mar 2019 at 21:15, Eddie James <eajames@linux.ibm.com> wrote:
>> Enable the video engine and add it's required reserved memory region.
> The upstream bindings don't mention the reserved memory region at all.
Whoops... I'll have to send a patch for that upstream.
>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index ee1a460..54427f4 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -42,6 +42,13 @@
>>                          compatible = "shared-dma-pool";
>>                          reusable;
>>                  };
>> +
>> +               ve_memory: jpegbuffer {
> video_memory or video_engine_memory
>
>> +                       size = <0x04000000>;    /* 64M */
> How do we get to 64MB?
OK it looks like we can get away with 32MB. I hadn't run the 
calculations since the beginning of working on this driver where I was 
using a lot more memory for fixed buffers. But we do need 32MB since we 
need two source buffers of up to 1920x1200x32bpp.
>
>
>> +                       alignment = <0x01000000>;
>> +                       compatible = "shared-dma-pool";
>> +                       reusable;
>> +               };
>>          };
>>
>>          leds {
>> @@ -315,4 +322,9 @@
>>        memory-region = <&gfx_memory>;
>>   };
>>
>> +&video {
>> +       status = "okay";
>> +       memory-region = <&ve_memory>;
>> +};
>> +
>>   #include "ibm-power9-dual.dtsi"
>> --
>> 1.8.3.1
>>
