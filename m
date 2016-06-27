Return-Path: <patrick@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rdjt55tdFzDqmH
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2016 08:15:08 +1000 (AEST)
Received: from localhost (32.97.110.52 [32.97.110.52]) by mx.zohomail.com
 with SMTPS id 1467065703519529.0240851921418;
 Mon, 27 Jun 2016 15:15:03 -0700 (PDT)
Date: Mon, 27 Jun 2016 17:15:01 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Gerrit server migration
Message-ID: <20160627221501.GN20922@asimov.austin.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="jnYfR+Q8IWTs8BNa"
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
X-List-Received-Date: Mon, 27 Jun 2016 22:15:10 -0000


--jnYfR+Q8IWTs8BNa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

All,

The Gerrit server is now ready for use.  All of the repositories except
for the ones listed below are migrated to it.  We therefore no longer
accept pull requests on Github, but instead need commits to go through
Gerrit.

For a reminder, the Gerrit server is at https://gerrit.openbmc-project.xyz
and documentation can be found in this outstanding pull request
https://github.com/openbmc/docs/pull/30 .

The Gerrit server automatically replicates all merged commits back to
Github, so Github is still considered the canonical location for our source.

Not [yet] migrated repositories:
    * Waiting on a few pull requests to be closed.
        * openbmc / openbmc
        * openbmc / skeleton
        * openbmc / phosphor-host-ipmid
        * openbmc / ipmi-fru-parser
        * openbmc / openpower-host-ipmi-oem
        * openbmc / phosphor-rest-server
        * openbmc / openbmc-test-automation
    * To be migrated later this week.
        * openbmc / docs
        * openbmc / openbmc-build-scripts
    * Never to be migrated (use mailing list for commits).
        * openbmc / linux
        * openbmc / ipmitool
        * openbmc / u-boot
        * openbmc / qemu
--
Patrick Williams

--jnYfR+Q8IWTs8BNa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXcaVlAAoJEKsDR8wtAMEZ2KwP/jzuKBaCpBI+mjiQcw32iqna
dyIU4SDEYRlo4VVwBTg1sO248cE+t7vURRaS5FKgQSobhuLgPGwm0qm3ZWHd+Fxm
FdbiNuBevLK3fBo+4vUxlFdl5qdVVKdyPgBRzI3LTOWTSXTOxDBGNysBlSlzNZWj
ZAkKCBt9Nr6h2VOQAfScUrTv99/vPtXbfo//cRBxZH7WEt/JM3IOvvLMeTG/yWet
l15rWZt/HZdHyJ1TDsezwqlT6iMoVdkU21AfSG0CZt/8JsigypeVcuHvD4xp/8E+
pht1fP5Yiyt9XCpyHXi7iZboHHkeFxtR0qeBP2XxVvv8gkDQWIQ4xS48j8W/zNI+
2KQnVej1klHexhCYE0cA4oB006Vh7HaIcCbeqwo4IlwnLqxEH+CJ/uh82O/IX956
v4vtLIilmk1pIvUwnQ2UMUlKehfKH0M1zVLO45xAYAvRqdULElXQcqjqWLTIm7f/
szlVyLy30pbBjWIW8JLXLEFmW7EiCHn6Ttre28Q5xaHxcCqvBNdPVAa+4/jBYBHt
tIJkeqsUhZGxBXoetA9MzdziPAakZv4xlye9n/GViWuYuGQZGw9nzuGDrXAHCui6
J0ZZvn9MCe8ux9Vw2q16xo+cqGpIRVPWimpLUUKgLMCkP/KZcuiRJCoiqzOqgyJf
Ule1ZBAROpee+KNr+L0e
=aIjt
-----END PGP SIGNATURE-----

--jnYfR+Q8IWTs8BNa--
