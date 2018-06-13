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
 by lists.ozlabs.org (Postfix) with ESMTPS id 415VHb5hZFzF0l6
 for <openbmc@lists.ozlabs.org>; Thu, 14 Jun 2018 00:58:19 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w5DEs3gQ001677
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jun 2018 10:58:17 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2jk353qmek-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jun 2018 10:58:17 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Wed, 13 Jun 2018 08:58:16 -0600
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 13 Jun 2018 08:58:13 -0600
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w5DEwCEA1966554
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 13 Jun 2018 07:58:12 -0700
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D0326E04E;
 Wed, 13 Jun 2018 08:58:12 -0600 (MDT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27F846E052;
 Wed, 13 Jun 2018 08:58:12 -0600 (MDT)
Received: from [9.41.102.69] (unknown [9.41.102.69])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 13 Jun 2018 08:58:12 -0600 (MDT)
Subject: Re: [RFC PATCH 3/5] fsi/scom: Fixup endian annotations
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
Cc: Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org
References: <20180612051911.20690-1-benh@kernel.crashing.org>
 <20180612051911.20690-4-benh@kernel.crashing.org>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Wed, 13 Jun 2018 09:58:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180612051911.20690-4-benh@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18061314-0020-0000-0000-00000E2D05D1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009183; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000265; SDB=6.01046401; UDB=6.00535906; IPR=6.00825376; 
 MB=3.00021625; MTD=3.00000008; XFM=3.00000015; UTC=2018-06-13 14:58:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18061314-0021-0000-0000-000061EC38BE
Message-Id: <da68019e-8784-0f6d-8481-b6929280c184@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-06-13_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1805220000 definitions=main-1806130160
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
X-List-Received-Date: Wed, 13 Jun 2018 14:58:20 -0000



On 06/12/2018 12:19 AM, Benjamin Herrenschmidt wrote:
> Use the proper annotated type __be32 and fixup the
> accessor used for get_scom()
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

Reviewed-by: Eddie James <eajames@linux.vnet.ibm.com>

> ---
>   drivers/fsi/fsi-scom.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
> index 8a608db0aa07..6ddfb6021420 100644
> --- a/drivers/fsi/fsi-scom.c
> +++ b/drivers/fsi/fsi-scom.c
> @@ -51,8 +51,8 @@ static DEFINE_IDA(scom_ida);
>   static int put_scom(struct scom_device *scom_dev, uint64_t value,
>   		    uint32_t addr)
>   {
> +	__be32 data;
>   	int rc;
> -	uint32_t data;
>
>   	mutex_lock(&scom_dev->lock);
>
> @@ -79,7 +79,7 @@ static int put_scom(struct scom_device *scom_dev, uint64_t value,
>   static int get_scom(struct scom_device *scom_dev, uint64_t *value,
>   		    uint32_t addr)
>   {
> -	uint32_t result, data;
> +	__be32 result, data;
>   	int rc;
>
>
> @@ -96,14 +96,13 @@ static int get_scom(struct scom_device *scom_dev, uint64_t *value,
>   	if (rc)
>   		goto bail;
>
> -	*value |= (uint64_t)cpu_to_be32(result) << 32;
> +	*value |= (uint64_t)be32_to_cpu(result) << 32;
>   	rc = fsi_device_read(scom_dev->fsi_dev, SCOM_DATA1_REG, &result,
>   				sizeof(uint32_t));
>   	if (rc)
>   		goto bail;
>
> -	*value |= cpu_to_be32(result);
> -
> +	*value |= be32_to_cpu(result);
>    bail:
>   	mutex_unlock(&scom_dev->lock);
>   	return rc;
