Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3whGSQ1PRHzDqKp
 for <openbmc@lists.ozlabs.org>; Mon,  5 Jun 2017 23:51:17 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v55DoR31083952
 for <openbmc@lists.ozlabs.org>; Mon, 5 Jun 2017 09:51:15 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2aw3p4cd1b-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 05 Jun 2017 09:51:15 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 5 Jun 2017 09:51:13 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 5 Jun 2017 09:51:11 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v55Dp0C134668760; Mon, 5 Jun 2017 13:51:10 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14AC8124035;
 Mon,  5 Jun 2017 09:48:45 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id AC28B124044;
 Mon,  5 Jun 2017 09:48:44 -0400 (EDT)
Subject: Re: Enabling p9 OCC hwmon
To: Joel Stanley <joel@jms.id.au>, Edward James <eajames@us.ibm.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <CACPK8XewcZ51qZqQHBzn5EuPvJw+P+ue+B87v=NRKrPZSNzYYg@mail.gmail.com>
 <CACPK8Xe2V_C=CN7VfdhMqx7=iR4DQpYLnKpPvE4u44tiKga0cw@mail.gmail.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 5 Jun 2017 08:51:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <CACPK8Xe2V_C=CN7VfdhMqx7=iR4DQpYLnKpPvE4u44tiKga0cw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17060513-0056-0000-0000-0000037D81E6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007177; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00870491; UDB=6.00432852; IPR=6.00650473; 
 BA=6.00005398; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015708; XFM=3.00000015;
 UTC=2017-06-05 13:51:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060513-0057-0000-0000-000007B386F7
Message-Id: <3a4c1cf0-2c44-48a7-a0b9-1560f7e19a77@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706050262
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
X-List-Received-Date: Mon, 05 Jun 2017 13:51:18 -0000

Hi Joel,

For the config, you needed both SENSORS_OCC and SENSORS_OCC_P9_SBE. I 
thought this worked fine for me... For the P8 version (I will post it 
once I've tested it) you will need both SENSORS_OCC and 
SENSORS_OCC_P8_I2C, so your current version won't work for P8, but I can 
change it in the P8 patchset.

Sorry about the warnings. Using the openbmc build to build the kernel no 
longer provides warnings in the compile log I guess, it used to do so. 
I'll fix those up.

Thanks!

Eddie


On 06/05/2017 08:11 AM, Joel Stanley wrote:
> On Mon, Jun 5, 2017 at 5:46 PM, Joel Stanley <joel@jms.id.au> wrote:
>> Hi Eddie,
>>
>> As of 763d6007e084f480b7129f35560c30ce30938509 the kernel tree has all
>> of the drivers that have been posted to the list staged, as far as I
>> could tell.
>>
>> I was attempting to enable the OCC hwmon driver, but it is behind a
>> config symbol that does not exist:
>>
>> $ git grep CONFIG_SENSORS_OCC_P9_SBE
>> drivers/hwmon/occ/Makefile:ifeq ($(CONFIG_SENSORS_OCC_P9_SBE), y)
>>
>> Can you work out what has happened here?
> I made a patch that fixes the issue for now:
>
>   http://patchwork.ozlabs.org/patch/771128/
>
> This my not be the fix you want once you've integrated the p8 version.
> Do you plan on posting the p8 OCC patches?
>
> In addition, we need to fix these sparse warnings:
>
> $ make C=2  drivers/hwmon/occ/
>    CHECK   drivers/hwmon/occ/p9.c
>    CHECK   drivers/hwmon/occ/p9_sbe.c
>    CHECK   drivers/hwmon/occ/common.c
> drivers/hwmon/occ/p9.c:99:23: warning: cast to restricted __be16
> drivers/hwmon/occ/p9.c:96:23: warning: cast to restricted __be32
> drivers/hwmon/occ/p9.c:63:23: warning: cast to restricted __be32
> drivers/hwmon/occ/p9.c:181:23: warning: cast to restricted __be16
> drivers/hwmon/occ/p9.c:178:23: warning: cast to restricted __be16
> drivers/hwmon/occ/p9.c:175:23: warning: cast to restricted __be16
> drivers/hwmon/occ/p9.c:172:23: warning: cast to restricted __be16
> drivers/hwmon/occ/p9.c:169:23: warning: cast to restricted __be16
> drivers/hwmon/occ/p9.c:166:23: warning: cast to restricted __be16
> drivers/hwmon/occ/p9.c:140:23: warning: cast to restricted __be16
> drivers/hwmon/occ/p9.c:137:23: warning: cast to restricted __be64
> drivers/hwmon/occ/p9.c:134:23: warning: cast to restricted __be32
> drivers/hwmon/occ/p9.c:125:23: warning: cast to restricted __be32
> drivers/hwmon/occ/p9.c:210:5: warning: symbol
> 'p9_occ_setup_sensor_attrs' was not declared. Should it be static?
> drivers/hwmon/occ/common.c:77:24: warning: incorrect type in
> assignment (different base types)
> drivers/hwmon/occ/common.c:77:24:    expected unsigned short
> [unsigned] [usertype] user_power_cap
> drivers/hwmon/occ/common.c:77:24:    got restricted __be16 [usertype] <noident>
>
> Cheers,
>
> Joel
>
