Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wyfkC6j2TzDr1m
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jun 2017 09:53:07 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.10] drivers/fsi: Fix SBEFIFO write() race
 condition
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <1498686949-15084-1-git-send-email-eajames@linux.vnet.ibm.com>
Date: Wed, 28 Jun 2017 19:53:03 -0400
Cc: openbmc@lists.ozlabs.org,
 "Edward A. James" <eajames@us.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D8D14726-D4AC-4EC6-B704-06B04B4659A7@fuzziesquirrel.com>
References: <1498686949-15084-1-git-send-email-eajames@linux.vnet.ibm.com>
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
X-List-Received-Date: Wed, 28 Jun 2017 23:53:08 -0000

thx Eddie!

Reviewed-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

> On Jun 28, 2017, at 5:55 PM, Eddie James <eajames@linux.vnet.ibm.com> =
wrote:
>=20
> From: "Edward A. James" <eajames@us.ibm.com>
>=20
> There was a race condition with the XFR_WRITE_DONE flag between =
write()
> and the worker thread. Occasionally the worker wrote all the data and
> checked the flag before write() could set it.
>=20
> Signed-off-by: Edward A. James <eajames@us.ibm.com>
> ---
> drivers/fsi/fsi-sbefifo.c | 7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index f1bc144..d7dccf9 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -688,6 +688,12 @@ static ssize_t sbefifo_write_common(struct =
sbefifo_client *client,
> 		len -=3D n;
> 		ret +=3D n;
>=20
> +		/* set flag before starting the worker, as it may run =
through
> +		 * and check the flag before we exit this loop!
> +		 */
> +		if (!len)
> +			set_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags);
> +
> 		/*
> 		 * Drain the write buffer.
> 		 */
> @@ -696,7 +702,6 @@ static ssize_t sbefifo_write_common(struct =
sbefifo_client *client,
> 			sbefifo_put(sbefifo);
> 	}
>=20
> -	set_bit(SBEFIFO_XFR_WRITE_DONE, &xfr->flags);
> 	sbefifo_put_client(client);
>=20
> 	return ret;
> --=20
> 1.8.3.1
