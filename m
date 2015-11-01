Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
 [173.167.31.197])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id DA8F41A02CB
 for <openbmc@lists.ozlabs.org>; Mon,  2 Nov 2015 01:14:36 +1100 (AEDT)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
Subject: Re: openbmc build failing
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_9DB71FD3-9478-46CD-866F-F226F3E34844"
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
X-Priority: 3 (Normal)
In-Reply-To: <201511011412.tA1ECac8019134@d03av05.boulder.ibm.com>
Date: Sun, 1 Nov 2015 09:14:31 -0500
Cc: openbmc@lists.ozlabs.org
Message-Id: <6D764293-5C16-4506-B4A9-3C68053AB931@fuzziesquirrel.com>
References: <201511011412.tA1ECac8019134@d03av05.boulder.ibm.com>
To: Chris Austen <austenc@us.ibm.com>
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
X-List-Received-Date: Sun, 01 Nov 2015 14:14:37 -0000


--Apple-Mail=_9DB71FD3-9478-46CD-866F-F226F3E34844
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Chris

I fixed this just now.  Please fetch the latest.

-brad.

> On Nov 1, 2015, at 9:12 AM, Chris Austen <austenc@us.ibm.com> wrote:
>=20
> Anyone seen this issue?
> =20
> =20
> DEBUG: Executing python function package_get_auto_pr
> DEBUG: Python function package_get_auto_pr finished
> DEBUG: Executing shell function do_install
> NOTE: make -j 4 DEPMOD=3Decho =
INSTALL_MOD_PATH=3D/home/causten/openbmc-barreleye/build/tmp/work/palmetto=
-openbmc-linux-gnueabi/linux-obmc/4.2+gitAUTOINC+0e0ca76818-r0/image =
modules_install
>   DEPMOD  4.2.0-openbmc-20151028-1
> install: cannot stat 'arch/arm/boot/cuImage': No such file or =
directory
> WARNING: exit code 1 from a shell command.
> ERROR: Function failed: do_install (log file is located at =
/home/causten/openbmc-barreleye/build/tmp/work/palmetto-openbmc-linux-gnue=
abi/linux-obmc/4.2+gitAUTOINC+0e0ca76818-r0/temp/log.do_install.20085)
> =20
> =20
>=20
> Chris Austen
> POWER Systems Enablement Manager
> (512) 286-5184 (T/L: 363-5184)
>=20
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc


--Apple-Mail=_9DB71FD3-9478-46CD-866F-F226F3E34844
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><div class="">Hi Chris</div><div class=""><br class=""></div><div class="">I fixed this just now. &nbsp;Please fetch the latest.</div><div class=""><br class=""></div><div class="">-brad.</div><br class=""><div><blockquote type="cite" class=""><div class="">On Nov 1, 2015, at 9:12 AM, Chris Austen &lt;<a href="mailto:austenc@us.ibm.com" class="">austenc@us.ibm.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div class="socmaildefaultfont" dir="ltr" style="font-family:Arial;font-size:10.5pt"><div class="socmaildefaultfont" dir="ltr" style="font-family:Arial;font-size:10.5pt"><div dir="ltr" class=""><div class="socpimCombinedMailingListContainer">Anyone seen this issue?</div>
<div class="socpimCombinedMailingListContainer">&nbsp;</div>
<div class="socpimCombinedMailingListContainer">&nbsp;</div></div>
<div dir="ltr" class=""><div class="">DEBUG: Executing python function package_get_auto_pr<br class="">DEBUG: Python function package_get_auto_pr finished<br class="">DEBUG: Executing shell function do_install<br class="">NOTE: make -j 4 DEPMOD=echo INSTALL_MOD_PATH=/home/causten/openbmc-barreleye/build/tmp/work/palmetto-openbmc-linux-gnueabi/linux-obmc/4.2+gitAUTOINC+0e0ca76818-r0/image modules_install<br class="">&nbsp; DEPMOD&nbsp; 4.2.0-openbmc-20151028-1<br class="">install: cannot stat 'arch/arm/boot/cuImage': No such file or directory<br class="">WARNING: exit code 1 from a shell command.<br class="">ERROR: Function failed: do_install (log file is located at /home/causten/openbmc-barreleye/build/tmp/work/palmetto-openbmc-linux-gnueabi/linux-obmc/4.2+gitAUTOINC+0e0ca76818-r0/temp/log.do_install.20085)</div>
<div class="">&nbsp;</div></div>
<div dir="ltr" class="">&nbsp;
<div class=""><br class="">Chris Austen<br class="">POWER Systems Enablement Manager<br class="">(512) 286-5184 (T/L: 363-5184)</div></div></div></div><br class="">

_______________________________________________<br class="">openbmc mailing list<br class=""><a href="mailto:openbmc@lists.ozlabs.org" class="">openbmc@lists.ozlabs.org</a><br class="">https://lists.ozlabs.org/listinfo/openbmc<br class=""></div></blockquote></div><br class=""></body></html>
--Apple-Mail=_9DB71FD3-9478-46CD-866F-F226F3E34844--
