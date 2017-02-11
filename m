Return-Path: <stoltz@google.com>
Received: from mail-it0-x22a.google.com (mail-it0-x22a.google.com
 [IPv6:2607:f8b0:4001:c0b::22a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vKwgJ6FMnzDqBW
 for <openbmc@lists.ozlabs.org>; Sat, 11 Feb 2017 13:26:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VpqHEoPA"; 
 dkim-atps=neutral
Received: by mail-it0-x22a.google.com with SMTP id k200so47936188itb.1
 for <openbmc@lists.ozlabs.org>; Fri, 10 Feb 2017 18:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+yYhHxsNEKvA5RhjzoyQ52b62MAi3MS9QF1H5Bjw3mc=;
 b=VpqHEoPA1WQGzrXuc8FHnE26hrgNGYN+MB8qIzpTPFnjkPFnO30FeJEEa3CCoZpRUm
 PJSqVqyASw5cdiarn2+KYzzxfVk9WPU2vmaEq9+M5/GFGYyLiEJIDXVJHKF04sUGWkQ9
 VWmqv6F1N22WSYXldfRYk8BihJZY+NSkmSmgXqtzQ13VOKHN58WwXJ3On1n4b/OaEpQf
 seygvexkqGHz1hgeX1QZHnm+Excf57OkUsJQ39U7feKAibAXnAUYxFy0FHKhHlsjrEV4
 KUiE3zErQ+xTsSS7FQeG1b9qBWsduoIBLH3VVuvR46o3ZByvcDbfOVbF5G36CRQKzQfE
 2WFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+yYhHxsNEKvA5RhjzoyQ52b62MAi3MS9QF1H5Bjw3mc=;
 b=RIglEmXhqe43hsbZOvflfWZx3b3MngDVcZXROl4CaKRUIGsRFUzPBsHQpWiMuR656E
 Xw9A1Jq5eR/vf8yFAzBbAmD4YUida7gFgmFx2BTm10ZoArRYaY0aA/MuaebT4Wmq0HYY
 HuM85xw1VHK/ZNAhUuucDGGKDnWwhRRi+8hj9uFjTdnBWh5sRcCP7RoYhxCZHJh64/qy
 Itj2QnNmmgVn86sWOjPMECZ+Ns1k8zaruUepo1VLvMg4KUpL5PEN88MTHJMAZ3JMinna
 imggzipLY3wLXRQz5Vxwy0995EV5qhWwu426hWNNDDquxhijAM0L+CveLNpjz5pXpOJ8
 I00Q==
X-Gm-Message-State: AIkVDXIYVpmVFQfw8qO2owYikDHajaQDytYRqlUKdmDP920XwDLHUS9wcipydlAjuffQmasFe3KXAoD3fog7tXrr
X-Received: by 10.36.23.74 with SMTP id 71mr29336554ith.37.1486780009379; Fri,
 10 Feb 2017 18:26:49 -0800 (PST)
MIME-Version: 1.0
From: Ben Stoltz <stoltz@google.com>
Date: Sat, 11 Feb 2017 02:26:38 +0000
Message-ID: <CAP0xrXhBNr56y26HqUwjD_2wWh3mCqQ=uA1fgHsfT-yLBFKOiQ@mail.gmail.com>
Subject: High level security requirements
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary=001a1143e38a51cc4b054837f2af
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
X-List-Received-Date: Sat, 11 Feb 2017 02:26:53 -0000

--001a1143e38a51cc4b054837f2af
Content-Type: text/plain; charset=UTF-8

I still need some background on Power9+OpenBMC and OpenBMC in other systems
in order to form a solid opinion on system security.

In the case of P9, I want to validate the SBE OTPROM and SEEPROM before
deploying to the data center. I'd like to be able to automate that
procedure and run it for any racked system at any time.

See https://cloud.google.com/security/security-design/ for some publicly
available information and context. At the lowest level:
"...We also design custom chips, including a hardware security chip that is
currently being deployed on both servers and peripherals. These chips allow
us to securely identify and authenticate legitimate Google devices at the
hardware level. ..."
Any P9 or OpenBMC security solution should be a very strong story,
independent of additional measures employed by any particular vendor. The
threat model should be clearly stated and be specific about what is in and
out of scope.

As far as the OpenBMC filesystem design, I expect the BMC to follow the
typical sequence for each layer of the boot procedure:
1) check for pending update and update if needed and valid
2) remove the ability to update
3) copy code and configuration into place for execution
4) validate code and configuration
5) record measurement or equivalent operation for the system
6) transfer control to next layer
7) next layer does its work including progression to its subsequent layer

The BMC, even though it runs Linux, is a fixed stack and has lower overall
complexity than the host system. Ideally, the BMC can re-enforce the chain
of trust of the host. In particular, I'm looking to the BMC to close the
possible gap in the SBE OTPROM and SEEPROM which could otherwise harbor a
persistent attack (e.g. load HB, validate it, maliciously patch it, run it).

The OpenBMC filesystem and its contents should be verifiable before they
are used. What is the scheme to be employed?

--001a1143e38a51cc4b054837f2af
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I still need some background on Power9+OpenBMC and OpenBMC=
 in other systems in order to form a solid opinion on system security.<div>=
<br></div><div>In the case of P9, I want to validate the SBE OTPROM and SEE=
PROM before deploying to the data center. I&#39;d like to be able to automa=
te that procedure and run it for any racked system at any time.</div><div><=
br></div><div>See=C2=A0<a href=3D"https://cloud.google.com/security/securit=
y-design/">https://cloud.google.com/security/security-design/</a>=C2=A0for =
some publicly available information and context. At the lowest level:</div>=
<div>&quot;...We also design custom chips, including a hardware security ch=
ip that is currently being deployed on both servers and peripherals. These =
chips allow us to securely identify and authenticate legitimate Google devi=
ces at the hardware level. ...&quot;</div><div>Any P9 or OpenBMC security s=
olution should be a very strong story, independent of additional measures e=
mployed by any particular vendor. The threat model should be clearly stated=
 and be specific about what is in and out of scope.</div><div><br></div><di=
v>As far as the OpenBMC filesystem design, I expect the BMC to follow the t=
ypical sequence for each layer of the boot procedure:</div><div>1) check fo=
r pending update and update if needed and valid</div><div>2) remove the abi=
lity to update</div><div>3) copy code and configuration into place for exec=
ution</div><div>4) validate code and configuration</div><div>5) record meas=
urement or equivalent operation for the system</div><div>6) transfer contro=
l to next layer</div><div>7) next layer does its work including progression=
 to its subsequent layer</div><div><br></div><div>The BMC, even though it r=
uns Linux, is a fixed stack and has lower overall complexity than the host =
system. Ideally, the BMC can re-enforce the chain of trust of the host. In =
particular, I&#39;m looking to the BMC to close the possible gap in the SBE=
 OTPROM and SEEPROM which could otherwise harbor a persistent attack (e.g. =
load HB, validate it, maliciously patch it, run it).</div><div><br></div><d=
iv>The OpenBMC filesystem and its contents should be verifiable before they=
 are used. What is the scheme to be employed?</div></div>

--001a1143e38a51cc4b054837f2af--
