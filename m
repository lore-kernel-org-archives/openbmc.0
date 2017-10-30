Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yQfsP4rk3zDqmt
 for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2017 03:22:48 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 46977161ECC;
 Mon, 30 Oct 2017 12:22:45 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.10 v2] drivers (fsi): sbefifo: Add timeout for
 waiting for data
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1509057254-14890-1-git-send-email-eajames@linux.vnet.ibm.com>
Date: Mon, 30 Oct 2017 12:22:45 -0400
Cc: openbmc@lists.ozlabs.org, andrew@aj.id.au,
 "Edward A. James" <eajames@us.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <7524F12B-654B-4979-8CC3-54980F5AB018@fuzziesquirrel.com>
References: <1509057254-14890-1-git-send-email-eajames@linux.vnet.ibm.com>
To: Eddie James <eajames@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Mon, 30 Oct 2017 16:22:50 -0000


> On Oct 26, 2017, at 6:34 PM, Eddie James <eajames@linux.vnet.ibm.com> =
wrote:
>=20
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> During a transfer, in the event that the SBE isn't running, the driver
> will wait for data to appear in the FIFO forever. This doesn't work at
> BMC boot time if any transfers are attempted (by OCC driver probing, =
for
> example), as it will just hang the boot. So add a simple timeout
> mechanism when the driver reschdules waiting for data to show up in =
the
> FIFO.
>=20
> Tested on witherspoon by rebooting the BMC successfully with chassis
> power on.
>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> Changes since v1:
> * Reset the wait_data_timeout field if we get data. If we get data, =
the SBE
>   is running and we really shouldn't timeout.
>=20
> drivers/fsi/fsi-sbefifo.c | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index f756822..41b838e 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -54,6 +54,7 @@
> #define SBEFIFO_EOT_ACK		0x14
>=20
> #define SBEFIFO_RESCHEDULE	msecs_to_jiffies(500)
> +#define SBEFIFO_MAX_RESCHDULE	msecs_to_jiffies(5000)
>=20
> struct sbefifo {
> 	struct timer_list poll_timer;
> @@ -77,6 +78,7 @@ struct sbefifo_buf {
> };
>=20
> struct sbefifo_xfr {
> +	unsigned long wait_data_timeout;
> 	struct sbefifo_buf *rbuf;
> 	struct sbefifo_buf *wbuf;
> 	struct list_head client;
> @@ -450,11 +452,27 @@ static void sbefifo_poll_timer(unsigned long =
data)
>=20
> 		devn =3D sbefifo_dev_nwreadable(sts);
> 		if (devn =3D=3D 0) {
> +			/*
> +			 * Limit the maximum waiting period for data in =
the
> +			 * FIFO. If the SBE isn't running, we will wait
> +			 * forever.
> +			 */
> +			if (!xfr->wait_data_timeout) {
> +				xfr->wait_data_timeout =3D
> +					jiffies + SBEFIFO_MAX_RESCHDULE;
> +			} else if (time_after(jiffies,
> +					      xfr->wait_data_timeout)) {
> +				ret =3D -ETIME;
> +				goto out;
> +			}
> +
> 			/* No data yet.  Reschedule. */
> 			sbefifo->poll_timer.expires =3D jiffies +
> 				SBEFIFO_RESCHEDULE;
> 			add_timer(&sbefifo->poll_timer);
> 			goto out_unlock;
> +		} else {
> +			xfr->wait_data_timeout =3D 0;
> 		}
>=20
> 		/* Fill.  The EOT word is discarded.  */
> --=20
> 1.8.3.1

I think I chose this wait forever approach because I figured user space =
could
use nonblock + epoll if they didn=E2=80=99t want to wait forever.  =
Rationale being the
kernel should provide access and not dictate policy.

But userspace isn=E2=80=99t the problem here, its the in-kernel api =
being used by
other drivers.

The only other idea I have here if we don=E2=80=99t like this patch is =
to make the in-kernel
API never block (or provide a non-blocking version of it), but I vaguely =
remember
that already being discussed and deemed un-optimal for other reasons.

-brad
