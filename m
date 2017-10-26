Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNK9d5vK8zDqty
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 07:58:45 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9QKtK0Y080817
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 16:58:43 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dugyyaw9k-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 16:58:43 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 26 Oct 2017 16:58:42 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 26 Oct 2017 16:58:40 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9QKwdTs49021064; Thu, 26 Oct 2017 20:58:39 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 836D8AC048;
 Thu, 26 Oct 2017 16:59:24 -0400 (EDT)
Received: from [9.10.99.145] (unknown [9.10.99.145])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 49B74AC043;
 Thu, 26 Oct 2017 16:59:24 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 1/3] hwmon: pmbus: core: Add virtual page
 config bit
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
References: <20171026061940.25364-1-andrew@aj.id.au>
 <20171026061940.25364-2-andrew@aj.id.au>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Thu, 26 Oct 2017 15:58:44 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171026061940.25364-2-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17102620-0056-0000-0000-000003DFD576
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007956; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00936891; UDB=6.00472159; IPR=6.00717153; 
 BA=6.00005660; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017730; XFM=3.00000015;
 UTC=2017-10-26 20:58:41
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102620-0057-0000-0000-00000816E2F8
Message-Id: <68a9a1e0-1646-8fcb-bcaa-70b81b9a1bbf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-26_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
 definitions=main-1710260262
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
X-List-Received-Date: Thu, 26 Oct 2017 20:58:46 -0000

Reviewed-by: Matt Spinler mspinler@linux.vnet.ibm.com


On 10/26/2017 1:19 AM, Andrew Jeffery wrote:
> Some circumstances call for virtual pages to expose multiple values
> packed into an extended PMBus register in a manner non-compliant with
> the PMBus standard. We should not try to set virtual pages on the
> device; add a flag so we can avoid doing so.
>
> Cc: Eddie James <eajames@linux.vnet.ibm.com>
> Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/hwmon/pmbus/pmbus.h      |  2 ++
>   drivers/hwmon/pmbus/pmbus_core.c | 12 ++++++++----
>   2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index a863b8fed16f..fd422cd76452 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -367,6 +367,8 @@ enum pmbus_sensor_classes {
>   #define PMBUS_HAVE_PWM12	BIT(20)
>   #define PMBUS_HAVE_PWM34	BIT(21)
>
> +#define PMBUS_PAGE_VIRTUAL	BIT(31)
> +
>   enum pmbus_data_format { linear = 0, direct, vid };
>   enum vrm_version { vr11 = 0, vr12 };
>
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index f72f966f5251..390a7b02b836 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -164,14 +164,18 @@ int pmbus_set_page(struct i2c_client *client, u8 page)
>   	int rv = 0;
>   	int newpage;
>
> -	if (page != data->currpage) {
> +	if (page == data->currpage)
> +		return 0;
> +
> +	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
>   		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
>   		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
>   		if (newpage != page)
> -			rv = -EIO;
> -		else
> -			data->currpage = page;
> +			return -EIO;
>   	}
> +
> +	data->currpage = page;
> +
>   	return rv;
>   }
>   EXPORT_SYMBOL_GPL(pmbus_set_page);
