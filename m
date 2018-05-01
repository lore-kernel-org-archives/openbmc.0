Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40b3wz6W7NzF2Qs
 for <openbmc@lists.ozlabs.org>; Wed,  2 May 2018 00:40:35 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w41EbVQv102728
 for <openbmc@lists.ozlabs.org>; Tue, 1 May 2018 10:40:33 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hpqqv694e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 01 May 2018 10:40:32 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 1 May 2018 08:40:31 -0600
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 1 May 2018 08:40:28 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w41EeSI013173082; Tue, 1 May 2018 07:40:28 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F08C136040;
 Tue,  1 May 2018 08:40:28 -0600 (MDT)
Received: from [9.80.214.2] (unknown [9.80.214.2])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 9CEFF136049;
 Tue,  1 May 2018 08:40:27 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.13] fsi: occ: Add check for OCC response
 checksum
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <1525122321-12244-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1525131849.252145.1356261360.2E85A1F6@webmail.messagingengine.com>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 1 May 2018 09:40:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1525131849.252145.1356261360.2E85A1F6@webmail.messagingengine.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18050114-0016-0000-0000-000008A2E24A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008957; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000257; SDB=6.01025969; UDB=6.00523958; IPR=6.00805200; 
 MB=3.00020882; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-01 14:40:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050114-0017-0000-0000-00003E804530
Message-Id: <beb636a9-1c09-8b9f-e839-97d7743bda20@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-01_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805010146
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
X-List-Received-Date: Tue, 01 May 2018 14:40:36 -0000



On 04/30/2018 06:44 PM, Andrew Jeffery wrote:
>
> On Tue, 1 May 2018, at 06:35, Eddie James wrote:
>> The OCC specification indicates that it is an error scenario if the
>> response checksum doesn't match the sum of the bytes of the response.
>> The driver needs to perform this calculation and check, and return an
>> error if it's a mismatch.
>>
>> Signed-off-by: Eddie James <eajames@linux.vnet.ibm.com>
>> ---
>>   drivers/fsi/fsi-occ.c | 23 +++++++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>
>> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
>> index 45ae13c..16f18df 100644
>> --- a/drivers/fsi/fsi-occ.c
>> +++ b/drivers/fsi/fsi-occ.c
>> @@ -427,6 +427,27 @@ static int occ_release(struct inode *inode, struct
>> file *file)
>>   	.release = occ_release,
>>   };
>>   
>> +static int occ_check_sum(struct occ_response *resp, u16 data_length)
> Why pass in data_length when it's been extracted from resp?

So that I don't have to convert it from BE again.

>
>> +{
>> +	unsigned int i;
>> +	u16 checksum = 0;
>> +	u16 checksum_resp = get_unaligned_be16(&resp->data[data_length]);
> This looks like the definition of struct occ_response is broken:
>
> struct occ_response {
> 	u8 seq_no;
> 	u8 cmd_type;
> 	u8 return_status;
> 	__be16 data_length;
> 	u8 data[OCC_RESP_DATA_BYTES];
> 	__be16 checksum;
> } __packed;
>
> The checksum member is misleading, as we're not always transferring 4089 bytes of data, but it is necessary to "avoid" an out-of-bounds memory access if we do. I think it's worth redefining data as `u8 data[OCC_RESP_DATA_BYTES + 2]` and dropping the checksum member.
>
> Also can you add a comment explaining why you're doing an "out of bounds" access through the data member by indexing with data_length?

  Good ideas.

>
>> +
>> +	checksum += resp->seq_no;
>> +	checksum += resp->cmd_type;
>> +	checksum += resp->return_status;
>> +	checksum += (data_length >> 8) + (data_length & 0xFF);
>> +
>> +	for (i = 0; i < data_length; ++i) {
>> +		checksum += resp->data[i];
>> +	}
>> +
>> +	if (checksum != checksum_resp)
>> +		return -EBADMSG;
>> +
>> +	return 0;
>> +}
>> +
>>   static int occ_write_sbefifo(struct sbefifo_client *client, const char *buf,
>>   			     ssize_t len)
>>   {
>> @@ -692,6 +713,8 @@ static void occ_worker(struct work_struct *work)
>>   
>>   	xfr->resp_data_length = resp_data_length + 7;
>>   
>> +	rc = occ_check_sum(resp, resp_data_length);
>> +
> It's a pity there aren't two checksums: one for the fixed length data (covering the variable data length value) and one for the variable length data. We're pretty much reduced to inferring that the data length is fine if it doesn't exceed OCC_RESP_DATA_BYTES, but that doesn't mean that it isn't corrupt.

Well it still works; if the data length is incorrect but less than the 
max, then the checksum won't match.

Thanks,
Eddie

>
> Cheers,
>
> Andrew
>
>>   done:
>>   	mutex_unlock(&occ->occ_lock);
>>   
>> -- 
>> 1.8.3.1
>>
