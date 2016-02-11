Return-Path: <andrew@aj.id.au>
Received: from homiemail-a15.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 by lists.ozlabs.org (Postfix) with ESMTP id 017D41A0019
 for <openbmc@lists.ozlabs.org>; Thu, 11 Feb 2016 12:04:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=KJWK8oky; 
 dkim-atps=neutral
Received: from homiemail-a15.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTP id 20B8F76C06B;
 Wed, 10 Feb 2016 17:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=w7ic5LuhnY7TFCXnEoLNX
 GgYWZI=; b=KJWK8okysmeF/PfuZAI8wtscLrzt4l8IyUWQM5tIEPca9CyYvSjj3
 +1zogkKP0sPhkDkm5TpctaC1mqx+qg4FIkhBuYUknWRx60T3oe8Gi6XZfMgL86eB
 A4QZ5YwxDmQPlA6CnC810JEy2Z/utzAc+L6mOdJd22TESntL6oHz7E=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a15.g.dreamhost.com (Postfix) with ESMTPSA id 59D9776C069;
 Wed, 10 Feb 2016 17:04:48 -0800 (PST)
Message-ID: <1455152677.3153.81.camel@aj.id.au>
Subject: Re: [PATCH phosphor-host-ipmid v2] IPMI Get IP Support
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Date: Thu, 11 Feb 2016 11:34:37 +1030
In-Reply-To: <1455140430-32605-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1455140430-32605-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1455140430-32605-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-kjNWI71kFa+juT8PYbnI"
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 11 Feb 2016 01:04:52 -0000


--=-kjNWI71kFa+juT8PYbnI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adriana,

I realise this has already been merged, but I feel like I should point
out some issues below for future improvements.

On Wed, 2016-02-10 at 15:40 -0600, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> Fix parsing of Get IP address.
> Dbus method returns additional information such as family and
> gateway, but this IPMI option just requires the IP to be returned.
> ---
>  transporthandler.C | 75 ++++++++++++++++++++++++++----------------------=
------
>  1 file changed, 36 insertions(+), 39 deletions(-)
>=20
> diff --git a/transporthandler.C b/transporthandler.C
> index df2986a..d43f1f9 100644
> --- a/transporthandler.C
> +++ b/transporthandler.C
> @@ -215,9 +215,7 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netfn,=
 ipmi_cmd_t cmd,
