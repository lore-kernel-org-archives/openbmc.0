Return-Path: <cbostic@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cbostic@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40gQJy1yhkzF13r
 for <openbmc@lists.ozlabs.org>; Wed,  9 May 2018 02:42:58 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w48GdnrB132354
 for <openbmc@lists.ozlabs.org>; Tue, 8 May 2018 12:42:56 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2hucw0s9d5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 08 May 2018 12:42:55 -0400
Received: from localhost
 by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Tue, 8 May 2018 12:42:54 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 8 May 2018 12:42:51 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w48GgpDN45875278; Tue, 8 May 2018 16:42:51 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB13F112040;
 Tue,  8 May 2018 12:42:44 -0400 (EDT)
Received: from Christophers-MacBook-Pro.local (unknown [9.85.178.108])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 76D00112047;
 Tue,  8 May 2018 12:42:44 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.13 3/6] fsi/fsi-master-gpio: Sample input data
 on different clock phase
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
References: <20180508010640.14113-1-benh@kernel.crashing.org>
 <20180508010640.14113-3-benh@kernel.crashing.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Tue, 8 May 2018 11:42:50 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20180508010640.14113-3-benh@kernel.crashing.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18050816-0036-0000-0000-000002F14730
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008993; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000259; SDB=6.01029369; UDB=6.00525982; IPR=6.00808502; 
 MB=3.00020997; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-08 16:42:52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18050816-0037-0000-0000-00004442A3A0
Message-Id: <22ba2038-a824-f1e1-b69d-7d8dec5ab4c4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-08_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805080160
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
X-List-Received-Date: Tue, 08 May 2018 16:42:58 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>

On 5/7/18 8:06 PM, Benjamin Herrenschmidt wrote:
> We currently sample the input data right after we toggle the
> clock low, then high. The slave establishes the data on the
> rising edge, so this is not ideal. We should sample it on
> the low phase instead.
>
> This currently works because we have an extra delay, but subsequent
> patches will remove it.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>   drivers/fsi/fsi-master-gpio.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 4295a46780cb..d6508bbad1fb 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -86,12 +86,15 @@ static void clock_toggle(struct fsi_master_gpio *master, int count)
>   	}
>   }
>
> -static int sda_in(struct fsi_master_gpio *master)
> +static int sda_clock_in(struct fsi_master_gpio *master)
>   {
>   	int in;
>
>   	ndelay(FSI_GPIO_STD_DLY);
> +	gpiod_set_value(master->gpio_clk, 0);
>   	in = gpiod_get_value(master->gpio_data);
> +	ndelay(FSI_GPIO_STD_DLY);
> +	gpiod_set_value(master->gpio_clk, 1);
>   	return in ? 1 : 0;
>   }
>
> @@ -126,8 +129,7 @@ static void serial_in(struct fsi_master_gpio *master, struct fsi_gpio_msg *msg,
>   	set_sda_input(master);
>
>   	for (bit = 0; bit < num_bits; bit++) {
> -		clock_toggle(master, 1);
> -		in_bit = sda_in(master);
> +		in_bit = sda_clock_in(master);
>   		msg->msg <<= 1;
>   		msg->msg |= ~in_bit & 0x1;	/* Data is active low */
>   	}
