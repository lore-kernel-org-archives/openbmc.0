Return-Path: <patrick@stwcx.xyz>
Received: from sender-of-o51.zoho.com (sender-of-o51.zoho.com [135.84.80.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wKNPq4jNNzDqCd
 for <openbmc@lists.ozlabs.org>; Sat,  6 May 2017 06:13:35 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1494015209219902.5247489687392;
 Fri, 5 May 2017 13:13:29 -0700 (PDT)
Date: Fri, 5 May 2017 15:13:28 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Rick Altherr <raltherr@google.com>
Cc: Nancy Yuen <yuenn@google.com>,
 Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Patrick Venture <venture@google.com>
Subject: Re: phosphor-hwmon bottleneck potential
Message-ID: <20170505201328.GK25937@heinlein.lan>
References: <CAO=notxUh7si0kxbpyA-vK6aJaLQSi5NWCap7SeXDAgUNn8grQ@mail.gmail.com>
 <1493960865.3948.70.camel@fuzziesquirrel.com>
 <20170505163406.GB25937@heinlein.lan>
 <CAPLgG=k3mr01DnqWX5W4oCOQJ3njJCVBSe+EsLkpXCdj2Uwj7A@mail.gmail.com>
 <20170505174341.GE25937@heinlein.lan>
 <CAPLgG=m9S_4X=-Wvc8Uomhh7KBL5tBZn8A0Be9JTLZ=B-u+h5g@mail.gmail.com>
 <20170505180239.GF25937@heinlein.lan>
 <CAPLgG=mXE4qz5PVRFupp3=ogcS4oe0bQfYKaEwesttUhdvb4Xw@mail.gmail.com>
 <CADfYTpGfqgKP-HWg54mXnw7qc0wtPqfE=ZicZrCo_WsOJiQc7g@mail.gmail.com>
 <CAPLgG=mTXTh-Pa_T2y2SxpOis4Y9aWz0shkzz7pH+iyB7BWBFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="8kI7hWEHMS8Z+7/0"
Content-Disposition: inline
In-Reply-To: <CAPLgG=mTXTh-Pa_T2y2SxpOis4Y9aWz0shkzz7pH+iyB7BWBFA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
X-ZohoMailClient: External
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
X-List-Received-Date: Fri, 05 May 2017 20:13:36 -0000


--8kI7hWEHMS8Z+7/0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 05, 2017 at 11:52:15AM -0700, Rick Altherr wrote:
> On Fri, May 5, 2017 at 11:37 AM, Nancy Yuen <yuenn@google.com> wrote:
> > 2. So putting the onus on each application to implement timestamps is
> > better design than having timestamps recorded by a central source, the
> > source that actually is reading from the driver?

> Re #2: timestamps lose value as they shift away from the time of the actu=
al
> measurement.  Ideally, the hardware would timestamp the sample, hwmon wou=
ld
> preserve and provide that timestamp to the userspace.

I'm not seeing the utility, specifically in the context of a fan control
algorithm, for a timestamp to know when the reading occurred having been
described.  I do see a need for it in the context of a "repository of
historical sensor values" such as what we will need to implement the
DCMI interfaces for IPMI.

I don't have any problem with a timestamp being added to the
dbus-objects being presented by phosphor-hwmon.  We do have Timestamp
property on xyz.openbmc_project.Logging.Entry already.  I would suggest
we make a xyz.openbmc_project.Common.Timestamp interface instead and
transition the logging entry server to including it.  The reason being
that I've recently had some questions about the date-time format we are
presenting across REST (ms since 1970 as uint64) as being difficult for
humans; having a Common.Timestamp interface makes it much easier for the
REST server (and later Redfish) to identify "things representing time
that should be converted to date-time format".

There is an issue with having two properties in a single dbus object
being changed at the same time and generating a single signal for it.
The org.freedesktop.DBus.Properties.PropertiesChanged signal only allows
a single interface, which might be an argument against what I wrote in
the previous paragraph.  Also, the sdbusplus-generated bindings do not
currently have a mechanism to indicate multiple properties changing as a
transaction even on a single interface.

If we do add a timestamp we need to be clear on what the expected
behavior of it is.  As we are seeing with this issue there can be some
time between sysfs read-start and read-end.  Also, if we are reading an
external device, like the fan controller on Witherspoon, the value
obtained isn't an instantaneous fan speed but an average over some
hardware-defined interval.  So I think we would need some language such
that "time immediately after sysfs read-end" is a valid representation.

--=20
Patrick Williams

--8kI7hWEHMS8Z+7/0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAlkM3OgACgkQqwNHzC0A
wRl+Fw/8DO7Z2j76l6xx9xqksqIBAu8enmqR6AVoiNvF61av3FqArWnLfgAp+DcM
WgKyXlK8C3+NWHVm3GITjR3aZ0aMCOkt6d+RkeFeUiO672cydrV+XgCA/+Fmv7o+
4D4jHJKeTRoFAJaPIIHSWx0eXQuuzGTiKbYCBD0L0GGmkuOleLksUzDmKuBeOwv9
L11xd9OxalSxKgaPRbSL5Ai+C7WQ175opIIOiH/NRjOi5uT3c91kkvAi11o4sCdt
KgZpH3PNGRwxGs/w2VVQHv9HzGoRImnRq7JrMDlmX50HvbuG3+bqOiTCwaVPhsiT
58sHcr4OEPrGUxk3nLU356Ou3sDe8VqTFzWwCUoxkYcDa7ZT6iJef2OdI5yaX+lC
znDnV+eE0RT6MAXnLlzB7VOys+XIr/K3KvFsHu+O+l+etimFGiKaOBVOpgHzO5JK
+OuqOKXWv8WK4T94TGQrM2nr3LMBEa78vwpCCH8wzY1S2wJsA6GHvs01Xn9/1FUh
opZs9yxXxyBOhMyS4bhjPfoyDiBFwUCt1MDKUXDl/NAPrymHiXKKpNOwQf/wZlWV
ER25M6eD51BT/BJwEft3mdeEvEXvwx6EGoAD9JTLwLI7wdP7PFyPoB7mcEGw4E68
GE5wZYCDLKvf3UX8aqyp/xNi5YCzksK4cYpsShZhCsxRKRMIfCE=
=OSXl
-----END PGP SIGNATURE-----

--8kI7hWEHMS8Z+7/0--
