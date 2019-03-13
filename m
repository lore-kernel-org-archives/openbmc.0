Return-Path: <pawel.rapkiewicz@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=pawel.rapkiewicz@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44K8ZQ2r15zDq7h;
 Wed, 13 Mar 2019 22:22:15 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2019 04:22:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,474,1544515200"; d="scan'208";a="328197555"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
 by fmsmga005.fm.intel.com with ESMTP; 13 Mar 2019 04:22:09 -0700
Received: from irsmsx111.ger.corp.intel.com (10.108.20.4) by
 IRSMSX151.ger.corp.intel.com (163.33.192.59) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Wed, 13 Mar 2019 11:22:08 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.146]) by
 irsmsx111.ger.corp.intel.com ([169.254.2.6]) with mapi id 14.03.0415.000;
 Wed, 13 Mar 2019 11:22:08 +0000
From: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>
To: Adriana Kobylak <anoo@linux.ibm.com>
CC: Brad Bishop <bradleyb@fuzziesquirrel.com>, Adriana Kobylak
 <anoo@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Tanous, Ed" <ed.tanous@intel.com>, openbmc
 <openbmc-bounces+anoo=linux.ibm.com@lists.ozlabs.org>
Subject: RE: [Redfish] VirtualMedia
Thread-Topic: [Redfish] VirtualMedia
Thread-Index: AdS81DvZ0sIWmrRRQ5OCnZ3P6JVTJwApRZyAAAj0oTAG1aflcAACbSuAAB6wjPA=
Date: Wed, 13 Mar 2019 11:22:08 +0000
Message-ID: <53D123781965AE42A2ABEE982B242E41A1031019@IRSMSX102.ger.corp.intel.com>
References: <53D123781965AE42A2ABEE982B242E41A1007CF9@IRSMSX102.ger.corp.intel.com>
 <20190205173627.lju73ko22y4etuab@thinkpad>
 <53D123781965AE42A2ABEE982B242E41A100830C@IRSMSX102.ger.corp.intel.com>
 <53D123781965AE42A2ABEE982B242E41A1030C51@IRSMSX102.ger.corp.intel.com>
 <438d9136141964be8c729a9f7ca25050@linux.vnet.ibm.com>
In-Reply-To: <438d9136141964be8c729a9f7ca25050@linux.vnet.ibm.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [163.33.239.182]
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Mar 2019 11:22:23 -0000

>> =

>> 1. Using systemd to monitor /tmp/nbd-proxy.X.sock files, and based on =

>> any change it will start nbd-client with appropriate options, like:
>> nbd-client -u /tmp/nbd-proxy.X.sock -b 512 /dev/nbdX then it will =

>> start "state_hook" script from the above commit with appropriate =

>> parameters.

> One advantage of using the nbd-proxy is that it manages the disk udev eve=
nts and polls to know when to start the "state_hook".

I understand that, and definitely I'm not against using udev, I'd like to a=
void limiting throughput by proxying data through one more service. =

We can write a mechanism based on core OS features (systemd/udev). I descri=
bed systemd usage so far, but it can be split for systemd and udev as well.=
 For example:

systemd:
to monitor if new /tmp/nbd-proxy.X.sock file appeared and start nbd-client =
accordingly

udev:
add a rule in /etc/udev/rules.d, which will watch for new nbd device attach=
ed, and start "state_hook"

The above approach seems to be right, however it limits the functionality t=
o exposing nbd device to host only (or whatever state_hook would do in futu=
re). Since there are no others usage so far we can stick with that.

The second one described, with DBus allows more flexibility, but requires a=
dditional service on DBus.

>> =

>> 5. bmcweb calls appropriate Virtual Media DBus method,

> The first point talks about systemd monitoring the socket creation, which=
 seems like a stand-alone service file. But here we're talking about a DBus=
 method that theoretically would start nbd-client?

Yes the second option is to write a DBus service for spawning nbd-client, a=
nd perhaps (in future) deal with Redfish virtual media, like NFS, CIFS, etc=
. The DBus approach gives a little more flexibility.

>> =

>> - Can be extended (if needed) to allow mounting other types of =

>> protocols,
as described in DMTF's VirtualMedia schema (NFS, CIFS, etc) all having same=
 DBus interface the Virtual Media Redfish

> The Redfish interface was designed to be able to mount a host from a netw=
ork share rather than proxying over a websocket, that's the reason we haven=
't added the Redfish endpoint yet. Do you see us eventually implementing th=
e Redfish API or just sticking with websocket implementations?

If we'd like to have Redfish as primary interface (WebUI using redfish endp=
oints instead of current ones) I think it's desired to implement such suppo=
rt. Even if current Virtual Media schemas does not cover proxying over webs=
ockets, this can be added as OEM extension. =


Regards,
Pawel
--------------------------------------------------------------------

Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek
przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by
others is strictly prohibited.
