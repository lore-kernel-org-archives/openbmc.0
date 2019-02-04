Return-Path: <pawel.rapkiewicz@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.65; helo=mga03.intel.com;
 envelope-from=pawel.rapkiewicz@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43thmH01h9zDqL9
 for <openbmc@lists.ozlabs.org>; Tue,  5 Feb 2019 09:12:52 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Feb 2019 14:12:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,560,1539673200"; d="scan'208";a="113688829"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
 by orsmga006.jf.intel.com with ESMTP; 04 Feb 2019 14:12:47 -0800
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.65]) by
 IRSMSX109.ger.corp.intel.com ([169.254.13.133]) with mapi id 14.03.0415.000;
 Mon, 4 Feb 2019 22:12:46 +0000
From: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
CC: Adriana Kobylak <anoo@linux.ibm.com>, "Tanous, Ed" <ed.tanous@intel.com>
Subject: [Redfish] VirtualMedia
Thread-Topic: [Redfish] VirtualMedia
Thread-Index: AdS81DvZ0sIWmrRRQ5OCnZ3P6JVTJw==
Date: Mon, 4 Feb 2019 22:12:46 +0000
Message-ID: <53D123781965AE42A2ABEE982B242E41A1007CF9@IRSMSX102.ger.corp.intel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [163.33.239.180]
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
X-List-Received-Date: Mon, 04 Feb 2019 22:13:03 -0000

Hi,

I've reviewed some email threads about implementation and usage of Virtual =
Media, and I tend to agree, that Virtual Media schema was not designed for =
usage like web socket proxy. I'm planning to propose some OEM extension tha=
t will make Virtual Media closer to our needs, and I'd like to ask you what=
 would be your usage of NBD over web sockets, are you planning to mount NBD=
 device only in BMC, make it available to HOST over i.e. usb gadget, or bot=
h depending on use case (Any other?).

I was thinking about implementation of Virtual Media Service, that will all=
ow those actions, but before that I'd like to gather more input.

I'm attaching link to nbd-proxy functionality implementation in bmcweb: htt=
ps://gerrit.openbmc-project.xyz/#/c/openbmc/bmcweb/+/17749/ =

There are two proposals on how nbd-client can be spawned upon web socket co=
nnection:
- systemd watching Unix Socket files
- VirtualMediaService triggered by bmcweb

Systemd tends to be easier, but with less control
VirtualMediaService allows more (like usb gadget), but would be better desi=
gned if I'd receive some input on your use cases.

Regards,
Pawel Rapkiewicz
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
