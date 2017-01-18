Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v3V9G3JH7zDqJ5
 for <openbmc@lists.ozlabs.org>; Thu, 19 Jan 2017 01:44:18 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 148475065037745.59884777996456;
 Wed, 18 Jan 2017 06:44:10 -0800 (PST)
Date: Wed, 18 Jan 2017 08:44:08 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Mine <mine260309@gmail.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: RFC: new design of phosphor-time-manager on sdbusplus
Message-ID: <20170118144408.GA5120@heinlein.lan>
References: <CAARXrtkPMixp9M0SYyaeP4_j83mRRXNG1O2Tf24rL5OH6CbJvg@mail.gmail.com>
 <20170116194447.d3yzsldsu3qsl5sz@asimov>
 <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Content-Disposition: inline
In-Reply-To: <CAARXrtnHD0s=dMKJwy_XqJ==cpamDiVPn8c4K=+ZPso1d0gSBg@mail.gmail.com>
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
X-List-Received-Date: Wed, 18 Jan 2017 14:44:19 -0000


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2017 at 03:51:39PM +0800, Mine wrote:
> On Tue, Jan 17, 2017 at 3:44 AM, Patrick Williams <patrick@stwcx.xyz> wro=
te:
> > On Fri, Jan 13, 2017 at 03:42:50PM +0800, Mine wrote:

> I should be meant to create two "instances" on the bus, eventually it loo=
ks
> something like:
> ```
> xyz.openbmc_project.Time.Manager
>     /xyz/openbmc_project/time/host_epoch
>         org.freedesktop.DBus.Peer
>         org.freedesktop.DBus.Introspectable
>         org.freedesktop.DBus.Properties
>         xyz.openbmc_project.Time.EpochTime
>     /xyz/openbmc_project/time/bmc_epoch
>         org.freedesktop.DBus.Peer
>         org.freedesktop.DBus.Introspectable
>         org.freedesktop.DBus.Properties
>         xyz.openbmc_project.Time.EpochTime

There isn't a reason to name the object path "epoch".  /time/bmc and
/time/host0 is probably more appropriate.

> > > And there will be no =E2=80=9Ccurr_time_mode/owner=E2=80=9D or =E2=80=
=9Crequested_time_mode/owner=E2=80=9D
> > > properties on DBUS.
> >
> > So these are only stored in phosphor-settingsd now or are they also used
> > internally for decisions?  I believe the previous implementation had
> > them exposed more for debug purposes.  Are you going to add them to the
> > journal at least?
>=20
> Yes, the time_mode and time_owner are still stored in
> phosphor-settingsd, and they
> are used internally by phosphor-time-manager, which will register
> callback for the
> settings' change and handled accordingly.
> The difference from the previous implementation is that we do not expose =
these
> settings in time-manager's DBus now.

There are two aspects for consideration here:

    1. The current time manager defers changing the host policies until
       the next boot.  We need to continue this behavior.

    2. If the process restarts we need it to go back into the "current
       state" and not the "requested state".  How do we make this
       happen?  The current implementation might also have a flaw here
       so maybe we log it as an issue for follow up.

> What do you mean by "add them to the journal"?

Use phosphor-logging.

--=20
Patrick Williams

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYf382AAoJEKsDR8wtAMEZWD4P/jXIIVyI4cTb/F5STMxAlb3/
jt21iquMq2tC7neUMHlCa/bSkDwe3jExemskDjUGpb6/SVWlIDAk+bMLDP4einl8
AUMuPbizlPWRzwedFw2RyKnT1B1wgJ3V/V3gGxk/T8w/XtFsetDCMQg1hLrQ0sWW
raq/wQzqOuyH0L4sPscskMNi1nPx45HlTIimaKAHNAq4i2JEw1zQGXN1VLNk70vO
7DSCtnZNmHrRjyab+jqUJKTglP8kWnrysWXVi3oeOj9ala+fht6lf7hEteMojU1C
WeCdpDOs2Z65XUE2XWxlkvhVuZCleIJ73GSJd7WBXpqJQ+5TTsLOk5ju1tWClA4t
g0+gIVEv8u+7Ys1cxaQV6oJStySmLVYykULE2paPy1hAi9KkUAVTVvL7ZgxIUWn4
OyVogOcUc3Swo8Ic+M8meHs2TVo4jLLHZ4v7ETtw9UwwrlGNbh/zo8vEnjbbLdCa
7FS3NgELU8sQwbx2sqi1VD6rKUn/snvd3UiSBo5r7cHzNg8vjhhtJ4pn3cTKKghf
WAsV/wAHYAtwe7wGriqurBegEO07hWaPPqRjKZ0bqfsZL9n7W/agTw6rEKckvNVs
yIEGHlfWjQoRHOr0EWaUHSmhlV0xGyHC/i/alAwCGBvPidQucJL77iLsh6HVF514
PdaH45uZt2Lze+TGvjND
=0Vpp
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
