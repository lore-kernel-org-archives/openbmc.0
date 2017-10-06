Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3y7W6P43V2zDqks
 for <openbmc@lists.ozlabs.org>; Fri,  6 Oct 2017 11:41:33 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v960dDVi099155
 for <openbmc@lists.ozlabs.org>; Thu, 5 Oct 2017 20:41:31 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ddrnnbs5u-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 05 Oct 2017 20:41:31 -0400
Received: from localhost
 by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 5 Oct 2017 20:41:30 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e11.ny.us.ibm.com (146.89.104.198) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 5 Oct 2017 20:41:27 -0400
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v960fQP837945588; Fri, 6 Oct 2017 00:41:26 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30D4DB204D;
 Thu,  5 Oct 2017 20:38:45 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.85.157.182])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP id 7E6B8B2046;
 Thu,  5 Oct 2017 20:38:44 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 v3 18/31] drivers: fsi: occ: Use big-endian
 values
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: "Edward A. James" <eajames@us.ibm.com>
References: <1507231464-13635-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1507231464-13635-19-git-send-email-eajames@linux.vnet.ibm.com>
 <1507244587.5452.101.camel@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 5 Oct 2017 19:41:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1507244587.5452.101.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17100600-2213-0000-0000-00000226CACC
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007847; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000235; SDB=6.00927029; UDB=6.00466426; IPR=6.00707283; 
 BA=6.00005623; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017414; XFM=3.00000015;
 UTC=2017-10-06 00:41:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17100600-2214-0000-0000-000057C3B04A
Message-Id: <fe0e968e-10e5-d90b-4995-1bd1a154b51c@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-05_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=2
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710060008
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 00:41:34 -0000



On 10/05/2017 06:03 PM, Andrew Jeffery wrote:
> On Thu, 2017-10-05 at 14:24 -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>   
>> Switch to __be16 from u16 and __be32 from u32. Also, use kernel access
>> of unaligned be16 instead of manually creating a big-endian value from
>> the occ response buffer.
>>   
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   drivers/fsi/occ.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>   
>> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
>> index 82a60c5..55f293d 100644
>> --- a/drivers/fsi/occ.c
>> +++ b/drivers/fsi/occ.c
>> @@ -50,9 +50,9 @@ struct occ_response {
>>   	u8 seq_no;
>>   	u8 cmd_type;
>>   	u8 return_status;
>> -	u16 data_length;
>> +	__be16 data_length;
>>   	u8 data[OCC_RESP_DATA_BYTES];
>> -	u16 checksum;
>> +	__be16 checksum;
>>   } __packed;
>>   
>>   /*
>> @@ -425,7 +425,7 @@ static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
>>   {
>>   	int rc;
>>   	u8 *resp;
>> -	u32 buf[5];
>> +	__be32 buf[5];
>>   	u32 data_len = ((len + 7) / 8) * 8;
>>   	struct sbefifo_client *client;
>>   
>> @@ -476,7 +476,7 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
>>   		       ssize_t len)
>>   {
>>   	int rc;
>> -	u32 *buf;
>> +	__be32 *buf;
>>   	u32 data_len = ((len + 7) / 8) * 8;
>>   	size_t cmd_len = data_len + 20;
>>   	struct sbefifo_client *client;
>> @@ -522,7 +522,7 @@ static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
>>   static int occ_trigger_attn(struct device *sbefifo)
>>   {
>>   	int rc;
>> -	u32 buf[6];
>> +	__be32 buf[6];
>>   	struct sbefifo_client *client;
>>   
>>   	buf[0] = cpu_to_be32(0x6);
>> @@ -560,6 +560,7 @@ static void occ_worker(struct work_struct *work)
>>   	int rc = 0, empty, waiting, canceled;
>>   	u16 resp_data_length;
>>   	struct occ_xfr *xfr;
>> +	struct occ_response *resp;
>>   	struct occ_client *client;
>>   	struct occ *occ = container_of(work, struct occ, work);
>>   	struct device *sbefifo = occ->sbefifo;
>> @@ -573,6 +574,7 @@ static void occ_worker(struct work_struct *work)
>>   		return;
>>   	}
>>   
>> +	resp = (struct occ_response *)xfr->buf;
>>   	set_bit(XFR_IN_PROGRESS, &xfr->flags);
>>   
>>   	spin_unlock_irq(&occ->list_lock);
>> @@ -591,7 +593,7 @@ static void occ_worker(struct work_struct *work)
>>   	if (rc)
>>   		goto done;
>>   
>> -	resp_data_length = (xfr->buf[3] << 8) + xfr->buf[4];
>> +	resp_data_length = get_unaligned_be16(&resp->data_length);
>>   	if (resp_data_length > OCC_RESP_DATA_BYTES) {
> You need to do be16_to_cpu() before any comparisons.

Hmm, I'm not convinced. I see this in access_ok.h

static  __always_inline 
<http://elixir.free-electrons.com/linux/latest/ident/__always_inline>  u16  get_unaligned_be16 
<http://elixir.free-electrons.com/linux/latest/ident/get_unaligned_be16>(const  void  *p)
{
	return  be16_to_cpup 
<http://elixir.free-electrons.com/linux/latest/ident/be16_to_cpup>((__be16 
<http://elixir.free-electrons.com/linux/latest/ident/__be16>  *)p);
} I think it will do the translation as well. Thanks, Eddie

>
>>   		rc = -EDOM;
>>   		goto done;
