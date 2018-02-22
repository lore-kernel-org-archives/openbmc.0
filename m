Return-Path: <eajames@linux.vnet.ibm.com>
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=eajames@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3znQtR52lMzF1hD
 for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2018 07:29:03 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
 w1MKPvbo123185
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:29:00 -0500
Received: from e38.co.us.ibm.com (e38.co.us.ibm.com [32.97.110.159])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ga2y4vbts-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2018 15:29:00 -0500
Received: from localhost
 by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <eajames@linux.vnet.ibm.com>;
 Thu, 22 Feb 2018 13:28:59 -0700
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 22 Feb 2018 13:28:57 -0700
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 w1MKSueJ12517662; Thu, 22 Feb 2018 13:28:56 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7925EC6037;
 Thu, 22 Feb 2018 13:28:56 -0700 (MST)
Received: from [9.80.205.44] (unknown [9.80.205.44])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 69A56C603C;
 Thu, 22 Feb 2018 13:28:55 -0700 (MST)
Subject: Re: [PATCH linux dev-4.13 04/16] fsi: sbefifo: Add tracing of
 transfers
To: Andrew Jeffery <andrew@aj.id.au>, joel@jms.id.au, jk@ozlabs.org,
 bradleyb@fuzziesquirrel.com, cbostic@linux.vnet.ibm.com
Cc: openbmc@lists.ozlabs.org
References: <20180220041844.13228-1-andrew@aj.id.au>
 <20180220041844.13228-5-andrew@aj.id.au>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Thu, 22 Feb 2018 14:28:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180220041844.13228-5-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18022220-0028-0000-0000-00000935D1C1
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008578; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000254; SDB=6.00993585; UDB=6.00504882; IPR=6.00772926; 
 MB=3.00019692; MTD=3.00000008; XFM=3.00000015; UTC=2018-02-22 20:28:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18022220-0029-0000-0000-000039B552A7
Message-Id: <ac98bc9b-a4e4-d0d1-90fb-34c365ab184e@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 22 Feb 2018 20:29:04 -0000



On 02/19/2018 10:18 PM, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Eddie James <eajames@linux.vnet.ibm.com>

> ---
>   drivers/fsi/fsi-sbefifo.c      | 16 ++++++++
>   include/trace/events/sbefifo.h | 93 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 109 insertions(+)
>   create mode 100644 include/trace/events/sbefifo.h
>
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 699de6b9a4eb..ef4a141dee2a 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -33,6 +33,9 @@
>   #include <linux/uaccess.h>
>   #include <linux/wait.h>
>
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/sbefifo.h>
> +
>   /*
>    * The SBEFIFO is a pipe-like FSI device for communicating with
>    * the self boot engine on POWER processors.
> @@ -275,6 +278,8 @@ static struct sbefifo_xfr *sbefifo_enq_xfr(struct sbefifo_client *client)
>   	if (!xfr)
>   		return ERR_PTR(-ENOMEM);
>
> +	trace_sbefifo_enq_xfer(client, xfr);
> +
>   	xfr->rbuf = &client->rbuf;
>   	xfr->wbuf = &client->wbuf;
>   	list_add_tail(&xfr->xfrs, &sbefifo->xfrs);
> @@ -303,6 +308,8 @@ static struct sbefifo_client *sbefifo_new_client(struct sbefifo *sbefifo)
>   	if (!client)
>   		return NULL;
>
> +	trace_sbefifo_new_client(client);
> +
>   	kref_init(&client->kref);
>   	client->dev = sbefifo;
>   	sbefifo_buf_init(&client->rbuf);
> @@ -343,6 +350,7 @@ static void sbefifo_release_client(struct kref *kref)
>   	}
>
>   	sbefifo_put(sbefifo);
> +	trace_sbefifo_release_client(client);
>   	kfree(client);
>   }
>
> @@ -393,6 +401,8 @@ static void sbefifo_poll_timer(unsigned long data)
>   	if (!xfr)
>   		goto out_unlock;
>
> +	trace_sbefifo_begin_xfer(xfr);
> +
>   	rbuf = xfr->rbuf;
>   	wbuf = xfr->wbuf;
>
> @@ -506,6 +516,8 @@ static void sbefifo_poll_timer(unsigned long data)
>   	}
>
>   out:
> +	trace_sbefifo_end_xfer(xfr, ret);
> +
>   	if (unlikely(ret)) {
>   		sbefifo->rc = ret;
>   		dev_err(&sbefifo->fsi_dev->dev,
> @@ -612,6 +624,10 @@ static ssize_t sbefifo_read_common(struct sbefifo_client *client,
>   		goto out;
>   	}
>
> +	trace_sbefifo_deq_xfer(client, list_first_entry_or_null(&client->xfrs,
> +							   struct sbefifo_xfr,
> +							   client));
> +
>   	n = min_t(size_t, n, len);
>
>   	if (ubuf) {
> diff --git a/include/trace/events/sbefifo.h b/include/trace/events/sbefifo.h
> new file mode 100644
> index 000000000000..4755fcb23e56
> --- /dev/null
> +++ b/include/trace/events/sbefifo.h
> @@ -0,0 +1,93 @@
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM sbefifo
> +
> +#if !defined(_TRACE_TIMER_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_SBEFIFO_H
> +
> +#include <linux/tracepoint.h>
> +#include <linux/fsi-sbefifo.h>
> +
> +TRACE_EVENT(sbefifo_new_client,
> +	TP_PROTO(const void *client),
> +	TP_ARGS(client),
> +	TP_STRUCT__entry(
> +		__field(const void *, client)
> +	),
> +	TP_fast_assign(
> +		__entry->client = client;
> +	),
> +	TP_printk("New client: %p", __entry->client)
> +);
> +
> +TRACE_EVENT(sbefifo_release_client,
> +	TP_PROTO(const void *client),
> +	TP_ARGS(client),
> +	TP_STRUCT__entry(
> +		__field(const void *, client)
> +	),
> +	TP_fast_assign(
> +		__entry->client = client;
> +	),
> +	TP_printk("Released client: %p", __entry->client)
> +);
> +
> +TRACE_EVENT(sbefifo_enq_xfer,
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
> +	TP_printk("Client %p enqueued transfer %p",
> +		  __entry->client, __entry->xfer)
> +);
> +
> +TRACE_EVENT(sbefifo_begin_xfer,
> +	TP_PROTO(const void *xfer),
> +	TP_ARGS(xfer),
> +	TP_STRUCT__entry(
> +		__field(const void *, xfer)
> +	),
> +	TP_fast_assign(
> +		__entry->xfer = xfer;
> +	),
> +	TP_printk("Began transfer %p",
> +		  __entry->xfer)
> +);
> +
> +TRACE_EVENT(sbefifo_end_xfer,
> +	TP_PROTO(const void *xfer, int ret),
> +	TP_ARGS(xfer, ret),
> +	TP_STRUCT__entry(
> +		__field(const void *, xfer)
> +		__field(int, ret)
> +	),
> +	TP_fast_assign(
> +		__entry->xfer = xfer;
> +		__entry->ret = ret;
> +	),
> +	TP_printk("Completed transfer %p: %d",
> +		  __entry->xfer, __entry->ret)
> +);
> +
> +TRACE_EVENT(sbefifo_deq_xfer,
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
> +	TP_printk("Client %p dequeueing transfer %p",
> +		  __entry->client, __entry->xfer)
> +);
> +#endif
> +
> +#include <trace/define_trace.h>
