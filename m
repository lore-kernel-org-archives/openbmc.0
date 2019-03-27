Return-Path: <eajames@linux.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44Trvw1C2kzDqCq
 for <openbmc@lists.ozlabs.org>; Thu, 28 Mar 2019 02:07:39 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x2RF2uLb077479
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 11:07:37 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2rgaxa9xj0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 27 Mar 2019 11:07:36 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.ibm.com>;
 Wed, 27 Mar 2019 15:07:32 -0000
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 27 Mar 2019 15:07:31 -0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x2RF7Uwq30277720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Mar 2019 15:07:30 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9F2E1136053;
 Wed, 27 Mar 2019 15:07:30 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7AFD13604F;
 Wed, 27 Mar 2019 15:07:29 +0000 (GMT)
Received: from [9.85.177.180] (unknown [9.85.177.180])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 27 Mar 2019 15:07:29 +0000 (GMT)
Subject: Re: [PATCH dev-5.0 7/7] ARM: dts: romulus: Enable video engine
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Jeremy Kerr <jk@ozlabs.org>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <1553196610-29595-1-git-send-email-eajames@linux.ibm.com>
 <1553196610-29595-8-git-send-email-eajames@linux.ibm.com>
 <CACPK8Xd2ULjzCVEDdDYXNXMcgqjM4NkbApfO826bNs2PNNtHUQ@mail.gmail.com>
From: Eddie James <eajames@linux.ibm.com>
Date: Wed, 27 Mar 2019 10:07:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xd2ULjzCVEDdDYXNXMcgqjM4NkbApfO826bNs2PNNtHUQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19032715-0004-0000-0000-000014F3D81B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010823; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000282; SDB=6.01180449; UDB=6.00617763; IPR=6.00961166; 
 MB=3.00026180; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-27 15:07:32
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032715-0005-0000-0000-00008B0C625E
Message-Id: <b74842c0-2060-82fa-3509-355659d3cddf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-03-27_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1903270106
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
X-List-Received-Date: Wed, 27 Mar 2019 15:07:40 -0000


On 3/27/19 1:11 AM, Joel Stanley wrote:
> On Thu, 21 Mar 2019 at 19:30, Eddie James <eajames@linux.ibm.com> wrote:
>> Enable the video engine and set it's required memory-region property.
>>
>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> index ee1a460..6b24608 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts
>> @@ -37,7 +37,7 @@
>>                  };
>>
>>                  gfx_memory: framebuffer {
>> -                       size = <0x01000000>;
>> +                       size = <0x04000000>;
> You're using the memory region we have set aside for the gfx device -
> the thing that you plug a monitor into the back of a machine with. Are
> you sure that is what we want to do?

It still has to be allocated in the kernel, right? I'm assuming that the 
kernel won't give memory areas we've grabbed with the gfx driver to the 
video driver, and same in reverse. I could add a separate memory region 
too, this just seemed convenient.

>
>>                          alignment = <0x01000000>;
>>                          compatible = "shared-dma-pool";
>>                          reusable;
>> @@ -315,4 +315,9 @@
>>        memory-region = <&gfx_memory>;
>>   };
>>
>> +&video {
>> +       status = "okay";
>> +       memory-region = <&gfx_memory>;
>> +};
>> +
>>   #include "ibm-power9-dual.dtsi"
>> --
>> 1.8.3.1
>>
