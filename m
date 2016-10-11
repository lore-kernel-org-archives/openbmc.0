Return-Path: <chris@distroguy.com>
X-Greylist: delayed 521 seconds by postgrey-1.36 at bilbo;
 Tue, 11 Oct 2016 12:44:58 AEDT
Received: from mx-out02.mykolab.com (mx.kolabnow.com [95.128.36.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3stKYk1X0MzDrSF
 for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2016 12:44:58 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at kolabnow.com
X-Spam-Flag: NO
X-Spam-Score: -2.9
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 tagged_above=-10 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9] autolearn=ham
Received: from mx03.mykolab.com (mx03.mykolab.com [10.20.7.101])
 by mx-out02.mykolab.com (Postfix) with ESMTPS id 8595261974;
 Tue, 11 Oct 2016 03:36:10 +0200 (CEST)
Date: Tue, 11 Oct 2016 12:36:03 +1100
From: Chris Smart <chris@distroguy.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Andrew Geissler <geissonator@gmail.com>,
 Patrick Williams <patrick@stwcx.xyz>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Subject: Re: openpower.xyz updates
Message-ID: <20161011013601.GA19444@distroguy.com>
References: <CACPK8XfQPDg0H_aNKmZOje7pPDRE9sJsD-epqAB8uW2X6SrrDg@mail.gmail.com>
 <CALLMt=rbR1usfKPt9G8kdUa2RaqRaaVEG3rV62wSBjaM59qi6Q@mail.gmail.com>
 <CACPK8Xcn=s3NAnVNOYBXwHrnfYPT7xicH-TTXTb50TJU6OHHrA@mail.gmail.com>
 <20160930013816.GC7390@heinlein.lan>
 <CACPK8Xd3vP0E14-QSnpKxcLYdnaf=eqZb3hvfm26QCEZCA3aiA@mail.gmail.com>
 <20160930131252.GD7390@heinlein.lan>
 <CALLMt=o-pdSefwGK9rSyoW1+6UzMspzkvQmSnZJrz9h3G89W5w@mail.gmail.com>
 <1476143058.16733.10.camel@aj.id.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline
In-Reply-To: <1476143058.16733.10.camel@aj.id.au>
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
X-List-Received-Date: Tue, 11 Oct 2016 01:44:58 -0000


--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 11, 2016 at 10:14:18AM +1030, Andrew Jeffery wrote:
>On Mon, 2016-10-10 at 11:09 -0500, Andrew Geissler wrote:
>> I noticed our gerrit trigger job to verify userid's was broken again
>> this morning.=A0=A0Looks like the trouble plugin (Git Client Plugin) was
>> upgraded again to the latest version.=A0=A0Anyone out there know why/who
>> did it?=A0=A0I'm going to put us back to 1.19.7 per my earlier comments.
>
>Joel and Chris Smart were looking at this yesterday. A job broke:
>
>https://openpower.xyz/job/openpower-op-build/184/console
>
>According to Chris it broke because of:
>
>https://bugs.eclipse.org/bugs/show_bug.cgi?id=3D428039
>
>    15:58 < csmart> joel, basically release() was replaced with close()
>    and so any plugin that uses git needs to be updated
>
>Looks like we're stuck between a rock and a hard place.
>

Yep, I updated the git client plugin because openpower build couldn't
perform any git operations.

I didn't expect that to affect any comms with other Jenkins instances
though, that is strange. Why does the gerrit userid plugin rely on on
git client? Do you have a log or backtrace? Might help to try and track
it down.

-c

>Cheers,
>
>Andrew
>
>>
>> There's no fix per-se for this, jenkins is always a bit hit or miss
>> with it's latest LTS version working with the latest plugins.=A0=A0Best
>> thing we can do is when we schedule our next jenkins LTS upgrade, to
>> try all the latest plugins again.
>>
>> Andrew
>>
>> On Fri, Sep 30, 2016 at 8:12 AM, Patrick Williams <patrick@stwcx.xyz> wr=
ote:
>> >
>> > On Fri, Sep 30, 2016 at 11:16:08AM +0930, Joel Stanley wrote:
>> > >
>> > > Okay. Do we plan to test the individual projects as part of an
>> > > openbmc/openbmc build in the future?
>> > >
>> > Yes.=A0=A0https://github.com/openbmc/openbmc/issues/382
>> >
>> > --
>> > Patrick Williams
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc



--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJX/EH+AAoJEHuZ4jFLkqiYt2IQAJSOTDMtcNMIeKJY6KeK4/SQ
16i601E8ljIJs+cPo4lx1dMZ8H/0kA+fxZIhqzvdVQieDwGxZZMs5iiWPhJh565U
4o1F5LHNSyi4BpDmt3unQVeiOl84oq+bG9YSz5hZpv/8xRtowDzVbiWbsiCeFjtb
xslRw9O3A+KCE4OGSmc1ks3PprEC54uZo/jjob2XCH1ftMch1Vo2fsfJ98zppWWp
2rpMxt49ezCX0yyQEGYTKAWYqkdUJ6Myja/cIaDYnD9IPfv6AwW1EVnvurrsTFAu
0zmZnXNTpsat3246hqlhvyJTDu07LDHZyhDJ7QvvRPGlBnSdiBL4/kVUggiCHWlw
EF8suUUK4/QJ4zL6hSfmIib7+DFOhNeawrHRuwabt+bH0ORDbiZHSSZRbPBtJZXL
EvOiRf5WAieuyoFd3v96hP8fqdmJ6zdAp8XVcSaGWgz9md2eyEGoo2HlB0+0RSMP
N6DlwMw6RjfgJAVo45YnATqG4w27FDo4jpzphDLBe7n6pwoL4ac7eUuLphNH1YFl
Fs6y8b9Rka8edfL16S4jWem8BUkx6aUC44eZrooVquZF8iZ4ZW5O7R/uqvt5nVkT
T3JXD1+okxCssB/yIzYXFuxyttyuMW/y9MirhUdbEdMPNAivlcom3/kno/4t/1Jp
9deT4CWGicwHLZs0QdAj
=1Es+
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
