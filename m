Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 567501A0290
 for <openbmc@lists.ozlabs.org>; Tue, 13 Oct 2015 06:35:32 +1100 (AEDT)
Received: from localhost (32.97.110.55 [32.97.110.55]) by mx.zohomail.com
 with SMTPS id 144467852793555.14424328732389;
 Mon, 12 Oct 2015 12:35:27 -0700 (PDT)
Date: Mon, 12 Oct 2015 14:35:26 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Moved from gdbus to sdbus. Fixed
 sdbus memory leak. Added commands to get a Palmetto to IPL further
Message-ID: <20151012193526.GN12084@asimov.ibm.com>
References: <1444610029-11956-1-git-send-email-patches@stwcx.xyz>
 <1444610029-11956-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dzI2QqkSBOAresgT"
Content-Disposition: inline
In-Reply-To: <1444610029-11956-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_06105_9
X-ZohoMail-Owner: <20151012193526.GN12084@asimov.ibm.com>+zmo_0_<patrick@stwcx.xyz>
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
X-List-Received-Date: Mon, 12 Oct 2015 19:35:33 -0000


--dzI2QqkSBOAresgT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Best practice would be to break this down into a few smaller commits.
At least one for 'move to sdbus' and one for 'add storage handler'.

On Sun, Oct 11, 2015 at 07:33:49PM -0500, OpenBMC Patches wrote:
> From: Chris Austen <austenc@us.ibm.com>
>=20
> ---
>=20
> diff --git a/Makefile b/Makefile
> index 4baf209..929ef21 100755
> --- a/Makefile
> +++ b/Makefile
> @@ -2,19 +2,36 @@ CXX ?=3D $(CROSS_COMPILE)g++
> =20
>  DAEMON =3D ipmid
>  DAEMON_OBJ =3D $(DAEMON).o
> -LIB_OBJ =3D apphandler.o
> -LIBS =3D libapphandler.so
> +LIB_APP_OBJ     =3D apphandler.o
> +LIB_SEN_OBJ     =3D sensorhandler.o
> +LIB_STORAGE_OBJ =3D storagehandler.o
> +LIB_OEM_OBJ     =3D oemhandler.o
> =20
> -INC_FLAG +=3D $(shell pkg-config --cflags glib-2.0 gio-unix-2.0) -I. -O2=
 --std=3Dgnu++11
> -LIB_FLAG +=3D $(shell pkg-config --libs glib-2.0 gio-unix-2.0) -rdynamic
> +LIB_APP     =3D libsenhandler.so
> +LIB_SEN     =3D libapphandler.so
> +LIB_STORAGE =3D libstoragehandler.so
> +LIB_OEM     =3D liboemhandler.so

The intention was to break these out into separate packages, especially
the OEM one.  I know we haven't set up a *-devel pacakge yet though.

> --- a/apphandler.C
> +++ b/apphandler.C
> +ipmi_ret_t ipmi_app_get_bt_capabilities(ipmi_netfn_t netfn, ipmi_cmd_t c=
md,=20
>                               ipmi_request_t request, ipmi_response_t res=
ponse,=20
>                               ipmi_data_len_t data_len, ipmi_context_t co=
ntext)
=2E..
> -    unsigned char str[] =3D {0x00, 0x01, 0xFE, 0xFF, 0x0A, 0x01};
> +    unsigned char str[] =3D {0x01, MAX_IPMI_BUFFER, MAX_IPMI_BUFFER, 0x0=
A, 0x01};

Why did the original have 0xFE and 0xFF instead of both the same?

> +
> +typedef struct {
> +    unsigned char  t_use;
> +    unsigned char  t_action;
> +    unsigned char  preset;
> +    unsigned char  flags;
> +    unsigned char  ls;
> +    unsigned char  ms;
> +} SET_WD_DATA ;
> +

Use C++/C99-style struct definition.  No need for typedef.

