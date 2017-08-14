Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xWJt53zPSzDqSb
 for <openbmc@lists.ozlabs.org>; Tue, 15 Aug 2017 01:09:17 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v7EF8OTa035958
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 11:09:14 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2cbe85r19t-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 14 Aug 2017 11:09:14 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 14 Aug 2017 09:09:13 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 14 Aug 2017 09:09:11 -0600
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v7EF9BP063504406; Mon, 14 Aug 2017 08:09:11 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B498BE03B;
 Mon, 14 Aug 2017 09:09:11 -0600 (MDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id B1F34BE038;
 Mon, 14 Aug 2017 09:09:10 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.10 v5 1/4] dt-bindings: i2c: Document the IBM
 CCF power supply version 1
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>, bjwyman@gmail.com
References: <1502474205-1557-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502474205-1557-2-git-send-email-eajames@linux.vnet.ibm.com>
 <1502696018.14932.20.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 14 Aug 2017 10:09:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1502696018.14932.20.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17081415-0004-0000-0000-000012BF2B95
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007543; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000220; SDB=6.00902227; UDB=6.00451855; IPR=6.00682443; 
 BA=6.00005531; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016689; XFM=3.00000015;
 UTC=2017-08-14 15:09:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17081415-0005-0000-0000-000080AE5328
Message-Id: <86d0c243-b6d6-0b24-388f-a3f3ade04164@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-14_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708140245
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
X-List-Received-Date: Mon, 14 Aug 2017 15:09:18 -0000



On 08/14/2017 02:33 AM, Andrew Jeffery wrote:
> On Fri, 2017-08-11 at 12:56 -0500, Eddie James wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>   
>>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   .../devicetree/bindings/i2c/ibm,cffps1.txt          | 21
> +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>   create mode 100644
> Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
>>   
>> diff --git a/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
> b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
>> new file mode 100644
>> index 0000000..f68a0a6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/ibm,cffps1.txt
>> @@ -0,0 +1,21 @@
>> +Device-tree bindings for IBM Common Form Factor Power Supply Version
> 1
>> +------------------------------------------------------------------
> ----
>> +
>> +Required properties:
>> + - compatible = "ibm,cffps1";
>>> + - reg = < I2C bus address >;		: Address of the
> power supply on the
>>> +					  I2C bus.
> Should we define properties for these registers?
>
> * OPERATION
> * ON_OFF_CONFIG
> * SYS_CONFIG

We could I suppose. I don't see why though; is it normal to document 
specific registers on devices? And why just those ones? The driver 
doesn't use them. Presumably someone who wants to use them can look at 
the spec.

Thanks for the review!
Eddie

>
> Cheers,
>
> Andrew
>
>> +
>> +Example:
>> +
>>> +    i2c-bus@100 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        #interrupt-cells = <1>;
>> +        < more properties >
>> +
>>> +        power-supply@68 {
>> +            compatible = "ibm,cffps1";
>> +            reg = <0x68>;
>> +        };
>> +    };
