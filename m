Return-Path: <andrew@aj.id.au>
Received: from homiemail-a22.g.dreamhost.com (sub3.mail.dreamhost.com
 [69.163.253.7])
 (using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3r7PTN3C9vzDq66
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2016 12:26:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b=lU93P0FL; 
 dkim-atps=neutral
Received: from homiemail-a22.g.dreamhost.com (localhost [127.0.0.1])
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTP id DA0AD114067;
 Sun, 15 May 2016 19:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=aj.id.au; h=message-id
 :subject:from:reply-to:to:cc:date:in-reply-to:references
 :content-type:mime-version; s=aj.id.au; bh=xCN14OBzZMgtRyEAmBhZ3
 Fl4D40=; b=lU93P0FLkjgpemCgaD2uPpX/D1BKr+kG5kuhqr35wHFSMkrRbsTYn
 b9ha1W+m0u2fM1isQrqcsI+Kox476I0DjjfoPKlLHblsGKagCgX1dUDpS3IhI7/F
 VAcLLUglAHTcnw0M0dS/JJ1HcNZszeV9chIH7KY09mQwkXKaBS7sjQ=
Received: from keelia (unknown [203.0.153.9])
 (using TLSv1 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: andrew@aj.id.au)
 by homiemail-a22.g.dreamhost.com (Postfix) with ESMTPSA id 4D5AE114065;
 Sun, 15 May 2016 19:25:55 -0700 (PDT)
Message-ID: <1463365542.2703.68.camel@aj.id.au>
Subject: Re: [PATCH phosphor-host-ipmid v2] Handle errors finding
 openbmc_path #75
From: Andrew Jeffery <andrew@aj.id.au>
Reply-To: andrew@aj.id.au
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Cc: Nan Li <bjlinan@cn.ibm.com>
Date: Mon, 16 May 2016 11:55:42 +0930
In-Reply-To: <1463140845-1854-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1463140845-1854-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1463140845-1854-2-git-send-email-openbmc-patches@stwcx.xyz>
Organization: IBM OzLabs
Content-Type: multipart/signed; micalg="pgp-sha512";
 protocol="application/pgp-signature"; boundary="=-CMgyMd7VLV3NOc9vez+I"
X-Mailer: Evolution 3.18.5.2-0ubuntu1 
Mime-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2016 02:26:01 -0000


--=-CMgyMd7VLV3NOc9vez+I
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nan Li,

Thanks for the patch. I've had a look at the files you're modifying and
it seems like the error handling is ripe for improvement beyond the
issues you've fixed. However, resolving those problems is probably
beyond the scope of your patch, so never mind that.

On Fri, 2016-05-13 at 07:00 -0500, OpenBMC Patches wrote:
> From: Nan Li <bjlinan@cn.ibm.com>
>=20
> 1.Check return value properly.
>=20
> Signed-off-by: Nan Li <bjlinan@cn.ibm.com>
> ---
> =C2=A0ipmid.C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 10 +=
+++++++++
> =C2=A0sensorhandler.C |=C2=A0=C2=A09 ++++++++-
> =C2=A02 files changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/ipmid.C b/ipmid.C
> index 728ba0b..413c2b7 100644
> --- a/ipmid.C
> +++ b/ipmid.C
> @@ -565,6 +565,11 @@ int set_sensor_dbus_state_s(uint8_t number, const ch=
ar *method, const char *valu
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r =3D find_openbmc_path("SENSOR", number, &=
a);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0if (r < 0) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fprintf(stderr, "Failed =
to find Sensor 0x%02x\n", number);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto final;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +

We jump to the final label which is consistent with the existing error
handling, but we don't appear to need any of the clean-up that's done
there. Maybe we should just return instead?

If we return, we need to return a value. Looking at the existing code
it seems that 0 is returned regardless of whether an error has
occurred. This doesn't seem useful (i.e. should this just be a void
function?), but also means that you don't need to choose an error
value...


> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r =3D sd_bus_message_new_method_call(bus,&m=
,a.bus,a.path,a.interface,method);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (r < 0) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fprintf(stderr, "Fa=
iled to create a method call: %s", strerror(-r));
> @@ -602,6 +607,11 @@ int set_sensor_dbus_state_y(uint8_t number, const ch=
ar *method, const uint8_t va
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r =3D find_openbmc_path("SENSOR", number, &=
a);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0if (r < 0) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fprintf(stderr, "Failed =
to find Sensor 0x%02x\n", number);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto final;
> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r =3D sd_bus_message_new_method_call(bus,&m=
,a.bus,a.path,a.interface,method);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (r < 0) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fprintf(stderr, "Fa=
iled to create a method call: %s", strerror(-r));
> diff --git a/sensorhandler.C b/sensorhandler.C
> index bb14e7a..9c7c2cd 100644
> --- a/sensorhandler.C
> +++ b/sensorhandler.C
> @@ -180,6 +180,13 @@ ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t =
netfn, ipmi_cmd_t cmd,
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0r =3D find_openbmc_path("SENSOR", reqptr->s=
ennum, &a);
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0if (r < 0) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fprintf(stderr, "Failed =
to find Sensor 0x%02x\n", reqptr->sennum);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0*data_len=3D0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rc =3D IPMI_CC_SENSOR_IN=
VALID;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0goto final;

Instead of 'goto final' we should just 'return IPMI_CC_SENSOR_INVALID'.
If we do that we also don't need to introduce the label.

> +=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0type =3D find_sensor(reqptr->sennum);
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0fprintf(stderr, "Bus: %s, Path: %s, Interfa=
ce: %s\n", a.bus, a.path, a.interface);
> @@ -220,7 +227,7 @@ ipmi_ret_t ipmi_sen_get_sensor_reading(ipmi_netfn_t n=
etfn, ipmi_cmd_t cmd,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0
> -
> +final:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0reply =3D sd_bus_message_unref(reply);

Since we're not using reply at the point we've introduced the goto, we
don't need to unref it. We know it'll still be NULL.
sd_bus_message_unref() handles the NULL case, but this is something I
had to dive into the code to verify. For sanity's sake we should
probably avoid it.

Cheers,

Andrew

> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return rc;
--=-CMgyMd7VLV3NOc9vez+I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCgAGBQJXOS+mAAoJEJ0dnzgO5LT5bHAP/jseSd5FLb/vsRVCHtYwY/Ze
sYyvigeiER2YSMB7o3RVhQT3T4rnLKWEhsG2la+CGYQyEQoFH5vYPM91ax5ftErz
bcp74X77NCBMzSW/YQe+aRoGhzyn26uq64FwrMj2R3bXGSoaryRXnt4/doI3Nx0y
UHWDpIEtJsL1c58rd1XMoHolVJ6IoBheKGyp9zn8s3qZNHHDBW0WrmVt+KmPfXEu
CrrXYB3tPHW8xJecmrlCoF9hMPoLLu5ot1ieTMhGFJPAKAMtzLWegalL+3Qw7aBn
+UGpEddSV5DWt7xEYf8RZwiWQKSKHTHOranHx3AZ/sC27FS1eRPF0J7R5aPQS4Nv
DFaUhuYzSVVyUOB1jMhIX/OFKhLLKZ04V1YAYt5bb0wyJXkwhzuBnNk5p+4IvOLh
8+2T8ArrNcYdq8iFcdZ8n267d1ebNE84vDgbIy67a2ot7M2bzIvevheRKpqDVATi
29A47ZS3a/uN18+xvdBy02hPtHfPm2tUBRuOuTi6ay9g9xGWrmdwCiiBcSsf5NzC
xkHXPaaCIcBkDs8mzlvnElAKZFYLLRROzUXSkP23AMvYarUrMEzALD9vfSor0Pz+
tXRMISuqRtxSmlJK7M8cZFn6WXYRj+LouRCYo1LbFRcW0ngRntXpfNG10zxC0e+v
6fVJkLfdikhvu80mGiPc
=VZRR
-----END PGP SIGNATURE-----

--=-CMgyMd7VLV3NOc9vez+I--
