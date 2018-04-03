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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40G19d62shzF29F
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 06:37:24 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w33KZYh9038291
 for <openbmc@lists.ozlabs.org>; Tue, 3 Apr 2018 16:37:22 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2h4fupaqam-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Apr 2018 16:37:22 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 3 Apr 2018 14:37:21 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 3 Apr 2018 14:37:18 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w33KbHwa11403760; Tue, 3 Apr 2018 13:37:17 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFEA3136046;
 Tue,  3 Apr 2018 14:37:17 -0600 (MDT)
Received: from [9.80.239.195] (unknown [9.80.239.195])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 3E052136043;
 Tue,  3 Apr 2018 14:37:17 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.13 4/5] pmbus (core): Use driver callbacks in
 pmbus_get_fan_rate()
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
References: <20180403142655.16681-1-andrew@aj.id.au>
 <20180403142655.16681-5-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 3 Apr 2018 15:37:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180403142655.16681-5-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18040320-0008-0000-0000-0000098C6B00
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008797; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01012660; UDB=6.00516122; IPR=6.00791926; 
 MB=3.00020397; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-03 20:37:20
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18040320-0009-0000-0000-000046A80808
Message-Id: <459f1994-7d8d-a46c-3a21-111a1565c7bc@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-04-03_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804030206
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
X-List-Received-Date: Tue, 03 Apr 2018 20:37:26 -0000



On 04/03/2018 09:26 AM, Andrew Jeffery wrote:
> The driver may have overridden the pmbus_read_byte_data() callback, so
> make sure we use that to achieve expected behaviour.
>
> This helps in the MAX31785 case where we may need to perform a one-shot
> retry of transfers in the face of a failure.

Reviewed-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index ee1bf11c7fc6..d0ffa4b3fcbd 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -453,15 +453,15 @@ static int pmbus_get_fan_rate(struct i2c_client *client, int page, int id,
>   		return s->data;
>   	}
>
> -	config = pmbus_read_byte_data(client, page,
> -				      pmbus_fan_config_registers[id]);
> +	config = _pmbus_read_byte_data(client, page,
> +				       pmbus_fan_config_registers[id]);
>   	if (config < 0)
>   		return config;
>
>   	have_rpm = !!(config & pmbus_fan_rpm_mask[id]);
>   	if (want_rpm == have_rpm)
> -		return pmbus_read_word_data(client, page,
> -					    pmbus_fan_command_registers[id]);
> +		return _pmbus_read_word_data(client, page,
> +					     pmbus_fan_command_registers[id]);
>
>   	/* Can't sensibly map between RPM and PWM, just return zero */
>   	return 0;
