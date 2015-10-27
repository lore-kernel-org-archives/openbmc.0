Return-Path: <patrick@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id D71201A09EC
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 11:17:54 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445982227732331.73797229176955;
 Tue, 27 Oct 2015 14:43:47 -0700 (PDT)
Date: Tue, 27 Oct 2015 16:43:45 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Allow esels to be sent to dbus event
 log
Message-ID: <20151027214345.GD13316@asimov.austin.ibm.com>
References: <1445823605-7513-1-git-send-email-patches@stwcx.xyz>
 <1445823605-7513-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rsGyAQ90QqnfMsmV"
Content-Disposition: inline
In-Reply-To: <1445823605-7513-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_0
X-ZohoMail-Owner: <20151027214345.GD13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 32.97.110.52
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
X-List-Received-Date: Wed, 28 Oct 2015 00:17:56 -0000


--rsGyAQ90QqnfMsmV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2015 at 08:40:05PM -0500, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
> diff --git a/storageaddsel.C b/storageaddsel.C
> new file mode 100644
> index 0000000..f11cf00
> --- /dev/null
> +++ b/storageaddsel.C
> @@ -0,0 +1,280 @@
> +#include <stdint.h>
> +#include <cstdlib>
> +#include <cstring>
> +#include <fstream>
> +#include <iostream>
> +#include <vector>
> +#include <systemd/sd-bus.h>
> +
> +#include "ipmid.H"
> +#include "storagehandler.h"
> +#include "sensorhandler.h"
> +
> +using namespace std;
> +
> +extern int find_openbmc_path(const char *, const uint8_t , dbus_interfac=
e_t *);
> +
> +
> +//////////////////////////
> +struct esel_section_headers_t {
> +	uint8_t sectionid[2];
> +	uint8_t sectionlength[2];
> +	uint8_t version;
> +	uint8_t subsectiontype;
> +	uint8_t compid;
> +};
> +
> +#define MAXSEVDESC 64
> +struct severity_values_t {
> +	uint8_t type;
> +	char    description[MAXSEVDESC];
> +};

There really isn't much advantage to using uint8_t here, is there?

Description should just be a const char*.  No advantage to trying to
limit the array like that, other than having an unintended missing null
character.

> +
> +
> +severity_values_t g_sev_desc[] =3D {

Array should be const.

> +	{0x10, "recoverable error"},
> +	{0x20, "predictive error"},
> +	{0x40, "unrecoverable error"},
> +	{0x50, "critical error"},
> +	{0x60, "error from a diagnostic test"},
> +	{0x70, "recovered symptom "},
> +	{0xFF, "Unknown"},
> +};
> +
> +//0000 df00 0000 0020 0004 0035 6faa 0000
> +
> +
> +char *sev_lookup(uint8_t  n) {

Function should return 'const char*'.

> +
> +	severity_values_t *p =3D g_sev_desc;
> +
> +	while (p->type !=3D 0xFF)  {
> +		if (p->type =3D=3D n) {
> +			break;
> +		}
> +		p++;
> +	}
> +			=09
> +	return p->description;
> +}

The C++11/C++14 way to do this is as follows:

    struct severity_values_t
    {
        uint8_t type;
        const char* description;
    };

    const std::vector<severity_values_t> g_sev_desc =3D {
        {0x10, "recoverable error"},
        {0x20, "predictive error"},
        {0x40, "unrecoverable error"},
        {0x50, "critical error"},
        {0x60, "error from a diagnostic test"},
    };

    const char* sev_lookup(uint8_t n)
    {
        auto i =3D std::find_if(std::begin(g_sev_desc), std::end(g_sev_desc=
),
                [n](auto p){ return p.type =3D=3D n; });
        return i->description;
    }

The [n](auto p){ return p.type =3D=3D n;} is called a lambda function.

[n] says "bind the local variable n into the lambda function"
(auto p) means the function will have 1 parameter: the iterator.


> +
> +
> +int find_sensor_type_string(uint8_t sensor_number, char **s) {
> +
> +    dbus_interface_t a;
> +    char *p;
> +    char r;
> +
> +    r =3D find_openbmc_path("SENSOR", sensor_number, &a);
> +
> +    if ((r < 0) || (a.bus[0] =3D=3D 0)) {
> +
> +    	// Just make a generic message for errors that=20
> +    	// occur on sensors that dont exist
> +    	asprintf(s, "Unknown Sensor (0x%02x)", sensor_number);

You're starting to get a mixture of tabs and spaces.  What is your tab size?

> +		p =3D strrchr (a.path, '/');
> +		asprintf(s, "%s", p+1);

Need to check for NULL from strrchr?

> +char *create_esel_severity(const uint8_t *buffer) {

const char*

> +int create_esel_buffer_hack(const uint8_t *buffer, size_t sz, char **asc=
ii) {
> +
> +	uint8_t *p	=3D new uint8_t [sz*2];

unique_ptr<uint8_t[]>(new uint8_t[sz*2]) is better C++ now because you don't
need to delete at the end.

> +	int i, j;

size_t is better for iterators.

--

Most of this code review is changing to 'const' and other minor cleanups. I=
'm
ok if you want to merge this as is and have a follow-up commit for the
cleanups.

--=20
Patrick Williams

--rsGyAQ90QqnfMsmV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWL/ARAAoJEKsDR8wtAMEZ6cMP/RxwEqG8EricE6Y/6+aNtkAA
3p0wGcLwl/vu8YwziaZHlnR3HMCsz5raY2Eztf9RJ9opB3LbKHI0GWAzk5Jd6yyr
hUy3V2/a21vQdAv8rVbKSCWHrS+4ERflGt0TmZtciStD6f8eiXLX4xSQc9Yw+jEb
WEPV0dERgb9EX1yv4Qr3gOthtzP3khnQ6cbrusDK4Fu/eegCepT7/EdP8IRlksqL
OtSuTwf311LZcTunQLeRkOKOYITpmkpjDjYgo4zg9eJB9EN80hQt9ByE4TfinZuX
QhDq5bXOZDXR0+048eopOUQ8d2cXTpg7iIs7PDiyl9NW7wlUAUv/IKXJkTfjSBnw
5/hPs9PtXtATZ56EMlTGQh4H9G/1WPVzPjFGeH0t0ah109CvubHEw/o6lzXtHIn9
omCso9XlTULhFmPhHLSW6AQLlX8eMyJKbz7UEA0NmdPnrwNYb/5ICHOftIG8CT7O
ph7tjznvoP/WTAW1oYga2M13kgLRostqIkh0id4Q3Lw190srI4eUtRznw6HfE5S2
WWmb4jfHUPwykQ5xx8XL7Dr7J4kSCx8bP/eoHFTZlzaSdcgrVdkqo1I1l/UNx0ka
svCAo88tBcJm4ZWgiFsPaiBTQUln7+Zd+KD34LYKcJB8DO1XfwKFYBUPgNawTL/I
aQE9Mit4Ch/IXJ59euVm
=ClOX
-----END PGP SIGNATURE-----

--rsGyAQ90QqnfMsmV--
