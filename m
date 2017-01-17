Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3v2b9h6zGXzDqSB
 for <openbmc@lists.ozlabs.org>; Tue, 17 Jan 2017 14:26:32 +1100 (AEDT)
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236]) by mx.zohomail.com
 with SMTPS id 1484623587291937.1477987953411;
 Mon, 16 Jan 2017 19:26:27 -0800 (PST)
Date: Mon, 16 Jan 2017 21:26:25 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Slack-like / IRC-alternative for #openbmc
Message-ID: <20170117032625.GA2370@heinlein.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
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
X-List-Received-Date: Tue, 17 Jan 2017 03:26:33 -0000


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I recently came across an open-source (and free) Slack / IRC alternative
called 'riot.im' (https://riot.im).  The underlying protocol
(matrix.org) implements bridging between the native matrix protocol and
IRC, so we get free mirroring between the two.

I set up a channel in matrix (openbmc, obviously) and set up the bridge to
the Freenode IRC channel.  If you see users with a '[m]' suffix, this is
their matrix/riot account.

Advantages of riot.im:

    * You can see the log of the chat room to read back on what happened
      while you were disconnected.

    * Much better web-client than the Freenode one; it looks very similar
      to Slack.  The client is also "easier" than an IRC client for
      the more casual users.  (Not everyone likes a command-line IRC
      client with a IRC bouncer like ZNC, I hear.)

    * Mobile clients for Android and iOS, with notifications.

    * Allows pictures and documents.  These are also sent to IRC as a link.

Feel free to try it out in addition to or instead of IRC.

--=20
Patrick Williams

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYfY7eAAoJEKsDR8wtAMEZa58P/i9S1oDlMj0yt9ErlaaZDkfj
piHl13S8BhSKL/IGeaXYDq5weJmm/b1H6oNIUAB69slEoW2y7sUAoz7CEkoXRanW
mNUniaMTzLPE7jHmbXG/E8gKOeAyShq/UEiG8Rv3tJUcQBEedAN6Wu1UGal19C9w
afIgCZ04D/iFLbVJKG5lW5YtASX+/AWg7I8TX8rZ1pLOFYowPW6AuGyrAtlsul0d
o6oZpg1HPIxIv334RrPw5uNBo9VXyHnazEIPqTZPo3WmZ/qtV/+TGFrniKBRbfxt
a4WD8bFNMpSt9jsBq5PjSJkTMDa7lANM7Uyv5Xy0FRqgS64H3514R5rpiBN/wF8Q
pp2s7OBJVUzxHjTetyIPjRVWbaJrmCfvsA4J5mgJOw8ZElykyIYow8zdltOw2RN4
B0QPHUNRjFjOIeUyX8vJsWzTc3KM7jnM8ka+aU8PbNoArT2fLuvDZOvq1C1GeaEl
0HANbcWxZtVgYhwl7AEpisWV8BAOarZoqAs/t2vJU92XtQnQFHOtARqgJNm/AQu4
iTs48aAS4vB99161WSyR1je9XGrbc1B0kFCQ4v9e+Bg0YdAW0yJ93fMihiWAGrL7
4yEpv0eH+DMCPbRjOTEryW2H0V93Mp1AJ4KoMD6ROhElSxbZU3ObzyPrkUl8WVy2
Ja99h8Bv3WUknMf62OA7
=zz0e
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
