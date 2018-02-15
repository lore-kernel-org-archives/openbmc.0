Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3zj10x6Wf4zF1KT
 for <openbmc@lists.ozlabs.org>; Fri, 16 Feb 2018 02:49:21 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1FFmqjs067609
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 10:49:19 -0500
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2g5avufbvq-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Feb 2018 10:49:18 -0500
Received: from localhost
 by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 15 Feb 2018 10:49:16 -0500
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e19.ny.us.ibm.com (146.89.104.206) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 15 Feb 2018 10:49:14 -0500
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1FFnDFD49086634; Thu, 15 Feb 2018 15:49:13 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05650112040;
 Thu, 15 Feb 2018 10:47:14 -0500 (EST)
Received: from [9.85.172.122] (unknown [9.85.172.122])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP id 4049E112034;
 Thu, 15 Feb 2018 10:47:13 -0500 (EST)
Subject: Re: [PATCH linux dev-4.10 04/16] fsi: occ: Add tracepoints
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180215123606.25777-1-andrew@aj.id.au>
 <20180215123606.25777-5-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 15 Feb 2018 09:49:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180215123606.25777-5-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18021515-0056-0000-0000-0000041ED351
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008539; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000253; SDB=6.00990135; UDB=6.00502822; IPR=6.00769483; 
 MB=3.00019572; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-15 15:49:15
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18021515-0057-0000-0000-00000860D424
Message-Id: <2ceded33-8db6-c918-9c48-105b21116d2f@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-15_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802150194
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
X-List-Received-Date: Thu, 15 Feb 2018 15:49:22 -0000



On 02/15/2018 06:35 AM, Andrew Jeffery wrote:
> The OCC driver uses a workqueue to manage calls through to the SBEFIFO, which
> in turn uses a timer callback to execute FIFO transfers. To ease observation of
> end-to-end interactions e.g. from userspace `cat`ing an OCC hwmon attribute,
> add tracing to book-end SBEFIFO transfers. This provides some perspective on
> the time taken for a single OCC operation to take place.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/fsi/occ.c          |  9 +++++
>   include/trace/events/occ.h | 86 ++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 95 insertions(+)
>   create mode 100644 include/trace/events/occ.h
>
> diff --git a/drivers/fsi/occ.c b/drivers/fsi/occ.c
> index adc64f3fcd0a..2313b6235ba3 100644
> --- a/drivers/fsi/occ.c
> +++ b/drivers/fsi/occ.c
> @@ -30,6 +30,9 @@
>   #include <linux/wait.h>
>   #include <linux/workqueue.h>
>
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/occ.h>
> +
>   #define OCC_SRAM_BYTES		4096
>   #define OCC_CMD_DATA_BYTES	4090
>   #define OCC_RESP_DATA_BYTES	4089
> @@ -131,6 +134,8 @@ static int occ_enqueue_xfr(struct occ_xfr *xfr)
>
>   	spin_unlock_irq(&occ->list_lock);
>
> +	trace_occ_enq_xfer(client, xfr);
> +
>   	if (empty)
>   		queue_work(occ_wq, &occ->work);
>
> @@ -275,6 +280,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>
>   done:
>   	spin_unlock_irq(&client->lock);
> +	trace_occ_read_complete(client, xfr);
>   	occ_put_client(client);
>   	return rc;
>   }
> @@ -305,6 +311,7 @@ static ssize_t occ_write_common(struct occ_client *client,
>   	occ_get_client(client);
>   	xfr = &client->xfr;
>
> +	trace_occ_write_begin(client, xfr);
>   	spin_lock_irq(&client->lock);
>
>   	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> @@ -633,6 +640,7 @@ static void occ_worker(struct work_struct *work)
>   	set_bit(XFR_IN_PROGRESS, &xfr->flags);
>
>   	spin_unlock_irq(&occ->list_lock);
> +	trace_occ_worker_xfer_begin(client, xfr);
>   	mutex_lock(&occ->occ_lock);
>
>   	start = jiffies;
> @@ -695,6 +703,7 @@ static void occ_worker(struct work_struct *work)
>   	spin_unlock_irq(&occ->list_lock);
>
>   	wake_up_interruptible(&client->wait);
> +	trace_occ_worker_xfer_complete(client, xfr);
>   	occ_put_client(client);
>
>   	if (!empty)
> diff --git a/include/trace/events/occ.h b/include/trace/events/occ.h
> new file mode 100644
> index 000000000000..81395ca32ee0
> --- /dev/null
> +++ b/include/trace/events/occ.h
> @@ -0,0 +1,86 @@
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM occ
> +
> +#if !defined(_TRACE_TIMER_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_OCC_H
> +
> +#include <linux/tracepoint.h>
> +#include <linux/occ.h>
> +
> +TRACE_EVENT(occ_enq_xfer,
> +	TP_PROTO(const void *client, const void *xfer),
> +	TP_ARGS(client, xfer),
> +	TP_STRUCT__entry(
> +		__field(const void *, client)
> +		__field(const void *, xfer)
> +	),
> +	TP_fast_assign(
> +		__entry->client = client;
> +		__entry->xfer = xfer;
> +	),
> +	TP_printk("Client %p enqueued xfer %p", __entry->client, __entry->xfer)
> +);
> +
> +TRACE_EVENT(occ_read_complete,
> +	TP_PROTO(const void *client, const void *xfer),
> +	TP_ARGS(client, xfer),
> +	TP_STRUCT__entry(
> +		__field(const void *, client)
> +		__field(const void *, xfer)
> +	),
> +	TP_fast_assign(
> +		__entry->client = client;
> +		__entry->xfer = xfer;
> +	),
> +	TP_printk("Client %p completed read for xfer %p",
> +		__entry->client, __entry->xfer)
> +);
> +
> +TRACE_EVENT(occ_write_begin,
> +	TP_PROTO(const void *client, const void *xfer),
> +	TP_ARGS(client, xfer),
> +	TP_STRUCT__entry(
> +		__field(const void *, client)
> +		__field(const void *, xfer)
> +	),
> +	TP_fast_assign(
> +		__entry->client = client;
> +		__entry->xfer = xfer;
> +	),
> +	TP_printk("Client %p began write for xfer %p",
> +		__entry->client, __entry->xfer)
> +);
> +
> +TRACE_EVENT(occ_worker_xfer_begin,
> +	TP_PROTO(const void *client, const void *xfer),
> +	TP_ARGS(client, xfer),
> +	TP_STRUCT__entry(
> +		__field(const void *, client)
> +		__field(const void *, xfer)
> +	),
> +	TP_fast_assign(
> +		__entry->client = client;
> +		__entry->xfer = xfer;
> +	),
> +	TP_printk("OCC worker began client %p xfer %p",
> +		__entry->client, __entry->xfer)
> +);
> +
> +TRACE_EVENT(occ_worker_xfer_complete,
> +	TP_PROTO(const void *client, const void *xfer),
> +	TP_ARGS(client, xfer),
> +	TP_STRUCT__entry(
> +		__field(const void *, client)
> +		__field(const void *, xfer)
> +	),
> +	TP_fast_assign(
> +		__entry->client = client;
> +		__entry->xfer = xfer;
> +	),
> +	TP_printk("OCC worker completed client %p xfer %p",
> +		__entry->client, __entry->xfer)
> +);
> +
> +#endif
> +
> +#include <trace/define_trace.h>
