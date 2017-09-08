Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 305 seconds by postgrey-1.36 at bilbo;
 Fri, 08 Sep 2017 11:21:16 AEST
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpKK86GrrzDrXG
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 11:21:16 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id A9BD96DD53;
 Thu,  7 Sep 2017 21:16:01 -0400 (EDT)
Content-Type: text/plain; charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: RFC for Telemetry data collection
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <59B163B0.6060804@linux.vnet.ibm.com>
Date: Thu, 7 Sep 2017 21:16:01 -0400
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, thalerj@us.ibm.com,
 jkeusema@us.ibm.com, rosedahl@us.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <D3C20289-0D8A-4485-BB2B-6D6519B99A0A@fuzziesquirrel.com>
References: <59B163B0.6060804@linux.vnet.ibm.com>
To: tomjose <tomjose@linux.vnet.ibm.com>
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
X-List-Received-Date: Fri, 08 Sep 2017 01:21:17 -0000

Hi Tom

I don=E2=80=99t really disagree with anything you wrote=E2=80=A6I=E2=80=99=
m just throwing out some additional thoughts.

I would propose that we:

1 - Add support to the REST server to subscribe to DBus signals, and =
simply forward the signal content in JSON format out over a websocket.  =
This allows an external user to get any async notification that any code =
running on the BMC can get.  I have a lot of questions on specifics here =
but I=E2=80=99ll save those for later, in case this doesn=E2=80=99t work =
out.

2 - Write an application to run on the BMC that subscribes to DBus =
signals and each time it occurs, creates a DBus object with the content =
of the signal again in JSON format.  The signals to subscribe to (and =
therefore the resulting =E2=80=9Chistory=E2=80=9D DBus objects for) =
would be defined via per-platform YAML.

=46rom there implementing different =E2=80=9Ceventing=E2=80=9D =
interfaces like Redfish, DCMI, SNMP traps, or whatever Rick does with =
protobufs :-) becomes an exercise in:

1 - If the eventing interface is async, socket based: Doing the same as =
#1 above in a new application, but applying a transformation on the =
JSON.
2 - If the eventing interface is sync, history based: Write an =
application that transforms the objects created by #2 above.

Does anyone see this framework not enabling them to meet their =
requirements?  Please poke holes.

-brad



> On Sep 7, 2017, at 11:20 AM, tomjose <tomjose@linux.vnet.ibm.com> =
wrote:
>=20
> Hello,
>=20
> I am working on the issue =
(https://github.com/openbmc/openbmc/issues/1957) to design a telemetry =
application for the OpenBMC. I would be explaining a rough idea of how =
we plan to go about. Please share your thoughts and feedback on this =
proposal.
