Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yx2CT0SQFzDrWj
 for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2017 01:24:52 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vBCEM2K1132016
 for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2017 09:24:50 -0500
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2eteu66jhy-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 12 Dec 2017 09:24:49 -0500
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 12 Dec 2017 07:24:49 -0700
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 12 Dec 2017 07:24:46 -0700
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 vBCEOk2x66977906; Tue, 12 Dec 2017 07:24:46 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 035E2136048;
 Tue, 12 Dec 2017 07:24:46 -0700 (MST)
Received: from Christophers-MacBook-Pro.local (unknown [9.81.219.14])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 5960813603A;
 Tue, 12 Dec 2017 07:24:43 -0700 (MST)
Subject: Re: [PATCH linux dev-4.10] hwmon (occ): Fix integer overflow in
 multiplication
To: Eddie James <eajames@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
References: <1512587959-27264-1-git-send-email-eajames@linux.vnet.ibm.com>
Cc: "Edward A. James" <eajames@us.ibm.com>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Tue, 12 Dec 2017 08:24:41 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1512587959-27264-1-git-send-email-eajames@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17121214-0004-0000-0000-0000135E29B3
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008194; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000244; SDB=6.00959160; UDB=6.00485058; IPR=6.00739183; 
 BA=6.00005738; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00018501; XFM=3.00000015;
 UTC=2017-12-12 14:24:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17121214-0005-0000-0000-0000853CCA70
Message-Id: <89a4ff17-2af6-64de-84ec-6e7296643395@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-12-12_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1712120207
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
X-List-Received-Date: Tue, 12 Dec 2017 14:24:53 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 12/6/17 1:19 PM, Eddie James wrote:
> From: "Edward A. James" <eajames@us.ibm.com>
>
> Power values were overflowing INT_MAX when being converted to
> microwatts, even though the storage was sufficiently large (unsigned 64
> bit). Change literals to unsigned long long.
>
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
>   drivers/hwmon/occ/common.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 3175e7b..a64f3db 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -468,7 +468,7 @@ static ssize_t occ_show_power_1(struct device *dev,
>   				struct device_attribute *attr, char *buf)
>   {
>   	int rc;
> -	u32 val = 0;
> +	u64 val = 0;
>   	struct power_sensor_1 *power;
>   	struct occ *occ = dev_get_drvdata(dev);
>   	struct occ_sensors *sensors = &occ->sensors;
> @@ -491,11 +491,11 @@ static ssize_t occ_show_power_1(struct device *dev,
>   		val = get_unaligned_be32(&power->accumulator);
>   		break;
>   	case 3:
> -		val = get_unaligned_be16(&power->value) * 1000000;
> +		val = (u64)get_unaligned_be16(&power->value) * 1000000ULL;
>   		break;
>   	}
>
> -	return snprintf(buf, PAGE_SIZE - 1, "%u\n", val);
> +	return snprintf(buf, PAGE_SIZE - 1, "%llu\n", val);
>   }
>
>   static ssize_t occ_show_power_2(struct device *dev,
> @@ -525,7 +525,7 @@ static ssize_t occ_show_power_2(struct device *dev,
>   		val = get_unaligned_be64(&power->accumulator);
>   		break;
>   	case 3:
> -		val = get_unaligned_be16(&power->value) * 1000000;
> +		val = (u64)get_unaligned_be16(&power->value) * 1000000ULL;
>   		break;
>   	case 4:
>   		val = power->function_id;
> @@ -562,7 +562,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
>   		val = get_unaligned_be16(&power->system.update_time);
>   		break;
>   	case 2:
> -		val = get_unaligned_be16(&power->system.value) * 1000000;
> +		val = (u64)get_unaligned_be16(&power->system.value) *
> +			1000000ULL;
>   		break;
>   	case 3:
>   		val = get_unaligned_be32(&power->system.update_tag);
> @@ -574,7 +575,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
>   		val = get_unaligned_be16(&power->proc.update_time);
>   		break;
>   	case 6:
> -		val = get_unaligned_be16(&power->proc.value) * 1000000;
> +		val = (u64)get_unaligned_be16(&power->proc.value) * 1000000ULL;
>   		break;
>   	case 7:
>   		val = get_unaligned_be32(&power->proc.update_tag);
> @@ -583,7 +584,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
>   		val = get_unaligned_be64(&power->proc.accumulator);
>   		break;
>   	case 9:
> -		val = get_unaligned_be16(&power->vdd.value) * 1000000;
> +		val = (u64)get_unaligned_be16(&power->vdd.value) * 1000000ULL;
>   		break;
>   	case 10:
>   		val = get_unaligned_be32(&power->vdd.update_tag);
> @@ -592,7 +593,7 @@ static ssize_t occ_show_power_a0(struct device *dev,
>   		val = get_unaligned_be64(&power->vdd.accumulator);
>   		break;
>   	case 12:
> -		val = get_unaligned_be16(&power->vdn.value) * 1000000;
> +		val = (u64)get_unaligned_be16(&power->vdn.value) * 1000000ULL;
>   		break;
>   	case 13:
>   		val = get_unaligned_be32(&power->vdn.update_tag);
