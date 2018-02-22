Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znQxF2lq2zF1hk
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 07:31:29 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1MKVLV3068061
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:31:27 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ga25txpt6-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:31:21 -0500
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 22 Feb 2018 13:30:02 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 22 Feb 2018 13:30:00 -0700
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1MKTx5J13631806; Thu, 22 Feb 2018 13:29:59 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C225DC6043;
 Thu, 22 Feb 2018 13:29:59 -0700 (MST)
Received: from [9.80.205.44] (unknown [9.80.205.44])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id B2476C603C;
 Thu, 22 Feb 2018 13:29:58 -0700 (MST)
Subject: Re: [PATCH linux dev-4.13 06/16] fsi: occ: Add tracepoints
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180220041844.13228-1-andrew@aj.id.au>
 <20180220041844.13228-7-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 22 Feb 2018 14:29:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220041844.13228-7-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18022220-0020-0000-0000-00000D7EC08A
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008578; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00993586; UDB=6.00504882; IPR=6.00772926; 
 MB=3.00019692; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-22 20:30:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022220-0021-0000-0000-0000603B34F7
Message-Id: <29959b57-23fc-3ba4-6a11-18f94245eb21@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2018-02-22_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
 definitions=main-1802220257
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
X-List-Received-Date: Thu, 22 Feb 2018 20:31:29 -0000



On 02/19/2018 10:18 PM, Andrew Jeffery wrote:
> The OCC driver uses a workqueue to manage calls through to the SBEFIFO, which
> in turn uses a timer callback to execute FIFO transfers. To ease observation of
> end-to-end interactions e.g. from userspace `cat`ing an OCC hwmon attribute,
> add tracing to book-end SBEFIFO transfers. This provides some perspective on
> the time taken for a single OCC operation to take place.

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>   drivers/fsi/fsi-occ.c          |  9 +++++
>   include/trace/events/fsi_occ.h | 86 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 95 insertions(+)
>   create mode 100644 include/trace/events/fsi_occ.h
>
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index 171355023aec..7e47466d5f55 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -30,6 +30,9 @@
>   #include <linux/wait.h>
>   #include <linux/workqueue.h>
>
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/fsi_occ.h>
> +
>   #define OCC_SRAM_BYTES		4096
>   #define OCC_CMD_DATA_BYTES	4090
>   #define OCC_RESP_DATA_BYTES	4089
> @@ -132,6 +135,8 @@ static int occ_enqueue_xfr(struct occ_xfr *xfr)
>
>   	spin_unlock_irqrestore(&occ->list_lock, flags);
>
> +	trace_occ_enq_xfer(client, xfr);
> +
>   	if (empty)
>   		queue_work(occ_wq, &occ->work);
>
> @@ -277,6 +282,7 @@ static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
>
>   done:
>   	spin_unlock_irqrestore(&client->lock, flags);
> +	trace_occ_read_complete(client, xfr);
>   	occ_put_client(client);
>   	return rc;
>   }
> @@ -308,6 +314,7 @@ static ssize_t occ_write_common(struct occ_client *client,
>   	occ_get_client(client);
>   	xfr = &client->xfr;
>
> +	trace_occ_write_begin(client, xfr);
>   	spin_lock_irqsave(&client->lock, flags);
>
>   	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> @@ -638,6 +645,7 @@ static void occ_worker(struct work_struct *work)
>   	set_bit(XFR_IN_PROGRESS, &xfr->flags);
>
>   	spin_unlock_irqrestore(&occ->list_lock, flags);
> +	trace_occ_worker_xfer_begin(client, xfr);
>   	mutex_lock(&occ->occ_lock);
>
>   	start = jiffies;
> @@ -700,6 +708,7 @@ static void occ_worker(struct work_struct *work)
>   	spin_unlock_irqrestore(&occ->list_lock, flags);
>
>   	wake_up_interruptible(&client->wait);
> +	trace_occ_worker_xfer_complete(client, xfr);
>   	occ_put_client(client);
>
>   	if (!empty)
> diff --git a/include/trace/events/fsi_occ.h b/include/trace/events/fsi_occ.h
> new file mode 100644
> index 000000000000..89562436de86
> --- /dev/null
> +++ b/include/trace/events/fsi_occ.h
> @@ -0,0 +1,86 @@
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM fsi_occ
> +
> +#if !defined(_TRACE_TIMER_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_OCC_H
> +
> +#include <linux/tracepoint.h>
> +#include <linux/fsi-occ.h>
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
