Return-Path: <andrew@aj.id.au>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="M8E9+SDh"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="M1xxJZ0Q"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 418w744d4yzF0Tn
 for <openbmc@lists.ozlabs.org>; Tue, 19 Jun 2018 14:32:48 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 7CD6421F91;
 Tue, 19 Jun 2018 00:32:41 -0400 (EDT)
Received: from web4 ([10.202.2.214])
 by compute4.internal (MEProxy); Tue, 19 Jun 2018 00:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=4CbJ5t6mNuuCvXsSkseCHCOTHfWUl
 bFV/N+J5TiqcVY=; b=M8E9+SDhWh1VwbcILPn7FCwbnzvc+OGhx4XMNFD4qNQA3
 +mgyiDZmb335B1v2wvtbWhH6AtSURKDf7CspCkCUAKXX7xppASj23K13YdNhFRAF
 0anj+05oLVyOntJyjxhDun7dP/HzDImO4xvK5FOS5znOfl7+apmrJ+OdGnyFr2zH
 IADI9qLJRL1RUAXTVWLQcBWY9W5a2iaCpyQU/7K10IWPjhotV6UfvM6f/B2nOQsg
 x7KcITEFgGUHiV0jj2Hv4jo9Z2RHUypVy55936yg1xbNAs4mlu2vPRVUszdaemp4
 M0hAfKIv5qolJMs50hlK9jdMGqBrektek/a5Rmvmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=4CbJ5t
 6mNuuCvXsSkseCHCOTHfWUlbFV/N+J5TiqcVY=; b=M1xxJZ0Q8/rx9I56qvaute
 roTTuNLCGTXDL8YEyxLXSaO8ADEvkAdBWt824njy7dJmdFo5uaoBoU1nssfbShd+
 Tm+vu5QWu4Yat339S1797pl7C6P4AXPvjt+tMP11XOKhaNBBsz7914SQLJ7lpi+r
 8Ve6hVJ6TUgGXbr07/XVuxQX3VJaRj/dpjlN0Aof793LD1pOPpm3QHj8N6/R4WTl
 JRFf5nGOVDaO/0Q3ABtcYhEr8pqcmi6xTdCt9Hj0Kx2CHsqgAL0PO4mNbEN6o6GO
 QIkQ2WYTrugP8boSmH8sESpO56D1fb+7fXIPfQ3liLLDAqTcQZvVsbi9fwSQbg0g
 ==
X-ME-Proxy: <xmx:aIcoWybgpnNozGooGOj17q7Hg6-o24VNrnDe4ojGl_-au5CBCdFlCA>
 <xmx:aIcoW1mKwPa7UwnwwLiQn8npQKcD3MtMGrWht8h4xHgvNTjtD7911A>
 <xmx:aYcoW-wmLezhxNpat3bS8GZBLdvdVpldjZvKBQq-vAcoQCdwz0FYmQ>
 <xmx:aYcoWzMYiJMd9tFFKLBKVpPH8_2deToetA_hIHGyeaTto6kT60mmZQ>
 <xmx:aYcoWyQLTD0klcK0d3RnOabvx3Ca6NPGAi9Oxfbfba9eD42zmi4ZCQ>
 <xmx:aYcoWxWnXZpuN3JUkpiG4O4kQdFhgYfiD082kJN5kTV49OUr4O0e8A>
X-ME-Sender: <xms:aIcoWzF4XLMxh3CPoVcL23LJ__tdHOFOUn3kiiGhdHQoJ-eb8Dr5oA>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
 id C3711BA4C4; Tue, 19 Jun 2018 00:32:40 -0400 (EDT)
Message-Id: <1529382760.3868846.1412653552.026DAE4E@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, openbmc@lists.ozlabs.org
Cc: Eddie James <eajames@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
X-Mailer: MessagingEngine.com Webmail Interface - ajax-0d8ea36c
Date: Tue, 19 Jun 2018 14:02:40 +0930
Subject: Re: [PATCH linux dev-4.13] fsi: occ: Rework and simplify driver
References: <6b32b34cf3940c9095e2fb232cf0b327eafdcf55.camel@kernel.crashing.org>
In-Reply-To: <6b32b34cf3940c9095e2fb232cf0b327eafdcf55.camel@kernel.crashing.org>
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
X-List-Received-Date: Tue, 19 Jun 2018 04:32:51 -0000

On Thu, 14 Jun 2018, at 13:10, Benjamin Herrenschmidt wrote:
> This gets rid of the struct xfer and workqueue, and provides
> a much simpler synchronous API for use in-kernel. The user
> API remains the same, though it loses the non-blocking
> facility which wasn't particularly useful.
> 
> The tracepoints are gone as they were rather specific to the
> complex queuing mechanism that is now gone.179

179?

