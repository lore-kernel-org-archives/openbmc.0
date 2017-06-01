Return-Path: <eajames@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wdr2l2QrszDqFR
 for <openbmc@lists.ozlabs.org>; Fri,  2 Jun 2017 00:54:07 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v51EruC9145957
 for <openbmc@lists.ozlabs.org>; Thu, 1 Jun 2017 10:53:56 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2atjys7d3m-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 01 Jun 2017 10:53:55 -0400
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 1 Jun 2017 10:53:50 -0400
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 1 Jun 2017 10:53:48 -0400
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v51Ernqj42205318; Thu, 1 Jun 2017 14:53:49 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59729112047;
 Thu,  1 Jun 2017 10:53:52 -0400 (EDT)
Received: from oc3016140333.ibm.com (unknown [9.41.179.225])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 03CEF112061;
 Thu,  1 Jun 2017 10:53:51 -0400 (EDT)
Subject: Re: [PATCH linux dev-4.10] i2c: fsi: Fix unused variable warning
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20170601063703.3083-1-joel@jms.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 1 Jun 2017 09:53:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <20170601063703.3083-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 17060114-0056-0000-0000-0000037992D8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007153; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00868714; UDB=6.00431747; IPR=6.00648589; 
 BA=6.00005393; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015669; XFM=3.00000015;
 UTC=2017-06-01 14:53:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060114-0057-0000-0000-000007AF9462
Message-Id: <a3c282e3-d3d7-77cf-1929-872857ae50e4@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-01_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706010277
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Jun 2017 14:54:09 -0000



On 06/01/2017 01:37 AM, Joel Stanley wrote:
> When there is no status bit to handle we return the uninitialised rc
> variable, causing this warning:
>
> drivers/i2c/busses/i2c-fsi.c: In function ‘fsi_i2c_xfer’:
> drivers/i2c/busses/i2c-fsi.c:410:7: warning: ‘rc’ may be used uninitialized in
> this function [-Wmaybe-uninitialized]
>      if (rc < 0)
>         ^
> drivers/i2c/busses/i2c-fsi.c:358:6: note: ‘rc’ was declared here
>    int rc;

Good catch, thanks.

>        ^~
>
> Instead return zero, but also print a warning as this looks like an
> error, as  we have checked the I2C_FSI_STAT register for
> I2C_STAT_ANY_RESP, but none of the status bits were set.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   drivers/i2c/busses/i2c-fsi.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index 4689479acf5e..b4eb1028a2ae 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -355,12 +355,12 @@ static int fsi_i2c_read_fifo(struct fsi_i2c_port *port, struct i2c_msg *msg,
>   static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
>   				 struct i2c_msg *msg, u32 status)
>   {
> -	int rc;
> -	u8 fifo_count;
>   	struct fsi_i2c_master *i2c = port->master;
> -	u32 dummy = 0;
> +	u8 fifo_count;
> +	int rc;
>
>   	if (status & I2C_STAT_ERR) {
> +		u32 dummy = 0;
>   		rc = fsi_i2c_write_reg(i2c->fsi, I2C_FSI_RESET_ERR, &dummy);
>   		if (rc)
>   			return rc;
> @@ -387,9 +387,12 @@ static int fsi_i2c_handle_status(struct fsi_i2c_port *port,
>   			rc = -ENODATA;
>   		else
>   			rc = msg->len;
> +		return rc;
>   	}
>
> -	return rc;
> +	dev_warn(&port->adapter.dev, "no status to handle\n");

This is fine with me, though it is currently impossible to hit the 
warning as we only call this function if a combined mask of the above 
checks (I2C_STAT_ERR, I2C_STAT_DAT_REQ, or I2C_STAT_CMD_COMP) is set. 
That's not very clear in the code, I admit.

Thanks.

Reviewed-by: Eddie James <eajames@linux.vnet.ibm.com>

> +
> +	return 0;
>   }
>
>   static int fsi_i2c_wait(struct fsi_i2c_port *port, struct i2c_msg *msg,
