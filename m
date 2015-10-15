Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478811A074F
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2015 09:13:32 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 1444947209123749.0928686397964;
 Thu, 15 Oct 2015 15:13:29 -0700 (PDT)
Date: Thu, 15 Oct 2015 17:13:27 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid 3/4] Suport examining sensor records
 and calling dbus
Message-ID: <20151015221327.GG21126@asimov.austin.ibm.com>
References: <1444923803-24688-1-git-send-email-patches@stwcx.xyz>
 <1444923803-24688-4-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="OzxllxdKGCiKxUZM"
Content-Disposition: inline
In-Reply-To: <1444923803-24688-4-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_7
X-ZohoMail-Owner: <20151015221327.GG21126@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.55
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Oct 2015 22:13:32 -0000


--OzxllxdKGCiKxUZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2015 at 10:43:22AM -0500, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
>=20
> diff --git a/ipmisensor.C b/ipmisensor.C
> new file mode 100644
> index 0000000..c2370b8
> --- /dev/null
> +++ b/ipmisensor.C
> @@ -0,0 +1,119 @@
> +#include <stdio.h>
> +#include <string.h>
> +#include <stdint.h>
> +
> +
> +extern unsigned char findSensor(char);

I couldn't figure out where this came from.  If you are intending this
to be a function used between multiple parts, it should probably be in a
header file and extern "C" (to avoid C++ name mangling).  Forward
declaring a function defined elsewhere like this can lead to code that=20
compiles but doesn't dlopen.

> +#define ISBITSET(x,y) ((x>>y)&0x01)

(((x)>>(y))&0x01) for macro safety.  Inline function instead?

> +
> +extern int updateDbusInterface(uint8_t , const char *, const char *) ;
> +extern int set_sensor_dbus_state(uint8_t ,const char *, const char *);
> +

Same extern statement here.

> +int findindex(const uint8_t sensor_type, int offset, int *index) {
> +=09
> +	int i=3D0, rc=3D0;
> +	lookup_t *pTable =3D ipmidbuslookup;
> +
> +	do {
> +
> +		if ( ((pTable+i)->sensor_type =3D=3D sensor_type) &&=20
> +			 ((pTable+i)->offset  =3D=3D offset)  ) {
> +			rc =3D 1;
> +			*index =3D i;
> +			break;
> +		}
> +		i++;
> +	} while ((pTable+i)->sensor_type  !=3D 0xFF);

Prefer std::find for this.  With C++11 you can make a lambda function
for the ->sensor_type and ->offset comparisons.

> +	return rc;

Should this return a pointer to the pTable entry instead?

> diff --git a/sensorhandler.C b/sensorhandler.C
> index 9f0c975..0b16d10 100644
> --- a/sensorhandler.C
> +++ b/sensorhandler.C
> @@ -4,6 +4,7 @@
>  #include <string.h>
>  #include <stdint.h>
> =20
> +extern int updateSensorRecordFromSSRAESC(const void *);

Another extern.  Lots of cross-file calling.
--=20
Patrick Williams

--OzxllxdKGCiKxUZM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWICUHAAoJEKsDR8wtAMEZUxQP/0bfd1aSHXaaEL51nIMYmR/a
IhDFu38jmlqxlbi380IQ6+jkLKH4S+1TChu3kxZo4fSDo4h8M9xt9tu1Soqr7FuF
Cru9oN1KnhDeA5n3hhboe2Cg83KNzyAG7JCIkkJxD6qEjyD4KgesBj53N6MhQMBJ
JVUfitT9RdC0n1/0wVwBp8Ip+r8eUaPk1qgOGOEoE7bnbXwMwoaKH85K6eMqKo5H
KXF6PI0bj/I2guL45gvWkVTosnfmMMQ1YYWNoOixyaXwYRYd02JdIC30b/UtYNBv
7uzyvNwOviL20kYu0N/6TEXNOpY3yeai95cqotj5OO0c0OTA5+Rq9gEQV+MEsRix
U37CXuPQrLK1roal1bgN4TSqFizLm2zIJLwb0ICSTq9ygAc1urjMC5FyDNHmGv53
4Jtts2QXLVuJebtlEdc7UhUOtuA+9HHw9VHrftUWpaKrbl/8P3R+z+qAk7i8MnrM
ZRjrW2GuYheeQp9hY+lC93lrMmHe4PzuagVtnOQZ00lq9mrBMLs+qeqE5R5R8AI7
ZIujnmKz2T1u6bhZUNpsGBugSSczEAfKVK+SSbsqJKtD2/QP5nZ369Bja51zvuBF
A27hMOcgI/FZrScAJAEvhkyXEv08lZrXiHjunBBv9P+MGKvsW//0HYhvs8VlluVb
sjDCz6azESGNA52K7dfl
=UAKg
-----END PGP SIGNATURE-----

--OzxllxdKGCiKxUZM--