Anyway, I had a plan to do the same thing, so:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> 
> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
> 
> This driver isn't upstream yet, so this is an update that
> could/should be "folded" into the final upstream submission.
> 
>  drivers/fsi/fsi-occ.c          | 515 +++++++--------------------------
>  drivers/hwmon/occ/common.c     |   2 +
>  drivers/hwmon/occ/p9_sbe.c     |  56 +---
>  include/linux/fsi-occ.h        |   9 +-
>  include/trace/events/fsi_occ.h |  86 ------
>  5 files changed, 119 insertions(+), 549 deletions(-)
>  delete mode 100644 include/trace/events/fsi_occ.h
> 
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index 15f41f45fb31..e4ebda646453 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -29,33 +29,30 @@
>  #include <linux/wait.h>
>  #include <linux/workqueue.h>
>  
> -#define CREATE_TRACE_POINTS
> -#include <trace/events/fsi_occ.h>
> -
>  #define OCC_SRAM_BYTES		4096
>  #define OCC_CMD_DATA_BYTES	4090
>  #define OCC_RESP_DATA_BYTES	4089
>  
> +#define OCC_SRAM_CMD_ADDR	0xFFFBE000
> +#define OCC_SRAM_RSP_ADDR	0xFFFBF000
> +
>  /*
> - * Assume we don't have FFDC, if we do we'll overflow and
> + * Assume we don't have much FFDC, if we do we'll overflow and
>   * fail the command. This needs to be big enough for simple
>   * commands as well.
>   */
> -#define OCC_SBE_STATUS_WORDS	16
> +#define OCC_SBE_STATUS_WORDS	32
>  
>  #define OCC_TIMEOUT_MS		1000
>  #define OCC_CMD_IN_PRG_WAIT_MS	50
>  
>  struct occ {
> +	struct device *dev;
>  	struct device *sbefifo;
>  	char name[32];
>  	int idx;
>  	struct miscdevice mdev;
> -	struct list_head xfrs;
> -	spinlock_t list_lock;		/* lock access to the xfrs list */
> -	struct mutex occ_lock;		/* lock access to the hardware */
> -	struct work_struct work;
> -	bool cancel;
> +	struct mutex occ_lock;
>  };
>  
>  #define to_occ(x)	container_of((x), struct occ, mdev)
> @@ -68,247 +65,82 @@ struct occ_response {
>  	u8 data[OCC_RESP_DATA_BYTES + 2];	/* two bytes checksum */
>  } __packed;
>  
> -/*
> - * transfer flags are NOT mutually exclusive
> - *
> - * Initial flags are none; transfer is created and queued from write(). All
> - *  flags are cleared when the transfer is completed by closing the file or
> - *  reading all of the available response data.
> - * XFR_IN_PROGRESS is set when a transfer is started from occ_worker_putsram,
> - *  and cleared if the transfer fails or occ_worker_getsram completes.
> - * XFR_COMPLETE is set when a transfer fails or finishes occ_worker_getsram.
> - * XFR_CANCELED is set when the transfer's client is released.
> - */
> -enum {
> -	XFR_IN_PROGRESS,
> -	XFR_COMPLETE,
> -	XFR_CANCELED,
> -};
> -
> -struct occ_xfr {
> -	struct list_head link;
> -	int rc;
> -	u8 buf[OCC_SRAM_BYTES];
> -	size_t cmd_data_length;
> -	size_t resp_data_length;
> -	unsigned long flags;
> -};
> -
> -/*
> - * client flags
> - *
> - * CLIENT_NONBLOCKING is set during open() if the file was opened with the
> - *  O_NONBLOCK flag.
> - * CLIENT_XFR_PENDING is set during write() and cleared when all data has been
> - *  read.
> - */
> -enum {
> -	CLIENT_NONBLOCKING,
> -	CLIENT_XFR_PENDING,
> -};
> -
>  struct occ_client {
> -	struct kref kref;
>  	struct occ *occ;
> -	struct occ_xfr xfr;
> -	spinlock_t lock;		/* lock access to the client state */
> -	wait_queue_head_t wait;
> +	struct mutex lock;
> +	size_t data_size;
>  	size_t read_offset;
> -	unsigned long flags;
> +	u8 *buffer;
>  };
>  
>  #define to_client(x)	container_of((x), struct occ_client, xfr)
>  
> -static struct workqueue_struct *occ_wq;
> -
>  static DEFINE_IDA(occ_ida);
>  
> -static int occ_enqueue_xfr(struct occ_xfr *xfr)
> -{
> -	int empty;
> -	unsigned long flags;
> -	struct occ_client *client = to_client(xfr);
> -	struct occ *occ = client->occ;
> -
> -	if (occ->cancel)
> -		return -ENODEV;
> -
> -	spin_lock_irqsave(&occ->list_lock, flags);
> -
> -	empty = list_empty(&occ->xfrs);
> -	list_add_tail(&xfr->link, &occ->xfrs);
> -
> -	spin_unlock_irqrestore(&occ->list_lock, flags);
> -
> -	trace_occ_enq_xfer(client, xfr);
> -
> -	if (empty)
> -		queue_work(occ_wq, &occ->work);
> -
> -	return 0;
> -}
> -
> -static void occ_get_client(struct occ_client *client)
> -{
> -	kref_get(&client->kref);
> -}
> -
> -static void occ_client_release(struct kref *kref)
> -{
> -	struct occ_client *client = container_of(kref, struct occ_client,
> -						 kref);
> -
> -	kfree(client);
> -}
> -
> -static void occ_put_client(struct occ_client *client)
> -{
> -	kref_put(&client->kref, occ_client_release);
> -}
> -
> -static struct occ_client *occ_open_common(struct occ *occ, unsigned long flags)
> -{
> -	struct occ_client *client = kzalloc(sizeof(*client), GFP_KERNEL);
> -
> -	if (!client)
> -		return NULL;
> -
> -	client->occ = occ;
> -	kref_init(&client->kref);
> -	spin_lock_init(&client->lock);
> -	init_waitqueue_head(&client->wait);
> -
> -	if (flags & O_NONBLOCK)
> -		set_bit(CLIENT_NONBLOCKING, &client->flags);
> -
> -	return client;
> -}
> -
>  static int occ_open(struct inode *inode, struct file *file)
>  {
> -	struct occ_client *client;
> +	struct occ_client *client = kzalloc(sizeof(*client), GFP_KERNEL);
>  	struct miscdevice *mdev = file->private_data;
>  	struct occ *occ = to_occ(mdev);
>  
> -	client = occ_open_common(occ, file->f_flags);
>  	if (!client)
>  		return -ENOMEM;
> -
> +	client->buffer = (u8 *)__get_free_page(GFP_KERNEL);
> +	if (!client->buffer) {
> +		kfree(client);
> +		return -ENOMEM;
> +	}
> +	client->occ = occ;
> +	mutex_init(&client->lock);
>  	file->private_data = client;
>  
> -	return 0;
> -}
> +	/* We allocate a 1-page buffer, make sure it all fits */
> +	BUILD_BUG_ON((OCC_CMD_DATA_BYTES + 3) > PAGE_SIZE);
> +	BUILD_BUG_ON((OCC_RESP_DATA_BYTES + 7) > PAGE_SIZE);
>  
> -static inline bool occ_read_ready(struct occ_xfr *xfr, struct occ *occ)
> -{
> -	return test_bit(XFR_COMPLETE, &xfr->flags) ||
> -		test_bit(XFR_CANCELED, &xfr->flags) || occ->cancel;
> +	return 0;
>  }
>  
> -static ssize_t occ_read_common(struct occ_client *client, char __user *ubuf,
> -			       char *kbuf, size_t len)
> +static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
> +			loff_t *offset)
>  {
> -	int rc;
> -	unsigned long flags;
> -	size_t bytes;
> -	struct occ_xfr *xfr;
> -	struct occ *occ;
> +	struct occ_client *client = file->private_data;
> +	ssize_t rc = 0;
>  
>  	if (!client)
>  		return -ENODEV;
> -
>  	if (len > OCC_SRAM_BYTES)
>  		return -EINVAL;
>  
> -	occ_get_client(client);
> -	xfr = &client->xfr;
> -	occ = client->occ;
> -
> -	spin_lock_irqsave(&client->lock, flags);
> -
> -	if (!test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> -		/* we just finished reading all data, return 0 */
> -		if (client->read_offset) {
> -			rc = 0;
> -			client->read_offset = 0;
> -		} else {
> -			rc = -ENOMSG;
> -		}
> -
> -		goto done;
> -	}
> -
> -	if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
> -		if (test_bit(CLIENT_NONBLOCKING, &client->flags)) {
> -			rc = -EAGAIN;
> -			goto done;
> -		}
> -
> -		spin_unlock_irqrestore(&client->lock, flags);
> -
> -		rc = wait_event_interruptible(client->wait,
> -					      occ_read_ready(xfr, occ));
> -
> -		spin_lock_irqsave(&client->lock, flags);
> -
> -		if (!test_bit(XFR_COMPLETE, &xfr->flags)) {
> -			if (occ->cancel || test_bit(XFR_CANCELED, &xfr->flags))
> -				rc = -ENODEV;
> -			else
> -				rc = -EINTR;
> -
> -			goto done;
> -		}
> -	}
> +	mutex_lock(&client->lock);
>  
> -	if (xfr->rc) {
> -		rc = xfr->rc;
> +	/* This should not be possible ... */
> +	if (WARN_ON_ONCE(client->read_offset > client->data_size)) {
> +		rc = -EIO;
>  		goto done;
>  	}
>  
> -	bytes = min(len, xfr->resp_data_length - client->read_offset);
> -	if (ubuf) {
> -		if (copy_to_user(ubuf, &xfr->buf[client->read_offset],
> -				 bytes)) {
> -			rc = -EFAULT;
> -			goto done;
> -		}
> -	} else {
> -		memcpy(kbuf, &xfr->buf[client->read_offset], bytes);
> -	}
> -
> -	client->read_offset += bytes;
> -
> -	/* xfr done */
> -	if (client->read_offset == xfr->resp_data_length)
> -		clear_bit(CLIENT_XFR_PENDING, &client->flags);
> +	/* Grab how much data we have to read */
> +	rc = min(len, client->data_size - client->read_offset);
>  
> -	rc = bytes;
> +	if (copy_to_user(buf, client->buffer + client->read_offset, rc))
> +		rc = -EFAULT;
> +	else
> +		client->read_offset += rc;
> + done:
> +	mutex_unlock(&client->lock);
>  
> -done:
> -	spin_unlock_irqrestore(&client->lock, flags);
> -	trace_occ_read_complete(client, xfr);
> -	occ_put_client(client);
>  	return rc;
>  }
>  
> -static ssize_t occ_read(struct file *file, char __user *buf, size_t len,
> -			loff_t *offset)
> +static ssize_t occ_write(struct file *file, const char __user *buf,
> +			 size_t len, loff_t *offset)
>  {
>  	struct occ_client *client = file->private_data;
> -
> -	return occ_read_common(client, buf, NULL, len);
> -}
> -
> -static ssize_t occ_write_common(struct occ_client *client,
> -				const char __user *ubuf, const char *kbuf,
> -				size_t len)
> -{
> -	int rc;
> -	unsigned long flags;
> -	unsigned int i;
> -	u16 data_length, checksum = 0;
> -	struct occ_xfr *xfr;
> +	size_t rlen, data_length;
> +	u16 checksum = 0;
> +	ssize_t rc, i;
> +	u8 *cmd;
>  
>  	if (!client)
>  		return -ENODEV;
> @@ -316,115 +148,66 @@ static ssize_t occ_write_common(struct occ_client 
> *client,
>  	if (len > (OCC_CMD_DATA_BYTES + 3) || len < 3)
>  		return -EINVAL;
>  
> -	occ_get_client(client);
> -	xfr = &client->xfr;
> -
> -	trace_occ_write_begin(client, xfr);
> -	spin_lock_irqsave(&client->lock, flags);
> +	mutex_lock(&client->lock);
>  
> -	if (test_bit(CLIENT_XFR_PENDING, &client->flags)) {
> -		rc = -EBUSY;
> -		goto done;
> -	}
> +	/* Construct the command */
> +	cmd = client->buffer;
>  
> -	memset(xfr, 0, sizeof(*xfr));	/* clear out the transfer */
> -	xfr->buf[0] = 1;		/* occ sequence number */
> +	/* Sequence number (we could increment it and compare with the response) */
> +	cmd[0] = 1;
>  
>  	/*
> -	 * Assume user data follows the occ command format.
> -	 * byte 0: command type
> +	 * Copy the user command (assume user data follows the occ command format)
> +	 *  byte 0  : command type
>  	 * bytes 1-2: data length (msb first)
>  	 * bytes 3-n: data
>  	 */
> -	if (ubuf) {
> -		if (copy_from_user(&xfr->buf[1], ubuf, len)) {
> -			rc = -EFAULT;
> -			goto done;
> -		}
> -	} else {
> -		memcpy(&xfr->buf[1], kbuf, len);
> +	if (copy_from_user(&cmd[1], buf, len)) {
> +		rc = -EFAULT;
> +		goto done;
>  	}
>  
> -	data_length = (xfr->buf[2] << 8) + xfr->buf[3];
> +	/* Extract data length */
> +	data_length = (cmd[2] << 8) + cmd[3];
>  	if (data_length > OCC_CMD_DATA_BYTES) {
>  		rc = -EINVAL;
>  		goto done;
>  	}
>  
> +	/* Calculate checksum */
>  	for (i = 0; i < data_length + 4; ++i)
> -		checksum += xfr->buf[i];
> -
> -	xfr->buf[data_length + 4] = checksum >> 8;
> -	xfr->buf[data_length + 5] = checksum & 0xFF;
> +		checksum += cmd[i];
> +	cmd[data_length + 4] = checksum >> 8;
> +	cmd[data_length + 5] = checksum & 0xFF;
>  
> -	xfr->cmd_data_length = data_length + 6;
> -	client->read_offset = 0;
> -
> -	rc = occ_enqueue_xfr(xfr);
> +	/* Submit command */
> +	rlen = PAGE_SIZE;
> +	rc = fsi_occ_submit(client->occ->dev, cmd, data_length + 6, cmd, &rlen);
>  	if (rc)
>  		goto done;
>  
> -	set_bit(CLIENT_XFR_PENDING, &client->flags);
> +	/* Set read tracking data */
> +	client->data_size = rlen;
> +	client->read_offset = 0;
> +
> +	/* Done */
>  	rc = len;
> + done:
> +	mutex_unlock(&client->lock);
>  
> -done:
> -	spin_unlock_irqrestore(&client->lock, flags);
> -	occ_put_client(client);
>  	return rc;
>  }
>  
> -static ssize_t occ_write(struct file *file, const char __user *buf,
> -			 size_t len, loff_t *offset)
> +static int occ_release(struct inode *inode, struct file *file)
>  {
>  	struct occ_client *client = file->private_data;
>  
> -	return occ_write_common(client, buf, NULL, len);
> -}
> -
> -static int occ_release_common(struct occ_client *client)
> -{
> -	unsigned long flags;
> -	struct occ *occ;
> -	struct occ_xfr *xfr;
> -
> -	if (!client)
> -		return -ENODEV;
> -
> -	xfr = &client->xfr;
> -	occ = client->occ;
> -
> -	spin_lock_irqsave(&client->lock, flags);
> -
> -	set_bit(XFR_CANCELED, &xfr->flags);
> -	if (!test_bit(CLIENT_XFR_PENDING, &client->flags))
> -		goto done;
> -
> -	spin_lock(&occ->list_lock);
> -
> -	if (!test_bit(XFR_IN_PROGRESS, &xfr->flags)) {
> -		/* already deleted from list if complete */
> -		if (!test_bit(XFR_COMPLETE, &xfr->flags))
> -			list_del(&xfr->link);
> -	}
> -
> -	spin_unlock(&occ->list_lock);
> -
> -	wake_up_all(&client->wait);
> -
> -done:
> -	spin_unlock_irqrestore(&client->lock, flags);
> +	free_page((unsigned long)client->buffer);
> +	kfree(client);
>  
> -	occ_put_client(client);
>  	return 0;
>  }
>  
> -static int occ_release(struct inode *inode, struct file *file)
> -{
> -	struct occ_client *client = file->private_data;
> -
> -	return occ_release_common(client);
> -}
> -
>  static const struct file_operations occ_fops = {
>  	.owner = THIS_MODULE,
>  	.open = occ_open,
> @@ -435,10 +218,10 @@ static const struct file_operations occ_fops = {
>  
>  static int occ_verify_checksum(struct occ_response *resp, u16 data_length)
>  {
> -	u16 i;
>  	u16 checksum;
>  	/* Fetch the two bytes after the data for the checksum. */
>  	u16 checksum_resp = get_unaligned_be16(&resp->data[data_length]);
> +	u16 i;
>  
>  	checksum = resp->seq_no;
>  	checksum += resp->cmd_type;
> @@ -454,7 +237,7 @@ static int occ_verify_checksum(struct occ_response 
> *resp, u16 data_length)
>  	return 0;
>  }
>  
> -static int occ_getsram(struct device *sbefifo, u32 address, u8 *data,
> +static int occ_getsram(struct device *sbefifo, u32 address, void *data,
>  		       ssize_t len)
>  {
>  	u32 data_len = ((len + 7) / 8) * 8;	/* must be multiples of 8 B */
> @@ -504,7 +287,7 @@ static int occ_getsram(struct device *sbefifo, u32 
> address, u8 *data,
>  	return rc;
>  }
>  
> -static int occ_putsram(struct device *sbefifo, u32 address, u8 *data,
> +static int occ_putsram(struct device *sbefifo, u32 address, const void *data,
>  		       ssize_t len)
>  {
>  	size_t cmd_len, buf_len, resp_len, resp_data_len;
> @@ -613,46 +396,28 @@ static int occ_trigger_attn(struct device *sbefifo)
>  	return rc;
>  }
>  
> -static void occ_worker(struct work_struct *work)
> +int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
> +		   void *response, size_t *resp_len)
>  {
> -	int rc = 0, empty;
> -	u16 resp_data_length;
> -	unsigned long flags;
> -	unsigned long start;
>  	const unsigned long timeout = msecs_to_jiffies(OCC_TIMEOUT_MS);
> -	const long int wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
> -	struct occ_xfr *xfr;
> -	struct occ_response *resp;
> -	struct occ_client *client;
> -	struct occ *occ = container_of(work, struct occ, work);
> +	const unsigned long wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
> +	struct occ *occ = dev_get_drvdata(dev);
> +	struct occ_response *resp = response;
>  	struct device *sbefifo = occ->sbefifo;
> +	u16 resp_data_length;
> +	unsigned long start;
> +	int rc;
>  
> -again:
> -	if (occ->cancel)
> -		return;
> -
> -	spin_lock_irqsave(&occ->list_lock, flags);
> -
> -	xfr = list_first_entry_or_null(&occ->xfrs, struct occ_xfr, link);
> -	if (!xfr) {
> -		spin_unlock_irqrestore(&occ->list_lock, flags);
> -		return;
> +	if (!occ)
> +		return -ENODEV;
> +	if (*resp_len < 7) {
> +		dev_dbg(dev, "Bad resplen %d\n", *resp_len);
> +		return -EINVAL;
>  	}
>  
> -	client = to_client(xfr);
> -	occ_get_client(client);
> -	resp = (struct occ_response *)xfr->buf;
> -	set_bit(XFR_IN_PROGRESS, &xfr->flags);
> -
> -	spin_unlock_irqrestore(&occ->list_lock, flags);
> -	trace_occ_worker_xfer_begin(client, xfr);
>  	mutex_lock(&occ->occ_lock);
>  
> -	start = jiffies;
> -
> -	/* write occ command */
> -	rc = occ_putsram(sbefifo, 0xFFFBE000, xfr->buf,
> -			 xfr->cmd_data_length);
> +	rc = occ_putsram(sbefifo, OCC_SRAM_CMD_ADDR, request, req_len);
>  	if (rc)
>  		goto done;
>  
> @@ -660,91 +425,54 @@ static void occ_worker(struct work_struct *work)
>  	if (rc)
>  		goto done;
>  
> -	/* read occ response */
> +	/* Read occ response header */
> +	start = jiffies;
>  	do {
> -		rc = occ_getsram(sbefifo, 0xFFFBF000, xfr->buf, 8);
> +		rc = occ_getsram(sbefifo, OCC_SRAM_RSP_ADDR, resp, 8);
>  		if (rc)
>  			goto done;
>  
>  		if (resp->return_status == OCC_RESP_CMD_IN_PRG) {
> -			rc = -EALREADY;
> +			rc = -ETIMEDOUT;
>  
>  			if (time_after(jiffies, start + timeout))
>  				break;
>  
> -			set_current_state(TASK_INTERRUPTIBLE);
> +			set_current_state(TASK_UNINTERRUPTIBLE);
>  			schedule_timeout(wait_time);
>  		}
>  	} while (rc);
>  
> +	/* Extract size of response data */
>  	resp_data_length = get_unaligned_be16(&resp->data_length);
> -	if (resp_data_length > OCC_RESP_DATA_BYTES) {
> +
> +	/* Message size is data length + 5 bytes header + 2 bytes checksum */
> +	if ((resp_data_length + 7) > *resp_len) {
>  		rc = -EMSGSIZE;
>  		goto done;
>  	}
>  
> +	dev_dbg(dev, "resp_status=%02x resp_data_len=%d\n",
> +		resp->return_status, resp_data_length);
> +
> +	/* Grab the rest */
>  	if (resp_data_length > 1) {
>  		/* already got 3 bytes resp, also need 2 bytes checksum */
> -		rc = occ_getsram(sbefifo, 0xFFFBF008, &xfr->buf[8],
> -				 resp_data_length - 1);
> +		rc = occ_getsram(sbefifo, OCC_SRAM_RSP_ADDR + 8,
> +				 &resp->data[3], resp_data_length - 1);
>  		if (rc)
>  			goto done;
>  	}
>  
> -	xfr->resp_data_length = resp_data_length + 7;
> +	*resp_len = resp_data_length + 7;
>  
>  	rc = occ_verify_checksum(resp, resp_data_length);
> -
> -done:
> + done:
>  	mutex_unlock(&occ->occ_lock);
>  
> -	xfr->rc = rc;
> -	set_bit(XFR_COMPLETE, &xfr->flags);
> -
> -	spin_lock_irqsave(&occ->list_lock, flags);
> -
> -	clear_bit(XFR_IN_PROGRESS, &xfr->flags);
> -	list_del(&xfr->link);
> -	empty = list_empty(&occ->xfrs);
> -
> -	spin_unlock_irqrestore(&occ->list_lock, flags);
> -
> -	wake_up_interruptible(&client->wait);
> -	trace_occ_worker_xfer_complete(client, xfr);
> -	occ_put_client(client);
> -
> -	if (!empty)
> -		goto again;
> -}
> -
> -struct occ_client *occ_drv_open(struct device *dev, unsigned long flags)
> -{
> -	struct occ *occ = dev_get_drvdata(dev);
> -
> -	if (!occ)
> -		return NULL;
> -
> -	return occ_open_common(occ, flags);
> -}
> -EXPORT_SYMBOL_GPL(occ_drv_open);
> -
> -int occ_drv_read(struct occ_client *client, char *buf, size_t len)
> -{
> -	return occ_read_common(client, NULL, buf, len);
> -}
> -EXPORT_SYMBOL_GPL(occ_drv_read);
> -
> -int occ_drv_write(struct occ_client *client, const char *buf, size_t len)
> -{
> -	return occ_write_common(client, NULL, buf, len);
> -}
> -EXPORT_SYMBOL_GPL(occ_drv_write);
> -
> -void occ_drv_release(struct occ_client *client)
> -{
> -	occ_release_common(client);
> +	return rc;
>  }
> -EXPORT_SYMBOL_GPL(occ_drv_release);
> +EXPORT_SYMBOL_GPL(fsi_occ_submit);
>  
>  static int occ_unregister_child(struct device *dev, void *data)
>  {
> @@ -771,11 +499,9 @@ static int occ_probe(struct platform_device *pdev)
>  	if (!occ)
>  		return -ENOMEM;
>  
> +	occ->dev = dev;
>  	occ->sbefifo = dev->parent;
> -	INIT_LIST_HEAD(&occ->xfrs);
> -	spin_lock_init(&occ->list_lock);
>  	mutex_init(&occ->occ_lock);
> -	INIT_WORK(&occ->work, occ_worker);
>  
>  	if (dev->of_node) {
>  		rc = of_property_read_u32(dev->of_node, "reg", &reg);
> @@ -819,24 +545,11 @@ static int occ_probe(struct platform_device *pdev)
>  
>  static int occ_remove(struct platform_device *pdev)
>  {
> -	unsigned long flags;
>  	struct occ *occ = platform_get_drvdata(pdev);
> -	struct occ_xfr *xfr;
> -	struct occ_client *client;
> -
> -	occ->cancel = true;
> -
> -	spin_lock_irqsave(&occ->list_lock, flags);
> -	list_for_each_entry(xfr, &occ->xfrs, link) {
> -		client = to_client(xfr);
> -		wake_up_all(&client->wait);
> -	}
> -	spin_unlock_irqrestore(&occ->list_lock, flags);
>  
>  	misc_deregister(&occ->mdev);
> -	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
>  
> -	cancel_work_sync(&occ->work);
> +	device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
>  
>  	ida_simple_remove(&occ_ida, occ->idx);
>  
> @@ -859,17 +572,11 @@ static struct platform_driver occ_driver = {
>  
>  static int occ_init(void)
>  {
> -	occ_wq = create_singlethread_workqueue("occ");
> -	if (!occ_wq)
> -		return -ENOMEM;
> -
>  	return platform_driver_register(&occ_driver);
>  }
>  
>  static void occ_exit(void)
>  {
> -	destroy_workqueue(occ_wq);
> -
>  	platform_driver_unregister(&occ_driver);
>  
>  	ida_destroy(&occ_ida);
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index c1bccf53b425..d7e6a4de8d85 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -7,6 +7,8 @@
>   * (at your option) any later version.
>   */
>  
> +#define DEBUG
> +
>  #include <linux/device.h>
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index 9a1d3ae56d69..34fe4d3bc247 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -12,69 +12,26 @@
>  #include <linux/fsi-occ.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> -#include <linux/spinlock.h>
>  
>  #include "common.h"
>  
> -/* Satisfy lockdep's need for static keys */
> -static struct lock_class_key p9_sbe_occ_client_lock_key;
> -
>  struct p9_sbe_occ {
>  	struct occ occ;
>  	struct device *sbe;
> -
> -	/*
> -	 * Pointer to occ device client. We store this so that we can cancel
> -	 * the client operations in remove() if necessary. We only need one
> -	 * pointer since we do one OCC operation (open, write, read, close) at
> -	 * a time (access to p9_sbe_occ_send_cmd is locked in the common code
> -	 * with occ.lock).
> -	 */
> -	struct occ_client *client;
> -
> -	/*
> -	 * This lock controls access to the client pointer and ensures atomic
> -	 * open, close and NULL assignment. This prevents simultaneous opening
> -	 * and closing of the client, or closing multiple times.
> -	 */
> -	struct mutex client_lock;
>  };
>  
>  #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
>  
> -static void p9_sbe_occ_close_client(struct p9_sbe_occ *ctx)
> -{
> -	struct occ_client *tmp_client;
> -
> -	mutex_lock(&ctx->client_lock);
> -	tmp_client = ctx->client;
> -	ctx->client = NULL;
> -	occ_drv_release(tmp_client);
> -	mutex_unlock(&ctx->client_lock);
> -}
> -
>  static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>  {
> -	int rc;
>  	struct occ_response *resp = &occ->resp;
>  	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
> +	size_t resp_len = sizeof(*resp);
> +	int rc;
>  
> -	mutex_lock(&ctx->client_lock);
> -	if (ctx->sbe)
> -		ctx->client = occ_drv_open(ctx->sbe, 0);
> -	mutex_unlock(&ctx->client_lock);
> -
> -	if (!ctx->client)
> -		return -ENODEV;
> -
> -	/* skip first byte (sequence number), OCC driver handles it */
> -	rc = occ_drv_write(ctx->client, (const char *)&cmd[1], 7);
> -	if (rc < 0)
> -		goto err;
> -
> -	rc = occ_drv_read(ctx->client, (char *)resp, sizeof(*resp));
> +	rc = fsi_occ_submit(ctx->sbe, cmd, 8, resp, &resp_len);
>  	if (rc < 0)
> -		goto err;
> +		return rc;
>  
>  	switch (resp->return_status) {
>  	case OCC_RESP_CMD_IN_PRG:
> @@ -102,8 +59,6 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
>  		rc = -EPROTO;
>  	}
>  
> -err:
> -	p9_sbe_occ_close_client(ctx);
>  	return rc;
>  }
>  
> @@ -117,8 +72,6 @@ static int p9_sbe_occ_probe(struct platform_device *pdev)
>  	if (!ctx)
>  		return -ENOMEM;
>  
> -	mutex_init(&ctx->client_lock);
> -	lockdep_set_class(&ctx->client_lock, &p9_sbe_occ_client_lock_key);
>  	ctx->sbe = pdev->dev.parent;
>  	occ = &ctx->occ;
>  	occ->bus_dev = &pdev->dev;
> @@ -141,7 +94,6 @@ static int p9_sbe_occ_remove(struct platform_device *pdev)
>  	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
>  
>  	ctx->sbe = NULL;
> -	p9_sbe_occ_close_client(ctx);
>  
>  	occ_shutdown(occ);
>  
> diff --git a/include/linux/fsi-occ.h b/include/linux/fsi-occ.h
> index 0a4a54a08be3..4810368d4fb2 100644
> --- a/include/linux/fsi-occ.h
> +++ b/include/linux/fsi-occ.h
> @@ -15,7 +15,6 @@
>  #define LINUX_FSI_OCC_H
>  
>  struct device;
> -struct occ_client;
>  
>  #define OCC_RESP_CMD_IN_PRG		0xFF
>  #define OCC_RESP_SUCCESS		0
> @@ -31,11 +30,7 @@ struct occ_client;
>  #define OCC_RESP_CRIT_OCB		0xE3
>  #define OCC_RESP_CRIT_HW		0xE4
>  
> -extern struct occ_client *occ_drv_open(struct device *dev,
> -				       unsigned long flags);
> -extern int occ_drv_read(struct occ_client *client, char *buf, size_t 
> len);
> -extern int occ_drv_write(struct occ_client *client, const char *buf,
> -			 size_t len);
> -extern void occ_drv_release(struct occ_client *client);
> +extern int fsi_occ_submit(struct device *dev, const void *request, 
> size_t req_len,
> +			  void *response, size_t *resp_len);
>  
>  #endif /* LINUX_FSI_OCC_H */
> diff --git a/include/trace/events/fsi_occ.h b/include/trace/events/fsi_occ.h
> deleted file mode 100644
> index 89562436de86..000000000000
> --- a/include/trace/events/fsi_occ.h
> +++ /dev/null
> @@ -1,86 +0,0 @@
> -#undef TRACE_SYSTEM
> -#define TRACE_SYSTEM fsi_occ
> -
> -#if !defined(_TRACE_TIMER_H) || defined(TRACE_HEADER_MULTI_READ)
> -#define _TRACE_OCC_H
> -
> -#include <linux/tracepoint.h>
> -#include <linux/fsi-occ.h>
> -
> -TRACE_EVENT(occ_enq_xfer,
> -	TP_PROTO(const void *client, const void *xfer),
> -	TP_ARGS(client, xfer),
> -	TP_STRUCT__entry(
> -		__field(const void *, client)
> -		__field(const void *, xfer)
> -	),
> -	TP_fast_assign(
> -		__entry->client = client;
> -		__entry->xfer = xfer;
> -	),
> -	TP_printk("Client %p enqueued xfer %p", __entry->client, __entry->xfer)
> -);
> -
> -TRACE_EVENT(occ_read_complete,
> -	TP_PROTO(const void *client, const void *xfer),
> -	TP_ARGS(client, xfer),
> -	TP_STRUCT__entry(
> -		__field(const void *, client)
> -		__field(const void *, xfer)
> -	),
> -	TP_fast_assign(
> -		__entry->client = client;
> -		__entry->xfer = xfer;
> -	),
> -	TP_printk("Client %p completed read for xfer %p",
> -		__entry->client, __entry->xfer)
> -);
> -
> -TRACE_EVENT(occ_write_begin,
> -	TP_PROTO(const void *client, const void *xfer),
> -	TP_ARGS(client, xfer),
> -	TP_STRUCT__entry(
> -		__field(const void *, client)
> -		__field(const void *, xfer)
> -	),
> -	TP_fast_assign(
> -		__entry->client = client;
> -		__entry->xfer = xfer;
> -	),
> -	TP_printk("Client %p began write for xfer %p",
> -		__entry->client, __entry->xfer)
> -);
> -
> -TRACE_EVENT(occ_worker_xfer_begin,
> -	TP_PROTO(const void *client, const void *xfer),
> -	TP_ARGS(client, xfer),
> -	TP_STRUCT__entry(
> -		__field(const void *, client)
> -		__field(const void *, xfer)
> -	),
> -	TP_fast_assign(
> -		__entry->client = client;
> -		__entry->xfer = xfer;
> -	),
> -	TP_printk("OCC worker began client %p xfer %p",
> -		__entry->client, __entry->xfer)
> -);
> -
> -TRACE_EVENT(occ_worker_xfer_complete,
> -	TP_PROTO(const void *client, const void *xfer),
> -	TP_ARGS(client, xfer),
> -	TP_STRUCT__entry(
> -		__field(const void *, client)
> -		__field(const void *, xfer)
> -	),
> -	TP_fast_assign(
> -		__entry->client = client;
> -		__entry->xfer = xfer;
> -	),
> -	TP_printk("OCC worker completed client %p xfer %p",
> -		__entry->client, __entry->xfer)
> -);
> -
> -#endif
> -
> -#include <trace/define_trace.h>
> 
