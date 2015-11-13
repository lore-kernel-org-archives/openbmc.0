Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id C82391A0AC6
 for <openbmc@lists.ozlabs.org>; Sat, 14 Nov 2015 03:50:55 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_738BCEF7-AD73-4CFF-8B6B-7876C9F1BE81"
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.5\))
Subject: Re: [PATCH phosphor-rest-server] Add self-signed cert
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <B642E366-FA36-4B50-A2D6-1B9CF83456B9@fuzziesquirrel.com>
Date: Fri, 13 Nov 2015 11:50:50 -0500
Cc: OpenBMC Patches <openbmc@lists.ozlabs.org>
Message-Id: <4B455CAA-B080-45E5-85B1-4EAB67A2ED20@fuzziesquirrel.com>
References: <1447427425-3614-1-git-send-email-openbmc-patches@stwcx.xyz>
 <20151113164259.GC21764@asimov.pw-on-the.net>
 <B642E366-FA36-4B50-A2D6-1B9CF83456B9@fuzziesquirrel.com>
To: Patrick Williams <patrick@stwcx.xyz>
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
X-List-Received-Date: Fri, 13 Nov 2015 16:50:57 -0000


--Apple-Mail=_738BCEF7-AD73-4CFF-8B6B-7876C9F1BE81
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

I just opened issue =
https://github.com/openbmc/phosphor-rest-server/issues/5 =
<https://github.com/openbmc/phosphor-rest-server/issues/5>
to track that.

Can we settle for this in the short term?

> On Nov 13, 2015, at 11:44 AM, Brad Bishop =
<bradleyb@fuzziesquirrel.com> wrote:
>=20
> At the moment we don=E2=80=99t have any cert at all.  Baby steps...
>=20
>> On Nov 13, 2015, at 11:42 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>>=20
>> On Fri, Nov 13, 2015 at 10:10:24AM -0500, OpenBMC Patches wrote:
>>> Eventually will be running with SSL.
>>>=20
>>> https://github.com/openbmc/phosphor-rest-server/pull/4
>>>=20
>>> Brad Bishop (1):
>>> Add self-signed cert
>>>=20
>>> cert.pem | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
>>=20
>> Why aren't we generating a new self-signed certificate on the machine
>> instead of including a global one here in the package?  It seems like =
at
>> a minimum we should generate a new one on each build.
>>=20
>>> setup.py |  6 ++++--
>>> 2 files changed, 52 insertions(+), 2 deletions(-)
>>> create mode 100644 cert.pem
>>>=20
>>> --=20
>>> 2.6.3
>>>=20
>>>=20
>>> _______________________________________________
>>> openbmc mailing list
>>> openbmc@lists.ozlabs.org
>>> https://lists.ozlabs.org/listinfo/openbmc
>>=20
>> --=20
>> Patrick Williams
>> _______________________________________________
>> openbmc mailing list
>> openbmc@lists.ozlabs.org
>> https://lists.ozlabs.org/listinfo/openbmc
>=20


--Apple-Mail=_738BCEF7-AD73-4CFF-8B6B-7876C9F1BE81
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">I just opened issue&nbsp;<a =
href=3D"https://github.com/openbmc/phosphor-rest-server/issues/5" =
class=3D"">https://github.com/openbmc/phosphor-rest-server/issues/5</a></d=
iv><div class=3D"">to track that.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Can we settle for this in the short =
term?</div><div class=3D""><br class=3D""></div><div><blockquote =
type=3D"cite" class=3D""><div class=3D"">On Nov 13, 2015, at 11:44 AM, =
Brad Bishop &lt;<a href=3D"mailto:bradleyb@fuzziesquirrel.com" =
class=3D"">bradleyb@fuzziesquirrel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">At =
the moment we don=E2=80=99t have any cert at all. &nbsp;Baby steps...<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">On Nov =
13, 2015, at 11:42 AM, Patrick Williams &lt;<a =
href=3D"mailto:patrick@stwcx.xyz" class=3D"">patrick@stwcx.xyz</a>&gt; =
wrote:<br class=3D""><br class=3D"">On Fri, Nov 13, 2015 at 10:10:24AM =
-0500, OpenBMC Patches wrote:<br class=3D""><blockquote type=3D"cite" =
class=3D"">Eventually will be running with SSL.<br class=3D""><br =
class=3D""><a =
href=3D"https://github.com/openbmc/phosphor-rest-server/pull/4" =
class=3D"">https://github.com/openbmc/phosphor-rest-server/pull/4</a><br =
class=3D""><br class=3D"">Brad Bishop (1):<br class=3D""> Add =
self-signed cert<br class=3D""><br class=3D"">cert.pem | 48 =
++++++++++++++++++++++++++++++++++++++++++++++++<br =
class=3D""></blockquote><br class=3D"">Why aren't we generating a new =
self-signed certificate on the machine<br class=3D"">instead of =
including a global one here in the package? &nbsp;It seems like at<br =
class=3D"">a minimum we should generate a new one on each build.<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">setup.py =
| &nbsp;6 ++++--<br class=3D"">2 files changed, 52 insertions(+), 2 =
deletions(-)<br class=3D"">create mode 100644 cert.pem<br class=3D""><br =
class=3D"">-- <br class=3D"">2.6.3<br class=3D""><br class=3D""><br =
class=3D"">_______________________________________________<br =
class=3D"">openbmc mailing list<br class=3D""><a =
href=3D"mailto:openbmc@lists.ozlabs.org" =
class=3D"">openbmc@lists.ozlabs.org</a><br =
class=3D"">https://lists.ozlabs.org/listinfo/openbmc<br =
class=3D""></blockquote><br class=3D"">-- <br class=3D"">Patrick =
Williams<br class=3D"">_______________________________________________<br =
class=3D"">openbmc mailing list<br class=3D""><a =
href=3D"mailto:openbmc@lists.ozlabs.org" =
class=3D"">openbmc@lists.ozlabs.org</a><br =
class=3D"">https://lists.ozlabs.org/listinfo/openbmc<br =
class=3D""></blockquote><br class=3D""></div></div></blockquote></div><br =
class=3D""></body></html>=

--Apple-Mail=_738BCEF7-AD73-4CFF-8B6B-7876C9F1BE81--
