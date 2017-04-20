Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3w87Ll4DvrzDqKk
 for <openbmc@lists.ozlabs.org>; Fri, 21 Apr 2017 04:53:51 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Add FSI SBEFIFO driver
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <70442308-495d-57e9-2657-90b7fec80f2f@linux.vnet.ibm.com>
Date: Thu, 20 Apr 2017 14:53:48 -0400
Cc: openbmc@lists.ozlabs.org,
 joel@jms.id.au,
 alistair@popple.id.au
Content-Transfer-Encoding: quoted-printable
Message-Id: <D5A81D6A-7A95-402C-99F6-45E555410CBA@fuzziesquirrel.com>
References: <1492488894-7051-1-git-send-email-bradleyb@fuzziesquirrel.com>
 <70442308-495d-57e9-2657-90b7fec80f2f@linux.vnet.ibm.com>
To: Eddie James <eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Thu, 20 Apr 2017 18:53:52 -0000

Thx Eddie!

> On Apr 20, 2017, at 12:31 PM, Eddie James <eajames@linux.vnet.ibm.com> =
wrote:
>=20
>=20
>=20
> On 04/17/2017 11:14 PM, Brad Bishop wrote:
>> IBM POWER9 processors contain some embedded hardware and software =
bits
>> collectively referred to as the self boot engine (SBE).  One role of
>> the SBE is to act as a proxy that provides access to the registers of
>> the POWER chip from other (embedded) systems.
>>=20
>> The POWER9 chip contains a hardware frontend for communicating with
>> the SBE from remote systems called the SBEFIFO.  The SBEFIFO logic
>> is contained within an FSI CFAM (see Documentation/fsi) and as such
>> the driver implements an FSI bus device.
>>=20
>> The SBE expects to communicate using a defined wire protocol; =
however,
>> the driver knows nothing of the protocol and only provides raw access
>> to the fifo device to userspace applications wishing to communicate =
with
>> the SBE using the wire protocol.
>>=20
>> The SBEFIFO consists of two hardware fifos.  The upstream fifo is =
used by
>> the driver to transfer data to the SBE on the POWER chip, from the =
system
>> hosting the driver.  The downstream fifo is used by the driver to =
transfer
>> data from the SBE on the power chip to the system hosting the driver.
>>=20
>> Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
>> ---
>>  drivers/fsi/Kconfig       |   6 +
>>  drivers/fsi/Makefile      |   1 +
>>  drivers/fsi/fsi-sbefifo.c | 811 =
++++++++++++++++++++++++++++++++++++++++++++++
>>  3 files changed, 818 insertions(+)
>>  create mode 100644 drivers/fsi/fsi-sbefifo.c
>>=20
>> diff --git a/drivers/fsi/Kconfig b/drivers/fsi/Kconfig
>> index c78b9b6e..087f239 100644
>> --- a/drivers/fsi/Kconfig
>> +++ b/drivers/fsi/Kconfig
>> @@ -18,6 +18,12 @@ config FSI_MASTER_GPIO
>>  	---help---
>>  	This option enables a FSI master driver using GPIO lines.
>>=20
>> +config FSI_SBEFIFO
>> +	tristate "SBEFIFO FSI client device driver"
>> +	depends on FSI
>> +	---help---
>> +	This option enables an FSI based SBEFIFO device driver.
>> +
>>  config FSI_SCOM
>>  	tristate "SCOM FSI client device driver"
>>  	depends on FSI
>> diff --git a/drivers/fsi/Makefile b/drivers/fsi/Makefile
>> index 3a106ba..edd84b2 100644
>> --- a/drivers/fsi/Makefile
>> +++ b/drivers/fsi/Makefile
>> @@ -1,5 +1,6 @@
>>=20
>>  obj-$(CONFIG_FSI) +=3D fsi-core.o
>>  obj-$(CONFIG_FSI_MASTER_GPIO) +=3D fsi-master-gpio.o
>> +obj-$(CONFIG_FSI_SBEFIFO) +=3D fsi-sbefifo.o
>>  obj-$(CONFIG_FSI_SCOM) +=3D fsi-scom.o
>>  obj-$(CONFIG_FSI_I2C) +=3D i2c/
>> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
>> new file mode 100644
>> index 0000000..9a13ce3
>> --- /dev/null
>> +++ b/drivers/fsi/fsi-sbefifo.c
>> @@ -0,0 +1,811 @@
>> +/*
>> + * Copyright (C) IBM Corporation 2017
>> + *
>> + * This program is free software; you can redistribute it and/or =
modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERGCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +
>> +#include <linux/delay.h>
>> +#include <linux/errno.h>
>> +#include <linux/idr.h>
>> +#include <linux/fsi.h>
>> +#include <linux/list.h>
>> +#include <linux/miscdevice.h>
>> +#include <linux/module.h>
>> +#include <linux/poll.h>
>> +#include <linux/sched.h>
>> +#include <linux/slab.h>
>> +#include <linux/timer.h>
>> +#include <linux/uaccess.h>
>> +
>> +/*
>> + * The SBEFIFO is a pipe-like FSI device for communicating with
>> + * the self boot engine on POWER processors.
>> + */
>> +
>> +#define DEVICE_NAME		"sbefifo"
>> +#define FSI_ENGID_SBE		0x22
>> +#define SBEFIFO_BUF_CNT		32
>> +
>> +#define SBEFIFO_UP		0x00	/* Up register offset */
>> +#define SBEFIFO_DWN		0x40	/* Down register offset */
>> +
>> +#define SBEFIFO_STS		0x04
>> +#define   SBEFIFO_EMPTY			BIT(20)
>> +#define SBEFIFO_EOT_RAISE	0x08
>> +#define   SBEFIFO_EOT_MAGIC		0xffffffff
>> +#define SBEFIFO_EOT_ACK		0x14
>> +
>> +struct sbefifo {
>> +	struct timer_list poll_timer;
>> +	struct fsi_device *fsi_dev;
>> +	struct miscdevice mdev;
>> +	wait_queue_head_t wait;
>> +	struct list_head link;
>> +	struct list_head xfrs;
>> +	struct kref kref;
>> +	spinlock_t lock;
>> +	char name[32];
>> +	int idx;
>> +	int rc;
>> +};
>> +
>> +struct sbefifo_buf {
>> +	u32 buf[SBEFIFO_BUF_CNT];
>> +	unsigned long flags;
>> +#define SBEFIFO_BUF_FULL		1
>> +	u32 *rpos;
>> +	u32 *wpos;
>> +};
>> +
>> +struct sbefifo_xfr {
>> +	struct sbefifo_buf *rbuf;
>> +	struct sbefifo_buf *wbuf;
>> +	struct list_head client;
>> +	struct list_head xfrs;
>> +	unsigned long flags;
>> +#define SBEFIFO_XFR_WRITE_DONE		1
>> +#define SBEFIFO_XFR_RESP_PENDING	2
>> +#define SBEFIFO_XFR_COMPLETE		3
>> +#define SBEFIFO_XFR_CANCEL		4
>> +};
>> +
>> +struct sbefifo_client {
>> +	struct sbefifo_buf rbuf;
>> +	struct sbefifo_buf wbuf;
>> +	struct list_head xfrs;
>> +	struct sbefifo *dev;
>> +	struct kref kref;
>> +};
>> +
>> +static struct list_head sbefifo_fifos;
>> +
>> +static DEFINE_IDA(sbefifo_ida);
>> +
>> +static int sbefifo_inw(struct sbefifo *sbefifo, int reg, u32 *word)
>> +{
>> +	return fsi_device_read(sbefifo->fsi_dev, reg, word, =
sizeof(*word));
>> +}
>> +
>> +static int sbefifo_outw(struct sbefifo *sbefifo, int reg, u32 word)
>> +{
>> +	return fsi_device_write(sbefifo->fsi_dev, reg, &word, =
sizeof(word));
>> +}
>> +
>> +static int sbefifo_readw(struct sbefifo *sbefifo, u32 *word)
>> +{
>> +	return sbefifo_inw(sbefifo, SBEFIFO_DWN, word);
>> +}
>> +
>> +static int sbefifo_writew(struct sbefifo *sbefifo, u32 word)
>> +{
>> +	return sbefifo_outw(sbefifo, SBEFIFO_UP, word);
>> +}
>> +
>> +static int sbefifo_ack_eot(struct sbefifo *sbefifo)
>> +{
>> +	u32 discard;
>> +	int ret;
>> +
>> +	 /* Discard the EOT word. */
>> +	ret =3D sbefifo_readw(sbefifo, &discard);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return sbefifo_outw(sbefifo, SBEFIFO_DWN | SBEFIFO_EOT_ACK,
>> +			SBEFIFO_EOT_MAGIC);
>> +}
>> +
>> +static size_t sbefifo_dev_nwreadable(u32 sts)
>> +{
>> +	static const u32 FIFO_NTRY_CNT_MSK =3D 0x000f0000;
>> +	static const unsigned int FIFO_NTRY_CNT_SHIFT =3D 16;
>> +
>> +	return (sts & FIFO_NTRY_CNT_MSK) >> FIFO_NTRY_CNT_SHIFT;
>> +}
>> +
>> +static size_t sbefifo_dev_nwwriteable(u32 sts)
>> +{
>> +	static const size_t FIFO_DEPTH =3D 8;
>> +
>> +	return FIFO_DEPTH - sbefifo_dev_nwreadable(sts);
>> +}
>> +
>> +static void sbefifo_buf_init(struct sbefifo_buf *buf)
>> +{
>> +	WRITE_ONCE(buf->rpos, buf->buf);
>> +	WRITE_ONCE(buf->wpos, buf->buf);
>> +}
>> +
>> +static size_t sbefifo_buf_nbreadable(struct sbefifo_buf *buf)
>> +{
>> +	size_t n;
>> +	u32 *rpos =3D READ_ONCE(buf->rpos);
>> +	u32 *wpos =3D READ_ONCE(buf->wpos);
>> +
>> +	if (test_bit(SBEFIFO_BUF_FULL, &buf->flags))
>> +		n =3D SBEFIFO_BUF_CNT;
>> +	else if (rpos <=3D wpos)
>> +		n =3D wpos - rpos;
>> +	else
>> +		n =3D (buf->buf + SBEFIFO_BUF_CNT) - rpos;
>> +
>> +	return n << 2;
>> +}
>> +
>> +static size_t sbefifo_buf_nbwriteable(struct sbefifo_buf *buf)
>> +{
>> +	size_t n;
>> +	u32 *rpos =3D READ_ONCE(buf->rpos);
>> +	u32 *wpos =3D READ_ONCE(buf->wpos);
>> +
>> +	if (test_bit(SBEFIFO_BUF_FULL, &buf->flags))
>> +		n =3D 0;
>> +	else if (wpos < rpos)
>> +		n =3D rpos - wpos;
>> +	else
>> +		n =3D (buf->buf + SBEFIFO_BUF_CNT) - wpos;
>> +
>> +	return n << 2;
>> +}
>> +
>> +/*
>> + * Update pointers and flags after doing a buffer read.  Return true =
if the
>> + * buffer is now empty;
>> + */
>> +static bool sbefifo_buf_readnb(struct sbefifo_buf *buf, size_t n)
>> +{
>> +	u32 *rpos =3D READ_ONCE(buf->rpos);
>> +	u32 *wpos =3D READ_ONCE(buf->wpos);
>> +
>> +	if (n)
>> +		clear_bit(SBEFIFO_BUF_FULL, &buf->flags);
>> +
>> +	rpos +=3D (n >> 2);
>> +	if (rpos =3D=3D buf->buf + SBEFIFO_BUF_CNT)
>> +		rpos =3D buf->buf;
>> +
>> +	WRITE_ONCE(buf->rpos, rpos);
>> +	return rpos =3D=3D wpos;
>> +}
>> +
>> +/*
>> + * Update pointers and flags after doing a buffer write.  Return =
true if the
>> + * buffer is now full.
>> + */
>> +static bool sbefifo_buf_wrotenb(struct sbefifo_buf *buf, size_t n)
>> +{
>> +	u32 *rpos =3D READ_ONCE(buf->rpos);
>> +	u32 *wpos =3D READ_ONCE(buf->wpos);
>> +
>> +	wpos +=3D (n >> 2);
>> +	if (wpos =3D=3D buf->buf + SBEFIFO_BUF_CNT)
>> +		wpos =3D buf->buf;
>> +	if (wpos =3D=3D rpos)
>> +		set_bit(SBEFIFO_BUF_FULL, &buf->flags);
>> +
>> +	WRITE_ONCE(buf->wpos, wpos);
>> +	return rpos =3D=3D wpos;
>> +}
>> +
>> +static void sbefifo_free(struct kref *kref)
>> +{
>> +	struct sbefifo *sbefifo;
>> +
>> +	sbefifo =3D container_of(kref, struct sbefifo, kref);
>> +	kfree(sbefifo);
>> +}
>> +
>> +static void sbefifo_get(struct sbefifo *sbefifo)
>> +{
>> +	kref_get(&sbefifo->kref);
>> +}
>> +
>> +static void sbefifo_put(struct sbefifo *sbefifo)
>> +{
>> +	kref_put(&sbefifo->kref, sbefifo_free);
>> +}
>> +
>> +static struct sbefifo_xfr *sbefifo_enq_xfr(struct sbefifo_client =
*client)
>> +{
>> +	struct sbefifo *sbefifo =3D client->dev;
>> +	struct sbefifo_xfr *xfr;
>> +
>> +	xfr =3D kzalloc(sizeof(*xfr), GFP_KERNEL);
>> +	if (!xfr)
>> +		return NULL;
>> +
>> +	xfr->rbuf =3D &client->rbuf;
>> +	xfr->wbuf =3D &client->wbuf;
>> +	list_add_tail(&xfr->xfrs, &sbefifo->xfrs);
>> +	list_add_tail(&xfr->client, &client->xfrs);
>> +
>> +	return xfr;
>> +}
>> +
>> +static struct sbefifo_xfr *sbefifo_client_next_xfr(
>> +		struct sbefifo_client *client)
>> +{
>> +	if (list_empty(&client->xfrs))
>> +		return NULL;
>> +
>> +	return container_of(client->xfrs.next, struct sbefifo_xfr,
>> +			client);
>> +}
>> +
>> +static bool sbefifo_xfr_rsp_pending(struct sbefifo_client *client)
>> +{
>> +	struct sbefifo_xfr *xfr;
>> +
>> +	xfr =3D sbefifo_client_next_xfr(client);
>> +	if (xfr && test_bit(SBEFIFO_XFR_RESP_PENDING, &xfr->flags))
>> +		return true;
>> +
>> +	return false;
>> +}
>> +
>> +static struct sbefifo_client *sbefifo_new_client(struct sbefifo =
*sbefifo)
>> +{
>> +	struct sbefifo_client *client;
>> +
>> +	client =3D kzalloc(sizeof(*client), GFP_KERNEL);
>> +	if (!client)
>> +		return NULL;
>> +
>> +	kref_init(&client->kref);
>> +	client->dev =3D sbefifo;
>> +	sbefifo_buf_init(&client->rbuf);
>> +	sbefifo_buf_init(&client->wbuf);
>> +	INIT_LIST_HEAD(&client->xfrs);
>> +
>> +	sbefifo_get(sbefifo);
>> +
>> +	return client;
>> +}
>> +
>> +static void sbefifo_client_release(struct kref *kref)
>> +{
>> +	struct sbefifo_client *client;
>> +	struct sbefifo_xfr *xfr;
>> +
>> +	client =3D container_of(kref, struct sbefifo_client, kref);
>> +	list_for_each_entry(xfr, &client->xfrs, client) {
>> +		/*
>> +		 * The client left with pending or running xfrs.
>> +		 * Cancel them.
>> +		 */
>> +		set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
>> +		sbefifo_get(client->dev);
>> +		if (mod_timer(&client->dev->poll_timer, jiffies))
>> +			sbefifo_put(client->dev);
>> +	}
>> +
>> +	sbefifo_put(client->dev);
>> +	kfree(client);
>> +}
>> +
>> +static void sbefifo_get_client(struct sbefifo_client *client)
>> +{
>> +	kref_get(&client->kref);
>> +}
>> +
>> +static void sbefifo_put_client(struct sbefifo_client *client)
>> +{
>> +	kref_put(&client->kref, sbefifo_client_release);
>> +}
>> +
>> +static struct sbefifo_xfr *sbefifo_next_xfr(struct sbefifo *sbefifo)
>> +{
>> +	struct sbefifo_xfr *xfr;
>> +
>> +	while (!list_empty(&sbefifo->xfrs)) {
>> +		xfr =3D container_of(sbefifo->xfrs.next, struct =
sbefifo_xfr,
>> +				xfrs);
> Could you use list_for_each_entry_safe() here?

yep.

>> +		if (unlikely(test_bit(SBEFIFO_XFR_CANCEL, &xfr->flags))) =
{
>> +			/* Discard cancelled transfers. */
>> +			list_del(&xfr->xfrs);
>> +			kfree(xfr);
>> +			continue;
>> +		}
>> +		return xfr;
>> +	}
>> +
>> +	return NULL;
>> +}
>> +
>> +static void sbefifo_poll_timer(unsigned long data)
>> +{
>> +	static const unsigned long EOT_MASK =3D 0x000000ff;
>> +	struct sbefifo *sbefifo =3D (void *)data;
>> +	struct sbefifo_buf *rbuf, *wbuf;
>> +	struct sbefifo_xfr *xfr =3D NULL;
>> +	struct sbefifo_buf drain;
>> +	size_t devn, bufn;
>> +	int eot =3D 0;
>> +	int ret =3D 0;
>> +	u32 sts;
>> +	int i;
>> +
>> +	spin_lock(&sbefifo->lock);
>> +	if (!list_empty(&sbefifo->xfrs))
>> +		xfr =3D container_of(sbefifo->xfrs.next, struct =
sbefifo_xfr,
>> +				xfrs);
> list_first_entry() might be more convenient.

agreed.

>> +	if (!xfr)
>> +		goto out_unlock;
>> +
>> +	rbuf =3D xfr->rbuf;
>> +	wbuf =3D xfr->wbuf;
>> +
>> +	if (unlikely(test_bit(SBEFIFO_XFR_CANCEL, &xfr->flags))) {
>> +		/* The client left. */
>> +		rbuf =3D &drain;
>> +		wbuf =3D &drain;
>> +		sbefifo_buf_init(&drain);
>> +		if (!test_bit(SBEFIFO_XFR_RESP_PENDING, &xfr->flags))
>> +			set_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags);
>> +	}
>> +
>> +	 /* Drain the write buffer. */
>> +	while ((bufn =3D sbefifo_buf_nbreadable(wbuf))) {
>> +		ret =3D sbefifo_inw(sbefifo, SBEFIFO_UP | SBEFIFO_STS,
>> +				&sts);
>> +		if (ret)
>> +			goto out;
>> +
>> +		devn =3D sbefifo_dev_nwwriteable(sts);
>> +		if (devn =3D=3D 0) {
>> +			/* No open slot for write.  Reschedule. */
>> +			sbefifo->poll_timer.expires +=3D =
msecs_to_jiffies(500);
> expires might be some time in the past, so you may not get the full =
500ms delay, if you want that. Safer to do expires =3D jiffies + =
msecs_to_jiffies(500). Same for the other reschedule calls below.

fixed.

>=20
> Everything else looking good to me.
> Eddie
>> +			add_timer(&sbefifo->poll_timer);
>> +			goto out_unlock;
>> +		}
>> +
>> +		devn =3D min_t(size_t, devn, bufn >> 2);
>> +		for (i =3D 0; i < devn; i++) {
>> +			ret =3D sbefifo_writew(sbefifo, *wbuf->rpos);
>> +			if (ret)
>> +				goto out;
>> +
>> +			sbefifo_buf_readnb(wbuf, 1 << 2);
>> +		}
>> +	}
>> +
>> +	 /* Send EOT if the writer is finished. */
>> +	if (test_and_clear_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags)) {
>> +		ret =3D sbefifo_outw(sbefifo,
>> +				SBEFIFO_UP | SBEFIFO_EOT_RAISE,
>> +				SBEFIFO_EOT_MAGIC);
>> +		if (ret)
>> +			goto out;
>> +
>> +		/* Inform reschedules that the writer is finished. */
>> +		set_bit(SBEFIFO_XFR_RESP_PENDING, &xfr->flags);
>> +	}
>> +
>> +	/* Nothing left to do if the writer is not finished. */
>> +	if (!test_bit(SBEFIFO_XFR_RESP_PENDING, &xfr->flags))
>> +		goto out;
>> +
>> +	 /* Fill the read buffer. */
>> +	while ((bufn =3D sbefifo_buf_nbwriteable(rbuf))) {
>> +		ret =3D sbefifo_inw(sbefifo, SBEFIFO_DWN | SBEFIFO_STS, =
&sts);
>> +		if (ret)
>> +			goto out;
>> +
>> +		devn =3D sbefifo_dev_nwreadable(sts);
>> +		if (devn =3D=3D 0) {
>> +			/* No data yet.  Reschedule. */
>> +			sbefifo->poll_timer.expires +=3D =
msecs_to_jiffies(500);
>> +			add_timer(&sbefifo->poll_timer);
>> +			goto out_unlock;
>> +		}
>> +
>> +		/* Fill.  The EOT word is discarded.  */
>> +		devn =3D min_t(size_t, devn, bufn >> 2);
>> +		eot =3D (sts & EOT_MASK) !=3D 0;
>> +		if (eot)
>> +			devn--;
>> +
>> +		for (i =3D 0; i < devn; i++) {
>> +			ret =3D sbefifo_readw(sbefifo, rbuf->wpos);
>> +			if (ret)
>> +				goto out;
>> +
>> +			if (likely(!test_bit(SBEFIFO_XFR_CANCEL, =
&xfr->flags)))
>> +				sbefifo_buf_wrotenb(rbuf, 1 << 2);
>> +		}
>> +
>> +		if (eot) {
>> +			ret =3D sbefifo_ack_eot(sbefifo);
>> +			if (ret)
>> +				goto out;
>> +
>> +			set_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags);
>> +			list_del(&xfr->xfrs);
>> +			if (unlikely(test_bit(SBEFIFO_XFR_CANCEL,
>> +							&xfr->flags)))
>> +				kfree(xfr);
>> +			break;
>> +		}
>> +	}
>> +
>> +out:
>> +	if (unlikely(ret)) {
>> +		sbefifo->rc =3D ret;
>> +		dev_err(&sbefifo->fsi_dev->dev,
>> +				"Fatal bus access failure: %d\n", ret);
>> +		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
>> +			kfree(xfr);
>> +		INIT_LIST_HEAD(&sbefifo->xfrs);
>> +
>> +	} else if (eot && sbefifo_next_xfr(sbefifo)) {
>> +		sbefifo_get(sbefifo);
>> +		sbefifo->poll_timer.expires =3D jiffies;
>> +		add_timer(&sbefifo->poll_timer);
>> +	}
>> +
>> +	sbefifo_put(sbefifo);
>> +	wake_up(&sbefifo->wait);
>> +
>> +out_unlock:
>> +	spin_unlock(&sbefifo->lock);
>> +}
>> +
>> +static int sbefifo_open(struct inode *inode, struct file *file)
>> +{
>> +	struct sbefifo *sbefifo =3D container_of(file->private_data,
>> +			struct sbefifo, mdev);
>> +	struct sbefifo_client *client;
>> +	int ret;
>> +
>> +	ret =3D READ_ONCE(sbefifo->rc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	client =3D sbefifo_new_client(sbefifo);
>> +	if (!client)
>> +		return -ENOMEM;
>> +
>> +	file->private_data =3D client;
>> +
>> +	return 0;
>> +}
>> +
>> +static unsigned int sbefifo_poll(struct file *file, poll_table =
*wait)
>> +{
>> +	struct sbefifo_client *client =3D file->private_data;
>> +	struct sbefifo *sbefifo =3D client->dev;
>> +	unsigned int mask =3D 0;
>> +
>> +	poll_wait(file, &sbefifo->wait, wait);
>> +
>> +	if (READ_ONCE(sbefifo->rc))
>> +		mask |=3D POLLERR;
>> +
>> +	if (sbefifo_buf_nbreadable(&client->rbuf))
>> +		mask |=3D POLLIN;
>> +
>> +	if (sbefifo_buf_nbwriteable(&client->wbuf))
>> +		mask |=3D POLLOUT;
>> +
>> +	return mask;
>> +}
>> +
>> +static ssize_t sbefifo_read(struct file *file, char __user *buf,
>> +		size_t len, loff_t *offset)
>> +{
>> +	struct sbefifo_client *client =3D file->private_data;
>> +	struct sbefifo *sbefifo =3D client->dev;
>> +	struct sbefifo_xfr *xfr;
>> +	ssize_t ret =3D 0;
>> +	size_t n;
>> +
>> +	WARN_ON(*offset);
>> +
>> +	if (!access_ok(VERIFY_WRITE, buf, len))
>> +		return -EFAULT;
>> +
>> +	if ((len >> 2) << 2 !=3D len)
>> +		return -EINVAL;
>> +
>> +	if ((file->f_flags & O_NONBLOCK) && =
!sbefifo_xfr_rsp_pending(client))
>> +		return -EAGAIN;
>> +
>> +	sbefifo_get_client(client);
>> +	if (wait_event_interruptible(sbefifo->wait,
>> +				(ret =3D READ_ONCE(sbefifo->rc)) ||
>> +				(n =3D sbefifo_buf_nbreadable(
>> +						&client->rbuf)))) {
>> +		sbefifo_put_client(client);
>> +		return -ERESTARTSYS;
>> +	}
>> +	if (ret) {
>> +		INIT_LIST_HEAD(&client->xfrs);
>> +		sbefifo_put_client(client);
>> +		return ret;
>> +	}
>> +
>> +	n =3D min_t(size_t, n, len);
>> +
>> +	if (copy_to_user(buf, READ_ONCE(client->rbuf.rpos), n)) {
>> +		sbefifo_put_client(client);
>> +		return -EFAULT;
>> +	}
>> +
>> +	if (sbefifo_buf_readnb(&client->rbuf, n)) {
>> +		xfr =3D sbefifo_client_next_xfr(client);
>> +		if (!test_bit(SBEFIFO_XFR_COMPLETE, &xfr->flags)) {
>> +			/*
>> +			 * Fill the read buffer back up.
>> +			 */
>> +			sbefifo_get(sbefifo);
>> +			if (mod_timer(&client->dev->poll_timer, =
jiffies))
>> +				sbefifo_put(sbefifo);
>> +		} else {
>> +			kfree(xfr);
>> +			list_del(&xfr->client);
>> +			wake_up(&sbefifo->wait);
>> +		}
>> +	}
>> +
>> +	sbefifo_put_client(client);
>> +
>> +	return n;
>> +}
>> +
>> +static ssize_t sbefifo_write(struct file *file, const char __user =
*buf,
>> +		size_t len, loff_t *offset)
>> +{
>> +	struct sbefifo_client *client =3D file->private_data;
>> +	struct sbefifo *sbefifo =3D client->dev;
>> +	struct sbefifo_xfr *xfr;
>> +	ssize_t ret =3D 0;
>> +	size_t n;
>> +
>> +	WARN_ON(*offset);
>> +
>> +	if (!access_ok(VERIFY_READ, buf, len))
>> +		return -EFAULT;
>> +
>> +	if ((len >> 2) << 2 !=3D len)
>> +		return -EINVAL;
>> +
>> +	if (!len)
>> +		return 0;
>> +
>> +	n =3D sbefifo_buf_nbwriteable(&client->wbuf);
>> +
>> +	spin_lock_irq(&sbefifo->lock);
>> +	xfr =3D sbefifo_next_xfr(sbefifo);
>> +
>> +	if ((file->f_flags & O_NONBLOCK) && xfr && n < len) {
>> +		spin_unlock_irq(&sbefifo->lock);
>> +		return -EAGAIN;
>> +	}
>> +
>> +	xfr =3D sbefifo_enq_xfr(client);
>> +	if (!xfr) {
>> +		spin_unlock_irq(&sbefifo->lock);
>> +		return -ENOMEM;
>> +	}
>> +	spin_unlock_irq(&sbefifo->lock);
>> +
>> +	sbefifo_get_client(client);
>> +
>> +	/*
>> +	 * Partial writes are not really allowed in that EOT is sent =
exactly
>> +	 * once per write.
>> +	 */
>> +	while (len) {
>> +		if (wait_event_interruptible(sbefifo->wait,
>> +				READ_ONCE(sbefifo->rc) ||
>> +					(sbefifo_client_next_xfr(client) =
=3D=3D xfr &&
>> +					 (n =3D sbefifo_buf_nbwriteable(
>> +							=
&client->wbuf))))) {
>> +			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
>> +			sbefifo_get(sbefifo);
>> +			if (mod_timer(&sbefifo->poll_timer, jiffies))
>> +				sbefifo_put(sbefifo);
>> +
>> +			sbefifo_put_client(client);
>> +			return -ERESTARTSYS;
>> +		}
>> +		if (sbefifo->rc) {
>> +			INIT_LIST_HEAD(&client->xfrs);
>> +			sbefifo_put_client(client);
>> +			return sbefifo->rc;
>> +		}
>> +
>> +		n =3D min_t(size_t, n, len);
>> +
>> +		if (copy_from_user(READ_ONCE(client->wbuf.wpos), buf, =
n)) {
>> +			set_bit(SBEFIFO_XFR_CANCEL, &xfr->flags);
>> +			sbefifo_get(sbefifo);
>> +			if (mod_timer(&sbefifo->poll_timer, jiffies))
>> +				sbefifo_put(sbefifo);
>> +			sbefifo_put_client(client);
>> +			return -EFAULT;
>> +		}
>> +
>> +		sbefifo_buf_wrotenb(&client->wbuf, n);
>> +		len -=3D n;
>> +		buf +=3D n;
>> +		ret +=3D n;
>> +
>> +		/*
>> +		 * Drain the write buffer.
>> +		 */
>> +		sbefifo_get(sbefifo);
>> +		if (mod_timer(&client->dev->poll_timer, jiffies))
>> +			sbefifo_put(sbefifo);
>> +	}
>> +
>> +	set_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags);
>> +	sbefifo_put_client(client);
>> +
>> +	return ret;
>> +}
>> +
>> +static int sbefifo_release(struct inode *inode, struct file *file)
>> +{
>> +	struct sbefifo_client *client =3D file->private_data;
>> +	struct sbefifo *sbefifo =3D client->dev;
>> +
>> +	sbefifo_put_client(client);
>> +
>> +	return READ_ONCE(sbefifo->rc);
>> +}
>> +
>> +static const struct file_operations sbefifo_fops =3D {
>> +	.owner		=3D THIS_MODULE,
>> +	.open		=3D sbefifo_open,
>> +	.read		=3D sbefifo_read,
>> +	.write		=3D sbefifo_write,
>> +	.poll		=3D sbefifo_poll,
>> +	.release	=3D sbefifo_release,
>> +};
>> +
>> +static int sbefifo_probe(struct device *dev)
>> +{
>> +	struct fsi_device *fsi_dev =3D to_fsi_dev(dev);
>> +	struct sbefifo *sbefifo;
>> +	u32 sts;
>> +	int ret;
>> +
>> +	dev_info(dev, "Found sbefifo device\n");
>> +	sbefifo =3D kzalloc(sizeof(*sbefifo), GFP_KERNEL);
>> +	if (!sbefifo)
>> +		return -ENOMEM;
>> +
>> +	sbefifo->fsi_dev =3D fsi_dev;
>> +
>> +	ret =3D sbefifo_inw(sbefifo,
>> +			SBEFIFO_UP | SBEFIFO_STS, &sts);
>> +	if (ret)
>> +		return ret;
>> +	if (!(sts & SBEFIFO_EMPTY)) {
>> +		dev_err(&sbefifo->fsi_dev->dev,
>> +				"Found data in upstream fifo\n");
>> +		return -EIO;
>> +	}
>> +
>> +	ret =3D sbefifo_inw(sbefifo, SBEFIFO_DWN | SBEFIFO_STS, &sts);
>> +	if (ret)
>> +		return ret;
>> +	if (!(sts & SBEFIFO_EMPTY)) {
>> +		dev_err(&sbefifo->fsi_dev->dev,
>> +				"Found data in downstream fifo\n");
>> +		return -EIO;
>> +	}
>> +
>> +	sbefifo->mdev.minor =3D MISC_DYNAMIC_MINOR;
>> +	sbefifo->mdev.fops =3D &sbefifo_fops;
>> +	sbefifo->mdev.name =3D sbefifo->name;
>> +	sbefifo->mdev.parent =3D dev;
>> +	spin_lock_init(&sbefifo->lock);
>> +	kref_init(&sbefifo->kref);
>> +
>> +	sbefifo->idx =3D ida_simple_get(&sbefifo_ida, 1, INT_MAX, =
GFP_KERNEL);
>> +	snprintf(sbefifo->name, sizeof(sbefifo->name), "sbefifo%d",
>> +			sbefifo->idx);
>> +	init_waitqueue_head(&sbefifo->wait);
>> +	INIT_LIST_HEAD(&sbefifo->xfrs);
>> +
>> +	/* This bit of silicon doesn't offer any interrupts... */
>> +	setup_timer(&sbefifo->poll_timer, sbefifo_poll_timer,
>> +			(unsigned long)sbefifo);
>> +
>> +	list_add(&sbefifo->link, &sbefifo_fifos);
>> +	return misc_register(&sbefifo->mdev);
>> +}
>> +
>> +static int sbefifo_remove(struct device *dev)
>> +{
>> +	struct fsi_device *fsi_dev =3D to_fsi_dev(dev);
>> +	struct sbefifo *sbefifo, *sbefifo_tmp;
>> +	struct sbefifo_xfr *xfr;
>> +
>> +	list_for_each_entry_safe(sbefifo, sbefifo_tmp, &sbefifo_fifos, =
link) {
>> +		if (sbefifo->fsi_dev !=3D fsi_dev)
>> +			continue;
>> +		misc_deregister(&sbefifo->mdev);
>> +		list_del(&sbefifo->link);
>> +		ida_simple_remove(&sbefifo_ida, sbefifo->idx);
>> +
>> +		if (del_timer_sync(&sbefifo->poll_timer))
>> +			sbefifo_put(sbefifo);
>> +
>> +		spin_lock(&sbefifo->lock);
>> +		list_for_each_entry(xfr, &sbefifo->xfrs, xfrs)
>> +			kfree(xfr);
>> +		spin_unlock(&sbefifo->lock);
>> +
>> +		WRITE_ONCE(sbefifo->rc, -ENODEV);
>> +
>> +		wake_up(&sbefifo->wait);
>> +		sbefifo_put(sbefifo);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static struct fsi_device_id sbefifo_ids[] =3D {
>> +	{
>> +		.engine_type =3D FSI_ENGID_SBE,
>> +		.version =3D FSI_VERSION_ANY,
>> +	},
>> +	{ 0 }
>> +};
>> +
>> +static struct fsi_driver sbefifo_drv =3D {
>> +	.id_table =3D sbefifo_ids,
>> +	.drv =3D {
>> +		.name =3D DEVICE_NAME,
>> +		.bus =3D &fsi_bus_type,
>> +		.probe =3D sbefifo_probe,
>> +		.remove =3D sbefifo_remove,
>> +	}
>> +};
>> +
>> +static int sbefifo_init(void)
>> +{
>> +	INIT_LIST_HEAD(&sbefifo_fifos);
>> +	return fsi_driver_register(&sbefifo_drv);
>> +}
>> +
>> +static void sbefifo_exit(void)
>> +{
>> +	fsi_driver_unregister(&sbefifo_drv);
>> +}
>> +
>> +module_init(sbefifo_init);
>> +module_exit(sbefifo_exit);
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Brad Bishop <bradleyb@fuzziesquirrel.com>");
>> +MODULE_DESCRIPTION("Linux device interface to the POWER self boot =
engine");
