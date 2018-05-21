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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40qSVY3y76zF18L
 for <openbmc@lists.ozlabs.org>; Tue, 22 May 2018 04:49:08 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4LIn4aW017959
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 14:49:05 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2j42xbsnjj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 21 May 2018 14:49:04 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Mon, 21 May 2018 12:49:00 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Mon, 21 May 2018 12:48:58 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4LImvAr11338162; Mon, 21 May 2018 11:48:57 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB5F5136043;
 Mon, 21 May 2018 12:48:57 -0600 (MDT)
Received: from [9.85.196.42] (unknown [9.85.196.42])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 4D24213603A;
 Mon, 21 May 2018 12:48:57 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.13 1/4] fsi/occ: Add retries on SBE errors
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <20180518013500.18005-1-benh@kernel.crashing.org>
 <1526879662.2642052.1378929336.646BF02C@webmail.messagingengine.com>
 <0450d7c40fe4e8015311ef6de478893a58445d9b.camel@kernel.crashing.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 21 May 2018 13:48:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <0450d7c40fe4e8015311ef6de478893a58445d9b.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18052118-0016-0000-0000-000008C527B6
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009062; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000261; SDB=6.01035648; UDB=6.00529738; IPR=6.00814777; 
 MB=3.00021227; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-21 18:49:00
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18052118-0017-0000-0000-00003ED4CBF2
Message-Id: <142d4920-3a8b-b2ba-a218-e4bd299c572c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-21_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805210223
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
X-List-Received-Date: Mon, 21 May 2018 18:49:10 -0000



On 05/21/2018 03:33 AM, Benjamin Herrenschmidt wrote:
> On Mon, 2018-05-21 at 14:44 +0930, Andrew Jeffery wrote:
>> On Fri, 18 May 2018, at 11:04, Benjamin Herrenschmidt wrote:
>>> This has proven useful in case of problems with the FSI
>>> communication. We retry up to 3 times.
>> As a note, there's a separate, OCC-specific error-handling sequence
>> as well, but this is currently done in drivers/hwmon/occ/common.c.
> This is more for transport failures. It might be less useful now that
> I've added CRC error recovery in the FSI layer and made it more
> reliable overall. Experience showed that the upper OCC layer just
> didn't deal with it well.
>
>>>  From the OCC documentation[1]:
>> 3.3.1 BMC-OCC Communication Failure Handling
>>
>> On failures communicating with an OCC the BMC should first verify
>> that the “OCC Active” sensor is TRUE.  If the OCCs are not active the
>> error should be ignored and communication with the OCC should not be
>> retired until the “OCC Active” sensor is TRUE.  If the “OCC Active”
>> sensor is TRUE the command should be retried twice.
> What is the "OCC Active sensor" ?

It's a value in the OCC poll response.

