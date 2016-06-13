Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rT6XC5RQFzDrZJ
 for <openbmc@lists.ozlabs.org>; Tue, 14 Jun 2016 08:14:50 +1000 (AEST)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1465856085194932.5464733077021;
 Mon, 13 Jun 2016 15:14:45 -0700 (PDT)
Date: Mon, 13 Jun 2016 17:14:43 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Migration to Gerrit Server
Message-ID: <20160613221443.GX19968@asimov.austin.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dQ+ozEaLk2y6HH72"
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Mon, 13 Jun 2016 22:14:52 -0000


--dQ+ozEaLk2y6HH72
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I've been working in the background at getting a Gerrit server running
for code review and process control.  To recap, this was the previous
decision:

    * Upstream projects would be reviewed by their upstream process and
      may use the openBMC mailing list (here) for reviews and discussion
      prior to upstream submission.

    * openBMC owned projects should transition away from Github and to
      Gerrit for reviews.

    * The auto-mailer for Github pull-requests will be disabled.

The server address is: https://gerrit.openbmc-project.xyz .  Security
paranoid developers (Stewart) will be happy to know this has a valid SSL
certificate courtesy of letsencrypt.org.

What I'm looking for next is help to enumerate the next-steps in the
roll-out.  A few thoughts to get us going:

    1) We need to update openbmc/docs with instructions on how to use
       Gerrit for contributions.

    2) We need to identify how to do CI on Gerrit.  I see a few
       different flavors of this.
        a) openbmc/openbmc compiles on openpower.xyz's Jenkins.  We
           would need to connect this up to Gerrit.
        b) Some projects currently use Travis-CI.  Is there a way to
           hook Travis-CI up to Gerrit directly, or indirectly via
           Jenkins?
        c) Some projects have no CI.  This should (will) be fixed in the
           near future.  This does raise a sidebar-topic of if Travis-CI
           will be sufficient.

    3) Should we pick a subset of repositories to try this out with?

    4) How do we identify, in Github, which repositories are mailing
       list reviewed and which are Gerrit-reviewed.

Any other thoughts or concerns?

--=20
Patrick Williams

--dQ+ozEaLk2y6HH72
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXXzBTAAoJEKsDR8wtAMEZaLQQAJNTasZZnUKWSoP2Oc9HdRwe
N+zrWWOKGAW3IXkR2dbP2UR0Nntzk0GnSBOxFydsyUo93O4kmOSnYRGrUvlj4oNj
S4lcKMZoWvIsnORhKexcvYXZQUG7hYpyBVolwPYRaUcbKsKxpYV0TUc9Oj8YzjRo
W2qgldL+CGuVmr4X/tfTsB7vrpOZ1a7rx23wtr+EdqB5r3/IgUlGRFa348L89uM+
+c09Brew2D20BsVFp/wOpdyjyyjqSseU6dKnBRbOqgPwgfJEPzf84owwrqsjq+/s
wu+VWltGdEsAIIJ9yIIeZdqWGfVdEufI8W3oJ9zvc4xAHF02z7yQ2G70NekHFRhR
eiYG1R1dJTMPuZ1SExyCPs288hWoL89ucZrXRPpsMK7ORE3Ndd9lfBLI8pEIStZZ
z/TkTnmMChVDTUK4QTl74IJ99/IduKLMN60vyYAqBq4bEzGCTMeXglFbVOIjRCur
zqeA/sZfUcchNN+RqCt/jT5n9/GtaWn4FW592UGA8n6MOF8J/S6aBWcdI9nm5Ylk
ZYcO6YVpg5xlWBZV+VoD60uyLDZkIwO7NJZK0kvvGyjkFW2NU1aR4zPTnZqXHJCz
3ID+m0sYTLUL+BvjLE7ssawjUbes9W+Zi+NlYoj6rbA+RvkK2lb0yziNz42kaV+r
GK6bLNb2VpizPWFT8oOP
=ZkUU
-----END PGP SIGNATURE-----

--dQ+ozEaLk2y6HH72--
