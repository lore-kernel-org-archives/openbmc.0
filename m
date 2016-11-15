Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tJ56V3CBjzDvhf
 for <openbmc@lists.ozlabs.org>; Tue, 15 Nov 2016 22:40:18 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1479210007140575.8602193120227;
 Tue, 15 Nov 2016 03:40:07 -0800 (PST)
Date: Tue, 15 Nov 2016 05:39:54 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Abhishek Pandit <abhishekpandit@google.com>
Cc: anoo@linux.vnet.ibm.com, openbmc@lists.ozlabs.org,
 Nancy Yuen <yuenn@google.com>
Subject: Re: Refactoring skeleton flash control
Message-ID: <20161115113954.GK15757@heinlein.lan>
References: <CAN61Adc8nt_R47Edj8YYTzwSMqGLB8LSd=ZxE5jeL_sthn=O4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Tv3+oRj6D9L8lW+H"
Content-Disposition: inline
In-Reply-To: <CAN61Adc8nt_R47Edj8YYTzwSMqGLB8LSd=ZxE5jeL_sthn=O4w@mail.gmail.com>
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
X-List-Received-Date: Tue, 15 Nov 2016 11:40:19 -0000


--Tv3+oRj6D9L8lW+H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Abhishek,

On Mon, Nov 14, 2016 at 11:09:30AM -0800, Abhishek Pandit wrote:
> Hey Adriana,
>=20
> I've started with how I think the dbus interface should behave:
> https://gerrit.openbmc-project.xyz/#/c/1166/.

I would like to see some better modeling in place for management of code
levels.  There may be some overlap with what you are proposing, but you
do seem focused on flashing specifically.  Look this over and let me
know what you think, how much overlap there is, and how much you want to
tackle now.  We could do some things like temporarily define the
interface in org.openbmc, to indicate eventual deprecation, but allow
you to continue making progress on the function.

-------------------------

Important use cases (from REST perspective):
    - How does a user identify which levels are installed?  Which levels
      are activated?  Which levels are kept for optional downgrade?
      Which levels are stored on redundant media (ex. dual side flash).
    - How does a user upload new levels?
    - How does a user request a level to be activated?

Interface modeling:
    interface xyz.openbmc_project.Software.Level:
        property - string Name
                 - string Version
                 - enum Persistence { "Temporary", "Persisted" }
                 - enum State { "Loading", "Verified", "Failed", "Available=
" }
    interface xyz.openbmc_project.FilePath:
        < Attached to Software.Level object for images resident on the
          BMC and not in flash modules only. Ex. tmpfs >
        property - string Path

    interface xyz.openbmc_project.Object.Association:
        < Associate Software.Level <-> Inventory.Item >
    interface xyz.openbmc_project.Software.Activation:
        < Attached to Object.Assocation object >
        property - enum Activation { "Ready", "Activating", "Backup",
                                     "Active"
                   enum RequestedActivation { "None", "Backup",=20
                                              "Active" }
                   integer Progress

    interface xyz.openbmc_project.Object.Add:
        Used to 'put' new image via HTTPS.  Need to confirm with Brad.
    interface xyz.openbmc_project.Object.Delete:
        Used to 'delete' images (from filesystem).

Object modeling:
    /xyz/openbmc_project/software:
        Owned by "DownloadManager" which supports Object.Add interface.  Th=
is
        can be called by REST when a user uploads a new level.  Later,
        we could attach additional interfaces here, possibly owned by
        other processes, such as 'Software.DownloadViaTFTP'.

    /xyz/openbmc_project/software/<id>:
        Owned by "DownloadManager" for images which are resident in
        tmpfs and a local filesystem ("Available" images).  Owned by
        "HostUpdater", "BMCUpdater", etc. for images which are resident
        in flash modules ("Active", "Backup").

    /xyz/openbmc_project/software/<id>/imageFor:
        Owned by "...Updater" processes and supports the
        Object.Association and Software.Activation interfaces.

Use case solutions:
    - How does a user identify which levels are installed?
        Enumerate /xyz/openbmc_project/software/
    - ... are activated?
        List /xyz/openbmc_project/software/ , look at Activation state
        on assocations.
    - ... are kept for optional downgrade?
        List /xyz/openbmc_project/software/ , see images "Persisted",
        "Available" and not ("Active" or "Backup").
    - How does a user upload new levels?
        Do a HTTP PUT to /xyz/openbmc_project/software/<id>.
    - How does a user request a level to be activated?
        Set RequestedActivation to "Active", "...Updater" process will
        begin activation.
>=20
> The overall plan for the flash interface in my head:
>=20
>    - REST (or some other) interface receives image + signature to update
>    flash
>       - Gets saved to filesystem and flash control is called
>    - Flash control loads the files into memory and verifies the signature
>       - Reference implementation would probably just be pgp

We have used OpenSSL interfaces for other projects.  I'm not stuck on
that though.

>    - Flash control locks the flash device
>       - This needs some more thought and probably new dbus interfaces;
>       important for host flash

Yeah, could certainly be a new interface for this on the same object as
Software.Activation.

>    - Image written to flash
>    - Lock on flash device released
>    - Signal asserted (Done)

Handled by org.freedesktop.Object.PropertyChanged signal on
"Activation" in my modeling above.

-----------------

This is just what I had floating around in the back of my head of what
we would [eventually] do for code update.  I have some past experience with=
=20
CIM and I believe this conceptually lines up with what CIM and Redfish have
both done.  I'm certainly not fixed on any particular interface, property,
or enumeration names.

--=20
Patrick Williams

--Tv3+oRj6D9L8lW+H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYKvQHAAoJEKsDR8wtAMEZvJ4P/iu4PgpQwI5h6qaW9fUYfctI
BbIWSC1OQFzD6hlW42gvgabrBNg1u2Kh4aq2R6TTzbtzrRV1BFjeAE0PHUEUjj/8
yBQ4Jmv1flWtJo0bpSfjy7ZL93oRnZRCKfss3sdVwLEM+enVDLw0Tvd36ycx9hmE
iqFLe4WQGDWPKdmMp0SlCiCdmi8ESm3Nj/mN4HCxIx/iOR+7UX/wJGUVBfsrA7GB
yqAqjK4LdAfcwh3OJzv2gaVDTu8gEGCvSPMPgYQV985Llqb3pj2XI3tCOmlVjyye
ApzHTRZtWoQdlquvwB2FdzZyLEFDnOjh9Hszmx992qmfHwnbeodVzJt9MCUIHi8O
IqUT3a6eQNPrRUAhkOkEQRXCVJQe3uqfRpwVajdoSGuHbP/6OqFFUt4RkW315qbn
L0yBJXRFclY/zNmY+LV4dCnZbo4tmezU2psfMOPcrRfCEjShHBzPn6gtwcRgyEM0
j0zD+8UaxkgGH1MxYE0oFr9IHjAPfiZv2rM4/AKv6SYKdH0V8QAEEqV0iIk9bNKp
w63OpKeG7VhTSG+0lijTPRJfp5FpDKp1/yda0Jox1N1nfiZGOspewBmA53oN0WOz
LgzdfRg9/bbJaXsQddC6PlpKML5cPHargBmYiE5at6DvRTpfty6GS/tThxV3gHvS
3fMo0DITPS1CDKP+VuBu
=q5Su
-----END PGP SIGNATURE-----

--Tv3+oRj6D9L8lW+H--
