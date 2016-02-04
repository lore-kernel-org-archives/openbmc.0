Return-Path: <njames@us.ibm.com>
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 (using TLSv1 with cipher CAMELLIA256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id E5C781A0239
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2016 11:57:27 +1100 (AEDT)
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 3 Feb 2016 17:57:26 -0700
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Wed, 3 Feb 2016 17:57:21 -0700
X-IBM-Helo: d03dlp01.boulder.ibm.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id DBAB6C40001
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2016 17:45:29 -0700 (MST)
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u140vJQh27918388
 for <openbmc@lists.ozlabs.org>; Wed, 3 Feb 2016 17:57:19 -0700
Received: from d03av03.boulder.ibm.com (localhost [127.0.0.1])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u140vJxd030093
 for <openbmc@lists.ozlabs.org>; Wed, 3 Feb 2016 17:57:19 -0700
Received: from e39.co.us.ibm.com (e39.boulder.ibm.com [9.17.249.49])
 by d03av03.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
 u140vIwn030089
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 3 Feb 2016 17:57:18 -0700
Message-Id: <201602040057.u140vIwn030089@d03av03.boulder.ibm.com>
Received: from localhost
 by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Wed, 3 Feb 2016 17:57:18 -0700
Received: from smtp.notes.na.collabserv.com (192.155.248.72)
 by e39.co.us.ibm.com (192.168.2.139) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
 Wed, 3 Feb 2016 17:57:16 -0700
X-IBM-Helo: smtp.notes.na.collabserv.com
X-IBM-MailFrom: njames@us.ibm.com
X-IBM-RcptTo: openbmc@lists.ozlabs.org
Received: from /spool/local
 by smtp.notes.na.collabserv.com with smtp.notes.na.collabserv.com ESMTP
 for <openbmc@lists.ozlabs.org> from <njames@us.ibm.com>;
 Thu, 4 Feb 2016 00:57:15 -0000
Received: from us1a3-smtp05.a3.dal06.isc4sb.com (10.146.71.159)
 by smtp.notes.na.collabserv.com (10.106.227.158) with
 smtp.notes.na.collabserv.com ESMTP; Thu, 4 Feb 2016 00:57:14 -0000
Received: from us1a3-mail62.a3.dal09.isc4sb.com ([10.142.3.202])
 by us1a3-smtp05.a3.dal06.isc4sb.com
 with ESMTP id 2016020400571324-473681 ;
 Thu, 4 Feb 2016 00:57:13 +0000 
In-Reply-To: <CACPK8XfebQP8Mi-pqRxseSJF08GHLXUX3+qyR3F=eQ-k+J0Cdw@mail.gmail.com>
Subject: Re: [PATCH openbmc v3] Update recipes and remove dhcp file
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, OpenBMC Maillist
 <openbmc@lists.ozlabs.org>
From: "Norman James" <njames@us.ibm.com>
Date: Wed, 3 Feb 2016 18:57:06 -0600
References: <1454545219-20880-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1454545219-20880-2-git-send-email-openbmc-patches@stwcx.xyz>
 <CACPK8XfebQP8Mi-pqRxseSJF08GHLXUX3+qyR3F=eQ-k+J0Cdw@mail.gmail.com>
X-KeepSent: 1870D9AE:F75BB46D-86257F4F:0004BD54;
 type=4; name=$KeepSent
X-Mailer: IBM Notes Release 9.0.1FP2 SHF37 August 25, 2014
X-LLNOutbound: False
X-Disclaimed: 24979
X-TNEFEvaluated: 1
Content-type: multipart/related; 
 Boundary="0__=09BBF5DCDF973BC48f9e8a93df938690918c09BBF5DCDF973BC4"
x-cbid: 16020400-0021-0000-0000-000016B8398F
X-IBM-ISS-SpamDetectors: Score=0.410717; BY=0.132516; FL=0; FP=0; FZ=0; HX=0; 
 KW=0; PH=0; SC=0.410717; ST=0; TS=0; UL=0; ISC=
X-IBM-ISS-DetailInfo: BY=3.00004875; HX=3.00000240; KW=3.00000007;
 PH=3.00000004; SC=3.00000138; SDB=6.00654848; UDB=6.00296784; UTC=2016-02-04
 00:57:14
x-cbparentid: 16020400-5090-0000-0000-000006F781DB
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
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
X-List-Received-Date: Thu, 04 Feb 2016 00:57:28 -0000

--0__=09BBF5DCDF973BC48f9e8a93df938690918c09BBF5DCDF973BC4
Content-type: multipart/alternative; 
	Boundary="1__=09BBF5DCDF973BC48f9e8a93df938690918c09BBF5DCDF973BC4"


--1__=09BBF5DCDF973BC48f9e8a93df938690918c09BBF5DCDF973BC4
Content-Transfer-Encoding: quoted-printable
Content-type: text/plain; charset=US-ASCII


Don't know if there is a real issue or not.   I wasn't ready for VUART and
wasn't educated in time on how to use it.  I just wanted the Linux release
to have OCC and network fixes.  I spent many hours trying to figure out why
we couldn't boot.


Regards,
Norman James
IBM - POWER Systems Architect
Phone: 1-512-286-6807 (T/L: 363-6807)
Internet: njames@us.ibm.com




From:	Joel Stanley <joel@jms.id.au>
To:	OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc:	OpenBMC Maillist <openbmc@lists.ozlabs.org>
Date:	02/03/2016 06:24 PM
Subject:	Re: [PATCH openbmc v3] Update recipes and remove dhcp file
Sent by:	"openbmc" <openbmc-bounces+njames=3Dus.ibm.com@lists.ozlabs.org>



On Thu, Feb 4, 2016 at 11:20 AM, OpenBMC Patches
<openbmc-patches@stwcx.xyz> wrote:
> From: Adriana Kobylak <anoo@us.ibm.com>
>
> Backout kernel level since tag 20160202 has vuart support that bmc
> currently does not support

Has a bug been opened?

> Pickup IPMI and REST functions to update the MAC address
> Remove dhcp file from network recipe that seems to cause issues
> ---
>  meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb       | 2 =
+-
>  meta-phosphor/common/recipes-phosphor/host-ipmid/host-ipmid.bb    | 2 +-
>  meta-phosphor/common/recipes-phosphor/network/network.bb          | 8 +
+------
>  .../common/recipes-phosphor/network/network/80-dhcp.network       | 5
-----
>  4 files changed, 4 insertions(+), 13 deletions(-)
>  delete mode 100755
meta-phosphor/common/recipes-phosphor/network/network/80-dhcp.network
>
> diff --git a/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb
b/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb
> index fe00ce3..e14d168 100644
> --- a/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb
> +++ b/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb
> @@ -10,7 +10,7 @@ SRC=5FURI =3D
"git://github.com/openbmc/linux;protocol=3Dgit;branch=3D${KBRANCH}"
>  LINUX=5FVERSION ?=3D "4.3"
>  LINUX=5FVERSION=5FEXTENSION ?=3D "-${SRCREV}"
>
> -SRCREV=3D"openbmc-20160202-2"
> +SRCREV=3D"fe68a785afbaa305506c87c6324f70ed0605385c"

Please don't do this. If you need a new tag, then we can create one.

By reverting back to here you lose fixes for the network driver. From
your commit message I think you're trying to avoid including the vuart
driver in the build. If this is the case then disable it in the kernel
configuration.
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
openbmc mailing list
openbmc@lists.ozlabs.org
https://lists.ozlabs.org/listinfo/openbmc


--1__=09BBF5DCDF973BC48f9e8a93df938690918c09BBF5DCDF973BC4
Content-Transfer-Encoding: quoted-printable
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline

<html><body><p>Don't know if there is a real issue or not.   I wasn't ready=
 for VUART and wasn't educated in time on how to use it.  I just wanted the=
 Linux release to have OCC and network fixes.  I spent many hours trying to=
 figure out why we couldn't boot.<br><br><br>Regards,<br>Norman James<br>IB=
M - POWER Systems Architect<br>Phone: 1-512-286-6807 (T/L: 363-6807)<br>Int=
ernet: njames@us.ibm.com<br><br><br><img width=3D"16" height=3D"16" src=3D"=
cid:1=5F=5F=3D09BBF5DCDF973BC48f9e8a93df938690918c09B@" border=3D"0" alt=3D=
"Inactive hide details for Joel Stanley ---02/03/2016 06:24:22 PM---On Thu,=
 Feb 4, 2016 at 11:20 AM, OpenBMC Patches &lt;openbmc-pa"><font color=3D"#4=
24282">Joel Stanley ---02/03/2016 06:24:22 PM---On Thu, Feb 4, 2016 at 11:2=
0 AM, OpenBMC Patches &lt;openbmc-patches@stwcx.xyz&gt; wrote:</font><br><b=
r><font size=3D"2" color=3D"#5F5F5F">From:        </font><font size=3D"2">J=
oel Stanley &lt;joel@jms.id.au&gt;</font><br><font size=3D"2" color=3D"#5F5=
F5F">To:        </font><font size=3D"2">OpenBMC Patches &lt;openbmc-patches=
@stwcx.xyz&gt;</font><br><font size=3D"2" color=3D"#5F5F5F">Cc:        </fo=
nt><font size=3D"2">OpenBMC Maillist &lt;openbmc@lists.ozlabs.org&gt;</font=
><br><font size=3D"2" color=3D"#5F5F5F">Date:        </font><font size=3D"2=
">02/03/2016 06:24 PM</font><br><font size=3D"2" color=3D"#5F5F5F">Subject:=
        </font><font size=3D"2">Re: [PATCH openbmc v3] Update recipes and r=
emove dhcp file</font><br><font size=3D"2" color=3D"#5F5F5F">Sent by:      =
  </font><font size=3D"2">&quot;openbmc&quot; &lt;openbmc-bounces+njames=3D=
us.ibm.com@lists.ozlabs.org&gt;</font><br><hr width=3D"100%" size=3D"2" ali=
gn=3D"left" noshade style=3D"color:#8091A5; "><br><br><br><tt>On Thu, Feb 4=
, 2016 at 11:20 AM, OpenBMC Patches<br>&lt;openbmc-patches@stwcx.xyz&gt; wr=
ote:<br>&gt; From: Adriana Kobylak &lt;anoo@us.ibm.com&gt;<br>&gt;<br>&gt; =
Backout kernel level since tag 20160202 has vuart support that bmc<br>&gt; =
currently does not support<br><br>Has a bug been opened?<br><br>&gt; Pickup=
 IPMI and REST functions to update the MAC address<br>&gt; Remove dhcp file=
 from network recipe that seems to cause issues<br>&gt; ---<br>&gt; &nbsp;m=
eta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb &nbsp; &nbsp; =
&nbsp; | 2 +-<br>&gt; &nbsp;meta-phosphor/common/recipes-phosphor/host-ipmi=
d/host-ipmid.bb &nbsp; &nbsp;| 2 +-<br>&gt; &nbsp;meta-phosphor/common/reci=
pes-phosphor/network/network.bb &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 8 ++---=
---<br>&gt; &nbsp;.../common/recipes-phosphor/network/network/80-dhcp.netwo=
rk &nbsp; &nbsp; &nbsp; | 5 -----<br>&gt; &nbsp;4 files changed, 4 insertio=
ns(+), 13 deletions(-)<br>&gt; &nbsp;delete mode 100755 meta-phosphor/commo=
n/recipes-phosphor/network/network/80-dhcp.network<br>&gt;<br>&gt; diff --g=
it a/meta-phosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb b/meta-p=
hosphor/common/recipes-kernel/linux/linux-obmc=5F4.3.bb<br>&gt; index fe00c=
e3..e14d168 100644<br>&gt; --- a/meta-phosphor/common/recipes-kernel/linux/=
linux-obmc=5F4.3.bb<br>&gt; +++ b/meta-phosphor/common/recipes-kernel/linux=
/linux-obmc=5F4.3.bb<br>&gt; @@ -10,7 +10,7 @@ SRC=5FURI =3D &quot;git://gi=
thub.com/openbmc/linux;protocol=3Dgit;branch=3D${KBRANCH}&quot;<br>&gt; &nb=
sp;LINUX=5FVERSION ?=3D &quot;4.3&quot;<br>&gt; &nbsp;LINUX=5FVERSION=5FEXT=
ENSION ?=3D &quot;-${SRCREV}&quot;<br>&gt;<br>&gt; -SRCREV=3D&quot;openbmc-=
20160202-2&quot;<br>&gt; +SRCREV=3D&quot;fe68a785afbaa305506c87c6324f70ed06=
05385c&quot;<br><br>Please don't do this. If you need a new tag, then we ca=
n create one.<br><br>By reverting back to here you lose fixes for the netwo=
rk driver. From<br>your commit message I think you're trying to avoid inclu=
ding the vuart<br>driver in the build. If this is the case then disable it =
in the kernel<br>configuration.<br>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F<br>openbmc mailing list<br>openbmc@lists.ozlabs=
.org<br></tt><tt><a href=3D"https://lists.ozlabs.org/listinfo/openbmc">http=
s://lists.ozlabs.org/listinfo/openbmc</a></tt><tt><br></tt><br><BR>
</body></html>

--1__=09BBF5DCDF973BC48f9e8a93df938690918c09BBF5DCDF973BC4--


--0__=09BBF5DCDF973BC48f9e8a93df938690918c09BBF5DCDF973BC4
Content-type: image/gif; 
	name="graycol.gif"
Content-Disposition: inline; filename="graycol.gif"
Content-ID: <1__=09BBF5DCDF973BC48f9e8a93df938690918c09B@>
Content-Transfer-Encoding: base64

R0lGODlhEAAQAKECAMzMzAAAAP///wAAACH5BAEAAAIALAAAAAAQABAAAAIXlI+py+0PopwxUbpu
ZRfKZ2zgSJbmSRYAIf4fT3B0aW1pemVkIGJ5IFVsZWFkIFNtYXJ0U2F2ZXIhAAA7


--0__=09BBF5DCDF973BC48f9e8a93df938690918c09BBF5DCDF973BC4--
