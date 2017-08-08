Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xRcYp70XSzDqyJ
 for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2017 00:42:22 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v78EdUJ2033903
 for <openbmc@lists.ozlabs.org>; Tue, 8 Aug 2017 10:42:20 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2c7f3v8wh8-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 Aug 2017 10:42:20 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 8 Aug 2017 10:42:19 -0400
Received: from b01cxnp23032.gho.pok.ibm.com (9.57.198.27)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 Aug 2017 10:42:17 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v78EgG1823527558; Tue, 8 Aug 2017 14:42:16 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53C22112040;
 Tue,  8 Aug 2017 10:42:08 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id DB4B4112034;
 Tue,  8 Aug 2017 10:42:07 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] drivers/fsi/scom: Remove reset before
 every putscom
To: Joel Stanley <joel@jms.id.au>
Cc: Jeremy Kerr <jk@ozlabs.org>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
 "Edward A. James" <eajames@us.ibm.com>,
 Christopher Bostic <cbostic@linux.vnet.ibm.com>
References: <1500562258-20214-1-git-send-email-eajames@linux.vnet.ibm.com>
 <ed57c99d-4ff6-300e-71c8-7afde6a61bed@ozlabs.org>
 <b8ec235e-b4bb-2fd3-75f5-54d96d500522@linux.vnet.ibm.com>
 <CACPK8XfE_f0sLWD5ffk3PL4jSenKo2u0rt1xj4EXmdPHbgBPeQ@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 8 Aug 2017 09:42:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <CACPK8XfE_f0sLWD5ffk3PL4jSenKo2u0rt1xj4EXmdPHbgBPeQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17080814-2213-0000-0000-00000206652D
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007507; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000217; SDB=6.00899367; UDB=6.00450156; IPR=6.00679573; 
 BA=6.00005519; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016596; XFM=3.00000015;
 UTC=2017-08-08 14:42:18
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17080814-2214-0000-0000-000057269940
Message-Id: <0704428e-aef6-dbe3-2df0-691570511024@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-08-08_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1706020000
 definitions=main-1708080237
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
X-List-Received-Date: Tue, 08 Aug 2017 14:42:23 -0000



On 08/08/2017 07:24 AM, Joel Stanley wrote:
> Hello Eddie,
>
> On Sat, Jul 29, 2017 at 12:30 AM, Eddie James
> <eajames@linux.vnet.ibm.com> wrote:
>> On 07/27/2017 09:10 PM, Jeremy Kerr wrote:
>>>> Reset causes problems for operations requiring multiple scoms (e.g. i2c
>>>> over scom). Instead, reset scom engine during probe.
>>> Looks good to me. Out of curiosity, what kind of problems?
>>
>> Mainly I2C bus arbitration errors. I guess the reset interrupted the I2C
>> clock line control during an operation.
> I've applied this to dev-4.10. One clarification:
>
>> @@ -202,6 +197,9 @@ static int scom_probe(struct device *dev)
>>          scom->mdev.parent = dev;
>>          list_add(&scom->link, &scom_devices);
>>
>> +       data = cpu_to_be32(SCOM_RESET_CMD);
>> +       fsi_device_write(fsi_dev, SCOM_RESET_REG, &data, sizeof(uint32_t));
>> +
>>          return misc_register(&scom->mdev);
> I wanted to check that you were ignoring the return value of
> fsi_device_write here intentionally. If not, please send a follow up
> that adds a check.

That is correct, I did not want to check the return value.

Thanks,
Eddie

>
> Cheers,
>
> Joel
>
