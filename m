Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 1F8B41A0C00
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2015 06:37:32 +1100 (AEDT)
Received: from localhost (108-215-4-10.lightspeed.austtx.sbcglobal.net
 [108.215.4.10]) by mx.zohomail.com
 with SMTPS id 1446147448071956.4962074148506;
 Thu, 29 Oct 2015 12:37:28 -0700 (PDT)
Date: Thu, 29 Oct 2015 14:37:26 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Patches <patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton] Move .so library to lib directory
Message-ID: <20151029193726.GE31364@asimov.austin.ibm.com>
References: <1446140425-7767-1-git-send-email-patches@stwcx.xyz>
 <1446140425-7767-2-git-send-email-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GxcwvYAGnODwn7V8"
Content-Disposition: inline
In-Reply-To: <1446140425-7767-2-git-send-email-patches@stwcx.xyz>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMail: Ss  SS_10 UW UB CHF_INT_SMD_EXT  SGR4_1_19105_0
X-ZohoMail-Owner: <20151029193726.GE31364@asimov.austin.ibm.com>+zmo_0_<patrick@stwcx.xyz>
X-ZohoMail-Sender: 108.215.4.10
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
X-List-Received-Date: Thu, 29 Oct 2015 19:37:33 -0000


--GxcwvYAGnODwn7V8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2015 at 12:40:25PM -0500, OpenBMC Patches wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>=20
> Move .so library out of bin into lib to make recipe simpler
> Move the make all target to the top so that it's the default for make
> Make clean to delete all created targets
> ---
>  Makefile | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/Makefile b/Makefile
> index 02f51f1..cbb62d8 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -5,7 +5,7 @@ OBJS	+=3D objects/pflash/arm_io.o
>  OBJS2   =3D progress.o ast-sf-ctrl.o libflash.o libffs.o arm_io.o
>  OBJS3   =3D obj/progress.o obj/ast-sf-ctrl.o obj/libflash.o obj/libffs.o=
 obj/arm_io.o
>  INCLUDES=3D$(shell pkg-config --cflags gio-unix-2.0 glib-2.0) -Iincludes=
 -Iobjects/pflash -I.
> -LIBS=3D$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Lbin -lopenbmc_=
intf
> +LIBS=3D$(shell pkg-config --libs gio-unix-2.0 glib-2.0) -Llib -lopenbmc_=
intf
> =20
>  %.o: interfaces/%.c=20
>  	$(CC) -c -fPIC -o obj/$@ $< $(CFLAGS) $(INCLUDES)
> @@ -22,14 +22,16 @@ LIBS=3D$(shell pkg-config --libs gio-unix-2.0 glib-2.=
0) -Lbin -lopenbmc_intf
>  %.o: objects/pflash/libflash/%.c
>  	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
> =20
> +all: setup libopenbmc_intf power_control led_controller button_power con=
trol_host fan host_watchdog control_bmc board_vpd pcie_slot_present flash_b=
ios flasher control_bmc_barreleye
> +
>  setup:=20
> -	mkdir -p obj
> +	mkdir -p obj lib
> =20
>  clean: =20
> -	rm -rf obj
> +	rm -rf obj lib bin/*.exe
> =20
>  libopenbmc_intf: openbmc_intf.o
> -	$(CC) -shared -o bin/$@.so obj/openbmc_intf.o $(LDFLAGS)
> +	$(CC) -shared -o lib/$@.so obj/openbmc_intf.o $(LDFLAGS)
> =20
>  power_control: power_control_obj.o gpio.o libopenbmc_intf
>  	$(CC) -o bin/$@.exe obj/gpio.o obj/power_control_obj.o $(LDFLAGS) $(LIB=
S)
> @@ -71,4 +73,3 @@ hwmon:  hwmon_intf.o libopenbmc_intf
>  	$(CC) -o bin/$@.exe obj/hwmon_intf.o $(LDFLAGS) $(LIBS)
> =20
> =20
> -all: setup libopenbmc_intf power_control led_controller button_power con=
trol_host fan host_watchdog control_bmc board_vpd pcie_slot_present flash_b=
ios flasher control_bmc_barreleye

You didn't need to move 'all' to the top in order to make it the
"default" goal.  ".DEFAULT_GOAL: all" does the same thing.

> --=20
> 2.6.0
>=20
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=20
Patrick Williams

--GxcwvYAGnODwn7V8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWMnV2AAoJEKsDR8wtAMEZypEP/RSLM+UeDT3+sORQD0mg0xk4
gBfwfoxsptojL27+Ec0CC3wOSPpIhHZ2dlncGOJJ/d9Ow6xlJkLh9VQhS9mCZ7V2
VH5zMBTHXNM52o5ucLZwrVGJV9REnSYiTGAyYZOhgTu1WxsO5CLBAQf/2NMPtdzz
UrvUkUfmFCdmjHQ5ovCUYSs/LUNTLr8+VmWY3vx+StYcHO2PdUFxZ2660hWzADIz
fdoRi/4GE0uiKILfSp4OkCtCbdmu0dB1bKZttmNwMb8f3LmMkNjhnBW8YIFLAq+g
xe++OWLKF+L5fw9jpIDZiWJJTawp3VhcHoViWipWbc9/oFpuI0lBksNpmTR+iWn/
zyBPMeLDZdJ7GAl7MZOayPDkO9PRYvZVLXf9f2Nux9Q7QRSM1KSmVHKnFjfP7410
ByuqdIsIXWgt2+6C1jTq0U0JHkWIcsFAtkIOFdTs9ooZOWBEazA7MxIZh2f+er45
NBylDrFj/QyajifPSaUVL7KLoXl0XaWOIr4ExBZ6X0P+5EbG160CeXKUELrNtkCV
tymQ2Dx4vZ7xbUv7io29abPAkeDnrwudOkLkEYKvwraDKSezJCn0DD7lqlubyuQ4
0ocKtllZr604+CQZS41nVtJqjqJn1Vh8IGqRRluBh16bODD31rLxO/Nq4t1LJbkZ
MuwKidf+YIEXjIj++YhV
=aJJI
-----END PGP SIGNATURE-----

--GxcwvYAGnODwn7V8--
