Return-Path: <ed.tanous@intel.com>
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=192.55.52.88; helo=mga01.intel.com;
 envelope-from=ed.tanous@intel.com; receiver=<UNKNOWN>)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3z0znZ1ktnzDsRw
 for <openbmc@lists.ozlabs.org>; Tue, 19 Dec 2017 11:49:35 +1100 (AEDT)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Dec 2017 16:49:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,423,1508828400"; d="scan'208";a="188169355"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
 by fmsmga006.fm.intel.com with ESMTP; 18 Dec 2017 16:49:31 -0800
Received: from orsmsx162.amr.corp.intel.com (10.22.240.85) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.319.2; Mon, 18 Dec 2017 16:49:31 -0800
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.57]) by
 ORSMSX162.amr.corp.intel.com ([169.254.3.44]) with mapi id 14.03.0319.002;
 Mon, 18 Dec 2017 16:49:31 -0800
From: "Tanous, Ed" <ed.tanous@intel.com>
To: Jeremy Kerr <jk@ozlabs.org>, Adi Gangidi <adi.gangidi@rackspace.com>,
 Jeremy Kerr <jmkerr@au1.ibm.com>, "anoo@us.ibm.com" <anoo@us.ibm.com>,
 Bradley W Bishop <bradleyb@us.ibm.com>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>, "ryan.dc.yu@foxconn.com" <ryan.dc.yu@foxconn.com>
CC: Chad Somerlot <chad.somerlot@RACKSPACE.COM>, Brad DeBauche
 <brad.debauche@RACKSPACE.COM>
Subject: RE: Video vs Serial for BMC based host console
Thread-Topic: Video vs Serial for BMC based host console
Thread-Index: AQHTcpQQEAvDXgKfGEWq3cy+kf10IKM/bVYAgAoZzsA=
Date: Tue, 19 Dec 2017 00:49:30 +0000
Message-ID: <7E9441B1E5EFFD4681F54958E82169932F4B1997@ORSMSX114.amr.corp.intel.com>
References: <DM5PR2001MB10183C72B6C4FE55827529E7E3370@DM5PR2001MB1018.namprd20.prod.outlook.com>
 <46ea39a9-8211-7466-cca1-d951c478d9d6@ozlabs.org>
In-Reply-To: <46ea39a9-8211-7466-cca1-d951c478d9d6@ozlabs.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-originating-ip: [10.22.254.138]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.24
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Dec 2017 00:49:39 -0000

I had spent some time trying to get video redirection through websocket goi=
ng on the AST, but got stalled recently working on other things.  I'm not s=
ure what your thoughts are on how it should be architected, but here's how =
I did my proof of concept.

Driver: pulls framebuffers out of hardware, defines a 10MB CMA region that =
can be allocated to video hardware.  Video buffers are pulled one at a time=
 by the web server, and rely on the aspeed interrupt scheme to return the c=
ompressed JPEG-like streams
Webserver: Ran VNC over HTTPS websocket, and queried the buffers asynchrono=
usly one at a time, and pushed them to the VNC websocket as they were avail=
able.  The code I had is available here and can be considered a toy at this=
 point.
