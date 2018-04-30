Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=fuzziesquirrel.com
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40ZZVF4ySzzF2Q9
 for <openbmc@lists.ozlabs.org>; Tue,  1 May 2018 05:34:13 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 9739DE9D51;
 Mon, 30 Apr 2018 15:34:08 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: reference platforms?
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <FA93D326-6F39-4E5F-8A51-1ED819BFF0F1@fb.com>
Date: Mon, 30 Apr 2018 15:34:08 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BC2069D9-DAC3-4EEB-9A35-D36F68947E06@fuzziesquirrel.com>
References: <1A67395A-9FF6-4DC2-AD43-2C80308F6608@fuzziesquirrel.com>
 <4723874F-4115-4E9E-90D5-4DC2C52EF326@fb.com>
 <650906BF-A79F-467F-B9C7-4CD3C9730E19@fuzziesquirrel.com>
 <FA93D326-6F39-4E5F-8A51-1ED819BFF0F1@fb.com>
To: Sai Dasari <sdasari@fb.com>
X-Mailer: Apple Mail (2.3273)
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2018 19:34:14 -0000

Hey Sai

Sorry it has taken me so long to respond.  I hope others will weigh in
with their ideas on this topic.

> On Apr 13, 2018, at 7:55 PM, Sai Dasari <sdasari@fb.com> wrote:
>=20
> Your proposed changes are good from scaling the development. My =
original question was from the end-user point of view who acquires bunch =
of OCP machines and tries to find a way to build OpenBMC for those =
machines. I was wondering if we can point those end-users to one unified =
repo @ "github.com/openbmc" and allow them to build OpenBMC binary for =
that platform. The other option would be for them to let them figure out =
the repo for that machine e.g. "github.com/<awesome-company>". I think =
any of these methods will work in practice.=20

Yep, I understand the goal.  I don=E2=80=99t have any great ideas off =
the top
of my head but I don=E2=80=99t think it should be too hard to come up =
with a
solution that meets both needs - a scalable development process _and_
a one-stop-shop for OCP platform builders (or others).

>=20
>> Put another way, we _could_ build the answer to the question into the
>> core of the project, but why (and at what cost to the project=E2=80=99s=
 ability
>> to scale)?  Someone could also just host a list somewhere, or maybe a
>> layer-index like OE has?
>>=20
>>> Does each openbmc adopter encouraged to maintains independent github =
repo with recipes needed to bring in the openbmc code and build for =
their supported machines?=20
>>=20
>>    I think so.  The specifics of what the adopter does/maintains are =
up to
>>    the adopter.  What are some pros/cons of a model like that?  This =
is what
>>    most everyone is doing already.  They fork some part of the =
project (or
>>    all of it), build on it (mostly in a machine layer?  hopefully?)  =
and then
>>    maybe/maybe not contribute something of what they did back to the =
upstream
>>    project.  It is my guess that this is the usual way in which =
product
>>    development teams use FLOSS.
> I am sure FLOSS allows forks, but for the benefit of community, it =
would be good to encourage contribution to the upstream openbmc repo. =
While it helps to scale to separate machine layer repo outside of =
upstream, I have concern that the adopter's focus would shift away from =
upstream to that external repo.  This might have side-effect of =
duplicate work in independent repos (might have good intention of =
upstreaming later), as opposed to ideal work flow (in my mind) of =
{'upstream-first'-> cherry pick to external repo}.=20

I think this valid concern could mostly be mitigated by careful =
selection of
maintainers and how we structure content amongst repositories.  I will =
try
and elaborate on how I think it could work with some pictures in the =
near
future.

>=20
>>> One (crazy) idea would be to come up with a minimum acceptance test =
suite (which can be automated) that validates all the core features and =
use this for accepting new platforms as reference platforms from =
community.
>>=20
>>    So my clarification is that the acceptance test would not measure =
how well
>>    a machine meets end-user requirements, but rather how well a =
machine makes
>>    use of the project=E2=80=99s common code.  Maybe a metric measured =
by the test could
>>    be something like least number of deviations from the defaults?
> Looks good metric to me for various application level service/daemons. =
Still not sure how the code changes specific to hardware can be =
regression tested e.g. KCS vs. BT, IPMB, NC-SI etc.
