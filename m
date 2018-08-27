Return-Path: <KWLIU@nuvoton.com>
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=kwliu@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
X-Greylist: delayed 600 seconds by postgrey-1.36 at bilbo;
 Mon, 27 Aug 2018 17:19:21 AEST
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 41zNYP1cgMzDqSL
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 17:19:20 +1000 (AEST)
Received: from NTILML02.nuvoton.com (212.199.177.21.static.012.net.il
 [212.199.177.21])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id w7R6d71d014721
 for <openbmc@lists.ozlabs.org>; Mon, 27 Aug 2018 09:39:08 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML02.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Mon, 27 Aug
 2018 10:09:05 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (TLS) id 15.0.1130.7; Mon, 27 Aug
 2018 15:09:03 +0800
Received: from NTHCML01A.nuvoton.com ([fe80::1170:e239:c9a9:e8b8]) by
 NTHCML01A.nuvoton.com ([fe80::1170:e239:c9a9:e8b8%13]) with mapi id
 15.00.1130.005; Mon, 27 Aug 2018 15:09:03 +0800
From: <KWLIU@nuvoton.com>
To: <ed.tanous@intel.com>, <eajames@linux.vnet.ibm.com>,
 <openbmc@lists.ozlabs.org>
Subject: RE: KVM Support?
Thread-Topic: KVM Support?
Thread-Index: AQHUO7lSdzDpnDbMxEmWF++8FZWSqaTOvOgAgAQtl7A=
Date: Mon, 27 Aug 2018 07:09:03 +0000
Message-ID: <3d92122e8c42452caee0ece1769ee147@NTHCML01A.nuvoton.com>
References: <tencent_5D1EDC1D8DB78D128D29AA554AADF300AE08@qq.com>
 <004c4dee-ada1-61f8-6c6c-653be2b3e57f@linux.vnet.ibm.com>
 <tencent_54C0BC7D36D43C257F35D6C9@qq.com>
 <17c12028-a8c5-7b39-aa17-afa80b0ec0da@linux.vnet.ibm.com>
 <7E9441B1E5EFFD4681F54958E821699345835528@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <7E9441B1E5EFFD4681F54958E821699345835528@ORSMSX114.amr.corp.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [110.28.101.63]
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
X-List-Received-Date: Mon, 27 Aug 2018 07:19:23 -0000

Hi Eddie & Ed:

Do you have any plan to support non-jpeg video stream in obmc-iKVM?
It is possible some platforms don't have hardware JPEG engine, instead have=
 the RGB video stream.
If possible to support RGB video stream, I think it would be better if you =
can add the video frame differentiation in obmc-iKVM because we don't need =
to send the full screen to VNC client on every request, it can reduce the b=
uffer size at least. (libvncserver already has the video frame differentiat=
ion)

Also, I have implemented a KVM application for our platform(nuvoton evb-npc=
m750) which has hardware video frame differentiation and hardware hextile e=
ngine.
https://github.com/Nuvoton-Israel/obmc-ikvm
https://github.com/Nuvoton-Israel/linux/commit/7e90f572323e56e9425b85aafe86=
dfa5a35c4e7d

I also enabled ED's KVM webui and added kvmws proxy in python web server.
https://github.com/Nuvoton-Israel/meta-openbmc-nuvoton-addon/commit/140771b=
7e898dd5ca8f0364290cce669609088ac

If you can spare a few minutes to review my implementation is my pleasure.

Currently, my video driver is not v4l2, so I am going to redesign it to fit=
 v4l2 and your obmc-iKVM, then I will try to add the RGB format support in =
your obmc-ikvm.

Regarding the larger binary size, I think we need to review all configurati=
ons of libvncserver and check which functions should be disabled.

Thanks,
Joseph Liu.
-----Original Message-----
From: openbmc [mailto:openbmc-bounces+kwliu=3Dnuvoton.com@lists.ozlabs.org]=
 On Behalf Of Tanous, Ed
Sent: Saturday, August 25, 2018 3:04 AM
To: Eddie James; xiuzhi; Alexander A. Filippov; openbmc
Subject: RE: KVM Support?

>
> Well, the VNC server (and Video Engine driver) integration is targeted
> for the OpenBMC release in February 2019. Hopefully in master before
> then. There is currently no plan or work being done to integrate a
> viewer into the BMC webui. But patches are certainly welcome in this
> area! It could be as simple as dropping in a noVNC html file... not sure.
>

Not to disagree with you, but there's some work here:

https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__gerrit.openbmc-2Dpro=
ject.xyz_-23_c_openbmc_phosphor-2Dwebui_-2B_10268_&d=3DDwIFAg&c=3Due8mO8zgC=
4VZ4q_aNVKt8G9MC01UFDmisvMR1k-EoDM&r=3D7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiD=
bLW4v8Q&m=3DuAK69sfPRejBDLMlDDz55S4bZYC4CDdn36duJicj1Ng&s=3DD17B6-0jST399fi=
aUbHLhWtx-Igita5vNYzRA-bGBmA&e=3D

The webui side of it was just a matter of dropping novnc into the webui and=
 routing the websocket back to the BMC.  The BMC side of it, implementing a=
ppropriate security on the websocket, and some other cleanup is on my back =
burner.  I'm at a bit of a crossroads, and I have two thoughts on how to pr=
oceed.

1. Rejigger the existing VNC kvm websocket implementation here to update to=
 the new driver API, and delete all the JPEG to bitmap decoding code.  This=
 solution essentially runs a websocket-only VNC server inside bmcweb. https=
://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__github.com_openbmc_bmcweb=
_blob_master_include_web-5Fkvm.hpp&d=3DDwIFAg&c=3Due8mO8zgC4VZ4q_aNVKt8G9MC=
01UFDmisvMR1k-EoDM&r=3D7g2D1XDc1ET3CnY1ySnaWQXPxPxfpLww1MiDbLW4v8Q&m=3DuAK6=
9sfPRejBDLMlDDz55S4bZYC4CDdn36duJicj1Ng&s=3DxlRipubKg7lXeC_KC_BlSZlCzxEljFo=
G1AL8mGRzQig&e=3D
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

3. Some other option that I'm missing?

I'm very interested in what the community thinks here.  Is there a use case=
 for having the standalone vncserver?

-Ed


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The privileged confidential information contained in this email is intended=
 for use only by the addressees as indicated by the original sender of this=
 email. If you are not the addressee indicated in this email or are not res=
ponsible for delivery of the email to such a person, please kindly reply to=
 the sender indicating this fact and delete all copies of it from your comp=
uter and network server immediately. Your cooperation is highly appreciated=
. It is advised that any unauthorized use of confidential information of Nu=
voton is strictly prohibited; and any information in this email irrelevant =
to the official business of Nuvoton shall be deemed as neither given nor en=
dorsed by Nuvoton.