> +ipmi_ret_t ipmi_app_set_watchdog(ipmi_netfn_t netfn, ipmi_cmd_t cmd,=20
> +                             ipmi_request_t request, ipmi_response_t res=
ponse,=20
> +                             ipmi_data_len_t data_len, ipmi_context_t co=
ntext)
> +{
> +
> +    SET_WD_DATA *reqptr =3D (SET_WD_DATA*) request;

Is this endian-safe?

> diff --git a/ipmid-api.h b/ipmid-api.h
> index 615e0d5..03e1cb6 100755
> --- a/ipmid-api.h
> +++ b/ipmid-api.h
> @@ -70,7 +70,8 @@ enum ipmi_net_fns
> +    NETFUN_OEM_IBM  =3D   (0x32 << 2)

This shouldn't be in the ipmid-api.  It isn't part of the IPMI spec.
Was already removed in the previous review.

> diff --git a/ipmid.C b/ipmid.C
> index 37ac771..38dba91 100644
> --- a/ipmid.C
> +++ b/ipmid.C
> @@ -4,22 +4,82 @@
> +#define FILTER "type=3D'signal',sender=3D'org.openbmc.HostIpmi',member=
=3D'ReceivedMessage'"

Prefer static const char* or a more unique name.

> +
> +    // Add the bytes needed for the methos to obe called

"methos to obe".  Is this latin?

> +static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bu=
s_error
> +                         *ret_error) {
=2E..
> +    r =3D sd_bus_message_read_array(m, 'y',  &request, &sz );
> +    if (r < 0) {
> +        fprintf(stderr, "Failed to parse signal message: %s\n", strerror=
(-r));
> +        return -1;
> +    }

Is there a read_array_n function to prevent buffer overrun?  I can crash
your application by sending a message longer than the size of 'request'.

> +    // TODO: Need to pass the buffer length of the request bytes

Isn't this satisfied with 'resplen =3D sz' below?  I'm fine with another
parameter for the input buffer size.  I think the intent was that
'resplen' is both input and output size.

> +    // Probably should just pass an ipmi object with all the=20
> +    // interesting stuff in there and just one parameter.

Generally, passing as parameters is more efficient.  Constructing an
extra object on the stack is just overhead.

> +    // Also this is not thread safe at all.  response is a single buffer
> +    // used by all commands.  Seems wrong

Do we have any threads?  The current implementation handles only one
command at a time and I don't think we intended to change that.

> diff --git a/ipmid.H b/ipmid.H
> index 6b7d2c9..ab8b030 100755
> --- a/ipmid.H
> +++ b/ipmid.H
> -#define MAX_IPMI_BUFFER 255
> +#define MAX_IPMI_BUFFER 64

Does Hostboot not handle if this is longer than 64?

> diff --git a/oemhandler.C b/oemhandler.C

The OEM messages should be in a separate package.

> +typedef struct {
> +    unsigned char  residls;
> +    unsigned char  residms;
> +    unsigned short selrecord;
> +    unsigned short offset;
> +    unsigned char  progress;
> +    unsigned char  data;
> +
> +} ESEL_DATA ;

C++/C99-style struct def.

> +
> +
> +// This function creates a /tmp/esel# file to store the=20
> +// incoming partial esel.  It is the role of some other
> +// function to commit the error log in to long term=20
> +// storage.  Likely via the ipmi add_sel command. =20
> +ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,=
=20
> +                              ipmi_request_t request, ipmi_response_t re=
sponse,=20
> +                              ipmi_data_len_t data_len, ipmi_context_t c=
ontext)
> +{
> +    ESEL_DATA *reqptr =3D (ESEL_DATA*) request;

Have concerns with endianness safety on this one especially because the
entries are of mismatched sizes.  I think you at least need a
__attribute__(packed) on the struct.

> +    if (reqptr->offset =3D=3D 0) {
> +        strcpy(iocmd, "wb");
> +    } else {
> +        // I was thinking "ab+" but it appears it doesn't
> +        // do what fseek asks.  Modify to rb+ and fseek=20
> +        // works great...
> +        strcpy(iocmd, "rb+");
> +    }

Writing to offset 0 is always going to cause truncation (erase of
previous data) while others allow append.  Is this intentional?  Is
there ever a case where an endpoint is going to write offset zero to
update data after they've written other data?

> +
> +    if ((fp =3D fopen(string, iocmd)) !=3D NULL) {
> +        fseek(fp, reqptr->offset, SEEK_SET);
> +        fwrite(&reqptr->data,rlen,1,fp);
> +        fclose(fp);

No handling return codes from these functions.

Does 'fseek' work if the file isn't already reqptr->offset bytes long?
As in, can I fseek past the current end of the file, and do those bytes
end up automatically filled in with zeros?

> diff --git a/sensorhandler.C b/sensorhandler.C
> new file mode 100644
> index 0000000..3bef067
=2E..
> +typedef struct {
> +    unsigned char  sennum;
> +} SENSOR_DATA ;

C99/C++ style struct.

> +unsigned char g_sensortype [][2] =3D {

Best to sort these numerically or use a C++11-style static initialized
map.  Then you can use a binary search on the data.

http://stackoverflow.com/questions/2636303/how-to-initialize-a-private-stat=
ic-const-map-in-c/8688615#8688615

> +unsigned char findSensor(char sensor_number) {
> +
> +    int i=3D0;
> +
> +    // TODO : This function should actually call
> +    // a dbus object and have it return the data
> +    // it is not ready yet so use a Palmetto=20
> +    // based lookup table for now.  The g_sensortype
> +    // can be removed once the dbus method exists
> +    while (g_sensortype[i][0] !=3D 0xff) {
> +        if (g_sensortype[i][1] =3D=3D sensor_number) {
> +            break;
> +        } else {
> +            i++;
> +        }
> +
> +    }
> +
> +    return g_sensortype[i][0];
> +
> +}

Use find, lower_bound, or map lookup.  Should avoid writing your own
loops for searching.

> diff --git a/storagehandler.C b/storagehandler.C
> new file mode 100644
> index 0000000..085b442
> --- /dev/null
> +++ b/storagehandler.C
> +typedef struct {
> +    unsigned char  frunum;
> +    unsigned char  offsetls;
> +    unsigned char  offsetms;
> +    unsigned char  data;
> +} WRITE_FRU_DATA ;

Same comment here as earlier pattern.

> +
> +ipmi_ret_t ipmi_storage_write_fru_data(ipmi_netfn_t netfn, ipmi_cmd_t cm=
d,=20
> +                              ipmi_request_t request, ipmi_response_t re=
sponse,=20
> +                              ipmi_data_len_t data_len, ipmi_context_t c=
ontext)
> +{
> +    WRITE_FRU_DATA *reqptr =3D (WRITE_FRU_DATA*) request;

Same comment here as earlier pattern.

> +    // I was thinking "ab+" but it appears it doesn't
> +    // do what fseek asks.  Modify to rb+ and fseek=20
> +    // works great...
> +    if (offset =3D=3D 0) {
> +        strcpy(iocmd, "wb");
> +    } else {
> +        strcpy(iocmd, "rb+");
> +    }
> +
> +    if ((fp =3D fopen(string, iocmd)) !=3D NULL) {
> +        fseek(fp, offset, SEEK_SET);
> +        fwrite(&reqptr->data,rlen,1,fp);
> +        fclose(fp);

Same comments here on fopen and return codes.

--=20
Patrick Williams

--dzI2QqkSBOAresgT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWHAt+AAoJEKsDR8wtAMEZMscP/RcSU9WxQh043Fk/XdVx5stF
JrWoEgCiqhm5XcfMfbjH4moG1xE6WFXOcEBrUMYLECUU+Nv17rodS1BcVPiCbB8o
tC5gde1JglUg8vu37/o3tIZFdYBbwak5f5VEu9B4vA/M58+WGP0hy4KXGJ2Q4Rem
JubSFPPzgfeene2a92jozZy6KCCN1V9eiD3aN3cZSxSqB2uToddYDIQhc9vkHyNa
Z6HOP+YkleHLp4oqdx21a0eb9QkT+cq1vlf5KMxbcT5Ij4eZqi66dtl1EdYlYNQ3
IFWz6oP3oscXtF6CNjPdjse+l07bEF15UOqrrA/Rf8DKvh56aWqTPivXh8QnD70X
2ZGOOy4JpYd+GyHD2NPU1XYJMGC4ki/m4YKup2OuXlmcAFkOZmRDRvebzZ0g2lLF
KucGhNNKnqqokqwy7D1dSOePLaCUF2IPsrm/Up+XuZq+akMnCAJZgxWfU56mIUBb
oqIySb1GZLo9eS8VEmw6VVgi66x8ZIAb7EC3Jaoo8Zuz+Gz9N1RMXqrI5NVlCKUZ
Drn0Zq0jqho+nIESEQsbSHrzKVlleVxoIJkJUAgkNOTVxt3dTnRJ0WfVqgfgahRe
90SZhEZebng+rBZvwHWrwuAlPNarliICwiQDbB7QruRmit6QZpyTbXDCQvfJT+u0
mjvgo2FVxdpcS2Yn7ErF
=peIB
-----END PGP SIGNATURE-----

--dzI2QqkSBOAresgT--
