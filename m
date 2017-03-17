Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vkmDk64zTzDqZQ
 for <openbmc@lists.ozlabs.org>; Fri, 17 Mar 2017 11:19:34 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Subject: Re: [PATCH linux dev-4.7] drivers/fsi: Add more time between clocking
 and data sampling
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20170315212550.65964-1-cbostic@linux.vnet.ibm.com>
Date: Thu, 16 Mar 2017 20:19:29 -0400
Cc: joel@jms.id.au,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <224CC8A9-0A97-4696-95BE-D8E8F9B02AFC@fuzziesquirrel.com>
References: <20170315212550.65964-1-cbostic@linux.vnet.ibm.com>
To: Christopher Bostic <cbostic@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 17 Mar 2017 00:19:35 -0000

Hi Chris

> On Mar 15, 2017, at 5:25 PM, Christopher Bostic =
<cbostic@linux.vnet.ibm.com> wrote:
>=20
> Under high work loads the ARM core can occasionaly hit invalid
> timings between the FSI clock and data lines which leads to
> data crc errors.  Add further delay between clock switch and
> data line changes.
>=20
> Signed-off-by: Christopher Bostic <cbostic@linux.vnet.ibm.com>
> ---
> drivers/fsi/fsi-master-gpio.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/fsi/fsi-master-gpio.c =
b/drivers/fsi/fsi-master-gpio.c
> index a8976d5..a93453f 100644
> --- a/drivers/fsi/fsi-master-gpio.c
> +++ b/drivers/fsi/fsi-master-gpio.c
> @@ -13,7 +13,7 @@
>=20
> #include "fsi-master.h"
>=20
> -#define	FSI_GPIO_STD_DLY	1	/* Standard pin delay in =
nS */
> +#define	FSI_GPIO_STD_DLY	1	/* Standard pin delay in =
uS */

How did you arrive at 1000x ?  Does this mean we spend 1000x spinning
the core when sending data out?

I wonder if 100x or even 10x might still get rid of enough of the =
jitter?

> #define	FSI_ECHO_DELAY_CLOCKS	16	/* Number clocks for =
echo delay */
> #define	FSI_PRE_BREAK_CLOCKS	50	/* Number clocks to prep =
for break */
> #define	FSI_BREAK_CLOCKS	256	/* Number of clocks to =
issue break */
> @@ -86,9 +86,9 @@ static void clock_toggle(struct fsi_master_gpio =
*master, int count)
> 	int i;
>=20
> 	for (i =3D 0; i < count; i++) {
> -		ndelay(FSI_GPIO_STD_DLY);
> +		udelay(FSI_GPIO_STD_DLY);
> 		gpiod_set_value(master->gpio_clk, 0);
> -		ndelay(FSI_GPIO_STD_DLY);
> +		udelay(FSI_GPIO_STD_DLY);
> 		gpiod_set_value(master->gpio_clk, 1);
> 	}
> }
> @@ -97,7 +97,7 @@ static int sda_in(struct fsi_master_gpio *master)
> {
> 	int in;
>=20
> -	ndelay(FSI_GPIO_STD_DLY);
> +	udelay(FSI_GPIO_STD_DLY);
> 	in =3D gpiod_get_value(master->gpio_data);
> 	return in ? 1 : 0;
> }
> --=20
> 1.8.2.2

thx - brad=
