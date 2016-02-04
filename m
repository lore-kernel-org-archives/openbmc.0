Return-Path: <dja@axtens.net>
Received: from mail-pf0-x22e.google.com (mail-pf0-x22e.google.com
 [IPv6:2607:f8b0:400e:c00::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id A65F11A0220
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2016 16:43:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b=g88LcUiz; 
 dkim-atps=neutral
Received: by mail-pf0-x22e.google.com with SMTP id 65so32713477pfd.2
 for <openbmc@lists.ozlabs.org>; Wed, 03 Feb 2016 21:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:subject:in-reply-to:references:user-agent:date:message-id
 :mime-version:content-type;
 bh=KtYDNRTzrApIdEjlEeo2wrHAb6XWp6d/SUdGUuc168g=;
 b=g88LcUizxWtgEwFMeIstCO/cpPQIfH12Grok1rQZGQ4lUlDmxZ/+K+aLGyGsnyrF+P
 Mata2muNwvpj0B7RpMFiIzkdrJwVHRbiu8th6Uq4UIQGP93w8YSw6V1nk0HWsckps/To
 5A3SYqS9hCWTI/FAJNGY0thmg9BnJoil/GNmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:from:to:subject:in-reply-to:references
 :user-agent:date:message-id:mime-version:content-type;
 bh=KtYDNRTzrApIdEjlEeo2wrHAb6XWp6d/SUdGUuc168g=;
 b=LWHbODfTPW3a5CRJJV/RCS7/7LjkzYGPVn+J+efj/3GP64G1s9GG6SNr4IdRHPez7w
 OCRWUBl2+ntrANLC+3RLN1QMecTTy7w/9JeIZSckYuM8Y/SQRg4bN+uGZeTTKyION0Kw
 yeM2y9KgeqRGE33Mv0ZHlekYe4Yz83/PQ/RAt939wWb/x3BOeSAmH33qw7S45fC2BMpM
 SDniM5/rqM7R0d7pqTubnN2KXpEHAfzJgU6WbCuNLog8RIaSQXrYzfriPykbmQqE4Ixm
 QYKVrz3wE8br+YplKi0gczRMMLst1RjbwVwy+7iwwqYbR0uNacvegnhOy1RhiCQeXuKU
 LIdw==
X-Gm-Message-State: AG10YOS9YFL+jdNvJ9B9pFGSSDPu5/WY9wpeojZar51NDyc4EwHnRAYlTHiwBpRwIWV6qw==
X-Received: by 10.66.216.7 with SMTP id om7mr8275437pac.90.1454564597809;
 Wed, 03 Feb 2016 21:43:17 -0800 (PST)
Received: from localhost ([138.44.250.25])
 by smtp.gmail.com with ESMTPSA id tp3sm13749352pac.16.2016.02.03.21.43.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Feb 2016 21:43:17 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-host-ipmid] Add Set MAC address
In-Reply-To: <1454542828-19634-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1454542828-19634-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454542828-19634-2-git-send-email-openbmc-patches@stwcx.xyz>
User-Agent: Notmuch/0.21 (http://notmuchmail.org) Emacs/24.5.1
 (x86_64-pc-linux-gnu)
Date: Thu, 04 Feb 2016 16:43:04 +1100
Message-ID: <8760y5f2tz.fsf@gamma.ozlabs.ibm.com>
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
X-List-Received-Date: Thu, 04 Feb 2016 05:43:23 -0000

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi,

>      {
>          sprintf(new_ipaddr, "%d.%d.%d.%d", reqptr->data[0], reqptr->data=
[1], reqptr->data[2], reqptr->data[3]);
>      }
> +    else if (reqptr->parameter =3D=3D 5) // MAC
Instead of a comment, could we #define or 'const' that 5 =3D=3D MAC?

Regards,
Daniel
> +    {
> +        char                mac[18];
> +        sd_bus_message *reply =3D NULL, *m =3D NULL;
> +        sd_bus_error error =3D SD_BUS_ERROR_NULL;
> +        int r =3D 0;
> +
> +        sprintf(mac, "%x:%x:%x:%x:%x:%x",
> +                reqptr->data[0],
> +                reqptr->data[1],
> +                reqptr->data[2],
> +                reqptr->data[3],
> +                reqptr->data[4],
> +                reqptr->data[5]);
> +
> +        r =3D sd_bus_message_new_method_call(bus,&m,app,obj,ifc,"SetHwAd=
dress");
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to add method object: %s\n", strerro=
r(-r));
> +            return -1;
> +        }
> +        r =3D sd_bus_message_append(m, "s", mac);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to append message data: %s\n", strer=
ror(-r));
> +            return -1;
> +        }
> +        r =3D sd_bus_call(bus, m, 0, &error, &reply);
> +        if (r < 0) {
> +            fprintf(stderr, "Failed to call method: %s\n", strerror(-r));
> +            return -1;
> +        }
> +    }
>      else if (reqptr->parameter =3D=3D 6) // Subnet
>      {
>          sprintf(new_netmask, "%d.%d.%d.%d", reqptr->data[0], reqptr->dat=
a[1], reqptr->data[2], reqptr->data[3]);
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

iQIcBAEBCgAGBQJWsuToAAoJEPC3R3P2I92FIzcQAIF4OWN8A6KUZsJZXOlTLPRb
JJW2du5onLs71wIUvAdFmPED5WaLAnbsb19/RdDAY1Wg7TCuK6G9SZxQcf8mKGUE
XufPnt/80lmPEeGp/2ztMCg7dCMiuwK8a5dCYFYZhBmiFu56pfnqTtGyGCd2sCy0
052ZXciIf5aCRWNpUbfrWwOI28RN/bqJ/0095QpHhLNedeEkbDrV43Ctjd92BY+v
S7xu8LFgtfanqfN6uHYbctqitw9C6kmjDG7wy+rYXQt39RbH2mHFTnUokKxnGSRX
mS2XBjl2Nv19NBrZ8deIatVZRuWXQXplRRFPDHfflCDmwi1LNrVmb2qb5JrYPPIR
eRRcGbrkZzzs9pcMRGX2ytIB3vPIbkXpieumYsy6S0NrA5RDhoz3tJCeF8QM/vR3
UBeayg9BcPtqbtEfAv0u2AY7L5nSTcrQ+Pbxyi2DWheLTELRaQ7knJ4Cp8JsLp3W
cPrL77SRjqLb8VJMIrCTlrAiLRKlG1gyb9+bAK6F1R/8I9t+D2m+1XhcPy7vPCyQ
ZPdUhatFqVJ62DI4T/KdA+OJZayaj7ndB3/p96chiDlUdAfANM05DF54qD1uxOQl
2kA7lHsrjRIWFhlUsaIaxrvSA3LS1JLI7oQRTTR7iYFY7gJ5clYhw580Y0gM4sfd
zV8USTePeQJ2dUL3OLCi
=ZcLB
-----END PGP SIGNATURE-----
--=-=-=--
