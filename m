Return-Path: <patrick@stwcx.xyz>
Received: from sender-p126.zohomail.com (sender1.zohomail.com [74.201.84.157])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 9D5AF1A09AE
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2015 11:29:57 +1100 (AEDT)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1445991442450844.4443508906368;
 Tue, 27 Oct 2015 17:17:22 -0700 (PDT)
Date: Tue, 27 Oct 2015 19:17:21 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Allow esels to be sent to dbus event
 log
Message-ID: <20151028001720.GE13316@asimov.austin.ibm.com>
References: <1445823605-7513-1-git-send-email-patches@stwcx.xyz>
 <1445823605-7513-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6dGMKdYe2Ft9UtxE"
Content-Disposition: inline
In-Reply-To: <1445823605-7513-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_0
X-ZohoMail-Owner: <20151028001720.GE13316@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Wed, 28 Oct 2015 00:29:58 -0000


--6dGMKdYe2Ft9UtxE
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

There is a mixture of tabs and not-tabs in this file.  Can you set your
editor to expand tabs?

> +};
> +
> +#define MAXSEVDESC 64
> +struct severity_values_t {
> +	uint8_t type;

Is there any need to specify the size of this?

> +	char    description[MAXSEVDESC];

Should be const char* instead of char[].  No advantage to specifying an arr=
ay
length here, except for possibility of accidentally having
non-terminated strings.

> +};
> +
> +
> +severity_values_t g_sev_desc[] =3D {
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

Function should return const char*.

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

The C++11/14 way of doing this is:

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
                [n](auto& e){ return e.type =3D=3D n; });
        return i->description;
    }

You don't need special terminators this way and you know the find_if is bug
proof.  You can also fairly easily change to binary_search if needed.

The '[n](auto& e){ return e.type =3D=3D n; }' is a "lambda function".
[n](auto e) says that we are creating a lambda function that captures
the local variable 'n' and takes in an auto-typed reference to the
element under consideration.

> +
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
> +
> +    } else {
> +
> +		p =3D strrchr (a.path, '/');

Need to check for nullptr here.

> +		asprintf(s, "%s", p+1);
> +    }
> +
> +    return 0;
> + }
> +

> +char *create_esel_severity(const uint8_t *buffer) {

const char*

> +int create_esel_buffer_hack(const uint8_t *buffer, size_t sz, char **asc=
ii) {
> +
> +	uint8_t *p	=3D new uint8_t [sz*2];

It is better to use unique_ptr instead of new.  Since this is a variable
length array you can do 'unique_ptr<uint8_t[]>(new uint8_t [sz*2])' but
if it was a non-array or non-variable-array you could do
'unique_ptr<foo>()'.  The advantage of 'unique_ptr' is you don't need to
worry about delete because it automatically deletes when going out of
scope.

> +	int i, j;

Should favor size_t for iterator types.

--=20

Most of this is clean-up.  I'm fine if we merge this now and have a
follow-up commit for the clean-ups.  Let me know.

--=20
Patrick Williams

--6dGMKdYe2Ft9UtxE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWMBQQAAoJEKsDR8wtAMEZwfMP/1/V948dJjzzMr76pVSUqGMy
ZnnXDe3+vut4Pm9crUdzLUd6Dj8OTZS6dKxSv5KY1izgLvSPdJP/3eeda19nAPZ9
Z07ZlICWvyWoE3sqvXPdCFIaCKTe0jv1WFPm0LVk2yyH8kJ57Re3FuJeejw3JowF
bVevMF59eS1L1gNB2mf+ceLLk1GaoGWstlAbhSAh9zdXf8fEEdAh2IjR5Vd2toQd
7HyIriynnc1N6Uyz6yaU4Xb2CRPojRsQj6M3CYG+WmvLLcgQGOCfGJp2iT4Wbwqd
FUWkgniA/qFv4VdNvOTphbq+y2EyVNrn4Zq6j/t1W3NMaBthb3xVzYstZ83he9Ev
kfsGqQSqFd3ubM1pS+tYYauRmmy2JQ3bVxSaujAewCFQQ7FjvPD1oJnvoCzFrvmw
OEc+kp5aXpt4DqhnQcEoZap38/MdTpOfXPBwHHPeVICeHvEZQ7yPatUM9kK8AmHi
znURfRvORnj6mSBd5uuYWmRaQ2JFhXtAP7EMciAgB1waXZYZa7qTS6nZY8TmX3UD
mQAbFjgcmsvTUqcmxf3vjb+GMRe5VHqZGMIeyRxlYPn8alxeTnoVbW7+nQvDYAJm
hl0eFJFRtSDhnj8zZhWtuBDX7w4AIXFeErtw+XWnXmtsrjnkAyKLZPAb58oLUOo4
e7h+NtKvlZvxuLe+/wVJ
=cPbK
-----END PGP SIGNATURE-----

--6dGMKdYe2Ft9UtxE--
