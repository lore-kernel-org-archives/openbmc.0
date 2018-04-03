Return-Path: <prvs=06312f16f5=eajames@linux.vnet.ibm.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=prvs=06312f16f5=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40Fsg56223zF24w
 for <openbmc@lists.ozlabs.org>; Wed,  4 Apr 2018 00:58:53 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w33Ewhlb037172
 for <openbmc@lists.ozlabs.org>; Tue, 3 Apr 2018 10:58:50 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2h4b233398-1
 (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 03 Apr 2018 10:58:49 -0400
Received: from localhost
 by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Tue, 3 Apr 2018 08:58:48 -0600
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 3 Apr 2018 08:58:45 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w33Ewja911862336; Tue, 3 Apr 2018 07:58:45 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 57F5113603A;
 Tue,  3 Apr 2018 08:58:45 -0600 (MDT)
Received: from [9.80.239.195] (unknown [9.80.239.195])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP id 8B69A136040;
 Tue,  3 Apr 2018 08:58:44 -0600 (MDT)
Subject: Re: [PATCH linux dev-4.13 3/5] pmbus (core): One-shot retries for
 failure to set page
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org, Matt Spinler <mspinler@linux.vnet.ibm.com>
References: <20180403142655.16681-1-andrew@aj.id.au>
 <20180403142655.16681-4-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Tue, 3 Apr 2018 09:58:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180403142655.16681-4-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18040314-0024-0000-0000-0000182C6B48
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008795; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000255; SDB=6.01012547; UDB=6.00516054; IPR=6.00791813; 
 MB=3.00020392; MTD=3.00000008; XFM=3.00000015; UTC=2018-04-03 14:58:47
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18040314-0025-0000-0000-00004F5DF404
Message-Id: <48da24d8-0594-88d7-967d-4639740127c4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-04-03_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1804030155
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
X-List-Received-Date: Tue, 03 Apr 2018 14:58:59 -0000



On 04/03/2018 09:26 AM, Andrew Jeffery wrote:
> Work around the shonky behaviour seen with the MAX31785 where we fail
> to set the page register in some circumstances.
>
> There's no real elegant way to do this. We can propagate the error up,
> but that forces us to retry the operation way up the call tree in any
> number of places. It also forces callers to split out pmbus_set_page()
> from the pmbus_{read,write}_{byte,word}_data() functions in order to
> differentiate between a failure to set the page and a failure to read a
> register (that might not exist, in which case an error is anticiptated).

Reviewed-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Cc: Eddie James <eajames@linux.vnet.ibm.com>
> Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index ee7e0684c29f..ee1bf11c7fc6 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -167,9 +167,17 @@ int pmbus_set_page(struct i2c_client *client, int page)
>   		return 0;
>
>   	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
> +		dev_dbg(&client->dev, "Want page %u, %u cached\n", page,
> +			data->currpage);
> +
>   		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> -		if (rv < 0)
> -			return rv;
> +		if (rv) {
> +			rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
> +						       page);
> +			dev_dbg(&client->dev,
> +				"Failed to set page %u, performed one-shot retry %s: %d\n",
> +				page, rv ? "and failed" : "with success", rv);
> +		}
>
>   		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
>   		if (rv < 0)
