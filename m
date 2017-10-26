Return-Path: <mspinler@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mspinler@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yNK9W1K1dzDqfh
 for <openbmc@lists.ozlabs.org>; Fri, 27 Oct 2017 07:58:38 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9QKuMXY075482
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 16:58:36 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dum480tjh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2017 16:58:36 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mspinler@linux.vnet.ibm.com>;
 Thu, 26 Oct 2017 16:58:35 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 26 Oct 2017 16:58:32 -0400
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9QKwWWF49021044; Thu, 26 Oct 2017 20:58:32 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40083AC040;
 Thu, 26 Oct 2017 16:59:17 -0400 (EDT)
Received: from [9.10.99.145] (unknown [9.10.99.145])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP id 0561EAC03A;
 Thu, 26 Oct 2017 16:59:16 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10 3/3] hwmon: pmbus: core: One-shot retries
 for failure to set page
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Cc: joel@jms.id.au, Eddie James <eajames@linux.vnet.ibm.com>
References: <20171026061940.25364-1-andrew@aj.id.au>
 <20171026061940.25364-4-andrew@aj.id.au>
From: Matt Spinler <mspinler@linux.vnet.ibm.com>
Date: Thu, 26 Oct 2017 15:58:36 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171026061940.25364-4-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17102620-0040-0000-0000-000003B8D5FD
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007956; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000239; SDB=6.00936891; UDB=6.00472159; IPR=6.00717153; 
 BA=6.00005660; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017730; XFM=3.00000015;
 UTC=2017-10-26 20:58:34
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17102620-0041-0000-0000-000007ADE3ED
Message-Id: <4bb212ed-d98c-0266-e082-35f5d365f506@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 26 Oct 2017 20:58:39 -0000

Reviewed-by: Matt Spinler mspinler@linux.vnet.ibm.com


On 10/26/2017 1:19 AM, Andrew Jeffery wrote:
> Work around the shonky behaviour seen with the MAX31785 where we fail
> to set the page register in some circumstances.
>
> There's no real elegant way to do this. We can propagate the error up,
> but that forces us to retry the operation way up the call tree in any
> number of places. It also forces callers to split out pmbus_set_page()
> from the pmbus_{read,write}_{byte,word}_data() functions in order to
> differentiate between a failure to set the page and a failure to read a
> register (that might not exist, in which case an error is anticiptated).
>
> Cc: Eddie James <eajames@linux.vnet.ibm.com>
> Cc: Matt Spinler <mspinler@linux.vnet.ibm.com>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/hwmon/pmbus/pmbus_core.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 390a7b02b836..d4e959bda491 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -168,7 +168,18 @@ int pmbus_set_page(struct i2c_client *client, u8 page)
>   		return 0;
>
>   	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
> +		dev_dbg(&client->dev, "Want page %u, %u cached\n", page,
> +			data->currpage);
> +
>   		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> +		if (rv) {
> +			rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
> +						       page);
> +			dev_warn(&client->dev,
> +				 "Failed to set page %u, performed one-shot retry %s: %d\n",
> +				 page, rv ? "and failed" : "with success", rv);
> +		}
> +
>   		newpage = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
>   		if (newpage != page)
>   			return -EIO;
