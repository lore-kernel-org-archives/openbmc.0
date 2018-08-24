Return-Path: <ed.tanous@intel.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41xrLP011lzDqrV
 for <openbmc@lists.ozlabs.org>; Sat, 25 Aug 2018 05:04:25 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2018 12:04:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,283,1531810800"; d="scan'208";a="86155142"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by orsmga002.jf.intel.com with ESMTP; 24 Aug 2018 12:04:09 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.8]) by
 ORSMSX106.amr.corp.intel.com ([169.254.1.57]) with mapi id 14.03.0319.002;
 Fri, 24 Aug 2018 12:04:09 -0700
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Eddie James <eajames@linux.vnet.ibm.com>, xiuzhi <1450335857@qq.com>,
 "Alexander A. Filippov" <a.filippov@yadro.com>, openbmc
 <openbmc@lists.ozlabs.org>
Subject: RE: KVM Support?
Thread-Topic: KVM Support?
Thread-Index: AQHUO7lUeASCSKYkH0Gc28tAnBmHq6TPOweA
Date: Fri, 24 Aug 2018 19:04:08 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E821699345835528@ORSMSX114.amr.corp.intel.com>
References: <tencent_5D1EDC1D8DB78D128D29AA554AADF300AE08@qq.com>
 <004c4dee-ada1-61f8-6c6c-653be2b3e57f@linux.vnet.ibm.com>
 <tencent_54C0BC7D36D43C257F35D6C9@qq.com>
 <17c12028-a8c5-7b39-aa17-afa80b0ec0da@linux.vnet.ibm.com>
In-Reply-To: <17c12028-a8c5-7b39-aa17-afa80b0ec0da@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMGM3NjlhZjEtYjlhYy00ZWViLTg5YjYtMGRkYmE0MmUzNDk2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiazBkYWJNWFo5M1MrdndXdnpzN0VoN0I0UG4yM3pwcEVQekxPaUlCaXlmUmhCb20yVWVlOFpnSm55eXl5RU5mRSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2018 19:04:29 -0000

>=20
> Well, the VNC server (and Video Engine driver) integration is targeted fo=
r the
> OpenBMC release in February 2019. Hopefully in master before then. There
> is currently no plan or work being done to integrate a viewer into the BM=
C
> webui. But patches are certainly welcome in this area! It could be as sim=
ple as
> dropping in a noVNC html file... not sure.
>=20

Not to disagree with you, but there's some work here:

https://gerrit.openbmc-project.xyz/#/c/openbmc/phosphor-webui/+/10268/

The webui side of it was just a matter of dropping novnc into the webui and=
 routing the websocket back to the BMC.  The BMC side of it, implementing a=
ppropriate security on the websocket, and some other cleanup is on my back =
burner.  I'm at a bit of a crossroads, and I have two thoughts on how to pr=
oceed.

1. Rejigger the existing VNC kvm websocket implementation here to update to=
 the new driver API, and delete all the JPEG to bitmap decoding code.  This=
 solution essentially runs a websocket-only VNC server inside bmcweb. https=
://github.com/openbmc/bmcweb/blob/master/include/web_kvm.hpp
Pros:
A. Smaller overall binary size.  Libvncserver supports a lot of things that=
 I suspect openbmc will never need to.  For example, the password authentic=
ation mechanisms for VNC/RFB protocol are woefully out of date by modern st=
andards, so I suspect there's no sense in having that code at all.
B. Better security.  There is no VNC port that could be abused/ported to ge=
t access to the KVM session.  The websocket authentication and authorizatio=
n infrastructure uses the same mechanisms as the rest of the webserver, so =
it reduces the attack surface.  Said another way, it's unlikely an attack o=
n bmcweb would be able to target the VNC server specifically.
C. Fewer framebuffer copies compared to a websocket proxy (at least in theo=
ry).  It is one fewer trip of the large framebuffers through userspace, whi=
ch should save us some copies.  At some point in the future if we got the L=
inux TLS subsystem going, we could likely build a no-copy, or single copy f=
ramebuffer solution, which should net us some performance by essentially ke=
eping the buffers in the kernel.

Cons:
A. It needs to be written.  Hopefully the changes should be mostly deletes,=
 and regiggering to pull framebuffers from the driver.  Keyboard and mouse =
would need to be hooked up to the gadget driver using the example from obmc=
-kvm.
B. It is a specific solution for openbmc, so it's unlikely to have much uti=
lity outside of the project.  Contributing to libvncserver "gives back" mor=
e to the open source community.

2. Use bmcweb as a websocket proxy to obmc-kvm server in a very similar way=
 to how we proxy to obmc-console.
Pros:
A. Gives us full compatibility with standard socket VNC, which could be use=
ful for debugging purposes.  I wouldn't recommend enabling it in practice w=
ithout some other kind of authentication and encryption pipeline ahead of i=
t.
B. The work to do this should be relatively minimal.  It should be essentia=
lly a copy-paste of the obmc-console socket code, a little debugging, and i=
t should be mostly good to go.

Cons:
A. Larger binary size.  I need to get more exact numbers here, but adding a=
 relatively large library (libvncserver) and another application (obmc-kvm)=
 seems unlikely to be good for our flash usage.  As is, we're already pushi=
ng the limits of a 32MB flash.
b. Extra framebuffer copies.  Driver -> obmc-kvm -> bmcweb(with TLS)  -> br=
owser  in theory is at least one extra copy.  It would be interesting to se=
t up both in practice.
=09
3. Some other option that I'm missing?

I'm very interested in what the community thinks here.  Is there a use case=
 for having the standalone vncserver?

-Ed
