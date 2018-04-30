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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ZcgT3MCDzF2QF
 for <openbmc@lists.ozlabs.org>; Tue,  1 May 2018 07:12:20 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w3UL9YXm123810
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 17:12:17 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2hp7x3pvv6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 30 Apr 2018 17:12:17 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 30 Apr 2018 17:12:17 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 30 Apr 2018 17:12:14 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w3ULCDOd51642420; Mon, 30 Apr 2018 21:12:14 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF80CB2052;
 Mon, 30 Apr 2018 18:14:14 -0400 (EDT)
Received: from [9.41.241.240] (unknown [9.41.241.240])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 3D036B204E;
 Mon, 30 Apr 2018 18:14:14 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.13 v3] fsi: occ: Use PutOCCSRAM in circular
 mode for OCC attention
To: Matt Spinler <mspinler@linux.vnet.ibm.com>,
 Andrew Jeffery <andrew@aj.id.au>
Cc: "Edward A . James" <eajames@us.ibm.com>, openbmc@lists.ozlabs.org
References: <20180427144559.25907-1-andrew@aj.id.au>
 <f16c3ac779c7bbedc8cc9b1fd2f82bcf@linux.vnet.ibm.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 30 Apr 2018 16:12:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <f16c3ac779c7bbedc8cc9b1fd2f82bcf@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18043021-0024-0000-0000-000003517F5F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008953; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01025620; UDB=6.00523751; IPR=6.00804851; 
 MB=3.00020870; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-30 21:12:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18043021-0025-0000-0000-000047D98198
Message-Id: <2524f40e-2ff3-698d-1d40-4722e65be614@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-04-30_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804300203
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2018 21:12:22 -0000



On 04/27/2018 02:56 PM, Matt Spinler wrote:
> Reviewed-by: Matt Spinler mspinler@linux.vnet.ibm.com
>
> On 2018-04-27 09:45, Andrew Jeffery wrote:
>> We can't do SCOMs from the BMC when the host is booted in secure mode,
>> and without triggering the attention of the OCC our commands won't be
>> processed. Further, the SCOM operation fails, which causes the OCC
>> driver's probe to fail, which leads the BMC to think that the OCC has
>> failed.
>>
>> We have an alternative to the SCOM though: We can trigger the OCC by
>> writing the correct attention magic in circular buffer mode.
>>
>> The PutOCCSRAM operation returns the written data length in the response
>> payload before the 0xCODE word, so the condition testing the success of
>> the operation is rearranged.

Thanks Andrew, looks good.

Reviewed-by: Eddie James <eajames@linux.vnet.ibm.com>

>>
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>> ---
>>
>> v3:
>> * Address Matt Spinler's feedback that the address field is ignored 
>> in mode 3
>>
>> Tested on two Witherspoon systems, one with secure-boot enabled and 
>> one without
>>
>> v2:
>> * Minor typo and documentation cleanups
>>
>>  drivers/fsi/fsi-occ.c | 22 +++++++++-------------
>>  1 file changed, 9 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
>> index 45ae13cd7a3d..938601fd7347 100644
>> --- a/drivers/fsi/fsi-occ.c
>> +++ b/drivers/fsi/fsi-occ.c
>> @@ -575,19 +575,16 @@ static int occ_putsram(struct device *sbefifo,
>> u32 address, u8 *data,
>>  static int occ_trigger_attn(struct device *sbefifo)
>>  {
>>      int rc;
>> -    __be32 buf[6];
>> +    __be32 buf[7];
>>      struct sbefifo_client *client;
>>
>> -    /*
>> -     * Magic sequence to do SBE putscom command. SBE will write 8 
>> bytes to
>> -     * specified SCOM address.
>> -     */
>> -    buf[0] = cpu_to_be32(0x6);
>> -    buf[1] = cpu_to_be32(0xa202);
>> -    buf[2] = 0;
>> -    buf[3] = cpu_to_be32(0x6D035);
>> -    buf[4] = cpu_to_be32(0x20010000);    /* trigger occ attention */
>> -    buf[5] = 0;
>> +    buf[0] = cpu_to_be32(0x5 + 0x2);        /* Chip-op length in 
>> words */
>> +    buf[1] = cpu_to_be32(0xa404);           /* PutOCCSRAM */
>> +    buf[2] = cpu_to_be32(0x3);              /* Mode: Circular */
>> +    buf[3] = cpu_to_be32(0x0);              /* Address: ignored in 
>> mode 3 */
>> +    buf[4] = cpu_to_be32(0x8);              /* Data length in bytes */
>> +    buf[5] = cpu_to_be32(0x20010000);       /* Trigger OCC attention */
>> +    buf[6] = 0;
>>
>>      client = sbefifo_drv_open(sbefifo, 0);
>>      if (!client)
>> @@ -602,8 +599,7 @@ static int occ_trigger_attn(struct device *sbefifo)
>>          goto done;
>>
>>      /* check for good response */
>> -    if ((be32_to_cpu(buf[0]) != 0xC0DEA202) ||
>> -        (be32_to_cpu(buf[1]) & 0x0FFFFFFF))
>> +    if ((be32_to_cpu(buf[0]) != 8) || (be32_to_cpu(buf[1]) != 
>> 0xC0DEA404))
>>          rc = -EBADMSG;
>>
>>  done:
>
