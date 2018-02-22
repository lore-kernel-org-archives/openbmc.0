Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znQv10XTWzF1hf
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 07:29:32 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1MKSLcL062913
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:29:31 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ga25txpe0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:29:29 -0500
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 22 Feb 2018 13:29:28 -0700
Received: from b03cxnp07029.gho.boulder.ibm.com (9.17.130.16)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 22 Feb 2018 13:29:26 -0700
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1MKTQuC9634282; Thu, 22 Feb 2018 13:29:26 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10247C6043;
 Thu, 22 Feb 2018 13:29:26 -0700 (MST)
Received: from [9.80.205.44] (unknown [9.80.205.44])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 0BC63C603C;
 Thu, 22 Feb 2018 13:29:24 -0700 (MST)
Subject: Re: [PATCH linux dev-4.13 05/16] fsi: gpio: Trace busy count
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180220041844.13228-1-andrew@aj.id.au>
 <20180220041844.13228-6-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 22 Feb 2018 14:29:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220041844.13228-6-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18022220-0008-0000-0000-0000095CD16F
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008578; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00993586; UDB=6.00504882; IPR=6.00772926; 
 MB=3.00019693; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-22 20:29:28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022220-0009-0000-0000-00004621779D
Message-Id: <c61d132b-5325-b5bc-00b4-ce17dd735f6b@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802220256
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
X-List-Received-Date: Thu, 22 Feb 2018 20:29:33 -0000



On 02/19/2018 10:18 PM, Andrew Jeffery wrote:
> An observation from trace output of the existing FSI tracepoints was that the
> remote device was sometimes reporting as busy. Add a new tracepoint reporting
> the busy count in order to get a better grip on how often this is the case,

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/fsi/fsi-master-gpio.c          |  3 +++
>   include/trace/events/fsi_master_gpio.h | 16 ++++++++++++++++
>   2 files changed, 19 insertions(+)
>
> diff --git a/drivers/fsi/fsi-master-gpio.c b/drivers/fsi/fsi-master-gpio.c
> index 3f487449a277..2a49b167effe 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -401,6 +401,9 @@ static int poll_for_response(struct fsi_master_gpio *master,
>   		break;
>   	}
>
> +	if (busy_count > 0)
> +		trace_fsi_master_gpio_poll_response_busy(master, busy_count);
> +
>   	/* Clock the slave enough to be ready for next operation */
>   	clock_zeros(master, FSI_GPIO_PRIME_SLAVE_CLOCKS);
>   	return rc;
> diff --git a/include/trace/events/fsi_master_gpio.h b/include/trace/events/fsi_master_gpio.h
> index 11b36c119048..48e83e5755f4 100644
> --- a/include/trace/events/fsi_master_gpio.h
> +++ b/include/trace/events/fsi_master_gpio.h
> @@ -63,6 +63,22 @@ TRACE_EVENT(fsi_master_gpio_break,
>   	)
>   );
>
> +
> +TRACE_EVENT(fsi_master_gpio_poll_response_busy,
> +	TP_PROTO(const struct fsi_master_gpio *master, int busy),
> +	TP_ARGS(master, busy),
> +	TP_STRUCT__entry(
> +		__field(int,	master_idx)
> +		__field(int,	busy)
> +	),
> +	TP_fast_assign(
> +		__entry->master_idx = master->master.idx;
> +		__entry->busy = busy;
> +	),
> +	TP_printk("fsi-gpio%d: device reported busy %d times",
> +		__entry->master_idx, __entry->busy)
> +);
> +
>   #endif /* _TRACE_FSI_MASTER_GPIO_H */
>
>   #include <trace/define_trace.h>
