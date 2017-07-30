Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xKkXw0H6czDr2n
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jul 2017 10:51:11 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.100] (unknown [192.168.253.100])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id EAC4B1277F5;
 Sat, 29 Jul 2017 20:51:06 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH linux dev-4.10 v6 2/2] drivers/leds: pca955x count LED
 lines as GPIO
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20170729183638.17503-3-cbostic@linux.vnet.ibm.com>
Date: Sat, 29 Jul 2017 20:50:55 -0400
Cc: joel@jms.id.au,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <16278DBF-DA73-4BFB-AEEE-1D07E7A89DEE@fuzziesquirrel.com>
References: <20170729183638.17503-1-cbostic@linux.vnet.ibm.com>
 <20170729183638.17503-3-cbostic@linux.vnet.ibm.com>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Sun, 30 Jul 2017 00:51:12 -0000


> On Jul 29, 2017, at 2:36 PM, Christopher Bostic =
<cbostic@linux.vnet.ibm.com> wrote:
>=20
> In order for gpio-keys-polled driver to properly register pins
> connected to the pca955x chip it is necessary to count 'LED' lines
> as part of the total gpio count.  The assocated gpio_chip struct
> for the pca955x is then set to all available I/O (LEDS and 'GPIO').
> Failure to do so will cause any pin # > GPIO pin count to fail
> gpio-keys-polled probe/registration as it falls outside the bounds
> of what the gpio_chip struct indicates is available.
>=20
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Tested-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

> ---
> drivers/leds/leds-pca955x.c | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
> index 9216742..4fa58b9 100644
> --- a/drivers/leds/leds-pca955x.c
> +++ b/drivers/leds/leds-pca955x.c
> @@ -472,6 +472,8 @@ static int pca955x_probe(struct i2c_client =
*client,
> 			ngpios++;
> 			break;
> 		case PCA955X_TYPE_LED:
> +			ngpios++;
> +
> 			/*
> 			 * Platform data can specify LED names and
> 			 * default triggers
> --=20
> 1.8.2.2
