Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3t0mdh3pJCzDvbS
 for <openbmc@lists.ozlabs.org>; Sat, 22 Oct 2016 00:25:44 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1477056334527746.5546910433213;
 Fri, 21 Oct 2016 06:25:34 -0700 (PDT)
Date: Fri, 21 Oct 2016 08:25:33 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Cc: openbmc@lists.ozlabs.org
Subject: Re: RFC for enablement of slpd on openbmc
Message-ID: <20161021132533.GI32710@heinlein.lan>
References: <5807B226.8090400@linux.vnet.ibm.com>
 <20161019213222.GG32710@heinlein.lan>
 <5808CCD4.301@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RUqJLqMNe5u4kDWT"
Content-Disposition: inline
In-Reply-To: <5808CCD4.301@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Fri, 21 Oct 2016 13:25:45 -0000


--RUqJLqMNe5u4kDWT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 07:25:32PM +0530, Ratan Gupta wrote:
> > What is the anticipated size footprint of using openSLP?  The RFC
> > doesn't seem that significant, so if we do not need the directory aspect
> > might it be more beneficial to write a small daemon ourself to give SLP
> > responses rather than trying to mold openSLP to fit our needs?
>     runtime foot print TOP Command shows
>     214     1 daemon   S *3620*   3%   0% slpd -l /tmp/slpd.log  >>>3.5K
>     file size which will take in flash
>     slpd:- 100.4K
>     libslp:-69.7K

Not horrible then.

> > I'm certainly not advocating avoiding using existing open source.  But,
> > with there not being an update to openSLP since 2013 and all the aspects
> > we are going to have to work around below, I'm wondering on the benefit.
>    I think we are not doing any workaround here,It is slp (as per the=20
> RFC)which expects
>    IP in their reg url as the slp needs ip in the reg url,we are=20
> catering that need via de

What I mean by a "workaround" is that for localhost reasons it would be
much more convenient to have the daemon do this work of automatically
updating the URL when the IP changes.  The non-local IP case isn't
especially interesting for the BMC.=20

> > Do we need to ensure the application is running (or available to run via
> > socket activation) before we do the registration?  If the application is
> > being restarted should we remove the registration and add it back after
> > it comes back?
> I believe that is not needed as the application(SA) would be dependent=20
> on the conf
>       and out policy suggest that network services should restart always=
=20
> so it would be unnecessary
>       to do reg and unreg

We currently do it this way for Avahi so I am fine doing the same for
SLP.  Someone ambitious could enhance this aspect in the future.

> > We also can then keep off of something in systemd / networkd to run
> > 'slp-register ip-change' whenever the IP changes.  This could either
> > restart *-slp-register.service or it could extract all of the SLP
> > registrations and update them with new IP addresses.  Putting all of the
> > *-slp-register.service into a 'target' might make restarting them very
> > simple.
> >
> > With this approach we do not need a long running application.
> I agree but do we really need to dereg and reg in the case when the=20
> service is going down as.
>      Our service policy is restart always whenever the network service=20
> goes down. so service would be down for a moment
>      Long running application i was asking for the IP change event,I am=
=20
> not aware if systemd-networkd send some event
>      whenever the ip change occurs.

Correct.  I don't feel it is needed now.

> >> 2) Application(new DBUS app) will register the configured services to
> >> the slpd on startup.
> > I am not understanding what the 'dbus app' aspect of this would be.
> > What would be the dbus interfaces?
>    I thought of if some other app(netman.py) wants to do the reg and=20
> unreg. so thought of exposing the
>        Register Service
>        unregister Service
>        Raising the DBUS signal in case of IP change.

I don't think we need to dynamically do these, other than the IP change.
We can handle that through a service restart rather than a long running
dbus process for an infrequent operation?

--=20
Patrick Williams

--RUqJLqMNe5u4kDWT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYChdNAAoJEKsDR8wtAMEZEwEP/j4Ija+nbUTC14lhcU5SH0L6
3w+Ud/ptXsCZqxkF/LrAhEA/89ahMvuZNloK7Dw6r4chjUJEkh2q1lfazhhD77Mv
+WpbX769J3GLf1Lc/F0xYSRbMaD0ABvIbdiTajPlRtDlWN9vk0MWsWdWv9nz0/JJ
yoLgi/4KTeQcJKzBKf9Ih6+QQo4pGWKQjtLKfVDIkZVCduwnAEJ5QaR3RIGVOWoJ
m91EiFSI35TMg+XTUBIfyesTaUTv+WFKcW3uwDN7QUsq4a+2GdWnVeeYeaPOUJMl
YNF93ZpIIyS9TKdRID4DoI17KT/Y1wH8GevLDiwzF+kbcOhqbAlCdcFxUaUZQSLl
b3rT1gKFF8NC0N8QhhfFZ6dwaG+DTzTf/INFuWHKTYHq2DHgvLptUrm3MUS15x7O
OtLs2BHqjnHmP4ukH81Y8YNPtYab+yuu1pX5TlFa36JYYOtaJxzehlsRaphGEQll
u0+JNI90r9Rc26lBos11KwB58uHmcVQUOkxao41o2gJHC2LZ4lRgluDy40BTCtBH
oypKMVmXESuesVK/q9nhnzBaFwLDy2FQAvau/tS+wOrNdN0qhCLE57qJOgpK6N6y
AHmHxReAE7/RCieHL8qfSmeAFmHy4d3CrCHq6oBhHiZTYpde8eS4i8wAG0VYAAOh
kNyOD2TkRIRzNVnRMzOi
=0nFD
-----END PGP SIGNATURE-----

--RUqJLqMNe5u4kDWT--
