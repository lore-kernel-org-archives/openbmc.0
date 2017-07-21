Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xDHMk39SlzDqs4
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jul 2017 14:09:22 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@fuzziesquirrel.com
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: [PATCH] max31785: Fix fan configuration at probe and runtime
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <20170721040031.8390-1-andrew@aj.id.au>
Date: Fri, 21 Jul 2017 00:09:18 -0400
Cc: joel@jms.id.au,
 openbmc@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AC03A1B0-40E4-4467-A0C6-930D078929FF@fuzziesquirrel.com>
References: <20170721040031.8390-1-andrew@aj.id.au>
To: Andrew Jeffery <andrew@aj.id.au>
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
X-List-Received-Date: Fri, 21 Jul 2017 04:09:23 -0000


> On Jul 21, 2017, at 12:00 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
>=20
> Several issues regarding configuration were present:
>=20
> 1. Failure to probe if MFR_FAN_CONFIG was non-zero
> 2. Failure to configure DUAL_TACH mode in MFR_FAN_CONFIG
> 3. Failure to configure RPM or PWM mode on attribute writes
>=20
> Combined these prevented fanX_input attributes reporting expected
> values for the second rotors.
>=20
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Acked-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
Tested-by: Brad Bishop <bradleyb@fuzziesquirrel.com>

> ---
> drivers/hwmon/max31785.c | 20 +++++++++++++++-----
> 1 file changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/hwmon/max31785.c b/drivers/hwmon/max31785.c
> index 4c858c5234c6..011354df587d 100644
> --- a/drivers/hwmon/max31785.c
> +++ b/drivers/hwmon/max31785.c
> @@ -297,6 +297,11 @@ static ssize_t max31785_fan_set_target(struct =
max31785 *data, int channel,
>=20
> 	mutex_lock(&data->lock);
>=20
> +	data->fan_config[channel] |=3D =
MAX31785_FAN_CFG_CONTROL_MODE_RPM;
> +	rc =3D max31785_write_fan_byte(data->client, channel,
> +				MAX31785_REG_FAN_CONFIG_1_2,
> +				data->fan_config[channel]);
> +
> 	/* Write new RPM value */
> 	data->fan_command[channel] =3D rpm;
> 	rc =3D max31785_write_fan_word(data->client, channel,
> @@ -342,6 +347,11 @@ static ssize_t max31785_pwm_set(struct max31785 =
*data, int channel, long pwm)
>=20
> 	mutex_lock(&data->lock);
>=20
> +	data->fan_config[channel] &=3D =
~MAX31785_FAN_CFG_CONTROL_MODE_RPM;
> +	rc =3D max31785_write_fan_byte(data->client, channel,
> +				MAX31785_REG_FAN_CONFIG_1_2,
> +				data->fan_config[channel]);
> +
> 	/* Write new PWM value */
> 	data->fan_command[channel] =3D pwm * =
MAX31785_FAN_COMMAND_PWM_RATIO;
> 	rc =3D max31785_write_fan_word(data->client, channel,
> @@ -458,7 +468,7 @@ static int max31785_init_fans(struct max31785 =
*data)
> 		}
> 	}
>=20
> -	return rv;
> +	return 0;
> }
>=20
> /* Return 0 if detection is successful, -ENODEV otherwise */
> @@ -840,14 +850,14 @@ static int max31785_probe(struct i2c_client =
*client,
> 	if (rc)
> 		return rc;
>=20
> -	rc =3D max31785_init_fans(data);
> -	if (rc)
> -		return rc;
> -
> 	rc =3D max31785_get_capabilities(data);
> 	if (rc < 0)
> 		return rc;
>=20
> +	rc =3D max31785_init_fans(data);
> +	if (rc)
> +		return rc;
> +
> 	if (max31785_has_dual_rotor(data))
> 		chip =3D &max31785_chip_info_0x3040;
> 	else
> --=20
> 2.11.0
