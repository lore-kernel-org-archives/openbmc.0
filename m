Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpNzp6BBfzDrYn
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 14:06:29 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id BF4C08B263;
 Fri,  8 Sep 2017 00:06:22 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: RFC for Telemetry data collection
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <3c810047-cb4e-465b-6373-900a484ed078@linux.vnet.ibm.com>
Date: Fri, 8 Sep 2017 00:06:22 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2F2674DE-F964-4B8A-8BBC-39B71567FBEF@fuzziesquirrel.com>
References: <59B163B0.6060804@linux.vnet.ibm.com>
 <D3C20289-0D8A-4485-BB2B-6D6519B99A0A@fuzziesquirrel.com>
 <3c810047-cb4e-465b-6373-900a484ed078@linux.vnet.ibm.com>
To: Deepak Kodihalli <dkodihal@linux.vnet.ibm.com>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Fri, 08 Sep 2017 04:06:31 -0000


> On Sep 7, 2017, at 11:29 PM, Deepak Kodihalli =
<dkodihal@linux.vnet.ibm.com> wrote:
>=20
> On 08/09/17 6:46 am, Brad Bishop wrote:
>> Hi Tom
>> I don=E2=80=99t really disagree with anything you wrote=E2=80=A6I=E2=80=
=99m just throwing out some additional thoughts.
>> I would propose that we:
>> 1 - Add support to the REST server to subscribe to DBus signals, and =
simply forward the signal content in JSON format out over a websocket.  =
This allows an external user to get any async notification that any code =
running on the BMC can get.  I have a lot of questions on specifics here =
but I=E2=80=99ll save those for later, in case this doesn=E2=80=99t work =
out.
>=20

You only quoted #1 here.  I=E2=80=99m highlighting that because terms =
like notification, event, and telemetry are being used a little loosely =
and we are not all on the same page.

I think we need to accommodate both async and sync/historical modes =
where async is just streamed out of the BMC, and sync, out of necessity =
have dbus objects created.  Hence my proposal for two applications, one =
for each mode.

Really trying to drive my point here - to put the above another way - in =
terms of how I have described these two modes, Toms thread (this thread) =
would be tackling async mode and your note thread =
(https://lists.ozlabs.org/pipermail/openbmc/2017-September/009065.html) =
covering sync/historical mode.

> Brad, that sounds fine to me in terms of how a notification can be =
sent, although Tom's proposal also talked about describing in yaml, how =
frequently to read something off of a, say a d-bus object representing a =
sensor.

My initial thinking is that neither of the proposed applications would =
ever be doing sync reads to a dbus object.  Rather, they just passively =
sit there and consume signals.  If need be they could discard them (see =
rate-limiting below).


> If I understood correctly, are you saying instead of doing this every =
X hours or seconds, we send out a notification whenever a =
PropertyChanged d-bus signal is caught?

Yes and no.  I am proposing we consume signals rather than perform reads =
but I still think we need:

1 - An API to configure async mode (what to subscribe to, maybe some =
kind of rate limiting).  I=E2=80=99m not sure if this would be a DBus =
API or just a REST thing.

2 - A robust YAML syntax that instructs application #2 (sync mode) to do =
the same things as #1 (what to subscribe to, rate limiting when creating =
historical snapshot objects).


> And let an off-BMC application bother about averages, min/max?
>=20
>=20
> Regards,
> Deepak
