Return-Path: <pawel.rapkiewicz@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=pawel.rapkiewicz@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44JgzN2L2PzDqDK
 for <openbmc@lists.ozlabs.org>; Wed, 13 Mar 2019 03:53:47 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2019 09:53:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,471,1544515200"; d="scan'208";a="306584555"
Received: from irsmsx105.ger.corp.intel.com ([163.33.3.28])
 by orsmga005.jf.intel.com with ESMTP; 12 Mar 2019 09:53:43 -0700
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.146]) by
 irsmsx105.ger.corp.intel.com ([169.254.7.210]) with mapi id 14.03.0415.000;
 Tue, 12 Mar 2019 16:53:41 +0000
From: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>
To: "Rapkiewicz, Pawel" <pawel.rapkiewicz@intel.com>, Brad Bishop
 <bradleyb@fuzziesquirrel.com>
CC: Adriana Kobylak <anoo@linux.vnet.ibm.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>, "Tanous, Ed" <ed.tanous@intel.com>
Subject: RE: [Redfish] VirtualMedia
Thread-Topic: [Redfish] VirtualMedia
Thread-Index: AdS81DvZ0sIWmrRRQ5OCnZ3P6JVTJwApRZyAAAj0oTAG1aflcA==
Date: Tue, 12 Mar 2019 16:53:42 +0000
Message-ID: <53D123781965AE42A2ABEE982B242E41A1030C51@IRSMSX102.ger.corp.intel.com>
References: <53D123781965AE42A2ABEE982B242E41A1007CF9@IRSMSX102.ger.corp.intel.com>
 <20190205173627.lju73ko22y4etuab@thinkpad>
 <53D123781965AE42A2ABEE982B242E41A100830C@IRSMSX102.ger.corp.intel.com>
In-Reply-To: <53D123781965AE42A2ABEE982B242E41A100830C@IRSMSX102.ger.corp.intel.com>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: request-justification,no-action
x-originating-ip: [163.33.239.181]
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
X-List-Received-Date: Tue, 12 Mar 2019 16:53:53 -0000

Hi,

I'd like to refresh the topic, since I'm seeing some traffic around Virtual=
 Media, I think this is a right time :)

Regards,
Pawel


-----Original Message-----
From: openbmc [mailto:openbmc-bounces+pawel.rapkiewicz=3Dintel.com@lists.oz=
labs.org] On Behalf Of Rapkiewicz, Pawel
Sent: Wednesday, February 6, 2019 12:08 AM
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: Adriana Kobylak <anoo@linux.vnet.ibm.com>; openbmc@lists.ozlabs.org; Ta=
nous, Ed <ed.tanous@intel.com>
Subject: RE: [Redfish] VirtualMedia

Brad, Adriana,

Here are answers for your email, at the bottom I'm describing flow we were =
talking on IRC channel.

> We are planning on making available to the host via usb gadget.  Just cur=
ious - what are some use cases for mounting the file locally on the BMC?

I'm not aware of any, but I can imagine some, one of it might be as you men=
tioned on IRC channel to perform update, not sure if it will be useful, and=
 how it would work comparing to other update methods, but it's for free. If=
 there is already possibility to expose image through BMC to HOST, mounting=
 it on BMC is one step less. That's why I was asking about use cases, it co=
mplicates a little a flow, i.e. slightly larger VirtualMedia Oem extention,=
 but might be worth it. In the below flow I skipped that possibility.

> fwiw Adriana and Jeremy had been working to this design here:

> https://lists.ozlabs.org/pipermail/openbmc/2018-July/012647.html

I've read it before and find using NBD great idea.

> Based on the chat in IRC it sounded like Intel might want to tweak that s=
lightly and get rid of the nbd-proxy as a stand-alone application and move =
that functionality into bmcweb.  Did I understand correctly?  I don't think=
 I'm opposed to that or anything (Jeremy/Adriana please comment if you have=
 any concerns there) but can you comment on the motivation for the change?

First motivation was to integrate NBD solution inside bmcweb (it was before=
 I found other integration patchsets), and inherit all the benefits from it=
, like all supported authentication methods, TLS, and one server certificat=
e, as far as I know, there would be problems with having websocketd working=
 with same certificate as bmcweb (I might be wrong at this point). Then I'v=
e realized that using boost::asio, and boost::beast nbd-proxy may be incorp=
orated into bmcweb, and the libraries would make it simpler. Moreover  it w=
ill remove additional communication channel - pipes, which will decrease co=
ntext switching and number of syscalls for communication over pipes. To be =
honest I have no idea how big (or little)  is a gain in performance, it mig=
ht be worth to measure it, and have comparable results. =