>      unsigned char       prefixlen;
>      unsigned char       scope;
>      unsigned int        flags;
> -    char                saddr [128];
> -    char                gateway [128];
> -    uint8_t             buf[11];
> +    char               *saddr =3D NULL;
>      int                 i =3D 0;
> =20
>      printf("IPMI GET_LAN\n");
> @@ -259,57 +257,56 @@ ipmi_ret_t ipmi_transport_get_lan(ipmi_netfn_t netf=
n, ipmi_cmd_t cmd,
>      else if (reqptr->parameter =3D=3D LAN_PARM_IP)
>      {
>          const char*         device             =3D "eth0";
> +        uint8_t buf[5]; // Size of expected IPMI response msg

Might be best to use a constant and avoid the comment:

#define IPMI_IP_RESP_SIZE 5

> =20
> -        sd_bus_message *res =3D NULL;
> -        sd_bus *bus1        =3D NULL;
> -        sd_bus_error err    =3D SD_BUS_ERROR_NULL;
> -
> -        rc =3D sd_bus_open_system(&bus1);
> -        if(rc < 0)
> -        {
> -            fprintf(stderr,"ERROR: Getting a SYSTEM bus hook\n");
> +        r =3D sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"GetAddr=
ess4");
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to add method object: %s\n", strerro=
r(-r));
>              return -1;
>          }
> -
> -        rc =3D sd_bus_call_method(bus1,            // On the System Bus
> -                                app,            // Service to contact
> -                                obj,            // Object path=20
> -                                ifc,            // Interface name
> -                                "GetAddress4",  // Method to be called
> -                                &err,           // object to return erro=
r
> -                                &res,           // Response message on s=
uccess
> -                                "s",         // input message (dev,ip,nm=
,gw)
> -                                "eth0");
> -        if(rc < 0)
> -        {
> -            fprintf(stderr, "Failed to Get IP on interface : %s\n", devi=
ce);
> +        r =3D sd_bus_message_append(m, "s", device);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to append message data: %s\n", strer=
ror(-r));
>              return -1;
>          }
> -
> -        /* rc =3D sd_bus_message_read(res, "a(iyyus)s", ...); */
> -        rc =3D sd_bus_message_enter_container (res, 'a', "(iyyus)");
> +        r =3D sd_bus_call(bus, m, 0, &error, &reply);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to call method: %s\n", strerror(-r))=
;
> +            return -1;
> +        }
> +        rc =3D sd_bus_message_enter_container (reply, 'a', "(iyyus)");
>          if(rc < 0)
>          {
>              fprintf(stderr, "Failed to parse response message:[%s]\n", s=
trerror(-rc));
>              return -1;
>          }
> -
> -        while ((rc =3D sd_bus_message_read(res, "(iyyus)", &family, &pre=
fixlen, &scope, &flags, &saddr)) > 0) {
> -                printf("%s:%d:%d:%d:%s\n", family=3D=3DAF_INET?"IPv4":"I=
Pv6", prefixlen, scope, flags, saddr);
> -        }
> -
> -        rc =3D sd_bus_message_read (res, "s", &gateway);
> -        if(rc < 0)
> +        rc =3D sd_bus_message_read(reply, "(iyyus)", &family, &prefixlen=
, &scope, &flags, &saddr);
> +        if (rc < 0)
>          {
> -            fprintf(stderr, "Failed to parse gateway from response messa=
ge:[%s]\n", strerror(-rc));
> +            fprintf(stderr, "Failed to receive response: %s\n", strerror=
(-r));
>              return -1;
>          }
> =20
> +        printf("%s:%d:%d:%d:%s\n", family=3D=3DAF_INET?"IPv4":"IPv6", pr=
efixlen, scope, flags, saddr);
> +
>          memcpy((void*)&buf[0], =C2=A4t_revision, 1);
> -        sscanf (saddr, "%c.%c.%c.%c", &buf[1], &buf[2], &buf[3], &buf[4]=
);
> -        buf[5] =3D family;
> -        buf[6] =3D prefixlen;
> -        sscanf (gateway, "%c.%c.%c.%c", &buf[7], &buf[8], &buf[9], &buf[=
10]);
> +
> +        // Parse IP address

Instead of hand-crafting this, why not use inet_pton()[1]? The binary
IP value is output in the s_addr member of struct in_addr. Also, we
need to do different things based on whether we have an IPv4 vs IPv6
address (assuming we care as there's detection of v4/v6 in the printf()
above), and with inet_pton() abstraction this is a change of a
parameter rather than a change of algorithm.

> +        char *tokptr =3D NULL;
> +        char* digit =3D strtok_r(saddr, ".", &tokptr);
> +        if (digit =3D=3D NULL)
> +        {
> +            fprintf(stderr, "Unexpected IP format: %s", saddr);
> +            return IPMI_CC_RESPONSE_ERROR;
> +        }
> +        i =3D 0;
> +        while (digit !=3D NULL)
> +        {
> +            int resp_byte =3D strtoul(digit, NULL, 10);

If we continue on this path (instead of using inet_pton() as suggested
above), with strtoul() you're assigning an unsigned value into a signed
type - it's a bit of nit but resp_byte should probably be unsigned.
Additionally, if you're using strtoul() you should to do error checking
as suggested in the NOTES section of the man page[2]. The example in
the strtol() man page[3] demonstrates that actually requires quite a
bit of effort.

> +            memcpy((void*)&buf[i+1], &resp_byte, 1);

I think really what you're trying to say here is that you expect the
value produced by strtoul() to be <=3D 255, and that you want to make use
of the parsed value. resp_byte should be tested for <=3D 255, as if the
parsed value is bigger it's a malformed IP. Malformed IPs should
probably result in an error being propagated to the caller.

Regardless, if we use inet_pton() instead we can just punt on the
problem of how to detect invalid IPs and deal with the error return
code (0, -1/errno) as necessary.

Additionally, the above approach locks the code to a little-endian
environment. I don't know that we care about being portable, but it's
easy to avoid the lock-in and the memcpy (assumes we've checked
resp_byte is in-range):

    buf[i+1] =3D (uint8_t) resp_byte;

And on that, it seems that we only use i in the context of the loop, in
the assignment into buf. Can we set i=3D1 prior to the loop, rather than
obfuscating the code unnecessarily with i+1?

Again, these last points are not relevant if we switch to inet_pton(),
though the s_addr value will still eventually need to be memcpy()ed
into the response buffer.

> +            i++;
> +            digit =3D strtok_r(NULL, ".", &tokptr);
> +        }
> =20
>          *data_len =3D sizeof(buf);
>          memcpy(response, &buf, *data_len);

Andrew

[1] http://man7.org/linux/man-pages/man3/inet_pton.3.html
[2] http://man7.org/linux/man-pages/man3/strtoul.3.html#NOTES
[3] http://man7.org/linux/man-pages/man3/strtol.3.html#EXAMPLE
--=-kjNWI71kFa+juT8PYbnI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABCgAGBQJWu94lAAoJEJ0dnzgO5LT5fawP/0W7UKWr2IqfdpjkHDn5S2qw
4gnUERpiL5L3mSMya0AljWqQMiTkB237N1sxR3AD9Tp4rFBAfZ5QN5Qx4XztV41a
GKuDy3CG+vV2tHnE9c/3/rDCDdOMk3MuzOOLcsPxKiqbJ/FGhZKSJaHWWDJ/Z9ef
h1U983F+/94m5c9cbRYOHRjxPtmxSwtOHpQi8+XgFEUQ2aBg5cx5brjcslH+hsKI
2PTxLhcBd8br1e2kCqQqVJbXR2u6ZtyIvowZqVu/FoipkDvPXuZdl//5ojGvWG9p
e8YUB/W4R7Cmit+YLA00qA4Vejd2siqPtdNYp7+jc0/4jsRxkWoWA/PTixrjr1fz
VCF8ilk9Q42mxwFvxAZ/rJU8TDiUEuPdSU8/IVjQ5eqAoKEWMs1EiMvvaKkrcbqi
lg3rIAX7LlAJQcLTg2FRvT/CmJIgGzPiAJV5rUpK9Bl5ldLDYl/4YDwqKpQkYaZQ
AOoJmOX11SYF1nPL+TZGqXsexhuDINgrbWXnsb6giyDtgKWSQm6Vs276AQB5fqKa
r16pIL46el3uojIAMNEiRF4WNrvXj/B4w0IjpZa8CCl5CcGq1OgDiKd9EsvHlP0x
XuvZn23C4exSGQCQsKYfB/2dVKTWyIG6AVDAT7vAAqXA15LoeBWhSCxwmOR2pCRl
Rap5ogAzl4U5v2GK1jC+
=0UOF
-----END PGP SIGNATURE-----

--=-kjNWI71kFa+juT8PYbnI--
