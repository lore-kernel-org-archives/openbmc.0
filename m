Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3sbsRh3B40zDq5f
 for <openbmc@lists.ozlabs.org>; Sat, 17 Sep 2016 22:49:35 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1474116566998180.73735477804917;
 Sat, 17 Sep 2016 05:49:26 -0700 (PDT)
Date: Sat, 17 Sep 2016 07:49:19 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Logging utilities.
Message-ID: <20160917124919.GA11301@heinlein.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
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
X-List-Received-Date: Sat, 17 Sep 2016 12:49:37 -0000


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

There is a commit on Gerrit where some discussion was requested on the
libraries we plan to use for logging:
    https://gerrit.openbmc-project.xyz/#/c/53/
The suggestion was made that we consider google/glog as a logging
library.

Our intention with the program logging is to heavily leverage systemd's
journal methods both for original program logging but also for later
programmatic extraction on errors.  Adriana is working on the second
part and will have some proof of concepts to share soon.

Left to their own devices, two different programmers might create two
logging events such as:
    ERROR "Failed to open device %s, %s", device, strerror(errno)
    ERROR "fopen on %s failed: %d", device, errno

Notice in this case, not only is the English different but the content
itself is different and impossible to parse out if we want to do
something like automatically transpose "device" into a potentially
failing FRU.  The journald approach is that you do not put content in
English but you use meta-data tags to represent it.

    LEVEL=3DERROR, MESSAGE=3D"Failed to open", FILE=3D"%s", device,
    ERRNO=3D"%d", errno

Now we have a message that humans can read ("Failed to open
FILE=3Ddevice") and one that computers can still interpret.  To take this
a step further, consider adding another meta-data tag:
    ERROR_EVENT=3D"xyz.openbmc-project.Error.Device-Not-Found"

We can now codify behavior, in a data format customizable per-system if
needed, such as:
    on xyz.openbmc-project.Error.Device-Not-Found:
        [Device, AccessType] =3D parse-device-string(metadata.DEVICE)
        Parts =3D devices-on-bus(BMC, Device, AccessType)
        add-callout(Parts, High)
        add-callout("Error.Device-Configuration", Low)

Effectively, we separate the error identification from the error policy.
There are a few major advantages of this:
    1. Historically we have found that well over 50% of the code in this
       environment ends up being dealing with errors, which makes the
       code very difficult to understand and maintain.  By separating
       the policy, we end up with something that is much more readable.
    2. Different systems end up with policy quirks that tend to litter
       the code.  "On this system i2c bus 3 goes through this extra
       riser card and the connector ends up oxidizing faster than we
       expected, so put that riser as the highest priority for
       replacement."  We can now put this policy into a system-specific
       enhancement file rather than --enable-firestone and #if
       CONFIG_FIRESTONE littering all the packages.

Now, back to the logging API, what Adriana delivered aligns very well
with these metadata and error concepts because it was designed with
these thoughts in mind (which, I know, we could have done a better job of
communicating).  We enforce, at compile-time, that "messages" are static
English statements and dynamic data is all tagged through the "entry"
mechanism.  Down the line we will be able to further enforce, again at
compile time, that log(error(xyz.openbmc-project.Device-Not-Found)...)
must contain {entry(DEVICE), entry(ERRNO)} so that the program fails to
compile if the required data, per the error definition, were not given.

I don't see an easy way to leverage google/glog to include these
concepts, other than simply having the logging utilities Adriana
delivered use google/glog instead of systemd_journal.  At that point we
are losing the mind-share(?) associated with using glog in the first
place.

Glog seems to be primarily oriented towards a logging infrastructure=20
for a stand-alone application.  The default behavior of it is to create
a log file in /tmp per process.  Due to the nature of our project, being
a collection of interacting products, debug is often going to require
aggregation of logging across the system and this is where journald
would be needed as the back-end.  As Rick mentioned in the above review,=20
glog doesn't currently support systemd as a back-end but that is likely
trivial to add (or maybe available as an unreleased patch already).  It
does seem like a significant code path to introduce simply as a way to
get from a log statement to journald, when what Adriana delivered
compiles directly to a single journald call.

Glog also uses C++ iostream-style << operators.  I made a simple
hello-world application using it and there ends up being a local object
constructed to contain the buffer, a << operator call to insert a string
into the buffer, and a destructor call to emit the log entry.  There is
4 function calls involved at a minimum for each log entry, plus an
additional function call per-element.  So, in addition to the
performance implications of whatever glog is doing internally, I have
concerns about the code size impacts to using Glog due to the way the
API is structured and implemented.

In summary, I do not see an advantage to using glog over direct
journald calls, and would prefer we incorporate something derived from
what Adriana has proposed, for the following reasons:
    1. The proposed API has syntactic handling for concepts we want in
       our error-event design that glog does not.
        a. glog could be inserted under phosphor::logging at any point
           in the future without any code change to applications that
           use phosphor::logging.
    2. Glog has performance and size implications, over direct journald
       calls, without much in the way of added value.

There are a number of macros that Glog provides to simplify log
interaction:
        LOG_IF(condition) << entry
    rather than
        if (condition) { LOG << entry; }
    (and many more)

It does seem like a concept we could enhance the phosphor::logging
interfaces with if we find that this makes the code more concise.  I
would be interested to hear some of the more widely used macros and see
those enhancements proposed in Gerrit.

--=20
Patrick Williams

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX3TvPAAoJEKsDR8wtAMEZqw8P/2WZ3YK4T67ZJcym+uBxdDRo
aU372qf7ZeoXNh2bp/q+eRhtSPwILRyRe7FMwbJClf1fMNBfY5uNgkjn6pvLsj3c
zYS7PegXzduaCHlApWFWsSrow+IW3LIkDW0fNxX1beBBxkAt5nDr4kxyI2HUyhZ/
iHb3kxG374+6y0QMWl4lg3to3P/Bg7q0TTyMDzjkbqRY1dkU+H9/oPxyI3kQXwQP
tVKMHHWFUB5PD5qO6YurHcmCQozu7+rTlXJ9jWF0pXUnIHeBWK11rFcPiBq7bI+b
hdPhCgVLfLYONd5epHCNQbjEX+lx1OLl8BVJ0A4XU7G0+XSps6cflhu5JAsDLZnV
rxjXky53zmaMXzlNQ1Qql0fkhVnC4pQ0hgHWpD4KjSdU6UShScOeqdiAD7bfZPSn
nCdHLy0vigbca0B7Xa27rZrzvBBtAuMDErBwJn3n9Nr+pMRtneI2TbdK1vVY0LR3
B4mBO465kpMNulFEZc/2DEWDtpJxzUVA2Cfe3/BU1PhE9YL/4p3mqP7eRWzdfyvI
Ja+ijQiGxtEfe0+nshgk0yzeHbNSqzrTSj0BycaWkjcZ8xJzPTB5/l/aabOUDIn4
Es642Q0F7DW9wwyi+lBPd3IYj6bxUF/huUvIpMR7PgRf+NzwFy0uegiZ3tOasLK3
Dn+Yr6XJo9kN1O9JEfLM
=wF1R
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--