I left spawning of nbd-client, but would like to discuss that. The motivati=
on behind that was that bmcweb is large standalone application which has a =
lot of functionalities - websockets are one of it, and I don't want to impl=
ement spawning and process monitoring inside it, I think it shouldn't be it=
s responsibility, that feature is far away from base bmcweb functionality.

After reviewing https://gerrit.openbmc-project.xyz/#/c/openbmc/meta-phospho=
r/+/17494/2
I suggest two options of spawning nbd-client and configuring usb gadget, bo=
th were already proposed in nbd-proxy patchset, but here in details

1. Using systemd to monitor /tmp/nbd-proxy.X.sock files, and based on any c=
hange it will start nbd-client with appropriate options, like:
nbd-client -u /tmp/nbd-proxy.X.sock -b 512 /dev/nbdX then it will start "st=
ate_hook" script from the above commit with appropriate parameters.
Pros:
- It's almost for free, easy shell script is required to determine which nb=
d-client shall be connected
- there is no need for watching if nbd-client shall be terminated - if loca=
l socket will disappear nbd-client would stop working, stopping usb gadget =
would be required
Cons:
- There is very little control in options for both nbd-client and usb gadge=
t, options cannot be passed explicitly, monitoring script shall determine w=
hich are required
- VirtualMedia redfish schema have no real data to be feed, probably nothin=
g except IP of remote host cannot be exposed,

2. Going with the spirit of OpenBMC as I understand it, and implement servi=
ce for managing VirtualMedia with appropriate DBus interface, I'd advocate =
for that.
Pros:
- Gives a lot of flexibility in options for mounting devices, like block-si=
ze, timeout, etc
- Can monitor nbd-client, connections, etc and do appropriate actions on us=
b gadget, i.e. if connection is broken
- Will deliver real data for VirtualMedia schema
- Can be extended (if needed) to allow mounting other types of protocols, a=
s described in DMTF's VirtualMedia schema (NFS, CIFS, etc) all having same =
DBus interface
Cons:
- This is another service, it will not interfere on communication between N=
BD-server, and nbd-client, once its connected, but consumes flash, RAM, and=
 once for a while context switching time

So based on nbd-proxy.hpp bmcweb patchset(https://gerrit.openbmc-project.xy=
z/#/c/openbmc/bmcweb/+/17749/), and choosing second option from the above t=
he flow might look like:

1. bmcweb starts and expose /nbd URI
2. From browser user is serving image through nbd-server (JS) 3. bmcweb acc=
epts connection, verifies credentials (i.e. Basic Auth, session, etc) 4. bm=
cweb Exposes first free local socket from pool (i.e. /tmp/nbd-proxy.0.sock)
<options>:
A) Easier, automatic
5. bmcweb calls appropriate Virtual Media DBus method,
B) Manual
5.1. bmcweb exposes VirtualMedia redfish schema with connected NBD Server o=
ver WS, and allows OEM "Mount to Host" action with parameters
5.2 bmcweb accepts POST on OEM "Mount to Host" action and calls appropriate=
 Dbus method exposed by Virtual Media </options> 6. VirtualMedia spawns nbd=
-client from /tmp/nbd-proxy.0.sock and mounts it to first free /dev/nbdX de=
vice, i.e. /dev/nbd0, 7. VirtualMedia starts monitoring nbd-client, and con=
figures usb gadget to expose /dev/nbd0 to HOST

At this point the traffic goes through this stream
NBDServer(JS) <=3D=3D WSS =3D=3D> bmcweb <=3D=3D local socket =3D=3D> nbd-c=
lient <=3D=3D syscalls? =3D=3D> usb gadget

Moreover:
- Virtual Media schema contains all the information delivered from Virtual =
Media Dbus service, it can contain whatever nbd-client is delivering + IP o=
f remote host, local NBD device, usb gadget data
- Virtual Media schema allows to break connection by DELETE method (or ejec=
t action) over HTTP to bmcweb forwarded over Dbus to Virtual Media Schema
- Virtual Media reacts on nbd-client stops working, websocket or local sock=
et disconnection, and is able to clean up (mostly usb gadget configuration)

Regards,
Pawel =



--------------------------------------------------------------------

Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydz=
ial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-31=
6 | Kapital zakladowy 200.000 PLN.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata=
 i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wi=
adomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiek=
olwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the s=
ole use of the intended recipient(s). If you are not the intended recipient=
, please contact the sender and delete all copies; any review or distributi=
on by others is strictly prohibited.

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
