Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3xpKQw2zl4zDrXd
 for <openbmc@lists.ozlabs.org>; Fri,  8 Sep 2017 11:26:16 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 8075C6DD53;
 Thu,  7 Sep 2017 21:18:45 -0400 (EDT)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: Re: RFC for Telemetry data collection
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <CAPLgG=nO4ceoy+7ChaTU7JfUO_-uboUCAe39DvzQUEdMaNE9kw@mail.gmail.com>
Date: Thu, 7 Sep 2017 21:18:45 -0400
Cc: tomjose <tomjose@linux.vnet.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, thalerj@us.ibm.com,
 jkeusema@us.ibm.com, rosedahl@us.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <04EC05F3-5654-4AD4-A52E-336D1BD8DD06@fuzziesquirrel.com>
References: <59B163B0.6060804@linux.vnet.ibm.com>
 <CAPLgG=nO4ceoy+7ChaTU7JfUO_-uboUCAe39DvzQUEdMaNE9kw@mail.gmail.com>
To: Rick Altherr <raltherr@google.com>
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
X-List-Received-Date: Fri, 08 Sep 2017 01:26:16 -0000


> On Sep 7, 2017, at 2:41 PM, Rick Altherr <raltherr@google.com> wrote:
>=20
> I have many opinions on telemetry data formats and APIs.  What I'm =
seeing in your proposal looks pretty good with some subtlety in the =
details.  For example, I expect to collect most data at least =
once-per-second,

This sounds like polling the BMC externally.  Did I infer correctly?  =
How do you feel about a push model with persistent connections?

> not log anything locally, and not alert.  I'll do all aggregation and =
thresholding at a higher level in the software stack.  I also, ideally, =
want very descriptive information about where in the system the sensor =
is.  I've attached a screenshot of what our existing host-based =
reporting software makes available to higher-level software.  This is a =
view via the human-readable web interface, the data is normally served =
via protobufs.
>=20
> Rick