https://gerrit.openbmc-project.xyz/#/c/7786/1/bmcweb/include/web_kvm.hpp
Front end: connected via NoVNC (https://github.com/novnc/noVNC) which imple=
ments a pretty standard run of the mill VNC interface.  This package was us=
ed unmodified.


Some issues I had:
1. CMA isn't terribly well documented at the time was relatively new.  The =
"right" way to do video would be to allocate the buffers when the KVM conne=
cts, and discard the buffers once the video disconnects so the memory is on=
ly used when the KVM is in use.  CMA gives you a mechanism to do this relia=
bly with large buffer sizes.
2. The aspeed implementation of jpeg compression isn't fully compliant (ie,=
 you can't add the appropriate header and save the buffer as a jpeg file) t=
herefore I had to implement a decompress to bitmap specifically for the asp=
eed hardware implementation.  This is _very_ slow in both transfer time and=
 decompression time.  On my list of things to do was to decipher the hierog=
lyphics that are the aspeed datasheet and see if I could get a more efficie=
nt way to scan a Jpeg buffer and simply patch in the required header fields=
 to make it jpeg compliant and send directly as jpeg.
The other option was to "teach" the NoVnc implementation how to decode the =
aspeed specific jpeg implementation.  I didn't get very far down either pat=
h here.
3. Frames were pulled one at a time, and didn't use the aspeed differential=
 compression, nor the double buffering available in hardware.  Both of thes=
e would've sped up processing significantly.
4. Requiring encryption is expensive, as it means that OpenSSL needs to enc=
rypt every byte.  There is an AES engine in the AST part that might mitigat=
e this, but my suspicion was implementation of the AST video differential a=
lgorithm (only sending changed bytes as a pixel stream) would net more perf=
ormance for a common user than implementing the crypto engine.  Ideally, we=
'd have time for both if this is something that everyone really needs.
5. I wasn't able to get the CMA buffer kernel command line option to launch=
 with the appropriate amount of saved memory.  Changing the default in the =
build seemed to work much better (your mileage may vary)
6. The VNC specification itself implements a laughably insecure password ha=
shing mechanism, so security needs to be done in the websocket layer in the=
 webserver.  My best stab at it is in the patchset linked above.

> a) Is this in your plan to implement in the near future ? If so, when ?

Yes, I believe we have resources planned to implement this in Q3 (although =
we won't commit to an external release timeframe for obvious reasons)  If y=
ou guys are looking to implement this sooner, we should talk, and see if ei=
ther:
A. I can help you guys get some of a jump start on it
B. I can move up my timetables (or someone on my team) to collaborate with =
you guys to get this done.

> b) Has any progress made this implementation easier by someone else?

See above.

> c) If answer is no to above questions, can one of you, please let us
> know steps in which we should go through about adding this feature,
> from scratch?

Feel free to tell my I'm crazy, but here are the steps as I see them.
1. Grab some variant of the ast_video driver (either the one I linked on IR=
C or the SDK one, each have their advantages and pitfalls)
2. Get the driver ported into something that will build in 4.13.  I found s=
everal issues here, and got a little wrapped around the axle trying to get =
them fixed, but my linux driver mojo is a little lacking these days.
	A. Solve the CMA problem, and get the appropriate build flags into a bitba=
ke recipe to get the large buffers allocated at runtime without having coll=
isions.
	B. Determine the required buffer lengths for your given choice of video mo=
des and set the config flags to change the default CMA size of the kernel b=
uild (I was not able to get these applied via kernel launch parameters, but=
 you might have more luck)
	C. Do general housekeeping on the driver (it is not suitable for upstreami=
ng at this point)
3. Decipher the AST2500 video compression scheme and decide on a path forwa=
rd for when and where to decompress.  My plan was to start by immediately d=
ecoding the buffer to a bitmap, then slowly move the decompression up the s=
tack as I was able to solve the engineering problems (driver -> websocket s=
erver -> web/NoVnc) until it was being decoded client side in the browser, =
which given some back of the napkin calculations will be required for the s=
olution to be useful.
The webserver I posted didn't get much love from a code review standpoint, =
and isn't standard.  Feel free to use it or roll your own if that's easier.=
  =20

4. Implement the NoVnc window in the phosphor-webui.  Integrating my proof =
of concept with a non-phosphor angular based UI was pretty trivial (less th=
an a day) and I have some example code that might help get you started.
5. Implement a USB gadget driver for Aspeed, and connect up the emulation o=
f both keyboard and mouse.  Some work has been done by others here.
6. Debug, load test, and find corner cases.  In our experience, BMC KVM has=
 a lot of corner cases that get exercised very rarely that can cause deadlo=
cks.

Let me know what you guys are planning to do and at a very least I might be=
 able to help you with some of the learnings I had running through this.

Out of curiosity, are you guys using an AST2400 or AST2500, or something el=
se?

-Ed
