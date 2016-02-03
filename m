Return-Path: <dja@axtens.net>
Received: from mail-pa0-x243.google.com (mail-pa0-x243.google.com
 [IPv6:2607:f8b0:400e:c03::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 2413D1A0220
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 17:18:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=SV3Opj0c; 
 dkim-atps=neutral
Received: by mail-pa0-x243.google.com with SMTP id pv5so519599pac.0
 for <openbmc@lists.ozlabs.org>; Tue, 02 Feb 2016 22:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=aDsMXvf37JVkSI5aDlSKrz1ypf7mo/UOi3QlXnFa1oU=;
 b=SV3Opj0c6nbAwaLMQNcDC+h6uva4YH3PC9ye5YCX9zUl2RVatq0DVQ6XOha0Wp9BH9
 hjb1Xs95QXmFpluJa8GSj9AbDf8fWoAgd2rS4F5NcgzkZUZV71M3Wz1lcycu+5joAPEj
 L5fM6plrz3BaddT5onKywtxGkkocFZniSUfNg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=aDsMXvf37JVkSI5aDlSKrz1ypf7mo/UOi3QlXnFa1oU=;
 b=b38s8JB5ChQkiBSJkd1nWaJUBo2qXEYdnqeVGFL9hpOotYG/60jZBCKEIjUmrsyDlE
 ppGpdU+Qsflkk1INfXfreqDoMVKc+VS2ePRkZTm5wgKQrZH8XjiYVMp2nJLh3uaRLruz
 YiIKZh6WFBa+UPyc26lrc2dgwFnQdQUSPkWnsEitNz1NQeO7nUvhgGKNvwrxcwhXZLmJ
 A+J1aF2FVRe7eNM/YvpWGfp7rgfZGYhD6OBXSGauei2Dsoa/k7XMRZ6tp+30LS+PnPek
 P0TR7w+jgVmWsAv8XA0CN132q04rUksa8qOPbByAW0qziR2xGO5tT2od1lMvJfFVFBHN
 M/Hw==
X-Gm-Message-State: AG10YOT/nyfyW2xzYDL7d25BoKE9hjbckkef5SPYmOuN+WBHhJMZLYrUamr6hG758efWyA==
X-Received: by 10.66.191.104 with SMTP id gx8mr53255691pac.21.1454480282908;
 Tue, 02 Feb 2016 22:18:02 -0800 (PST)
Received: from localhost ([138.44.250.25])
 by smtp.gmail.com with ESMTPSA id h65sm6813609pfh.43.2016.02.02.22.18.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Feb 2016 22:18:02 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH skeleton] add back in control_bmc
In-Reply-To: <1454344251-25942-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454344251-25942-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454344251-25942-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Wed, 03 Feb 2016 17:17:47 +1100
Message-ID: <874mdqiagk.fsf@gamma.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
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
X-List-Received-Date: Wed, 03 Feb 2016 06:18:06 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

OpenBMC Patches <openbmc-patches@stwcx.xyz> writes:

> From: Norman James <njames@us.ibm.com>
>
> ---
>  Makefile | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index b94d275..65787ff 100755
> --- a/Makefile
> +++ b/Makefile
> @@ -22,7 +22,7 @@ LIBS=3D$(shell pkg-config --libs gio-unix-2.0 glib-2.0)=
 -Llib -lopenbmc_intf
>  %.o: objects/pflash/libflash/%.c
>  	$(CC) -c -o obj/$@ $< $(CFLAGS) $(INCLUDES)
>=20=20
> -all: setup libopenbmc_intf power_control led_controller button_power but=
ton_reset control_host host_watchdog board_vpd pcie_slot_present flash_bios=
 flasher pflash hwmons_barreleye
> +all: setup libopenbmc_intf power_control led_controller button_power but=
ton_reset control_host host_watchdog board_vpd pcie_slot_present flash_bios=
 flasher pflash hwmons_barreleye control_bmc
>=20=20
>  setup:=20
>  	mkdir -p obj lib
> @@ -73,3 +73,6 @@ pflash:  $(OBJS2) pflash.o
>  hwmons_barreleye: hwmons_barreleye.o object_mapper.o libopenbmc_intf
>  	$(CC) -o bin/$@.exe obj/hwmons_barreleye.o obj/object_mapper.o  $(LDFLA=
GS) $(LIBS)
>=20=20
> +control_bmc: control_bmc_obj.o libopenbmc_intf
It took me a while to convince myself why there's a requirement for
libopenbmc_intf, but I see that it's included in LIBS.

I feel like there must be a cleaner way, but I'm at least happy that
it's correct now.

Regards,
Daniel Axtens
> +	$(CC) -o bin/$@.exe obj/control_bmc_obj.o $(LDFLAGS) $(LIBS)
> +
> --=20
> 2.6.4
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJWsZuLAAoJEPC3R3P2I92F9YIP/2F0KMKxU5YWdcBxKDxTxh93
rWU53VVW+4Wb83PRlGH9zlUrrOLjy5lzp8M4JUHEKXMsQ8CS8fOdvexk1A6SxrB5
Dq5/9WNHSQntAKxIA0/dav+2rUxmudSkLQ2SGeqbfnxs0OBaP+AfTdm/DeJxeDe6
ayRocKN6DrOTBmC0voqddMmWqYlYq+V3dy9w1E92MNAkiOHPfOw1g5V+FHiVkWll
paCBum/CXK+nw6W9n+OEkys/KkJwYUZuPbQ9H0JDgX6ET/j67qvsiVvKtEtiK2DD
xwgZYmWTyDqWOr6NTHn13Q+p6U47r4UIN83+G6TJaCJeViCur6VOojgzByeE+37N
QEcpKBMG4GzldI88Ekv6TEsQkCOP8Ea1PWqnHUXx2GE6QCJD5um3xDbYAjZ9O0Np
1TdGBFWVc5Vcdp64HFckSHCRCJn37iVEfI0YQVsJ0xc/ZZ1HZl7edmO7cUWkOK9w
BMK/bbsS5yPaRpz4CWKsa+WBlzgdkQemI+/67aC/UF14C6eDHv5TtjMr1ExFgjM0
RWwAoHri3ExejfaziJDuJv39l/NTS8sOlz0rHCIK5rOO7jPTupo1jnBEgm4UCm3U
8LlFzYwrxKvVz75m07NQ09s1ZrZHgY+SBlpMkPD4k1d95JQG/JRX/K+sWNjZum7B
nocWfNjro7OtM01wNwI/
=ID4o
-----END PGP SIGNATURE-----
--=-=-=--
