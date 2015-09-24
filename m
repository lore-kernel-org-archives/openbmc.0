Return-Path: <brad@bwbmail.net>
X-Greylist: delayed 485 seconds by postgrey-1.35 at bilbo;
 Thu, 24 Sep 2015 13:23:14 AEST
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 560D81A0026
 for <openbmc@lists.ozlabs.org>; Thu, 24 Sep 2015 13:23:14 +1000 (AEST)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <brad@bwbmail.net>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_AE84724A-22CA-457E-8D5B-E05F6F6C8D58"
Subject: SDK usage
Message-Id: <7FC7482F-0974-4573-9A6F-07B70927EA0F@bwbmail.net>
Date: Wed, 23 Sep 2015 23:15:05 -0400
To: openbmc@lists.ozlabs.org
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Sep 2015 03:23:14 -0000


--Apple-Mail=_AE84724A-22CA-457E-8D5B-E05F6F6C8D58
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

For those that have been playing around with the Yocto build environment =
I just wanted to point out that you don't have to build an image every =
time as you develop your applications.

You can build a relocatable SDK and then use that to cross compile. =
After that you can simply copy your app(s) over to the qemu instance =
with ssh. Here are some (brief) instructions - =
https://github.com/openbmc/openbmc/wiki/Howto---Build-using-the-SDK =
<https://github.com/openbmc/openbmc/wiki/Howto---Build-using-the-SDK>

Let me know if there are any questions or feedback.

Thx - Brad=

--Apple-Mail=_AE84724A-22CA-457E-8D5B-E05F6F6C8D58
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class="">For those that have been playing around with the Yocto build environment I just wanted to point out that you don't have to build an image every time as you develop your applications.<br class=""><br class="">You can build a relocatable SDK and then use that to cross compile. After that you can simply copy your app(s) over to the qemu instance with ssh. Here are some (brief) instructions -&nbsp;<a href="https://github.com/openbmc/openbmc/wiki/Howto---Build-using-the-SDK" class="">https://github.com/openbmc/openbmc/wiki/Howto---Build-using-the-SDK</a><br class=""><br class="">Let me know if there are any questions or feedback.<br class=""><br class="">Thx - Brad</body></html>
--Apple-Mail=_AE84724A-22CA-457E-8D5B-E05F6F6C8D58--