>
>>   If the command still fails after two retries and the “OCC Active”
>> sensor is still “TRUE” and there is no checkstop the error is valid
>> and a request to reset the OCCs should be sent.
>>
>> [1] https://github.com/open-power/docs/blob/master/occ/OCC_OpenPwr_FW_Interfaces.pdf
>>
>>> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> ---
>>>   drivers/fsi/fsi-occ.c | 179 ++++++++++++++++++++++++------------------
>>>   1 file changed, 104 insertions(+), 75 deletions(-)
>>>
>>> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
>>> index bdee26096688..f4b2df7a3084 100644
>>> --- a/drivers/fsi/fsi-occ.c
>>> +++ b/drivers/fsi/fsi-occ.c
>>> @@ -35,6 +35,7 @@
>>>   #define OCC_SRAM_BYTES		4096
>>>   #define OCC_CMD_DATA_BYTES	4090
>>>   #define OCC_RESP_DATA_BYTES	4089
>>> +#define OCC_COMMAND_RETRIES	3
>>>   
>>>   /*
>>>    * Assume we don't have FFDC, if we do we'll overflow and
>>> @@ -458,9 +459,9 @@ static int occ_getsram(struct device *sbefifo, u32
>>> address, u8 *data,
>>>   		       ssize_t len)
>>>   {
>>>   	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
>>> -	size_t resp_len, resp_data_len;
>>> +	size_t saved_resp_len, resp_len, resp_data_len;
>>>   	__be32 *resp, cmd[5];
>>> -	int rc;
>>> +	int rc, retries = OCC_COMMAND_RETRIES;
>>>   
>>>   	/*
>>>   	 * Magic sequence to do SBE getsram command. SBE will fetch data from
>>> @@ -472,28 +473,37 @@ static int occ_getsram(struct device *sbefifo, u32
>>> address, u8 *data,
>>>   	cmd[3] = cpu_to_be32(address);
>>>   	cmd[4] = cpu_to_be32(data_len);
>>>   
>>> -	resp_len = (data_len >> 2) + OCC_SBE_STATUS_WORDS;
>>> +	resp_len = saved_resp_len = (data_len >> 2) + OCC_SBE_STATUS_WORDS;
>>>   	resp = kzalloc(resp_len << 2 , GFP_KERNEL);
>>>   	if (!resp)
>>> -		return -ENOMEM;
>>> -
>>> -	rc = sbefifo_submit(sbefifo, cmd, 5, resp, &resp_len);
>>> -	if (rc)
>>> -		goto free;
>>> -	rc = sbefifo_parse_status(0xa403, resp, resp_len, &resp_len);
>>> -	if (rc)
>>> -		goto free;
>>> +		rc = -ENOMEM;
>>> +
>>> +	rc = -1;
>>> +	while (rc && retries--) {
>>> +		resp_len = saved_resp_len;
>>> +		rc = sbefifo_submit(sbefifo, cmd, 5, resp, &resp_len);
>>> +		if (rc == 0)
>>> +			rc = sbefifo_parse_status(0xa403, resp, resp_len, &resp_len);
>>> +		if (rc) {
>>> +			if (rc < 0)
>>> +				pr_err("occ: FSI error %d, retrying sram read\n", rc);
>>> +			else
>>> +				pr_err("occ: SBE error 0x%08x, retrying sram read\n", rc);
>>> +		}
>>> +	}
>>>   
>>> -	resp_data_len = be32_to_cpu(resp[resp_len - 1]);
>>> -	if (resp_data_len != data_len) {
>>> -		pr_err("occ: SRAM read expected %d bytes got %d\n",
>>> -		       data_len, resp_data_len);
>>> -		rc = -EBADMSG;
>>> -	} else {
>>> -		memcpy(data, resp, len);
>>> +	/* Check response lenght and copy data */
>>> +	if (rc == 0) {
>>> +		resp_data_len = be32_to_cpu(resp[resp_len - 1]);
>>> +		if (resp_data_len != data_len) {
>>> +			pr_err("occ: SRAM read expected %d bytes got %d\n",
>>> +			       data_len, resp_data_len);
>>> +			rc = -EBADMSG;
>>> +		} else {
>>> +			memcpy(data, resp, len);
>>> +		}
>>>   	}
>>>   
>>> -free:
>>>   	/* Convert positive SBEI status */
>>>   	if (rc > 0) {
>>>   		pr_err("occ: SRAM read returned failure status: %08x\n", rc);
>>> @@ -508,8 +518,8 @@ static int occ_putsram(struct device *sbefifo, u32
>>> address, u8 *data,
>>>   {
>>>   	size_t cmd_len, buf_len, resp_len, resp_data_len;
>>>   	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
>>> +	int rc, retries = OCC_COMMAND_RETRIES;
>>>   	__be32 *buf;
>>> -	int rc;
>>>   
>>>   	/*
>>>   	 * We use the same buffer for command and response, make
>>> @@ -522,38 +532,48 @@ static int occ_putsram(struct device *sbefifo, u32
>>> address, u8 *data,
>>>   	if (!buf)
>>>   		return -ENOMEM;
>>>   
>>> -	/*
>>> -	 * Magic sequence to do SBE putsram command. SBE will transfer
>>> -	 * data to specified SRAM address.
>>> -	 */
>>> -	buf[0] = cpu_to_be32(cmd_len);
>>> -	buf[1] = cpu_to_be32(0xa404);
>>> -	buf[2] = cpu_to_be32(1);
>>> -	buf[3] = cpu_to_be32(address);
>>> -	buf[4] = cpu_to_be32(data_len);
>>> -
>>> -	memcpy(&buf[5], data, len);
>>> -
>>> -	rc = sbefifo_submit(sbefifo, buf, cmd_len, buf, &resp_len);
>>> -	if (rc)
>>> -		goto free;
>>> -	rc = sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
>>> -	if (rc)
>>> -		goto free;
>>> +	rc = -1;
>>> +	while (rc && retries--) {
>>> +		/*
>>> +		 * Magic sequence to do SBE putsram command. SBE will transfer
>>> +		 * data to specified SRAM address.
>>> +		 */
>>> +		buf[0] = cpu_to_be32(cmd_len);
>>> +		buf[1] = cpu_to_be32(0xa404);
>>> +		buf[2] = cpu_to_be32(1);
>>> +		buf[3] = cpu_to_be32(address);
>>> +		buf[4] = cpu_to_be32(data_len);
>> Maybe it's worth a comment that we're doing this work inside the loop because we're reusing the buffer for the response, and we're doing that to minimise the memory consumption, and it motivated by the SBEFIFO protocol crazy.
>>
>>> +
>>> +		memcpy(&buf[5], data, len);
>>> +
>>> +		resp_len = OCC_SBE_STATUS_WORDS;
>>> +		rc = sbefifo_submit(sbefifo, buf, cmd_len, buf, &resp_len);
>>> +		if (rc == 0)
>>> +			rc = sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
>>> +		if (rc) {
>>> +			if (rc < 0)
>>> +				pr_err("occ: FSI error %d, retrying sram write\n", rc);
>>> +			else
>>> +				pr_err("occ: SBE error 0x%08x, retrying sram write\n", rc);
>>> +		}
>>> +	}
>>>   
>>> -	if (resp_len != 1) {
>>> -		pr_err("occ: SRAM write response lenght invalid: %d\n",
>>> -		       resp_len);
>>> -		rc = -EBADMSG;
>>> -	} else {
>>> -		resp_data_len = be32_to_cpu(buf[0]);
>>> -		if (resp_data_len != data_len) {
>>> -			pr_err("occ: SRAM write expected %d bytes got %d\n",
>>> -			       data_len, resp_data_len);
>>> +	/* Check response lenght */
>>> +	if (rc == 0) {
>>> +		if (resp_len != 1) {
>>> +			pr_err("occ: SRAM write response lenght invalid: %d\n",
>> Hmm, not your fault but I just noticed 'length' is misspelled here.
>>
>>> +			       resp_len);
>>>   			rc = -EBADMSG;
>>> +		} else {
>>> +			resp_data_len = be32_to_cpu(buf[0]);
>>> +			if (resp_data_len != data_len) {
>>> +				pr_err("occ: SRAM write expected %d bytes got %d\n",
>>> +				       data_len, resp_data_len);
>>> +				rc = -EBADMSG;
>>> +			}
>>>   		}
>>>   	}
>>> -free:
>>> +
>>>   	/* Convert positive SBEI status */
>>>   	if (rc > 0) {
>>>   		pr_err("occ: SRAM write returned failure status: %08x\n", rc);
>>> @@ -567,46 +587,55 @@ static int occ_trigger_attn(struct device *sbefifo)
>>>   {
>>>   	__be32 buf[OCC_SBE_STATUS_WORDS];
>>>   	size_t resp_len, resp_data_len;
>>> -	int rc;
>>> +	int rc, retries = OCC_COMMAND_RETRIES;
>>>   
>>>   	BUILD_BUG_ON(OCC_SBE_STATUS_WORDS < 7);
>>> -	resp_len = OCC_SBE_STATUS_WORDS;
>>>   
>>> -	buf[0] = cpu_to_be32(0x5 + 0x2);        /* Chip-op length in words */
>>> -	buf[1] = cpu_to_be32(0xa404);           /* PutOCCSRAM */
>>> -	buf[2] = cpu_to_be32(0x3);              /* Mode: Circular */
>>> -	buf[3] = cpu_to_be32(0x0);              /* Address: ignored in mode 3 */
>>> -	buf[4] = cpu_to_be32(0x8);              /* Data length in bytes */
>>> -	buf[5] = cpu_to_be32(0x20010000);       /* Trigger OCC attention */
>>> -	buf[6] = 0;
>>> -
>>> -	rc = sbefifo_submit(sbefifo, buf, 7, buf, &resp_len);
>>> -	if (rc)
>>> -		goto error;
>>> -	rc = sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
>>> -	if (rc)
>>> -		goto error;
>>> +	rc = -1;
>>> +	while (rc && retries--) {
>>> +		resp_len = OCC_SBE_STATUS_WORDS;
>>> +
>>> +		buf[0] = cpu_to_be32(0x5 + 0x2);        /* Chip-op length in words */
>>> +		buf[1] = cpu_to_be32(0xa404);           /* PutOCCSRAM */
>>> +		buf[2] = cpu_to_be32(0x3);              /* Mode: Circular */
>>> +		buf[3] = cpu_to_be32(0x0);              /* Address: ignored in mode 3 */
>>> +		buf[4] = cpu_to_be32(0x8);              /* Data length in bytes */
>>> +		buf[5] = cpu_to_be32(0x20010000);       /* Trigger OCC attention */
>>> +		buf[6] = 0;
>>> +
>>> +		rc = sbefifo_submit(sbefifo, buf, 7, buf, &resp_len);
>>> +		if (rc == 0)
>>> +			rc = sbefifo_parse_status(0xa404, buf, resp_len, &resp_len);
>>> +		if (rc) {
>>> +			if (rc < 0)
>>> +				pr_err("occ: FSI error %d, retrying attn\n", rc);
>>> +			else
>>> +				pr_err("occ: SBE error 0x%08x, retrying attn\n", rc);
>>> +		}
>>> +	}
>>>   
>>> -	if (resp_len != 1) {
>>> -		pr_err("occ: SRAM attn response lenght invalid: %d\n",
>>> -		       resp_len);
>>> -		rc = -EBADMSG;
>>> -	} else {
>>> -		resp_data_len = be32_to_cpu(buf[0]);
>>> -		if (resp_data_len != 8) {
>>> -			pr_err("occ: SRAM attn expected 8 bytes got %d\n",
>>> -			       resp_data_len);
>>> +	/* Check response lenght */
>> 'length'
>>
>>> +	if (rc == 0) {
>>> +		if (resp_len != 1) {
>>> +			pr_err("occ: SRAM attn response lenght invalid: %d\n",
>> 'length'
>>
>>> +			       resp_len);
>>>   			rc = -EBADMSG;
>>> +		} else {
>>> +			resp_data_len = be32_to_cpu(buf[0]);
>>> +			if (resp_data_len != 8) {
>>> +				pr_err("occ: SRAM attn expected 8 bytes got %d\n",
>>> +				       resp_data_len);
>>> +				rc = -EBADMSG;
>>> +			}
>>>   		}
>>>   	}
>>> - error:
>>> +
>>>   	/* Convert positive SBEI status */
>>>   	if (rc > 0) {
>>>   		pr_err("occ: SRAM attn returned failure status: %08x\n", rc);
>>>   		rc = -EBADMSG;
>>>   	}
>>>   
>>> -
>>>   	return rc;
>>>   }
>>>   
>>> -- 
>>> 2.17.0
>>>
