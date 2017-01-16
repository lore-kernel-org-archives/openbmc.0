Return-Path: <mspinler@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2NvC57hWzDqR9
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 06:43:19 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v0GJcSr6126410
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 14:43:15 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2813rssp2y-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 16 Jan 2017 14:43:15 -0500
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Mon, 16 Jan 2017 12:43:15 -0700
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 16 Jan 2017 12:43:13 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 26A2F19D801C;
 Mon, 16 Jan 2017 12:42:29 -0700 (MST)
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v0GJhCZu11075934; Mon, 16 Jan 2017 12:43:12 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8D92BE042;
 Mon, 16 Jan 2017 12:43:12 -0700 (MST)
Received: from [9.10.99.159] (unknown [9.10.99.159])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 6ED08BE044;
 Mon, 16 Jan 2017 12:43:12 -0700 (MST)
Subject: Re: [PATCH] arm: dts: aspeed: witherspoon: Add devices
To: Joel Stanley <joel@jms.id.au>
References: <20170113192359.18149-1-mspinler@linux.vnet.ibm.com>
 <CACPK8XdNFcZjs7e3X4vWFzYjAyBL6KMyzJ91i=qNF43SZXEzeQ@mail.gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Mon, 16 Jan 2017 13:43:32 -0600
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CACPK8XdNFcZjs7e3X4vWFzYjAyBL6KMyzJ91i=qNF43SZXEzeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 17011619-0016-0000-0000-000005E1F2F8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006445; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000199; SDB=6.00808497; UDB=6.00393760; IPR=6.00585857; 
 BA=6.00005062; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013939; XFM=3.00000011;
 UTC=2017-01-16 19:43:14
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17011619-0017-0000-0000-0000368976D8
Message-Id: <71b0925f-8103-76ab-fe97-ecd1c30ff480@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-01-16_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
 definitions=main-1701160277
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
X-List-Received-Date: Mon, 16 Jan 2017 19:43:20 -0000


On 1/15/2017 6:02 PM, Joel Stanley wrote:
> On Sat, Jan 14, 2017 at 6:23 AM, Matt Spinler
> <mspinler@linux.vnet.ibm.com> wrote:
>> From: Matt Spinler <spinler@us.ibm.com>
>>
>> Add more I2C devices and the rear LEDs.
> Please make the subject line more descriptive. "add i2c and led devices".
Sure.  Was just trying to fit in the 50 characters.
>> Signed-off-by: Matt Spinler <spinler@us.ibm.com>
>> ---
>>   arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 39 ++++++++++++++++++++++--
>>   1 file changed, 36 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> index 9badf3e94599..11de7a957738 100644
>> --- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
>> @@ -19,6 +19,22 @@
>>          memory {
>>                  reg = <0x80000000 0x40000000>;
>>          };
>> +
>> +       leds {
>> +               compatible = "gpio-leds";
>> +
>> +               rear-fault-led {
> Follow the naming of the other machines. This should be "rear-fault".
>
> Are there other fault leds? If not, call it "fault".
There's also a set of front LEDs for these functions.  They're off of a 
9552 and just I haven't gotten to their representation yet.
When I eventually get the autogeneration of the device tree working, 
these names will be whatever they show up as in the MRW.
I will change these to 'rear-fault', etc.
>
>> +                       gpios = <&gpio ASPEED_GPIO(N, 2) GPIO_ACTIVE_LOW>;
> Did you attempt to compile this patch? It doesn't build for me, with
> the first error on this line.
Doh!  I merged it from another tree where I tested it, but missed 
updating the gpio include to the aspeed version.

>> +               };
>> +
>> +               rear-id-led {
> Same here. Call it "identify". as in the other dts.
Will change it to rear-identify as mentioned above.
>
>> +                       gpios = <&gpio ASPEED_GPIO(N, 4) GPIO_ACTIVE_LOW>;
>> +               };
>> +
>> +               rear-power-led {
> power.
Will be rear-power.
>
>> +                       gpios = <&gpio ASPEED_GPIO(N, 3) GPIO_ACTIVE_LOW>;
>> +               };
>> +       };
>>   };
>>
>>   &fmc {
>> @@ -115,25 +131,38 @@
>>                  compatible = "bosch,bmp180";
>>                  reg = <0x77>;
>>          };
>> +
>> +       max31785@52 {
>> +               compatible = "maxim,max31785";
>> +               reg = <0x52>;
>> +       };
>>   };
>>
>>   &i2c4 {
>>          status = "okay";
>>
>> -       /* CP1 TMP423A */
>>          /* CP1 VDN & VDDR */
>>          /* CP1 VDD & VCS */
>>          /* CP1 VIO */
>> +
>> +       tmp423a@4c {
>> +               compatible = "ti,tmp423";
>> +               reg = <0x4c>;
>> +       };
>>   };
>>
>>
>>   &i2c5 {
>>          status = "okay";
>>
>> -       /* CP1 TMP423A */
>>          /* CP1 VDN & VDDR */
>>          /* CP1 VDD & VCS */
>>          /* CP1 VIO */
>> +
>> +       tmp423a@4c {
>> +               compatible = "ti,tmp423";
>> +               reg = <0x4c>;
>> +       };
>>   };
>>
>>   &i2c6 {
>> @@ -152,13 +181,17 @@
>>   &i2c9 {
>>          status = "okay";
>>
>> -       /* Tmp275 */
>>
>>          /* MUX
>>           *    -> PCIe Slot 3
>>           *    -> PCIe Slot 4
>>           *    -> PCA9517 -> PEX8725
>>           */
>> +
>> +       tmp275@4a {
>> +               compatible = "ti,tmp275";
>> +               reg = <0x4a>;
>> +       };
>>   };
>>
>>   &i2c10 {
>> --
>> 2.11.0
>>
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
