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
 by lists.ozlabs.org (Postfix) with ESMTPS id 40mLSC1J22zF14h
 for <openbmc@lists.ozlabs.org>; Thu, 17 May 2018 03:06:18 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w4GH5U9u100848
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 13:06:16 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2j0pycndce-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 16 May 2018 13:06:15 -0400
Received: from localhost
 by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <cbostic@linux.vnet.ibm.com>;
 Wed, 16 May 2018 11:06:15 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 16 May 2018 11:06:12 -0600
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w4GH6C0212976390; Wed, 16 May 2018 10:06:12 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 078C6C603C;
 Wed, 16 May 2018 11:06:12 -0600 (MDT)
Received: from christophersmbp.austin.ibm.com (unknown [9.85.200.247])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 85886C604F;
 Wed, 16 May 2018 11:06:11 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.13] fsi/fsi-master-gpio: Delay sampling of FSI
 data input
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
References: <d7c1b4c513fb4d2d96cb1ff3735b7b27c14d336e.camel@kernel.crashing.org>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Wed, 16 May 2018 12:06:10 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <d7c1b4c513fb4d2d96cb1ff3735b7b27c14d336e.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 18051617-8235-0000-0000-00000D82F0C4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00009035; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000260; SDB=6.01033214; UDB=6.00528282; IPR=6.00812346; 
 MB=3.00021148; MTD=3.00000008; XFM=3.00000015; UTC=2018-05-16 17:06:13
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18051617-8236-0000-0000-000040FDCA42
Message-Id: <6932c776-5297-d477-0980-a794aaae637f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2018-05-16_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1805160170
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
X-List-Received-Date: Wed, 16 May 2018 17:06:19 -0000

Reviewed-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>


On 5/15/18 8:05 AM, Benjamin Herrenschmidt wrote:
> Most SoC GPIO implementations, including the Aspeed one, have
> synchronizers on the GPIO inputs. This means that the value
> read from a GPIO is a couple of clocks old, from whatever clock
> source feeds those synchronizers.
>
> In practice, this means that in no-delay mode, we are using a
> value that can potentially be a bit too old and too close to
> the clock edge establishing the data on the other side of the link.
>
> The voltage converters we use on some systems make this worse
> and sensitive to things like voltage fluctuations etc... This is,
> we believe, the cause of occasional CRC errors encountered during
> heavy activity on the LPC bus.
>
> This is fixed by introducing a dummy GPIO read before the actual
> data read. It slows down SBEFIFO by about 15% (less than any delay
> primitive) and the end result is so far solid.
>
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>   drivers/fsi/fsi-master-gpio.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 98700eac16fd..36a71efd802c 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -98,6 +98,11 @@ static int sda_clock_in(struct fsi_master_gpio *master)
>   	if (!master->no_delays)
>   		ndelay(FSI_GPIO_STD_DLY);
>   	gpiod_set_value(master->gpio_clk, 0);
> +
> +	/* Dummy read to feed the synchronizers */
> +	gpiod_get_value(master->gpio_data);
> +
> +	/* Actual data read */
>   	in = gpiod_get_value(master->gpio_data);
>   	if (!master->no_delays)
>   		ndelay(FSI_GPIO_STD_DLY);
>
