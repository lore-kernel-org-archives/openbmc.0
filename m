Return-Path: <bradleyb@fuzziesquirrel.com>
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fuzziesquirrel.com
 (client-ip=173.167.31.197; helo=bajor.fuzziesquirrel.com;
 envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3yWGgp2hSbzDrK8
 for <openbmc@lists.ozlabs.org>; Tue,  7 Nov 2017 15:30:29 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Received: from [192.168.253.30] (unknown [192.168.253.30])
 by bajor.fuzziesquirrel.com (Postfix) with ESMTPSA id 5CBE0E55B9
 for <openbmc@lists.ozlabs.org>; Mon,  6 Nov 2017 23:30:20 -0500 (EST)
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_1674224D-5A47-4A6F-B62C-50BF46B419BF"
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Subject: OpenBMC 11/6 community telecon - Minutes
Message-Id: <611925BD-F55E-4C9E-9BA0-51B771699D1A@fuzziesquirrel.com>
Date: Mon, 6 Nov 2017 23:30:20 -0500
To: OpenBMC <openbmc@lists.ozlabs.org>
X-Mailer: Apple Mail (2.3273)
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
X-List-Received-Date: Tue, 07 Nov 2017 04:30:32 -0000


--Apple-Mail=_1674224D-5A47-4A6F-B62C-50BF46B419BF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

There was a high level overview presented on how servers use OpenBMC =
today.  Discussion moved to the current and anticipated use cases of =
OpenBMC on different types of platforms.

Brainstorm session on how to eliminate duplication of work:
  - As an experiment, will try open sprint planning on =
github.com/openbmc/openbmc <http://github.com/openbmc/openbmc>
  - Collaborate on the mailing list and on IRC early!

Discussed OpenBMC release support model.
   - Currently strive to use stable releases from component projects =
(Yocto, Linux) - have not always succeeded in practice.
   - Work to do beyond this to establish a model.
   - Backport security fixes directly upstream to Yocto, not OpenBMC, =
whenever possible.

There was a question if anyone has ever run a security scan against =
OpenBMC.  Yes - an example can be found here:
https://github.com/openbmc/openbmc/issues/1229 =
<https://github.com/openbmc/openbmc/issues/1229>

linux.conf.au <http://linux.conf.au/> in January.  Attend to learn about =
OpenBMC and OSS in general.

Please let me know if anything is inaccurate or I=E2=80=99ve missed =
something.

-brad=

--Apple-Mail=_1674224D-5A47-4A6F-B62C-50BF46B419BF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">There was a high level overview presented on =
how servers use OpenBMC today. &nbsp;Discussion moved to the current and =
anticipated use cases of OpenBMC on different types of =
platforms.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Brainstorm session on how to eliminate duplication of =
work:</div><div class=3D"">&nbsp; - As an experiment, will try open =
sprint planning on <a href=3D"http://github.com/openbmc/openbmc" =
class=3D"">github.com/openbmc/openbmc</a></div><div class=3D"">&nbsp; - =
Collaborate on the mailing list and on IRC early!</div><div class=3D""><br=
 class=3D""></div><div class=3D"">Discussed OpenBMC release support =
model.</div><div class=3D"">&nbsp; &nbsp;- Currently strive to use =
stable releases from component projects (Yocto, Linux) - have not always =
succeeded in practice.</div><div class=3D"">&nbsp; &nbsp;- Work to do =
beyond this to establish a model.</div><div class=3D"">&nbsp; &nbsp;- =
Backport security fixes directly upstream to Yocto, not OpenBMC, =
whenever possible.</div><div class=3D""><br class=3D""></div><div =
class=3D"">There was a question if anyone has ever run a security scan =
against OpenBMC. &nbsp;Yes - an example can be found here:</div><div =
class=3D""><a href=3D"https://github.com/openbmc/openbmc/issues/1229" =
class=3D"">https://github.com/openbmc/openbmc/issues/1229</a></div><div =
class=3D""><br class=3D""></div><div class=3D""><a =
href=3D"http://linux.conf.au" class=3D"">linux.conf.au</a>&nbsp;in =
January. &nbsp;Attend to learn about OpenBMC and OSS in =
general.</div><div class=3D""><br class=3D""></div><div class=3D"">Please =
let me know if anything is inaccurate or I=E2=80=99ve missed =
something.</div><div class=3D""><br class=3D""></div><div =
class=3D"">-brad</div></body></html>=

--Apple-Mail=_1674224D-5A47-4A6F-B62C-50BF46B419BF--
