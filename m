Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNK9Y1MTYzDqjm
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 07:58:40 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9QKtKR3078502
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 16:58:38 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dupjxskpm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 16:58:38 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 26 Oct 2017 16:58:37 -0400
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 26 Oct 2017 16:58:36 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9QKwaHi53936198; Thu, 26 Oct 2017 20:58:36 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22D73AC03A;
 Thu, 26 Oct 2017 16:59:21 -0400 (EDT)
Received: from [9.10.99.145] (unknown [9.10.99.145])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id DE756AC040;
 Thu, 26 Oct 2017 16:59:20 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 2/3] hwmon: pmbus: max31785: Mark virtual
 pages as virtual
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
References: <20171026061940.25364-1-andrew@aj.id.au>
 <20171026061940.25364-3-andrew@aj.id.au>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Thu, 26 Oct 2017 15:58:40 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171026061940.25364-3-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17102620-0024-0000-0000-000002E8D21B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007956; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00936891; UDB=6.00472159; IPR=6.00717153; 
 BA=6.00005660; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017730; XFM=3.00000015;
 UTC=2017-10-26 20:58:37
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102620-0025-0000-0000-000045D9C5BE
Message-Id: <713a1ca7-5f1b-654e-9b0e-91b81f33ddfa@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-10-26_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
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
X-List-Received-Date: Thu, 26 Oct 2017 20:58:41 -0000

Reviewed-by: Matt Spinler mspinler@linux.vnet.ibm.com


On 10/26/2017 1:19 AM, Andrew Jeffery wrote:
> Avoid setting PAGE to a unsupported value on the MAX31785 to avoid
> errors from the hardware in circumstances that we know it will fail.
>
> The virtual pages are used to expose the non-standard tacho measurements
> for the second rotor of a dual-rotor fan. Maxim's implementation breaks
> with the PMBus standard by providing a four-byte response to what is
> usually a two-byte command.
>
> Cc: Eddie James <eajames@linux.vnet.ibm.com>
> Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/hwmon/pmbus/max31785.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 6a0d289ad346..c862ab51e3af 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -436,6 +436,7 @@ static int max31785_of_fan_config(struct i2c_client *client,
>
>   			info->pages = max(info->pages, virtual + 1);
>   			info->func[virtual] |= PMBUS_HAVE_FAN12;
> +			info->func[virtual] |= PMBUS_PAGE_VIRTUAL;
>   		}
>   	}
>
